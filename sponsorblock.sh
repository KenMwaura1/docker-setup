docker run -d \
--name iSponsorBlockTV \
--restart=unless-stopped \
-v /PATH_TO_YOUR_DATA_DIR:/app/data \
ghcr.io/dmunozv04/isponsorblocktv
