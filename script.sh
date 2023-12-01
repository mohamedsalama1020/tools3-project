#!/bin/bash

# Define image names
frontend_image="frontend_image"
backend_image="backend_image"
db_image="db_image"

# Define container names
frontend_container="frontendcontainer"
backend_container="backendcontainer"
db_container="dbcontainer"

# Define ports
frontend_port=3000
backend_port=8080
db_port=3306
# Build Podman images
sudo podman build -t $frontend_image clinic-system/.
sudo podman build -t $backend_image Clinc_System/.
sudo podman build -t $db_image 'DB_Docker File'/.

# Run Podman containers
sudo podman run  --name $db_container -p $db_port:3306 -d $db_image
sudo podman run --name $backend_container -p $backend_port:8080  -d $backend_image
sudo podman run  --name $frontend_container --env BROWSER=none -p $frontend_port:3000  -d $frontend_image