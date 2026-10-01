# The LiteLLM proxy for the tenish stack: one model gateway in front of
# Vertex AI that cabal (identity.toml [litellm]) and the agents talk to.
# Multi-arch upstream image (amd64 + arm64); the tag is the release that
# `main-stable` pointed at when pinned — move it on purpose, not by rebuild.
FROM ghcr.io/berriai/litellm:v1.103.2

COPY config.yaml /etc/litellm/config.yaml

# The upstream ENTRYPOINT is the `litellm` CLI; only its arguments change.
# Project and location come from the environment (gojira.yaml `env`), the
# master key from a Secret, so the same image serves every environment.
CMD ["--config", "/etc/litellm/config.yaml", "--port", "8080"]
