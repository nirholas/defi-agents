#!/usr/bin/env bash
# Assemble the Cloudflare Pages site for sperax.click into ./_site.
# Run after `bun scripts/commands/build.ts`, which writes the agent JSON to ./public.
set -euo pipefail
cd "$(dirname "$0")/.."

test -f public/index.json || { echo "public/index.json missing: run the build first" >&2; exit 1; }

rm -rf _site
mkdir -p _site/docs
cp -r public/. _site/
cp -r docs/. _site/docs/
rm -f _site/docs/split-agents.cjs
cp agents-manifest.json llms.txt llms-full.txt robots.txt humans.txt _site/
cp -r schema _site/

cat > _site/_redirects <<'REDIRECTS'
/ /docs/ 302
REDIRECTS

cat > _site/_headers <<'HEADERS'
/*.json
  Access-Control-Allow-Origin: https://sperax.io
  Access-Control-Allow-Methods: GET, OPTIONS
  Cache-Control: public, max-age=3600, s-maxage=86400, stale-while-revalidate=604800
  Vary: Origin
HEADERS

echo "Site assembled in _site ($(find _site -type f | wc -l) files)"
