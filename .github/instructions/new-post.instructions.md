---
applyTo: "content/posts/**"
---

# New Post Workflow

When asked to create a new post, follow these steps exactly:

## Steps

1. **Derive the slug** — kebab-case from the title (e.g., "K8s Observability 2024" → `k8s-observability-2024`)

2. **Create a worktree** (preferred) or branch from `main`

   ```sh
   # From the main repo directory:
   git worktree add -b post/<slug> ../jasstkn.github.io-<slug>
   cd ../jasstkn.github.io-<slug>
   ```

3. **Create post directory**

   ```sh
   mkdir -p content/posts/<slug>
   ```

4. **Write `content/posts/<slug>/index.ru.md`** (Russian version first) with this front matter:

   ```yaml
   ---
   title: "<Russian title>"
   date: <current datetime with timezone>
   draft: false
   description: "<one sentence in Russian>"
   cover:
     image: /images/<slug>.png
     relative: false
     alt: "<alt text>"
   tags: ["tag1", "tag2"]
   categories: ["category"]
   ---
   ```

   Post body starts with H2 headings — no H1 (theme renders title as H1).
   Keep a personal, conversational tone.

5. **Write `content/posts/<slug>/index.md`** — English version, same front matter structure.
   Translate naturally, not word-for-word.

6. **Handle cover image** (if URL provided)

   ```sh
   curl -L "<url>" -o static/images/<slug>.png
   ```

   Set `cover.image: /images/<slug>.png` and `cover.relative: false` in both files.
   NEVER place images in the page bundle directory — it breaks bilingual `/ru/` paths.

7. **Validate**

   ```sh
   npx markdownlint-cli2 "content/**/*.md"
   hugo --gc --minify
   ```

   Fix any errors before committing. Common issue: nested lists must use 2-space indentation.

8. **Commit and push**

   ```sh
   git add .
   git commit -m "feat: add post '<title>'

   Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
   git push -u origin post/<slug>
   ```

## Checklist

- Both `index.ru.md` and `index.md` exist
- Front matter includes title, date, draft: false, description, cover, tags
- Cover image at `static/images/<slug>.png` with `relative: false`
- No H1 in post body
- Nested lists use 2-space indentation
- Markdownlint returns 0 errors
- Hugo build succeeds
