# The LiteLLM proxy for the tenish stack: one model gateway in front of
# Vertex AI that cabal (identity.toml [litellm]) and the agents talk to.
# Multi-arch upstream image (amd64 + arm64); the tag is the release that
# `main-stable` pointed at when pinned — move it on purpose, not by rebuild.
# Pinned by digest, not tag: the official litellm images carried a credential
# stealer on 2026-10-21 (1.107.0), and a tag can be re-pushed while a digest
# cannot. This is the v1.103.2 index (amd64 + arm64) as published. To move:
#   docker buildx imagetools inspect ghcr.io/berriai/litellm:<tag>   # read the digest
FROM ghcr.io/berriai/litellm:v1.103.2@sha256:f63fb81b831b170ec16851e23c36ac5bf52ef106b271406429524a2ed730bbfd

COPY config.yaml /etc/litellm/config.yaml

# The upstream ENTRYPOINT is the `litellm` CLI; only its arguments change.
# Project and location come from the environment (gojira.yaml `env`), the
# master key from a Secret, so the same image serves every environment.
CMD ["--config", "/etc/litellm/config.yaml", "--port", "8080"]
