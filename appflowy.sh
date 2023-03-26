 # exexcute xhost + in the terminal to enable xserver access

 xhost +

 docker run --rm \
  -v $HOME/.Xauthority:/root/.Xauthority:rw \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev/dri:/dev/dri \
  -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
  -v appflowy-data:/home/appflowy \
  -e DISPLAY=${DISPLAY} \
  appflowyio/appflowy_client:main
