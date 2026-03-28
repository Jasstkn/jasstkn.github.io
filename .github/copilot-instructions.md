# Copilot Instructions — jasstkn.github.io

Personal blog about SRE, DevOps, and Kubernetes. Built with Hugo (extended) and PaperMod v8 theme. Bilingual: English (default) + Russian.

## Development Flow

**Every change follows this flow — no exceptions:**

1. **Create a worktree** (preferred over switching branches — see [Git Worktrees](#git-worktrees) below)
   ```sh
   git -C <main-repo> worktree add -b <type>/<slug> ../<repo-name>-<slug>
   cd ../<repo-name>-<slug>
   ```
2. **Make changes**
3. **Validate locally before committing:**
   ```sh
   npx markdownlint-cli2 "content/**/*.md"   # must return 0 errors
   make dev                                   # verify site builds and renders
   ```

   If you run `make dev` and wait for user validation, print the local URL so the user can open it in the browser.

   For CI-only changes (no content modified), `hugo --gc --minify` is sufficient instead of `make dev`.
4. **Conventional commits** (see format below)
5. **Push and open PR** — CI runs lint + build automatically

## Git Worktrees

Use worktrees to keep `main` always clean and work on multiple branches in parallel without switching.

### Create a worktree

```sh
# From the main repo directory:
git worktree add -b <type>/<slug> ../<repo-name>-<slug>
cd ../<repo-name>-<slug>
```

**Naming convention:** `../<repo-name>-<slug>` — a sibling directory, kebab-case slug matching the branch name.

Examples:

```sh
git worktree add -b post/k8s-tips ../jasstkn.github.io-k8s-tips
git worktree add -b chore/update-deps-2026-04 ../jasstkn.github.io-update-deps
```

### Work inside the worktree

Each worktree is a fully independent working directory — run all commands from inside it:

```sh
cd ../jasstkn.github.io-k8s-tips
make dev       # local dev server scoped to this branch
git add .
git commit -m "feat: ..."
git push -u origin post/k8s-tips
```

### List active worktrees

```sh
git worktree list
```

### Clean up after merge

```sh
# From the main repo:
git worktree remove ../jasstkn.github.io-<slug>
git branch -d <type>/<slug>
```

## Branch Naming

| Work type | Branch pattern | Example |
|-----------|---------------|---------|
| New post | `post/<slug>` | `post/k8s-observability-2024` |
| CI / GitHub Actions | `ci/<description>` | `ci/update-actions-sha` |
| Maintenance / deps | `chore/<description>` | `chore/update-papermod-v9` |
| Bug fix | `fix/<description>` | `fix/cover-image-path` |

## Conventional Commits

From https://www.conventionalcommits.org/en/v1.0.0/#summary.

## Content Structure

Every post lives in its own page bundle directory:

```
content/posts/<slug>/
├── index.ru.md     ← Russian version (written first)
└── index.md        ← English version (translation)
```

Some posts might have only one language version. In this case only index.ru.md will exist.

### Front Matter Schema

```yaml
---
author: "Author Name"
title: "Post Title"
date: YYYY-MM-DDTHH:MM:SS+00:00
draft: false
description: "One concise sentence summarising the post."
cover:
  image: /images/<slug>.png
  relative: false
  alt: "Descriptive alt text"
tags: ["tag1", "tag2"]
categories: ["category"]
---
```

Hugo content files start with YAML front matter followed by the post body — no H1 heading (the theme renders `title` as H1). First content heading is H2.

## Image / Cover Rules

- Place cover images in **`static/images/<slug>.png`** (never in the page bundle directory)
- Always set `relative: false` — relative paths break the `/ru/` language prefix
- Reference as `/images/<slug>.png` (absolute path)
- To download an image: `curl -L "<url>" -o static/images/<slug>.png`

## Markdownlint Rules (`.markdownlint-cli2.yaml`)

- **MD013** (line length): disabled — blog prose can be long
- **MD033** (inline HTML): disabled — Hugo shortcodes use HTML
- **MD024** (duplicate headings): `siblings_only` is allowed
- **MD007** (list indentation): use **2 spaces** for nested lists — NOT 4 spaces
- No trailing spaces inside list items

Common CI failure: nested lists with 4-space indentation. Always use 2 spaces.

## Hugo Configuration

- Hugo version: `0.159.1` (extended)
- Theme: PaperMod v8 (git submodule at `themes/PaperMod`)
- `make dev` starts local server; `make deps` updates the theme submodule

## CI Pipeline (`.github/workflows/gh-pages.yml`)

Three jobs run on every push and PR:
1. `lint` — `markdownlint-cli2` on all `content/**/*.md`
2. `build` — Hugo extended build with cache
3. `deploy` — GitHub Pages deployment (only on `main` branch)

All GitHub Actions are pinned to SHA. When updating actions, always include the version tag as a comment: `uses: actions/checkout@<sha> # v6`

## Author

Name: Mariia Kotliarevskaia  
Email: mariia.kotliarevskaia@gmail.com  
GitHub: @jasstkn  
Social: [@jasstkn](https://x.com/jasstkn) on X, [@maria_kot](https://hachyderm.io/@maria_kot) on Mastodon
