# DESIGN.md — Pax Silica Assessment

Design documentation for the Pax Silica interactive assessment portal, the animated explainer, and the printable full report.

Built on the **Agile Intelligence Design System**. Everything below is what is actually in the built files — not aspiration.

---

## 1. What this is

A public-interest research portal assessing the Philippines' "Pax Silica" semiconductor initiative: a 1,618.74-hectare Economic Zone offered to US chipmakers, with no signed agreement behind it.

Audience: policymakers, journalists, civil society, investors. The design problem is **credibility under scrutiny** — every number has to be traceable, every claim checkable, and nothing may read as advocacy.

### Deliverables

| File | Role |
|---|---|
| `Pax Silica Assessment.dc.html` | The portal. Desktop-first, 29 sections, 10 interactive exhibits, embedded explainer. |
| `Pax Silica Explainer.dc.html` | Standalone 3:06 narrated explainer, sized for screen recording. |
| `Pax Silica Full Report.dc.html` | Paginated print document (`doc-page.js`), letter, PDF-ready. |
| `Pax Silica Full Report autoprint.dc.html` | Same, fires print on load. |
| `*(offline).html` | Self-contained bundles, ~12.3 MB each, all audio and assets inlined. |
| `narration-script.md` / `.json` | Narration source of truth, 33 lines with timings. |
| `audio/` | 33 ElevenLabs MP3s, one per narration line. |

---

## 2. Design principles

1. **Evidence is the interface.** No finding appears without its source. The source card is a first-class component, not a footnote.
2. **Neutral surface, loud numbers.** The page is white and quiet; the data carries the emphasis. Never editorialize with color.
3. **Interrogate, don't assert.** Sliders, scenario toggles and the claim checker let the reader test the argument rather than accept it.
4. **Rhythm by exception.** The document runs white for long stretches; three navy full-bleed exhibits mark the three load-bearing arguments (water, jobs, preconditions).
5. **Degrade to paper.** Everything must survive as a PDF and as an offline file with no network.

---

## 3. Color

### Brand core (from the design system)

| Token | Hex | Use |
|---|---|---|
| Deep Intelligence Blue | `#0B4F9C` | Structure, headings on light, section rules, link hover |
| Bright Analytics Blue | `#0096D6` | Interaction — links, focus rings, slider accent, progress bar |
| Cyan / Teal accent | `#00B8CC` | Eyebrows, highlight terms, explainer accents. Sparing. |
| Navy surface | `#061B3A` | Full-bleed dark exhibits, explainer field, hero |
| White | `#FFFFFF` | Default surface |
| Off-white | `#FAFBFC` | Alternating sections |
| Card fill | `#F8FAFB` | Card and table-header fill |
| Hairline | `#E6E9EE` | Every border and divider. 1px, never dashed. |
| Ink | `#0E1726` | Headings, primary text on light |
| Body | `#475063` | Body copy |
| Muted | `#7B8597` | Labels, captions, mono eyebrows |
| Soft grey | `#A7A9AC` | Tertiary, disabled |
| Cool grey | `#D6D9DC` | Chart gridlines, inactive tracks |
| Ice blue | `#E6F4FA` | Nav hover, selection, tinted rows |

### Evidence & status scale (extension)

Assessment work needs verdicts. Three semantic colors only, each with a light companion fill — never used decoratively:

| Meaning | Fore | Fill | Where |
|---|---|---|---|
| Contradicted / unmet / risk | `#D04A4A` (`#B03A3A` on light fill) | `#FCEAEA` | Claim checker "not supported", unmet gates, downside scenario |
| Partial / unverified / caution | `#E4A11B` (`#9A6B10` text) | `#FDF3E0` | Discrepancies, "partially supported", pending gates |
| Supported / met | `#2EA86A` (`#1F7A4C` text) | `#E7F6EC` | Verified claims, met preconditions |

Chart-only tints: `#5B7DA5`, `#8FBEDF`, `#C9E4F3` for comparator series where blue must read as a scale rather than as brand.

**Rules.** One background color per block. Red is only ever a verdict, never a highlight. No gradient except the signature `#0B4F9C → #0096D6` on the reading-progress bar and the explainer veils.

---

## 4. Typography

**Inter** for everything readable. **JetBrains Mono** for every spec: eyebrows, section numbers, register IDs, units, axis labels, table headers, countdown digits.

| Role | Spec |
|---|---|
| Display (hero, explainer) | `clamp(34px, 6.2vw, 92px)` · 800 · `-0.045em` · `0.95` |
| Section title | `clamp(26px, 3.4vw, 44px)` · 700 · `-0.03em` · `1.08` · lowercase |
| Exhibit title | 19–22px · 700 · `-0.02em` |
| Big number / KPI | `clamp(28px, 4vw, 58px)` · 800 · `-0.04em` · tabular |
| Body | 16–17px · 400 · `1.65` · `#475063` |
| Small body / caption | 13–14px · `1.6` · `#7B8597` |
| Mono eyebrow | 11–12px · 500 · `0.12em` tracking · uppercase |
| Mono micro (IDs, units) | 10–11px · `0.08em` |

**Casing.** Section titles and nav labels lowercase — the design system's structural rule. Body copy sentence case. Eyebrows uppercase mono. Proper nouns, agencies and acronyms always keep their real casing (`BCDA`, `PEZA`, `US$`) — the lowercase rule never overrides accuracy.

All figures use `font-variant-numeric: tabular-nums` so columns align and counters don't jitter.

---

## 5. Layout

- **Max content width** 1280px; reading column capped at ~72ch for prose.
- **Fluid gutters** `clamp(16px, 4vw, 40px)` — the single padding expression used everywhere, so 390px and 1920px share one rule.
- **8-pt spacing scale**: 4 / 8 / 16 / 24 / 32 / 48 / 64 / 96 / 128.
- **Section chrome**: mono number · 60px rule · lowercase title, at the top of every section.
- **Radii**: 6 chips · 12 cards (default) · 16 popovers · 20 large panels · 32 showcase · 999 pills.
- **Shadows**: none at rest. `0 6px 16px rgba(14,23,38,.06)` on hover; `0 24px 40px -16px rgba(11,79,156,.22)` on lifted popovers and the explainer frame.

### Header

Sticky, `rgba(255,255,255,0.88)` + `saturate(180%) blur(14px)`, 1px hairline beneath, 62px min-height. One row only: mark + wordmark, primary nav pills (`nowrap`, `overflow:hidden`), then a **more** menu holding the secondary sections, then search. Scroll-spy fills the active pill deep blue with white text. A 3px gradient reading-progress bar sits above it.

### Responsive

Desktop-first, verified to 390px. No media-query breakpoint soup — the layout holds through:
- fluid padding and `clamp()` type
- `flex-wrap` on every stat row and card grid
- `minmax()` grids that collapse to one column
- dense tables in `overflow-x:auto` wrappers with a mono "scroll →" hint
- full-bleed navy exhibits that keep their padding ratio via `min(vw, vh)` clamps

---

## 6. Component inventory

**Source card.** Hairline card, `#F8FAFB`, mono register ID top-right, tier badge, publisher · date · title, outbound link with `→`. Appears beneath every finding.

**Claim chip.** Pill with verdict color + light fill, mono verdict label, expands to the matching register entries. Has a share-card action.

**Exhibit shell.** White (or navy) block with mono eyebrow, lowercase title, one-line standfirst, the interactive body, then a provenance line listing the register IDs it draws on.

**Provenance line.** Mono, 10.5px, `#7B8597`, prefixed `sources ·`, register IDs comma-separated. Every section has one.

**Stat block.** Big tabular number + mono label beneath. Grouped in wrapping flex rows with `clamp(24px, 5vw, 80px)` gaps.

**Slider exhibit.** `input[type=range]` with `accent-color:#0096D6`, live readout in the big-number style, verdict chip that flips color as the value crosses the threshold.

**Gate / precondition row.** Status dot, label, verdict pill, evidence link. Sixteen rows, fifteen unmet.

**Data table.** Mono uppercase header on `#F8FAFB`, 1px row hairlines, tabular figures, right-aligned numerics, horizontal scroll on narrow.

**Countdown.** Mono tabular digits, unit labels beneath, navy field. Counts to the November decision point.

**Explainer popup.** Navy frame, radial cyan/blue glows, 3px radial-dot grain at `mix-blend-mode:overlay` / `0.45`. Rounded 20px in popup mode, full-bleed when expanded. Transport bar: play/pause, restart, scrubber, elapsed/total mono, chapter rail (hidden in popup mode), subtitle track.

---

## 7. Motion

Single easing curve: `cubic-bezier(.2,.7,.2,1)`.

- **Reveal**: `opacity 0→1` + `translateY(24px→0)`, 800ms, staggered per child via `IntersectionObserver`.
- **Counters** animate to value on first view, 900ms, tabular so width never shifts.
- **Explainer scenes** use `data-in` delays in seconds per element, driven off the audio clock — so narration and visuals cannot drift.
- **Hover**: `translateY(-3px)` + shadow step + border to `#0096D6` on cards; `translateX(3px)` on arrow glyphs.
- No springs, no bounce, no parallax, no scroll-jacking.
- `prefers-reduced-motion: reduce` kills all animation and transition globally.

---

## 8. Evidence architecture

Three interlocking layers — the part of the design that matters most.

1. **Sources register** — 59 entries, four evidence tiers (primary official / secondary reported / analytical / contested). Each has an ID, publisher, date, title, URL, tier.
2. **Per-section provenance** — every section declares the register IDs it draws on, so a reader can audit any passage without leaving it.
3. **Claim checker** — user-testable claims resolved against the register, each returning supported / partial / not supported with the entries behind the verdict.

Appendices B–G carry calculations, discrepancies, BCDA lease provisions, glossary, evidence gaps and version history. The printable report reproduces the full register verbatim.

---

## 9. Accessibility

- `:focus-visible { outline: 2px solid #0096D6; outline-offset: 2px }` everywhere.
- Body text ≥ 4.5:1; mono micro-labels ≥ 4.5:1 against their surface (muted grey is never used below 10px).
- Hit targets ≥ 44px on touch.
- All 33 narration lines have synced subtitles; the explainer is fully comprehensible muted.
- Semantic headings, `aria-label` on every icon-only control, real `<table>` markup for tabular data.
- Bilingual (English / Filipino) toggle on body content.

---

## 10. Conventions for future work

- Inline styles only — no stylesheets, no CSS classes. The only `<helmet><style>` content is font loading, `@keyframes`, body resets, and the reduced-motion kill switch.
- New colors must come from §3. If a new semantic state is genuinely needed, add it to §3 with its light companion fill before using it.
- Any new finding ships with a register entry and a source card. No exceptions — an uncited number is a bug.
- Verdict language stays in the three states. Don't invent a fourth.
- Keep the offline bundles in sync when audio or assets change; they are the archival copies.
- Update `narration-script.json` before touching explainer timings — the scene clock reads from it.
