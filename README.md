Redhawk-Compose
===============
This project assembles core REDHAWK functions into docker-compose microservices that are
easily pieced together via a single docker-compose.yml file.

Quickstart
----------
The only requirement for redhawk-compose is a yum repository containing a REDHAWK release.
For convenience, we have provided a container to host your own REDHAWK rpms locally.  To
start the local yum server, and launch our stock REDHAWK architecture:

```bash
# Start yum server with REDHAWK artifacts
(cd deps && docker-compose up --build)

# Start REDHAWK runtime containers
docker-compose up --build
```

Building Dependencies
---------------------
The 'deps' directory contains dependencies required for building the runtime containers.
These dependencies contain a local yum server (to host REDHAWK RPMs).

### Yum container
The yum container will download the REDHAWK tarball and unpack RPMs for a yum server.
The yum server is hosted on port 80 (by default) and can be viewed in a browser at 
[http://localhost/yum](http://localhost/yum).

#### To build and start yum-server, launch the docker-compose.yml located inside 'deps'
```bash
cd deps && docker-compose up --build
```

#### Updating REDHAWK version
To build containers with a different REDHAWK version, update the 'REDHAWK_TAR' variable 
located inside (./deps/docker-compose.yml). The REDHAWK tarballs can be found on github at 
<https://github.com/RedhawkSDR/redhawk/releases>.


Runtime Containers
------------------
The 'runtime' directory breaks out each REDHAWK runtime dependency into their own respective
microservice.

### Base
The base container extends the stock centos:7 container to reference our local yum container
above.  All runtime containers extend this base container. If you have a different yum
repository you'd like to use, update the runtime/docker-compose.yml as follows:
```bash
version: '3'
services:

  base:
    build:
      context: ./base
      dockerfile: Dockerfile
      args:
        rhrepo: "<my-external-yum-URL-here>"
```

### Omniserver
The omniserver container extends the base container to include omniORB services required by
REDHAWK.  The omniserver container can act as BOTH the nameserver and eventserver (via the 
omniNamesEvents.sh script), or can be launched as an individual nameserver or eventserver.

### Domain
The domain container extends the omniserver container (requires omniORB configuration) and installs 
the REDHAWK domain manager.

### GPP
The gpp container extends the domain container, as they share many of the same RPM dependencies, 
and installs the REDHAWK-provided GPP node required to launch components.


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
