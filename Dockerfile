FROM conda/miniconda3:latest
RUN mkdir -p /mlflow/mlruns
WORKDIR /mlflow
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV HOST=mlflow.dev
ENV GCP_STORAGE_BUCKET=${GCP_STORAGE_BUCKET}
# ENV CREDENTIALS_PATH=./cre/test.json # It's not safety, just code for localhost
ENV GCLOUD_PROJECT=mlflow-project

RUN echo "export LC_ALL=$LC_ALL" >> /etc/profile.d/locale.sh
RUN echo "export LANG=$LANG" >> /etc/profile.d/locale.sh
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libpq-dev
RUN pip install -U pip && \
    pip install --ignore-installed google-cloud-storage && \
    pip install psycopg2 mlflow
COPY ./start.sh ./start.sh
RUN chmod +x ./start.sh
EXPOSE 80
EXPOSE 443
CMD ["./start.sh"]
