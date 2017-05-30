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
 youtube-dl \
 python-matplotlib \
 libfreetype6-dev \
 libxft-dev \
 && pip install -U pip \
 && pip install -U \
 pyOpenSSL

# ndg-httpsclient \
# pyasn1 \
# six==1.6.0 \
# requests \
# jupyter \
# numpy \
# scipy


#RUN pip install -U \
# matplotlib \
# pandas \
# sklearn \
# pydub \
# tqdm \
# && pip install \
# pyAudioAnalysis

# pip install https://github.com/hipstas/audio-tagging-toolkit
# pip install git+git://github.com/hipstas/audio-tagging-toolkit.git

# Install FFmpeg with mp3 support
#RUN add-apt-repository -y ppa:mc3man/trusty-media \
# && apt-get update -y \
# && apt-get install -y ffmpeg gstreamer0.10-ffmpeg

# Configure container startup
ENV SHELL /bin/bash
WORKDIR /home/sharedfolder
#CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
