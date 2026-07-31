# Pax Silica Assessment — public site

The published site for an independent, Philippines-centred assessment of the Pax Silica
initiative and the proposed Economic Security Zone at New Clark City, Capas, Tarlac.

**Live at <https://pax-silica.aiailabs.net>** — a static build, redeployed automatically on
every push to `main`.

The assessment takes no side. It neither endorses nor rejects the project; it concludes that
the Philippines should decline to sign in November 2026 unless seven preconditions are met.
Every figure on the site traces to a published source, and the sources register is part of
the page.

## Repository layout

```
index.html                     the site — 2,671 lines of plain, editable HTML
support.js                     template runtime; resolves the {{ }} bindings
assets/                        images
audio/                         33 narration clips for the embedded explainer
DESIGN.md                      the design contract — read before any visual change
narration-script.md / .json    narration source of truth, with timings
Pax Silica Full Report.dc.html printable/PDF edition
Pax Silica Explainer.dc.html   standalone explainer
archive/                       the previous single-file bundled export, kept as the
                               offline copy DESIGN.md asks for
```

## Editing

`index.html` is ordinary HTML. Edit it directly.

It was previously a single 12 MB bundled export that had to be decoded from a JSON-escaped
string, edited, and re-encoded with a byte-identical round-trip assertion. That is no longer
the case, and any instructions describing that procedure are obsolete.

Two things to respect:

- **`DESIGN.md` is the design contract.** New colours come from its palette; the three verdict
  states are not extended. It documents the conventions the page actually follows, including
  inline-styles-only with no stylesheets or CSS classes.
- **Narration timing is fixed to the audio.** The caption timings correspond to the 33 clips in
  `audio/`. Retiming captions without regenerating audio desynchronises the explainer.

## Two version tracks

- **Site version** — this repository, currently **v1.3**. Any copy change bumps it, in all three
  places it appears: the hero eyebrow, the "about this assessment" block, and the footer.
- **Assessment version** — the underlying research, currently **v2.6**, maintained separately with
  its own change log.

The page displays both, as `site v1.x · assessment v2.x`.

## This is a deploy target

The research is maintained in a separate private repository. Nothing reaches this one
automatically; changes are propagated deliberately, after verification, because a push here
publishes.

The assessment is maintained as a living document: project facts carry a "verified to" date
that moves forward as developments are checked, nothing is silently revised, and corrections
to previously published claims are stated as corrections. The version current when the
November 2026 framework is signed will be frozen as the permanent pre-signature record.
