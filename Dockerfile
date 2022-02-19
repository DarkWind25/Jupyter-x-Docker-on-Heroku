FROM python:3.10.2

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

# Install Ubuntu dependencies
# libopencv-dev = opencv dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        libopencv-dev \ 
        build-essential \
        libssl-dev \
        libpq-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        gettext \
        unzip \
        supervisor \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        python3-urllib3 \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade PIP
RUN pip install pip pipenv --upgrade

# sklearn opencv, numpy, and pandas
RUN pip install scikit-learn opencv-contrib-python numpy pandas

# tensorflow (including Keras)
RUN pip install tensorflow keras

# pytorch (cpu)
RUN apt-get update && apt-get -y install gcc mono-mcs && rm -rf /var/lib/apt/lists/*
RUN pip install torch==1.9.0+cpu torchvision==0.10.0+cpu torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

# fastai
RUN pip install fastai

# webscrap
RUN pip install beautifulsoup4 html5lib

# Extras pip packages
RUN pip install numba pillow scikit-image

# Project installs
RUN pipenv install --skip-lock --system --dev

CMD ["./scripts/entrypoint.sh"]
