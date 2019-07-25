ARG BASE_CONTAINER=quay.io/snakemake/snakemake:v5.5.4@sha256:a3280d1ddb58c96c802b1c2f8ac2786e1914806d1e0b5b9c45e55cd6d22cad5a
FROM $BASE_CONTAINER

LABEL maintainer="Julian Pistorius <julian@julianpistorius.com>"

RUN mkdir /code

COPY . /code/

WORKDIR /code

VOLUME /data

CMD snakemake