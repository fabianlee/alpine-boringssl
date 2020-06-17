# Summary
Alpine image with boringssl

uses multi-stage docker build to keep final image small

# Usage to generate ed25519 private/public keys in current directory
sudo docker run -it --rm -v `pwd`:/export fabianlee/alpine-boringssl:1.0.0 generate-ed25519 -out-public /export/mypub -out-private /export/mypriv


