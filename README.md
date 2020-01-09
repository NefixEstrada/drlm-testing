# drlm-testing

This is the repository for testing DRLM. It uses [Endly](https://github.com/viant/endly) for E2E


## How to use

1- Install the latest version of [Endly](https://github.com/viant/endly) (Go 1.11+ required):

```sh
git clone https://github.com/viant/endly
cd endly/endly
GO111MODULE=on go build endly.go
mv endly /usr/local/bin
```

2- Clone this repository

```sh
git clone https://github.com/NefixEstrada/drlm-testing
cd drlm-testing
```

3- Run the tests!!
```sh
endly
```