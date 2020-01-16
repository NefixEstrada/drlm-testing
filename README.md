# drlm-testing

This is the repository for testing DRLMv3. It uses [Endly](https://github.com/viant/endly) for E2E


## How to use

### 1- Install the latest version of [dr3dev](https://github.com/didacog/dr3dev) (the DRLM development environment):

```sh
git clone https://github.com/didacog/dr3dev && cd dr3dev
make build-all
make start-all 
```

### 2- Start the environment and run the tests!

```sh
make start-all tls=true ghuser="<GitHub username>" gitname="<Git name>" gitmail="<Git email address>"
cd drlm-testing
./run.sh
```
