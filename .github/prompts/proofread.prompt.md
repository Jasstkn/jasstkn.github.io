---
description: Proofread a blog post in both Russian and English for grammar, naturalness, and readability
---

Proofread blog post files for grammar, style, and natural reading flow.

## Input

Provide the post slug or file paths. If not provided, proofread the most recently modified post in `content/posts/`.

## Russian (`index.ru.md`)

**Grammar and style:**
- Fix case agreement (падеж) — e.g., "несколько фактов" vs "несколько факта"
- Fix verb forms and aspect (вид глагола)
- Fix preposition usage ("по идее" — not "поидее", always two words)
- Comma placement before subordinate clauses (перед придаточными)

**Readability:**
- Keep the author's personal, conversational tone (first person, informal but thoughtful)
- Avoid bureaucratic phrasing; prefer natural spoken Russian
- Short sentences are better than long compound ones
- If a sentence is awkward, rephrase — don't just fix the typo

**Do not change:**
- Technical terms in English (Kubernetes, CI/CD, GitHub Copilot CLI, etc.)
- Code blocks or inline code
- URLs and link text
- The author's subjective opinions and style

## English (`index.md`)

**Grammar:**
- Fix article usage (a/an/the) — Russian speakers often omit articles
- Fix subject-verb agreement
- Fix verb tense consistency within paragraphs
- "would be" for hypotheticals, "is/are" for facts

**Readability:**
- Ensure translation sounds natural in English — not a literal translation from Russian
- Vary sentence structure to avoid monotony
- Prefer active voice over passive

**Common errors from past proofreading:**
- "Поидее" → "По идее"
- "разницы" → "разницу" (accusative case)
- Missing comma before "но", "что", "которые"
- "would be" where simple present is correct
- Missing article "the" before specific nouns

## Output

Apply corrections directly to both files.
Provide a brief summary of changes made (grouped by file and error type).
Do NOT change meaning, structure, post length, or add new content.
