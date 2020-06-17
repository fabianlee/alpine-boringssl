OWNER := fabianlee
PROJECT := alpine-boringssl
VERSION := 1.0.0
OPV := $(OWNER)/$(PROJECT):$(VERSION)

# builds docker image
docker-build:
	sudo docker build -f Dockerfile -t $(OPV) .

## cleans docker image
clean:
	sudo docker image rm $(OPV) | true

## runs container in foreground, using default args
docker-test:
	sudo docker run -it --rm $(OPV)

## runs container in foreground, override entrypoint to use use shell
docker-test-cli:
	sudo docker run -it --rm --entrypoint "/bin/sh" $(OPV)

## runs bssl with parameters passed from command line "
## example:
## make docker-run CMD="generate-ed25519 -out-public /export/mypub -out-private /export/mypriv"
docker-run: 
	sudo docker run -it --rm -v `pwd`:/export $(OPV) $(CMD)

## pushes to docker hub
docker-push:
	sudo docker push $(OPV)
