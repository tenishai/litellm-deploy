# Changelog

Notable changes to this deployment. The format loosely follows
[Keep a Changelog](https://keepachangelog.com/). A `vX.Y.Z` tag publishes the
image (`.github/workflows/release.yaml`); the dogfood deploys what `main` says.

## [Unreleased]

Nothing yet.

## [0.1.0] — 2026-11-28

### Changed

- **Upstream pinned to litellm v1.108.20** (from v1.103.2, pinned 2026-10-01). The release
  dry run's vulnerability scan found 77 fixable high or critical findings in the older base,
  none in this repo's own files; the current release scans clean. By digest, as before.

### Added

- **A release publishes the image.** Pushing a `vX.Y.Z` tag runs `ci.yaml` on the tagged
  commit, builds the image, checks `litellm --version` and the baked config, scans it, and
  publishes it for amd64 and arm64 to `ghcr.io/tenishai/litellm-deploy` under the tag and
  the short sha, with SBOM and provenance, and a GitHub release carrying the digest. An
  installer that deploys the stack from published images pulls this one instead of
  building this repo (tenishai/stack, `image:`).

### Changed

- **Renamed to litellm-deploy** (from `litellm`), so a public repo of this name
  does not read as a fork of BerriAI's project.
- **Licence: MIT**, with NOTICE (LiteLLM is BerriAI's, under its own terms),
  SECURITY, CONTRIBUTING with the DCO, CODE_OF_CONDUCT, templates. (#9)
- Pull-request checks: every overlay builds and the manifests match
  `gojira.yaml`, with a `ci` summary job a branch ruleset can require. (#11)
- The base image is pinned by digest, after the upstream 1.107.0 compromise. (#8)
