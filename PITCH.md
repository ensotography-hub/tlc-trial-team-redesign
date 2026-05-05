# TLC Trial Team — The case for the $2,500 redesign

A talking-points sheet for Giovani. Use it on the Loom walkthrough,
or paste sections into the proposal email.

---

## The opening line

> "Tania — your story is one of the most powerful I've come across.
> A family that came here with nothing and rebuilt. Twenty years of
> standing alongside accident victims. 172 five-star reviews where
> people literally use the word 'family.' All of that deserves a
> website that *feels* like the firm you've actually built. Right
> now your site doesn't. Let me show you what it should look like."

Then share the link. Don't oversell. Let the mockup do it.

---

## What's wrong with the current site (frame these as **problems for her clients**, not insults to her web guy)

The current site (tlctrialteam.com, hosted on what looks like a 2018-era Genesis WordPress
template called "rivas-genesis-2020") has six concrete issues you can name on the call:

1. **It looks like 2009 in 2026.** First impression on mobile sets the bar — and right
   now the bar is "this firm is fine, I guess." For a $1.4M-settlement attorney, that's
   leaving money on the table before they pick up the phone.

2. **Tania is invisible.** The most powerful thing about TLC is *her* — her story, her
   bilingual fluency, her faith-anchored practice. The current site buries it. The new
   site puts her face in the hero, her quote in the hero, her Cuban-family origin
   story on the homepage.

3. **The 172 five-star reviews are nearly hidden.** That's the single strongest social
   proof the firm has, and it's a tiny line at the top. New site: it's stat #1 in the
   hero, a Google-branded review widget below the fold, and a full reviews page.

4. **No lead capture for "not ready to call yet" visitors.** Every visitor who isn't
   ready to dial right now is just… leaving. The new site has a 3-step progressive form
   that captures name → incident type → 2-sentence story, with no friction. Even half-finished
   submissions can be retargeted.

5. **NTL Top 100 badge is decoration, not credibility.** The new design treats it the way
   an Inc 5000 logo would be treated on a modern SaaS site — front-and-center, in the hero,
   not buried in a sidebar.

6. **No real local SEO depth.** Each "Areas We Serve" page on the current site is essentially
   the same template. The new architecture lets each city page (Lutz, Winter Haven, Lakeland,
   Tampa Bay, etc.) be its own SEO-rich landing — preserving every URL she already ranks for
   while making them actually convert.

---

## What the new design does (the tangible list)

Stack-rank the value:

- **Mobile-first.** Designed for the phone first, where 70%+ of injury searches happen.
- **Sub-1.5s load.** Static HTML/CSS, no WordPress bloat, no plugin tax, no slow theme.
- **3-step lead form** captures the visitors who aren't ready to call.
- **Live Google map** on the contact page (every office gets a pin).
- **Bilingual-ready** — En Español link in the utility bar, Spanish-speaking note on contact.
- **Reusable Google Reviews widget** (homepage + dedicated `/reviews` page).
- **Cinematic motion** — Lenis smooth scroll, masked vertical word rotator, scroll reveals
  (the same engine we use on Ensotography). Premium feel without being heavy.
- **Sticky nav with a permanent "Free Consultation" CTA** — the button is always one tap away.
- **Multi-page architecture** — every practice area + every city has its own page, so when
  a Lutz client searches "Lutz car accident lawyer" they hit a Lutz page, not a generic one.

---

## The intangible argument (this is the one that closes the deal)

> "Your website is the first thing a person in a crisis sees of you. It's the first
> impression a hospital nurse forms before recommending you to a patient who just got
> rear-ended. It's the first proof a Spanish-speaking family has that you can actually
> help them. Right now, that first impression is contradicting twenty years of work.
> A new site doesn't change *what you do* — it just stops the website from
> apologizing for it."

Other intangible angles to drop:

- **Recruitment** — when she eventually wants to add an associate, the new site is a
  recruiting tool. The current one is the opposite.
- **Referral confidence** — other attorneys who refer her cases will share her site.
  Right now they're hesitant to. New site: pride.
- **Faith-aligned positioning** — the new site lets her own her values without it
  feeling salesy. "Shared Christian values" lives in the about page, where it should be.
- **Settlement leverage** — adjusters absolutely Google opposing counsel. A modern
  site with $1.4M / $850K results front-and-center quietly raises the floor on every
  negotiation she walks into.

---

## The price anchor

Before naming $2,500, anchor against three numbers she already knows:

- **One PIP claim retainer.** Most of her PI cases generate 30–40% of recoveries that
  start at $5K and routinely cross $250K. The site pays for itself the moment one
  additional client hires her because of it.
- **A single billboard month.** A Tampa Bay billboard runs $2,800–$5,500/mo and reaches
  drivers, not researched buyers. The website works 24/7 for years.
- **Her current Yelp/legal-directory ad spend.** Whatever she's paying Avvo, Justia,
  FindLaw, Yelp Premium — the new site captures more of that traffic with no monthly
  recurring cost beyond the domain + hosting (~$15/mo).

> **Then say it:** "$2,500 for the full redesign — homepage plus every practice
> area page, every city page, About, Contact, Case Results, and Reviews. I handle
> the domain hookup, the SEO redirects so she keeps every Google ranking she's
> already built, and a full Google Search Console transfer. One-week turnaround."

---

## SEO preservation talk track

This is the one she'll worry about. Tell her:

1. **Every URL stays the same.** `/lutz/`, `/winter-haven/`, `/auto-accidents/`,
   `/case-results/` — same paths, just better content.
2. **All schema markup gets carried forward** — LegalService schema, AggregateRating,
   PostalAddress for each office. Already in the mockup.
3. **Free 301 redirect map** for any URL that does change.
4. **Google Search Console transfer** included — she keeps full visibility into search
   performance.
5. **No platform lock-in.** Static HTML deploys to Vercel/Netlify free tier. She owns
   the code; if she ever wants to move it, she can.

---

## The "why now" close

> "Florida's statute of limitations got cut from four years to two in March 2023.
> Cases that would have walked through your door in 2027 will hire someone else if
> your site doesn't show up in the first phone they pick up after the crash. Most
> of your competitors haven't updated their sites either. The window to be the
> visibly-modern firm in Tampa Bay is right now, and it doesn't stay open
> forever."

---

## What's in this folder (so you know what to demo)

```
tlc-trial-team-redesign/
├── index.html                       ← homepage (the centerpiece)
├── about.html                       ← Tania's full story + creds
├── contact.html                     ← 3 offices + map + lead form
├── case-results.html                ← 12 verdicts/settlements
├── reviews.html                     ← Google widget + 12 review cards
├── practice-areas/
│   └── auto-accidents.html          ← sample sub-page (full depth)
├── areas/
│   └── lutz.html                    ← sample area-served page
├── assets/
│   ├── css/styles.css               ← full design system (TLC palette)
│   ├── js/main.js                   ← Lenis + rotator + form + reveals
│   └── img/                         ← logo + Tania portrait + NTL badges
└── PITCH.md                         ← this file
```

The remaining practice-area pages (motorcycle, truck, slip-and-fall,
premises liability, negligent security, wrongful death, brain injury,
property damage) and remaining city pages (Winter Haven, Lakeland,
Tampa Bay, Wesley Chapel, Land O' Lakes, Spring Hill, New Port Richey,
Clearwater, Largo, St. Petersburg, Bradenton, Sarasota, Port Charlotte)
follow the same template — auto-accidents.html and lutz.html show
the pattern. Easy to clone & customize per page once she signs.

---

## After she says yes

1. Get domain access (Cloudflare nameservers if possible).
2. Set up Vercel project, deploy.
3. Map old WordPress URLs → new HTML URLs (most stay the same).
4. Submit updated sitemap to Google Search Console.
5. Migrate Google Business reviews badge to the new site (live API
   widget instead of static cards — upsell or include).
6. Bilingual page set (`/abogado/`) — same template, Spanish copy.
7. Two-week deliverable. Invoice on signature, balance on launch.
