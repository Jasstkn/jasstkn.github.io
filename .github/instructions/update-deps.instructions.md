---
applyTo: ".github/**"
---

# Dependency Update Workflow

When asked to update dependencies, follow these steps:

## Steps

1. **Create a worktree**

   ```sh
   git worktree add -b chore/update-deps-$(date +%Y-%m) ../jasstkn.github.io-update-deps-$(date +%Y-%m)
   cd ../jasstkn.github.io-update-deps-$(date +%Y-%m)
   ```

2. **Update PaperMod theme submodule**

   ```sh
   make deps
   ```

   Note the new version from `themes/PaperMod/` git log.

3. **Check latest Hugo extended release**

   Visit <https://github.com/gohugoio/hugo/releases/latest>.
   If newer than `HUGO_VERSION` in `.github/workflows/gh-pages.yml`, update it.

4. **Update GitHub Actions to latest SHAs**

   For each pinned action in `.github/workflows/gh-pages.yml`, fetch the latest release SHA
   and update in the format: `uses: <owner>/<action>@<full-sha> # v<major>`

   Actions to check:

   - `actions/checkout`
   - `actions/configure-pages`
   - `actions/cache`
   - `actions/upload-pages-artifact`
   - `actions/deploy-pages`
   - `DavidAnson/markdownlint-cli2-action`

5. **Verify build**

   ```sh
   hugo --gc --minify
   ```

6. **Commit and push**

   ```sh
   git commit -m "chore: update dependencies $(date +%Y-%m)

   Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
   git push -u origin chore/update-deps-$(date +%Y-%m)
   ```

## Notes

- Hugo is installed via direct `wget` in the workflow — `peaceiris/actions-hugo` was removed
- Deployment uses `actions/deploy-pages` — `peaceiris/actions-gh-pages` was removed
- Dependabot handles weekly Actions checks and monthly submodule checks automatically
