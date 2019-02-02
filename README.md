Redhawk-Compose
===============
This project assembles core REDHAWK functions into docker-compose microservices that are
easily pieced together via a single docker-compose.yml file.


Quickstart
----------
The only requirement for redhawk-compose is a yum repository containing a REDHAWK release.
Don't have your own REDHAWK yum repository?  No problem - we've provided another project to
create your own yum repository to host the REDHAWK rpms locally at 
[redhawk-yum](https://github.com/captivationsoftware/redhawk-yum).

```bash
# Build REDHAWK runtime containers
docker-compose -f docker-compose.build.yml build

# Launch REDHAWK runtime containers
docker-compose up
```

Runtime Containers
------------------
Each sub-directory represents a REDHAWK microservice that runs in their own respective containers.

### Base
The base container extends the stock centos:7 container to reference our local yum container
above.  All runtime containers extend this base container. If you have a different yum
repository you'd like to use, update the [.env](.env) file as follows:
```bash
rhrepo="<my-external-yum-URL-here>"
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
