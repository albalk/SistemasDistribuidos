#Alba López, Oscar Marcos INSO3A
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update


EXPOSE 60000
COPY source/serverMultMatrix /serverMultMatrix
RUN chmod +x /serverMultMatrix
#RUN mkdir /prueba

CMD /serverMultMatrix
