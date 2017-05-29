# Audio ML Notebook

FROM ubuntu:14.04

MAINTAINER Steve McLaughlin <stephen.mclaughlin@utexas.edu>

EXPOSE 8888

ENV PYTHONWARNINGS="ignore:a true SSLContext object"

# Install dependencies
RUN apt-get update && apt-get install -y \
 wget \
 curl \
 git \
 swig \
 software-properties-common \
 build-essential \
 unzip \
 libimage-exiftool-perl \
 python2.7 \
 python-pip \
 python-dev \
 libffi-dev \
 libssl-dev \
 ipython \
 ipython-notebook \
 && pip install --upgrade pip \
 && pip install pyOpenSSL ndg-httpsclient pyasn1 \
 && pip install -U six==1.6.0 \
 && pip install 'requests[security]' \
 && pip install -U jupyter numpy scipy matplotlib pandas \
 && pip install -U sklearn pydub tqdm requests \
 && pip install pyAudioAnalysis \
 && pip https://github.com/hipstas/audio-tagging-toolkit

 # Install FFmpeg with mp3 support
 RUN add-apt-repository -y ppa:mc3man/trusty-media \
 && apt-get update -y \
 && apt-get install -y ffmpeg gstreamer0.10-ffmpeg

# Configure container startup
ENV SHELL /bin/bash
WORKDIR /home/sharedfolder
CMD ["jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
