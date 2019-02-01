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

