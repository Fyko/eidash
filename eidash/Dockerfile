FROM rust:1.77.2-slim AS chef
USER root
RUN cargo install cargo-chef
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
ENV PROTOBUF_VER="26.1"
ENV SQLX_OFFLINE=true
ENV RUSTFLAGS=-Ctarget-feature=-crt-static

RUN apt update && apt install -y libssl-dev pkg-config g++ curl libprotobuf-dev unzip && rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
	curl -sSL https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOBUF_VER}/protoc-${PROTOBUF_VER}-linux-aarch_64.zip -o protoc.zip && \
	unzip protoc.zip && \
	cp bin/protoc /usr/bin/protoc && \
	rm -rf *

COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
COPY . .
RUN cargo build --release --bin eidash --no-default-features

FROM debian:bookworm AS runtime
WORKDIR /app
COPY --from=builder /app/target/release/eidash .
RUN apt update && apt install -y libssl-dev && rm -rf /var/lib/apt/lists/*
CMD ["/app/eidash"]
