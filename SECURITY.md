# Security policy

## Reporting a vulnerability

Please don't open a public issue for a security problem.

Report it privately to **security@tenish.ai**.

If this repository's **Security** tab shows a **Report a vulnerability**
button, you can use that instead. GitHub offers it only on public
repositories where it has been turned on.

Include what you can of: what the problem is and what an attacker could do
with it, the commit you tested, steps to reproduce, and any configuration it
depends on. A clear description is enough to start.

## What happens next

- We acknowledge your report within **14 days**.
- We tell you whether we've confirmed the problem as soon as we know.
- We fix confirmed problems on `main`, and tell you before the fix is public.
- We credit you in the fix's commit or pull request unless you'd rather we didn't.

We ask that you give us a reasonable chance to fix a problem before disclosing
it publicly.

## Scope

This repository holds the configuration, Dockerfile and Kubernetes manifests
that deploy the LiteLLM proxy for the tenish stack. In scope:

- a model key, master key or cloud credential leaking through the config, the
  image, a manifest or a generated file;
- a manifest or config change that exposes the proxy beyond its cluster
  Service, or lets a caller reach a model without the master key;
- the base image: a pinned digest that no longer matches a published LiteLLM
  release.

**Out of scope:** vulnerabilities in LiteLLM itself (report those to
<https://github.com/BerriAI/litellm>, and tell us if we pin an affected
version), and problems that require an attacker to already control the cluster
or the cloud project.
