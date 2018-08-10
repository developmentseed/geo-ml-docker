# geo-ml-docker

This docker is built from [developmentseed/geolambda](https://github.com/developmentseed/geolambda) image which includes libraries and their dependencies for geospatial processing, such as numpy and gdal.

In addition to the libraries provided by geolambda, geo-ml-docker includes libraries for machine learning such as tensorflow and keras. See all included libraries in [requirements](./requirements.txt).

## Docker Commands

### On your local machine

- #### Build the image

```bash

docker build -t geo-ml-docker .
```

- #### Basic use case: Run a shell in a new container

```bash
docker run -it geo-ml-docker /bin/bash
```

- #### Advanced use case

Run a jupyter notebook in a new container, expose the port, and mount a volume. Note - this mounts a volume in the current directory so it should be run in the directory where any required files are maintained.

```bash
docker run -it -v ${PWD}:/code -p 8888:8888 geo-ml-docker /bin/bash -c "jupyter notebook --debug --ip=* --port=8888 --no-browser --allow-root"
```

### On an AWS EC2 machine

- #### Docker installation on the EC2 machine
Follow the AWS's [instruction](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html) to install Docker on the EC2 machine before you go ahead.


- #### Build the image
ssh to the EC2 with your pem, and build the docker image.

```bash
docker build -t geo-ml-docker .
```

- #### Run the jupyter notebook EC2

```bash
docker run -v ${PWD}:/code -it -p 8888:8888 geo-ml-docker /bin/bash -c "jupyter notebook --debug --ip=* --port=8888 --no-browser --allow-root"
```

- #### Log into the jupyter notebook from your local machine
In another terminal ssh to cloud machine.

```bash
ssh -i Your_AWS.pem -L 8888:localhost:8888 ubuntu@ec2-XX-XXX-XXX-XXX.compute-1.amazonaws.com
```

- #### Open your jupyter notebook on the browser
When you run the notebook the first time, copy and pasted something like `http://127.0.0.1::8888/?token=xxxxxx` to your browser to open the notebook.
