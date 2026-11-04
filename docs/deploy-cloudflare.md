# Deploying sperax.click on Cloudflare Pages

[sperax.click](https://sperax.click) serves the agent JSON API and these docs from the Cloudflare Pages project `sperax-click`. The `sperax.click` zone is on Cloudflare; at Namecheap the domain's nameservers point to Cloudflare.

## What the site serves

| Path | Content |
|------|---------|
| `/` | `302` redirect to `/docs/` |
| `/docs/` | This documentation (`docs/` copied as is) |
| `/index.json`, `/index.{locale}.json` | Agent index, one per locale |
| `/{agent-id}.json`, `/{agent-id}.{locale}.json` | Single agent definitions |
| `/agents-manifest.json` | Manifest of all agents |
| `/schema/speraxAgentSchema_v1.json` | Agent JSON Schema |
| `/llms.txt`, `/llms-full.txt`, `/robots.txt`, `/humans.txt` | Root text files |

Every `*.json` response carries the CORS and cache headers from `vercel.json` (`Access-Control-Allow-Origin: https://sperax.io`, `s-maxage=86400`). `scripts/build-site.sh` writes them to `_site/_headers`.

## Build and deploy by hand

```bash
bun install
bun scripts/commands/build.ts     # agent JSON for every locale -> ./public
bash scripts/build-site.sh        # ./public + docs + root files -> ./_site
export CLOUDFLARE_API_TOKEN=...   # token with Pages:Edit
export CLOUDFLARE_ACCOUNT_ID=...
npx wrangler pages deploy _site --project-name sperax-click --branch main
```

`--branch main` makes it the production deployment. Any other branch name creates a preview at `<hash>.sperax-click.pages.dev`.

## Automatic deploys

`.github/workflows/cloudflare-pages.yml` runs the same steps on every push to `main` and on manual dispatch. It needs two repository secrets:

| Secret | Value |
|--------|-------|
| `CLOUDFLARE_API_TOKEN` | API token with `Cloudflare Pages: Edit` |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare account ID |

## Verify

```bash
curl -sI https://sperax.click/ | head -1                 # 302
curl -s https://sperax.click/index.json | head -c 100     # {"schemaVersion":1,...
curl -sI https://sperax.click/sperax-portfolio-tracker.json | grep -i access-control
```

## Rollback

In the Cloudflare dashboard, open **Workers & Pages → sperax-click → Deployments**, pick an earlier production deployment and choose **Rollback to this deployment**.

## Using your own domain

1. Create a Pages project: `npx wrangler pages project create <name> --production-branch main`.
2. Deploy as above with `--project-name <name>`.
3. In the project, open **Custom domains** and add your hostname. If the zone is on Cloudflare, the DNS record is created for you. Otherwise add a `CNAME` to `<name>.pages.dev`.
4. Replace `sperax.click` in `CNAME`, `robots.txt` and the README.
