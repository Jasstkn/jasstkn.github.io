# jasstkn.github.io

Personal blog about SRE, DevOps, and Kubernetes. Built with [Hugo](https://gohugo.io/) and [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Local development

```sh
make dev
```

## TODO

- [ ] Migrate off `peaceiris/actions-hugo` — the action appears to be no longer actively maintained. Consider installing Hugo directly in the workflow (e.g. via `apt`, a script, or the official Hugo GitHub Action).
- [ ] Migrate off `peaceiris/actions-gh-pages` — GitHub now has official support for Pages deployment via `actions/upload-pages-artifact` + `actions/deploy-pages`.
- [ ] Add markdown linter to CI (e.g. [markdownlint](https://github.com/DavidAnson/markdownlint)).
