# Ship SOP — how Claude hands work back to Giovani

This is the template every "done, ship it" response follows. Claude fills
the blanks, Giovani follows the numbered steps top-to-bottom. No
guessing, no Googling, no asking which link.

**The rule:** every step has a direct click-through link, the exact
content to paste (if any), and a one-line "what you should see" so the
user knows they did it right. **Every ship message includes BOTH the
GitHub URL and the live Vercel URL.**

---

## The template

### What shipped

A tight bulleted list of what's in this commit, grouped by surface.
Each bullet ends with the file path so Giovani can eyeball where it lives.

```
- Hero rotator hover state — slower roll on hover (assets/css/styles.css)
- Practice list keyboard-focusable — Enter triggers same as click (assets/js/main.js)
- Tania portrait crop — top-aligned to keep her face above the fold (index.html)
```

### What you need to do — in order

Numbered. Time estimates in parens. Never more than 5 steps — if it's
more, break it into phases.

#### Step 1 — Push to GitHub (10s)

Double-click `push-tlc.command` in Finder.

A native macOS dialog opens — type the commit message you want (or hit
Return for the default `update: YYYY-MM-DD HH:MM`), click **Push**.

**You should see:** Terminal prints `✓ Pushed.` and a macOS
notification ("TLC pushed").

#### Step 2 — Watch Vercel deploy (30–60s)

**Click:** https://vercel.com/dashboard

Find `tlc-trial-team-redesign` → latest deployment shows "Building" → then
green "Ready".

#### Step 3 — Verify live

**Click the live URL:** https://tlc-trial-team-redesign.vercel.app

Hard-refresh once (cmd+shift+R) so the new CSS/JS isn't cached.

**You should see:** [exact phrase or visual change to look for, e.g.
"the teal italic 'in an instant' on the hero"].

#### Step 4 — Standing URLs (always include in every ship)

- **Repo:** https://github.com/ensotography-hub/tlc-trial-team-redesign
- **Live:** https://tlc-trial-team-redesign.vercel.app
- **Tania's current site (for comparison):** https://tlctrialteam.com

#### Step 5 — If anything looks wrong

"Tell me what step you're on and what you see — I'll debug."

---

## Rules Claude follows when writing one of these

1. **Commit-ready first, talk after.** Claude makes all the edits in
   the sandbox before writing the response. Giovani's workspace folder
   IS the live git clone — files Claude writes are already there.

2. **Push happens on Giovani's machine.** The sandbox has no GitHub
   credentials. The push wrapper `push-tlc.command` opens an osascript
   dialog for the commit message — Giovani doesn't need to type
   anything in Terminal.

3. **Update §10 of PROJECT_CONTEXT.md in the same commit.** Date header,
   commit hash, 3–6 bullets of what shipped + why. Bump "Last updated"
   at the top. Skipping this is what makes fresh chats amnesiac.

4. **Both URLs in every ship message.** GitHub repo URL + live Vercel
   URL. Not optional. Giovani has explicitly asked for this.

5. **No postamble.** Don't summarize what you did at the bottom. He
   reads the bullets and clicks the link. Trailing paragraphs of "this
   change improves..." waste his time.

6. **Direct links only.** "Open Vercel and find the project" is wrong.
   `https://vercel.com/dashboard` is right.

7. **5-step max.** If a ship needs more than 5 steps, the work is too
   big — split into two ships. Most ships are 3 steps (push → wait →
   verify).

---

## When to NOT use the Ship SOP

- The change is purely sandbox-side (e.g., reading files, planning) —
  no commit yet. Just respond conversationally.
- It's a verification or audit response (e.g., "let me check how X
  works"). Use the SOP only when there's something to push.
- The conversation is mid-iteration — don't ship every micro-change.
  Batch related changes into one push.
