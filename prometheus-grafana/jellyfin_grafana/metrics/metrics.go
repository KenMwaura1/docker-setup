package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	activeSessionsGauge = prometheus.NewGauge(prometheus.GaugeOpts{
		Name: "jellyfin_active_sessions",
		Help: "Number of active Jellyfin sessions",
	})
	jellyfinToken string
)

func init() {
	prometheus.MustRegister(activeSessionsGauge)
	jellyfinToken = "187f26bdb1cb495c876ab03c96550c5b" // Replace with your actual Jellyfin token
}

func fetchJellyfinMetrics() {
	for {
		sessions, err := getJellyfinSessions()
		if err != nil {
			log.Printf("Error fetching Jellyfin sessions: %v", err)
		} else {
			activeSessionsGauge.Set(float64(len(sessions)))
			log.Printf("Active Jellyfin sessions: %d", len(sessions))
		}
		time.Sleep(20 * time.Second) // Updated to 20-second interval
	}
}

func getJellyfinSessions() ([]interface{}, error) {
	req, err := http.NewRequest("GET", "http://192.168.100.16:8096/Sessions", nil)
	if err != nil {
		return nil, fmt.Errorf("error creating request: %w", err)
	}

	req.Header.Set("Authorization", "MediaBrowser Token="+jellyfinToken)

	client := &http.Client{Timeout: 10 * time.Second} // Added timeout
	resp, err := client.Do(req)
	if err != nil {
		return nil, fmt.Errorf("error making request: %w", err)
	}
	defer resp.Body.Close()

	var sessions []interface{}
	err = json.NewDecoder(resp.Body).Decode(&sessions)
	if err != nil {
		return nil, fmt.Errorf("error decoding response: %w", err)
	}

	return sessions, nil
}

func main() {
	go fetchJellyfinMetrics()

	http.Handle("/metrics", promhttp.Handler())
	fmt.Println("Jellyfin exporter started. Listening on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}