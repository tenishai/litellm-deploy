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

## License

[MIT](LICENSE). Copyright (c) 2026 tenish and the litellm contributors. The
LiteLLM proxy itself is BerriAI's, under its own MIT licence; see
[NOTICE](NOTICE).
