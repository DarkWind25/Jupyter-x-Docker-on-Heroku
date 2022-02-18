FROM python:3.10.2

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

RUN pip install pip pipenv --upgrade
RUN pip install jupyter
RUN pipenv install --skip-lock --system --dev

CMD ["./scripts/entrypoint.sh"]
