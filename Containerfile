FROM docker.io/alpine as builder
RUN apk add gcc libc-dev
ADD podman_hello_world.c .
RUN gcc -O2 -static -o podman_hello_world podman_hello_world.c

FROM scratch
LABEL maintainer="Podman Maintainers"
LABEL artist="Máirín Ní Ḋuḃṫaiġ, X/Twitter:@mairin"
LABEL io.containers.capabilities="sys_chroot"
COPY --from=builder podman_hello_world /usr/local/bin/podman_hello_world
CMD ["/usr/local/bin/podman_hello_world"]
