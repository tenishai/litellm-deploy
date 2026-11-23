# Changelog

Notable changes to this deployment. The format loosely follows
[Keep a Changelog](https://keepachangelog.com/). There are no tagged releases;
the deployment is what `main` says.

## [Unreleased]

### Changed

- **Renamed to litellm-deploy** (from `litellm`), so a public repo of this name
  does not read as a fork of BerriAI's project.
- **Licence: MIT**, with NOTICE (LiteLLM is BerriAI's, under its own terms),
  SECURITY, CONTRIBUTING with the DCO, CODE_OF_CONDUCT, templates. (#9)
- Pull-request checks: every overlay builds and the manifests match
  `gojira.yaml`, with a `ci` summary job a branch ruleset can require. (#11)
- The base image is pinned by digest, after the upstream 1.107.0 compromise. (#8)
