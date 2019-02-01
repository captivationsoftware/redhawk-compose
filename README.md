Redhawk-Compose
===============
This project assembles core REDHAWK functions into docker-compose microservices that are
easily pieced together via a single docker-compose.yml file.


Building Dependencies
---------------------
The 'deps' directory contains dependencies required for building the runtime containers.
These dependencies contain a local yum server (to host REDHAWK RPMs).

### Yum container
The yum container will download the REDHAWK tarball and unpack RPMs for a yum server.
The yum server is hosted on port 80 (by default) and can be viewed in a browser at 
[http://localhost/yum](http://localhost/yum).

### Base container
The base container extends the stock centos:7 container to reference our local yum container
above.  All runtime containers extend this base container.

#### To build and start the dependencies, run the build script located at ./deps/build.sh
```bash
cd deps && ./build.sh
```

Runtime Containers
------------------
The 'runtime' directory breaks out each REDHAWK runtime dependency into their own respective
microservice.

MacOS Support
-------------
The containers have been tested on Docker Engine: 18.09.1. To use the REDHAWK IDE on mac, we
recommend installing XQuartz to establish an X-display that can be utilized inside our IDE 
container.
```bash
# Step 1: Install Xquartz
# Step 2: Configure Xquartz (https://blogs.oracle.com/oraclewebcentersuite/running-gui-applications-on-native-docker-containers-for-mac)
# Step 3: Enable x11 for localhost
xhost + 127.0.0.1
# Step 4: Define DISPLAY variable typically used in Linux displays
export DISPLAY=host.docker.internal:0
# Step 5: Launching docker compose should automatically start the REDHAWK IDE
docker-compose up --build
```
