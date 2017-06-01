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
 libgtk-3-dev \
 software-properties-common \
 build-essential \
 unzip \
 sox \
 libsox-fmt-mp3 \
 libimage-exiftool-perl \
 python2.7 \
 python-pip \
 python-dev \
 libffi-dev \
 libssl-dev \
 ipython \
 ipython-notebook \
 python-matplotlib \
 libfreetype6-dev \
 libxft-dev \
 libblas-dev \
 liblapack-dev \
 libatlas-base-dev \
 gfortran \
 libpulse-dev \
 libsndfile1-dev \
 aubio-tools \
 libaubio-dev \
 libaubio-doc \
 libyaml-dev \
 libfftw3-dev \
 libavcodec-dev \
 libavformat-dev \
 libavutil-dev \
 libavresample-dev \
 libsamplerate0-dev \
 libtag1-dev \
 python-numpy-dev \
 python-numpy \
 python-yaml \
 && python -m pip install -U pip \
 && pip install -U \
 setuptools \
 pyOpenSSL \
 ndg-httpsclient \
 pyasn1 \
 requests \
 unicodecsv \
 youtube-dl \
 six \
 pydub \
 numpy \
 jupyter \
 pandas \
 matplotlib \
 scipy \
 sklearn \
 librosa \
 aubio \
 scikits.audiolab \
 scikits.talkbox \
 pyAudioAnalysis \
 pocketsphinx \
 speechrecognition \
 tornado \
 pathlib \
 git+git://github.com/hipstas/audio-tagging-toolkit.git

# Install FFmpeg with mp3 support
RUN add-apt-repository -y ppa:mc3man/trusty-media \
 && apt-get update -y \
 && apt-get install -y ffmpeg gstreamer0.10-ffmpeg

# Install essentia
RUN git clone https://github.com/MTG/essentia.git \
&& cd essentia \
&& ./waf configure --mode=release --build-static --with-python --with-cpptests --with-examples --with-vamp \
&& ./waf \
&& ./waf install

# Configure container startup
ENV SHELL /bin/bash
WORKDIR /home/sharedfolder
CMD git clone https://github.com/danstowell/smacpy.git
CMD git clone https://github.com/hipstas/audio-tagging-toolkit.git
CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token=''

# Launch container and open notebook like so:
# docker pull stevemclaugh/audio-ml-notebook
# docker run -it --name audio_ml_container -p 8888:8888 -v ~/Desktop/sharedfolder:/home/sharedfolder stevemclaugh/audio-ml-notebook
