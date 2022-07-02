# Credit Card number validator Web Service

![badge](https://github.com/caike/cc-validator/actions/workflows/haskell.yml/badge.svg)

HTTP endpoint that validates credit card numbers

## Run this project

This project uses Stack - https://docs.haskellstack.org/en/stable/GUIDE/

Run the project with the following command:

`stack run`

The first time it is run, it should take a few minutes to download and compile dependencies. Once it is finished, the service will be available on port `3000`.  

It can be accessed via curl, like the following examples:

```
$ curl -i localhost:3000?number=4556737586899855
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Date: Sat, 02 Jul 2022 20:38:50 GMT
Server: Warp/3.3.19
Content-Type: text/html; charset=utf-8

Valid
```

or the following for an invalid number:

```
$ curl -i localhost:3000?number=9556737586899855
HTTP/1.1 200 OK
Transfer-Encoding: chunked
Date: Sat, 02 Jul 2022 20:39:27 GMT
Server: Warp/3.3.19
Content-Type: text/html; charset=utf-8

Invalid
```


## Run tests

`stack test`

