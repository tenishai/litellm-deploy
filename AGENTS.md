# AGENTS.md — litellm-deploy

Instructions for AI coding agents working in this repo. Claude Code loads this via
`CLAUDE.md` (`@AGENTS.md`); other AGENTS.md-aware tools read it directly.

This is a deploy repo, not the proxy. `config.yaml` lists the models, the
`Dockerfile` copies it into BerriAI's LiteLLM image, `gojira.yaml` is the contract
with [Gojira](https://github.com/tenishai/gojira), and Gojira regenerates `k8s/` and
`.github/workflows/gojira-ci.yaml` from it.

## Rules

- Edit `gojira.yaml`, `config.yaml` and the `Dockerfile` by hand. Let Gojira
  regenerate the rest: an edit to `gojira.yaml` without regenerated manifests fails
  the contract check in `.github/workflows/ci.yaml`.
- Move the base image only by digest, on purpose. The Dockerfile says how to read one.
- Sign off every commit: `git commit -s` (see [CONTRIBUTING.md](CONTRIBUTING.md)).
- Never commit a key or token; `.env`, `*.pem`, `*-token` and agent session notes
  are gitignored.
