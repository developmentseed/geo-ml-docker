# geo-ml-docker

This docker is built from [developmentseed/geolambda](https://github.com/developmentseed/geolambda) image which includes libraries and their dependencies for geospatial processing, such as numpy and gdal.

In addition to the libraries provided by geolambda, geo-ml-docker includes libraries for machine learning such as tensorflow and keras. See all included libraries in [requirements](./requirements.txt).

## Docker Commands

### Build the image

```bash

docker build -t geo-ml-docker .
```

### Basic use case: Run a shell in a new container

```bash
docker run -it geo-ml-docker /bin/bash 
```

### Advanced use case

Run a jupyter notebook in a new container, expose the port, and mount a volume. Note - this mounts a volume in the current directory so it should be run in the directory where any required files are maintained.

```bash
docker run -it -v ${PWD}:/code -p 8888:8888 geo-ml-docker /bin/bash -c "jupyter notebook --debug --ip=* --port=8888 --no-browser --allow-root"
```

