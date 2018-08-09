FROM developmentseed/geolambda:latest

RUN \
    yum makecache fast;
    
RUN pip3 install --upgrade pip
RUN pip3 install cython
RUN pip3 install pyyaml h5py 

ENV \
    PYCURL_SSL_LIBRARY=nss

# install requirements
WORKDIR /code
COPY requirements.txt /code/
RUN \
    pip3 install -r requirements.txt

