FROM python:3.10.2

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gcc wget 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install pip pipenv --upgrade
RUN pip install jupyter
RUN pipenv install --skip-lock --system --dev

# webscrap
RUN pip install beautifulsoup4 html5lib

# Extras pip packages
RUN pip install numba pillow scikit-image numpy pandas fastai matplotlib keras
RUN pip cache purge

CMD ["./scripts/entrypoint.sh"]
