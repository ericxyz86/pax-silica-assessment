# Source migration — parity reached, awaiting cutover approval

`site/index.html` is the 340 KB editable source. The 12 MB bundle at the repo root
is still what is deployed. `main` is untouched.

## Parity against the live bundle — rendered, settled, identical

| | live bundle | source | delta |
|---|---|---|---|
| rendered characters | 71,215 | 71,215 | **0** |
| `<section id>` | 21 | 21 | 0 |
| `<h2>` | 10 | 10 | 0 |
| `<h3>` | 34 | 34 | 0 |
| sentences (>40 chars) | 409 | 409 | 0 missing, 0 extra |
| unresolved `{{ }}` bindings | 0 | 0 | — |

Both measured after an identical settle pass (scroll to bottom to trigger every
IntersectionObserver reveal, then back to top). The explainer auto-open is gated by a
`paxExplainerSeen` localStorage flag; it must be cleared between runs or the second
page measured will differ by the modal's chrome. That flag caused a false 3-sentence
gap on the first attempt.

## What was ported
- 19 of today's 31 July corrections, re-applied by hand.
- 19 further content hunks ported from the live bundle, covering the v2.5 substance the
  Claude Design project never received (the "more than 30 countries" false-claim entry,
  the payroll-withholding disclosure, the 2017 ECC confirmation) and the /no-ai-slop
  rewrites.
- 1 hunk deliberately NOT ported: `reportHref` bundler indirection. The source links the
  full report by literal href, which is correct for a multi-file deploy.

## Not yet proven
- Visual/CSS parity — only rendered text was compared.
- Coolify serving a multi-file tree (config says `build_pack: static`, `base_directory: /`,
  nginx:alpine, so it should serve the repo root, but it has never been exercised).
