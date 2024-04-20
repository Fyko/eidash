FROM rust:1.77.2-slim AS chef
USER root
RUN cargo install cargo-chef
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json
COPY . .
RUN cargo build --release --bin eidash --no-default-features

FROM debian:bookworm-slim AS runtime
WORKDIR /app
COPY --from=builder /app/target/release/eidash .

RUN ls -la
CMD ["/app/eidash"]
