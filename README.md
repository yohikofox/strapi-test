## Copy `.env.sample` to `.env` file in cms application :

```sh
$ cp ./packages/application/cms/.env.sample ./packages/application/cms/.env
```

## Make sure to have a `PostgreSQL` container running locally

```sh
$ docker-compose up -d database
```

## Execute following commands :

```sh
$ yarn
$ yarn w web dev
$ yarn w cms develop
```
