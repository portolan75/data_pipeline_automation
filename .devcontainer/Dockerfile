# Setting an R environment from scratch 
# Step 1 - Import base image
# NOTE: despite ubuntu 24.04 is available it does not includes packages python3.11-dev and python3.11-venv
FROM ubuntu:24.04

# Step 2 - Set arguments and environment variables
# Define arguments
ARG PROJECT_NAME="EIA_DATA_PIPELINE"
ARG VENV_NAME="LEARN_GITHUB_ACTIONS"
ARG DEBIAN_FRONTEND=noninteractive
ARG QUARTO_VER="1.6.40"

# Define environment variables
ENV PROJECT_NAME=$PROJECT_NAME
ENV VENV_NAME=$VENV_NAME
ENV QUARTO_VER=$QUARTO_VER
ENV CONFIGURE_OPTIONS="--with-cairo --with-jpeglib --enable-R-shlib --with-blas --with-lapack"
ENV TZ='Europe/Amsterdam'

# Step 3 - Install dependencies
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    gfortran \
    git \
    g++ \
    libreadline-dev \
    libx11-dev \
    libxt-dev \
    libpng-dev \
    libjpeg-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libbz2-dev \
    libzstd-dev \
    liblzma-dev \
    libpcre2-dev \
    locales \
    openjdk-8-jdk \
    openssh-client \
    screen \
    texinfo \
    texlive \
    texlive-fonts-extra \
    vim \
    wget \
    xvfb \
    tzdata \
    sudo\
    jq\
    curl\
    libgit2-dev \
    libmagick++-dev \
    make \
    tmux \
    python3-launchpadlib \
    python3-dev \
    python3-venv \
    python3-pip \
    libharfbuzz-dev \
    libfribidi-dev \
    && rm -rf /var/lib/apt/lists/*

# Set locale
RUN locale-gen en_US.UTF-8

# Set the timezone to Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set main working directory
WORKDIR /root
    
# Make settings folder
RUN mkdir settings
    
# Copy requirements.txt install_requirements.sh install_quarto.sh into ./settings/
COPY requirements.txt install_requirements.sh install_quarto.sh ./settings/

# Installing Quarto
RUN bash ./settings/install_quarto.sh $QUARTO_VER

# Step 5 - Setup Python environment (install packages and give environment name)
RUN bash ./settings/install_requirements.sh $VENV_NAME