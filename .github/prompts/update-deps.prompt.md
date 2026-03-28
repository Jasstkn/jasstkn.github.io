---
description: Check and update all site dependencies — Hugo version, PaperMod theme, and GitHub Actions SHAs
---

Check and update all dependencies for the MariaOps Hugo site.

## Steps

1. **Create branch**
   ```sh
   git checkout main && git pull
   git checkout -b chore/update-deps-$(date +%Y-%m)
   ```

2. **Update PaperMod theme submodule**
   ```sh
   make deps
   # or: git submodule update --remote --merge
   ```
   Check the new version in `themes/PaperMod/` (look at git log or theme.toml).

3. **Check latest Hugo extended release**
   - Visit https://github.com/gohugoio/hugo/releases/latest
   - If newer than the current `HUGO_VERSION` in `.github/workflows/gh-pages.yml`, update it
   - Current version is in the `env.HUGO_VERSION` field of the `build` job

4. **Update GitHub Actions to latest SHAs**
   For each action in `.github/workflows/gh-pages.yml`, get the latest release SHA:

   | Action | How to find latest SHA |
   |--------|----------------------|
   | `actions/checkout` | https://github.com/actions/checkout/releases |
   | `actions/configure-pages` | https://github.com/actions/configure-pages/releases |
   | `actions/cache` | https://github.com/actions/cache/releases |
   | `actions/upload-pages-artifact` | https://github.com/actions/upload-pages-artifact/releases |
   | `actions/deploy-pages` | https://github.com/actions/deploy-pages/releases |
   | `DavidAnson/markdownlint-cli2-action` | https://github.com/DavidAnson/markdownlint-cli2-action/releases |

   Format: `uses: <owner>/<action>@<full-sha> # v<major>`

5. **Verify locally**
   ```sh
   hugo --gc --minify
   ```

6. **Commit each logical change separately**
   ```sh
   # Theme update
   git add themes/
   git commit -m "build: update PaperMod theme to v<version>

   Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

   # Hugo version update (if changed)
   git add .github/workflows/
   git commit -m "ci: update Hugo to v<version>

   Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"

   # Actions SHA updates
   git add .github/workflows/
   git commit -m "ci: update GitHub Actions to latest SHAs

   Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
   ```

7. **Push and create PR**
   ```sh
   git push -u origin chore/update-deps-$(date +%Y-%m)
   gh pr create --title "chore: update dependencies $(date +%Y-%m)" --body "- PaperMod theme: updated to latest\n- Hugo: <old> → <new>\n- GitHub Actions: all SHAs updated to latest releases"
   ```

## Notes

- `peaceiris/actions-hugo` has been replaced — Hugo is installed via direct wget in the workflow
- `peaceiris/actions-gh-pages` has been replaced — deployment uses official `actions/deploy-pages`
- Dependabot handles weekly checks for GitHub Actions and monthly for git submodules, but Hugo version updates require manual checking
