FROM golang:1.21.4

RUN apt update && \
    apt install -y \ 
    strongswan \
    libstrongswan-standard-plugins \
    strongswan-libcharon \
    uuid-runtime \
    make

WORKDIR /app

COPY . .

RUN make

CMD [ "./ipsec_exporter" ]
