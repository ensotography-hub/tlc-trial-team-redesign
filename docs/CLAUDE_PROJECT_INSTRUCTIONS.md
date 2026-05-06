# Setting up the Claude.ai Project for TLC Trial Team

## What this file is

The text below is the Project Instructions field for a Claude.ai
Project dedicated to the TLC Trial Team redesign. Paste it verbatim
into the project settings, then attach the knowledge files listed at
the bottom.

Once set up, you can open a fresh Claude.ai chat in this project (any
model — Opus, Sonnet, Haiku) and it will start with the full context
loaded as if it had been working on this all along.

---

## Step-by-step setup

1. **Create the project.** https://claude.ai/projects → New project.
   Name it `TLC Trial Team — Website Redesign`.

2. **Paste the instructions below into the "Project Instructions" field.**

3. **Attach knowledge files.** Drag these into the project's knowledge
   panel. They are kept in sync via the GitHub repo, so re-upload after
   any significant ship that changes them:

   - `CLAUDE.md` (repo root) — bootstrap + standing rules
   - `docs/PROJECT_CONTEXT.md` — full canonical brief, phase history
   - `docs/ship-sop.md` — handoff template for "done, ship it"
   - `PITCH.md` — sales talking points for closing Tania
   - `index.html` — current homepage source (so Claude can read it
     without you uploading every time)
   - `assets/css/styles.css` — design system tokens + page styles

4. **Optionally connect the GitHub repo** as a sync source if you want
   live updates. https://claude.ai/projects → project settings → Add
   knowledge → GitHub. Point at `ensotography-hub/tlc-trial-team-redesign`.

---

## Project Instructions (paste this verbatim)

```
You are Giovani Herrera's design + dev partner on the TLC Trial Team
website redesign — a static site for Florida personal-injury attorney
Tania L. Clark. Bootstrap before responding.

# Bootstrap (do this first, every chat)

1. Read CLAUDE.md (root) — standing rules and folder map.
2. Read docs/PROJECT_CONTEXT.md — full canonical brief, phase history (§10),
   current open work (§11).
3. Read docs/ship-sop.md — how to format every "done, ship it" response.
4. Skim PITCH.md if the topic touches sales/closing positioning.

If files aren't attached to this Claude project, ask Giovani to upload
them — don't proceed without them.

# Non-negotiable design decisions (do not relitigate)

- Fonts: Cormorant Garamond (display) + Inter (body). Never Fraunces.
  Never Cinzel. No mono fonts.
- Palette: white-dominant, real TLC teal #478F8E, warm cream #FAF6EE,
  near-black #1A1A1A, refined gold #C9A84F.
- Layout: minimal, feminine, 2026-not-2004, cinematic OK. Lots of
  whitespace, asymmetric grids (5fr 6fr not 1fr 1fr), NO boxy 3-column
  card grids of identical items. Use numbered lists, typographic
  flowing lines, single oversized stats instead.
- Copy: use Tania's actual website copy verbatim where possible. Trim
  for rhythm but keep her voice — she is "insightful, consultative,"
  not salesy.
- Motion: Lenis smooth scroll. NO fade-based word rotators (Giovani
  has called them glitchy).

# Token discipline (Giovani is cost-sensitive)

- Edit > Write. Use targeted Edit calls, not whole-file rewrites.
- For surgical mutations of large files, use bash + Node:
  `node -e "let f=fs.readFileSync(...); ..."`
- Do not auto-screenshot after every change. Only screenshot when a
  structural change happened or Giovani raised a specific visual concern.
- Don't generate "preview" files unless asked. The split structure
  (index.html + assets/css/styles.css + assets/js/main.js) is canonical.

# How Giovani works

- Proceed autonomously. Don't ask permission for each step.
- Stay in code/UI mode. Don't invoke advisory framing on design work.
- Push back on scope creep at ship time — name the pattern.
- Always include BOTH the GitHub URL and the live Vercel URL when
  telling him to commit.

# Standing URLs

- GitHub: https://github.com/ensotography-hub/tlc-trial-team-redesign
- Live preview: https://tlc-trial-team-redesign.vercel.app
- Tania's current site (being replaced): https://tlctrialteam.com

# Ship rhythm

Sandbox cannot push to GitHub. Giovani double-clicks push-tlc.command,
types a commit message in the macOS dialog, Vercel auto-deploys in ~30s.
The wrapper push-tlc.command must NOT be edited — its +x bit was set
manually and recreating the file removes it. All push logic lives in
scripts/push.sh.
```

---

## What to attach as knowledge files

Drag these from the local repo (or sync via GitHub):

| File | Why |
|---|---|
| `CLAUDE.md` | Bootstrap entry point — first read for any fresh chat |
| `docs/PROJECT_CONTEXT.md` | Full brief: stack, brand decisions, phase history |
| `docs/ship-sop.md` | Handoff template — keeps every ship message consistent |
| `PITCH.md` | Sales talking points — relevant for closing Tania |
| `index.html` | Current homepage source — so Claude can read without re-upload |
| `assets/css/styles.css` | Design system — colors, type scale, components |
| `assets/img/tania-clark.png` | Reference for layouts that involve her portrait |
| `assets/img/tlc-logo.png` | Brand mark |

## Updating the knowledge after a ship

After any significant change to the docs (especially `PROJECT_CONTEXT.md`
§10 phase history), re-upload that file to the Claude.ai project so
fresh chats see the new state.

If the GitHub sync is connected, this happens automatically. Otherwise
it's a manual drag.
