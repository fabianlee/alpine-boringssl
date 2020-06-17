#
# builder image
#
FROM golang:1.14.4-alpine3.12 as builder

RUN apk update \
	&& apk add git cmake perl build-base libffi-dev openssl-dev rng-tools

RUN git clone https://github.com/google/boringssl.git && cd boringssl \
        && mkdir build && cd build \
        && cmake .. && make


#
# generate clean, final image for end users
#
FROM alpine:3.12.0

# could not figure out way to create statically linked bssl
# so need these shared libraries
RUN apk update \
      && apk add libstdc++ libgcc \
      && mkdir -p /export && chmod 777 /export

# copy golang binary into container
COPY --from=builder /go/boringssl/build/tool/bssl .

# executable
ENTRYPOINT [ "./bssl" ]
CMD [ "--help" ]
