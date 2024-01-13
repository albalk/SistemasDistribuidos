FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update

EXPOSE 60000
COPY source/serverFileManager /serverFileManager
RUN chmod +x /serverFileManager

RUN mkdir /dirprueba

CMD /serverFileManager