# Summary
Alpine image with [boringssl](https://boringssl.googlesource.com/boringssl/), Google's openssl fork

Only offered via source, so uses multi-stage docker to compile/link, then copies executable to small final image

# Usage to generate ed25519 private/public keys in current directory
sudo docker run -it --rm -v `pwd`:/export fabianlee/alpine-boringssl:1.0.0 generate-ed25519 -out-public /export/mypub -out-private /export/mypriv


