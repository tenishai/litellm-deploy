# litellm

The [LiteLLM](https://github.com/BerriAI/litellm) proxy for the tenish
stack: one model gateway in front of Vertex AI that cabal, kobo and the
agents talk to by model name. `config.yaml` lists the models; the project
and location come from the environment, the master key from a Secret, and
Vertex credentials from Workload Identity — nothing secret in the image.

Deployed through [Gojira](https://github.com/tenishai/gojira) from
`gojira.yaml`; the Service is `litellm.litellm.svc.cluster.local` (port 80).

Out-of-band per environment: Secret `litellm-secrets` with
`LITELLM_MASTER_KEY`. The Google identity is the platform's: `gojira.yaml`
`identity:` names the account and the role, and Gojira grants, binds and
annotates.

Call it:

```bash
curl -s http://litellm/v1/chat/completions -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
  -H 'content-type: application/json' \
  -d '{"model":"gemini-2.5-flash","messages":[{"role":"user","content":"hello"}]}'
```

## The published image

Every `vX.Y.Z` tag publishes `ghcr.io/tenishai/litellm-deploy:vX.Y.Z` (amd64 and arm64,
digest in the release notes). An install that deploys from published images names that
in its stack file; the section below is for a Gojira that builds this repo itself.

## Deploying it

This repo is deployed by a [Gojira](https://github.com/tenishai/gojira) install;
nothing here runs on its own.

1. Connect the repo to your Gojira (app `litellm`, class `web`, the environment
   and cluster you want). Gojira opens a setup PR with the manifests and
   workflow rendered from `gojira.yaml`; merge it.
2. Before the first deploy, create the one out-of-band Secret in the app's
   namespace: `litellm-secrets` with `LITELLM_MASTER_KEY`.
3. `gojira.yaml` names the Google identity (`identity.gsa`) and the role it
   needs (`roles/aiplatform.user`); Gojira grants, binds and annotates. Set
   `VERTEX_PROJECT` and `VERTEX_LOCATION` under `env:` for your project.
4. Push to `main` (or press Redeploy): the generated workflow builds the image
   and applies the manifests. Callers reach it at
   `http://litellm.litellm.svc.cluster.local` with the master key.

To add a model, edit `config.yaml`. To move LiteLLM itself, change the digest in
the `Dockerfile`, on purpose.

## Community

[CONTRIBUTING.md](CONTRIBUTING.md), [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md),
[SECURITY.md](SECURITY.md), [CHANGELOG.md](CHANGELOG.md).

## License

[MIT](LICENSE). Copyright (c) 2026 tenish and the litellm contributors. The
LiteLLM proxy itself is BerriAI's, under its own licence (MIT, with an
enterprise directory licensed separately); see [NOTICE](NOTICE).
