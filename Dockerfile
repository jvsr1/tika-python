FROM python:3.9.10

WORKDIR /
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN apt-cache search openjdk;
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;

COPY . .
ENV TIKA_SERVER_JAR="tika-server.jar"
ENV TIKA_LOG_PATH="tika-log/"

CMD [ "python", "test.py"]
