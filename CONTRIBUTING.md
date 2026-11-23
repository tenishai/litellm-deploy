# Contributing

Issues and pull requests are welcome.

This is a deploy repository: `config.yaml` lists the models, the `Dockerfile`
copies it into BerriAI's LiteLLM image, `gojira.yaml` and `k8s/` describe the
deployment, and [Gojira](https://github.com/tenishai/gojira) regenerates the
manifests and the `.github/workflows/gojira-ci.yaml` workflow from
`gojira.yaml`. Edit `gojira.yaml`, `config.yaml` and the `Dockerfile` by hand;
let Gojira regenerate the rest.

## Open a PR

1. Fork the repo or create a branch.
2. Make your change. Move the base image only on purpose, by digest (the
   `Dockerfile` says how to read one).
3. Sign off every commit with `git commit -s`; see [Developer Certificate of Origin](#developer-certificate-of-origin).
4. Open a pull request against `main` describing what changed and why.

Do not commit secrets or an operator's files: `.env`, `*.pem`, `*-token` and
agent session notes (`CLAUDE.local.md`, `scratch*`) are gitignored.

By contributing you agree your work is licensed under the project's
[MIT License](LICENSE).

## Using AI tools

AI-assisted contributions are welcome; we build this way ourselves. You are
responsible for every line you submit: understand it, test it, and be able to
explain it in review. Say in the pull request description which AI tools you
used. Crediting the agent with a `Co-Authored-By:` trailer is optional. Don't
submit code a tool reproduced from a source whose license isn't compatible with
the MIT License.

## Developer Certificate of Origin

This repository uses the [Developer Certificate of Origin](https://developercertificate.org/)
(DCO) instead of a contributor license agreement. Every commit in a pull request
must carry a `Signed-off-by:` line with your name and email, and they must match
the commit's author. `git commit -s` adds it from your `user.name` and
`user.email`:

```
Signed-off-by: Jane Doe <jane@example.com>
```

By adding that line you certify the following, quoted from
<https://developercertificate.org/>:

```
Developer Certificate of Origin
Version 1.1

Copyright (C) 2004, 2006 The Linux Foundation and its contributors.

Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.


Developer's Certificate of Origin 1.1

By making a contribution to this project, I certify that:

(a) The contribution was created in whole or in part by me and I
    have the right to submit it under the open source license
    indicated in the file; or

(b) The contribution is based upon previous work that, to the best
    of my knowledge, is covered under an appropriate open source
    license and I have the right under that license to submit that
    work with modifications, whether created in whole or in part
    by me, under the same open source license (unless I am
    permitted to submit under a different license), as indicated
    in the file; or

(c) The contribution was provided directly to me by some other
    person who certified (a), (b) or (c) and I have not modified
    it.

(d) I understand and agree that this project and the contribution
    are public and that a record of the contribution (including all
    personal information I submit with it, including my sign-off) is
    maintained indefinitely and may be redistributed consistent with
    this project or the open source license(s) involved.
```

The `dco` CI check runs on every pull request to `main`. It checks each
non-merge commit the pull request adds, and fails naming each commit whose
sign-off is missing or doesn't match its author. To fix it:

```bash
git commit --amend --signoff --no-edit      # the last commit only
git rebase --signoff origin/main            # every commit on your branch
git push --force-with-lease
```

A pull request opened by someone with write access to this repository skips
the check, including one opened from a fork; it is enforced on pull requests
from everyone else.
