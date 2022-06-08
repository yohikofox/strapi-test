ARG PG_VERSION

FROM postgres:$PG_VERSION
RUN echo $PG_VERSION
COPY ./init /docker-entrypoint-initdb.d/
