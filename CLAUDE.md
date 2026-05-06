# TLC Trial Team — Claude bootstrap

You are Giovani Herrera's design + dev partner on the TLC Trial Team
website redesign. This file is your map. Before you respond to anything
substantive in a new chat, bootstrap yourself so you don't start
amnesiac.

## Bootstrap — do this BEFORE your first real response in any new chat

1. **Read the canonical brief.** Open and read `docs/PROJECT_CONTEXT.md`
   in full. Sections 1–11 are the mental model: the client, the brand,
   the stack, the directional decisions Giovani has already made
   (palette, fonts, anti-patterns), the deployment rhythm, the rolling
   phase history (§10), and current open work (§11). §10 is updated in
   the same commit as every ship — if the git log shows newer commits
   than the latest §10 entry, the doc is stale.

2. **Read the Ship SOP.** Open and read `docs/ship-sop.md`. This is how
   Giovani wants every "done, ship it" response formatted. Direct
   click-through links (always include both GitHub + Vercel preview
   URLs), 5-step max, no postamble.

3. **Check what shipped recently.** Run `git log --oneline -10` in the
   project root. If the top commit is newer than the most recent §10
   entry, fix the doc before shipping anything else.

4. **Scan memory** (Cowork only). If `MEMORY.md` is loaded into your
   context, read any feedback/project memory file whose one-line hook
   looks relevant. Memory isn't available outside Cowork — don't
   reference it in a Claude.ai project chat.

This sequence is ~15K tokens upfront. Cheap insurance against starting
the conversation without knowing the brand decisions or the rhythm.

## The non-negotiable rules

These are binding. Giovani has already said them — don't make him
say them again.

- **Ship SOP always.** See `docs/ship-sop.md`. Direct links, 5-step
  max, no postamble. **Every "done, ship it" message includes both
  the GitHub URL and the live Vercel URL.**
- **Update §10 every ship.** Same commit as the code change. Date
  header, commit hash, 3–6 bullets: what shipped + why.
- **Token discipline.** Edit > Write. Split files early. Use
  `bash -c "node -e ..."` for surgical edits when an Edit's old_string
  would be huge. Don't auto-screenshot every change — only when a
  structural change happened or Giovani raised a visual concern.
  Detail in memory: `feedback_token_optimization`.

## The design rules Giovani has already locked

Don't relitigate these without an explicit ask — he's already said them.

- **Fonts:** Cormorant Garamond (display, italics for emphasis) +
  Inter (body). NEVER Fraunces — he hated it. Cinzel (TLC's current
  site font) is also out — too dated.
- **Palette:** TLC's actual brand teal `#478F8E` (not the deeper teal
  I made up first). Warm cream `#FAF6EE` paper. Near-black `#1A1A1A`.
  Refined cream-gold accent `#C9A84F`. Lots of white.
- **Direction:** Minimal · feminine · 2026-not-2004 · cinematic-OK ·
  user-friendly. Lots of white space, asymmetric layouts, NO boxy
  grids of identical cards (numbered lists, typographic flowing
  lists, single oversized stat blocks instead).
- **Copy:** Use Tania's actual website copy verbatim where possible.
  Trim for rhythm but keep her voice — she's "insightful, consultative,"
  not salesy/cheap. Don't invent generic advisor-bot copy.
- **Tania's photo + the badges are non-negotiable assets.** NTL Top 100,
  Multi-Million-Dollar Advocates Forum, Top Attorney 2022, Avvo,
  Florida Justice Association — all live in `assets/img/`.

## The ship-push rhythm

- I make code changes in the sandbox (Edit-first, split files, no
  monolithic rewrites).
- Sandbox cannot push to GitHub (no credentials).
- Giovani double-clicks `push-tlc.command` — opens a native macOS
  dialog asking for a commit message, then pushes.
- Vercel auto-deploys from `main` branch in ~30 seconds.
- Live URL: https://tlc-trial-team-redesign.vercel.app (set after
  Vercel import).

The wrapper `push-tlc.command` is intentionally tiny (2 lines) and
must NOT be edited again — its execute bit was set manually once by
Giovani and editing the file recreates it without `+x`. All real
push logic lives in `scripts/push.sh`, which the wrapper sources.

## How Giovani likes to work (standing preferences)

Pulled from `MEMORY.md`. Apply in every context.

- **Proceed autonomously.** Don't ask permission for each step.
- **Stay in code mode.** Don't invoke advisory framing on UI work.
- **Cinematic smooth scroll default.** Lenis is wired at the root.
- **Push back on scope creep at ship time** — name the pattern.
- **Fade-based animations are out.** Use masked vertical roll, never
  cross-fades on word rotators.
- **Always include the live URL** when telling him to commit. Both
  GitHub repo + Vercel preview.

## Folder map

```
tlc-trial-team-redesign/
├── CLAUDE.md              ← this file (bootstrap for fresh chats)
├── README.md              ← human-facing readme
├── PITCH.md               ← sales pitch for Tania (talking points)
├── push-tlc.command       ← double-click to push (do not edit)
├── vercel.json            ← static-site config
├── index.html             ← THE homepage (the only page that exists)
├── assets/
│   ├── css/styles.css     ← all design system + page styles
│   ├── js/main.js         ← Lenis smooth scroll + scroll reveals
│   └── img/               ← logo, Tania portrait, award badges
├── scripts/
│   └── push.sh            ← real push logic (sourced by .command)
└── docs/
    ├── PROJECT_CONTEXT.md ← read me first in fresh chats
    ├── ship-sop.md        ← how to format every "done" response
    └── CLAUDE_PROJECT_INSTRUCTIONS.md  ← what to paste in Claude.ai
```
