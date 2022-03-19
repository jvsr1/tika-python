FROM python:3.9.10

RUN mkdir tika-project
WORKDIR /tika-project
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN apt-cache search openjdk;
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;



COPY . .
ENV TIKA_SERVER_JAR="tika-server.jar"
# TODO: Joao, it's not reading this. 
# ENV TIKA_LOG_PATH="tika-log/"

RUN pip install funcx funcx_endpoint
RUN pip install xtract_sdk==0.0.7a11

COPY test.py /tika-project/test.py
COPY test.txt /tika-project/test.txt

CMD [ "python", "test.py"]
