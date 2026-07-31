# Pax Silica Assessment — public site

Public static deployment of the Pax Silica independent assessment.

- Production: <https://pax-silica.aiailabs.net>
- Entry point: `index.html`
- Hosting: Coolify static build on the AI LABS Hetzner server, deploying on push to `main`
- Access: Public Cloudflare Access bypass for this exact hostname

## This repo is a deploy target, not the source of truth

The research lives in a separate **private** repo: <https://github.com/ericxyz86/pax-silica>

Nothing reaches this repo automatically. Changes are propagated deliberately, after verification, because every push here redeploys a public page.

## Two version tracks — do not conflate

- **Site version** (this repo, currently **v1.1**) — the published page. Any copy change or major tweak bumps it, in all three places it appears: the hero eyebrow, the "about this assessment" block, and the footer.
- **Assessment version** (research repo, currently **v2.6**) — the research itself, with change logs in its Appendix H.

The site is due to display both as `site v1.x · assessment v2.x`.

## Editing `index.html`

It is a bundled export: the entire page is a JSON-escaped string inside `<script type="__bundler/template">`. Do not hand-edit it as HTML.

1. Back up `index.html` first.
2. Decode the template payload with `json.loads`.
3. Edit the decoded page.
4. Re-encode with `json.dumps(page, ensure_ascii=False)`, then escape `</script>` and `</`.
5. **Assert the round-trip decodes back byte-identical before writing.**

**Never edit the narration caption array** — the `[[0.6, '...']]` block preceding `CLIPS_HAVE`. It is timed to the recorded MP3s in `pax-silica-narration/`, and changing that text desyncs the captions from the audio. When replacing strings, compute that block's span and skip anything inside it; at least one string appears both as visible copy and as a locked caption.

Two verification traps that produce false alarms: captions store em dashes as literal escape sequences rather than the character itself, so searching for a real dash misses them; and `CLIPS_HAVE` legitimately appears three times, not once. Verify by byte-comparing the caption block against the pre-edit file rather than by string probes.
