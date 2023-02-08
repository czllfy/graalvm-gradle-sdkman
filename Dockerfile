FROM ghcr.io/graalvm/graalvm-ce:ol7-java17-22.3.1

ADD . /build
WORKDIR /build

RUN yum install -y unzip zip

RUN \
    curl -s "https://get.sdkman.io" | bash; \
    source "$HOME/.sdkman/bin/sdkman-init.sh"; \
    sdk install gradle; \
    gu install native-image;;

RUN gradle -v
RUN native-image --version
