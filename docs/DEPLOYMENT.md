# 🚀 Deployment Guide

This repository supports **two deployment options**:

| Option | Best For | Requires |
|--------|----------|----------|
| **GitHub Pages** | Free hosting, automatic CI/CD | GitHub Actions enabled |
| **Vercel** | Faster global CDN, CORS control | Vercel account |

---

## Option 1: GitHub Pages (Automatic)

GitHub Pages is the **default deployment method**. It works automatically when GitHub Actions are enabled.

### Setup

1. **Fork/Clone this repository**

2. **Configure secrets** in Settings → Secrets → Actions:
   ```
   OPENAI_API_KEY=sk-your-key-here
   ```

3. **Choose your domain:**

   **Default GitHub Pages URL:**
   ```bash
   rm CNAME
   git add CNAME && git commit -m "Use default domain" && git push
   ```
   Your URL: `https://[username].github.io/defi-agents/`

   **Custom Domain:**
   ```bash
   echo "agents.yourdomain.com" > CNAME
   git add CNAME && git commit -m "Set custom domain" && git push
   ```

4. **Enable GitHub Pages:**
   - Settings → Pages → Source: `gh-pages` branch
   - Enable "Enforce HTTPS"

### How It Works

```
Push to main → GitHub Actions → Build → Deploy to gh-pages
```

The workflow (`.github/workflows/release.yml`):
1. Runs tests
2. Translates agents to 18 languages via OpenAI
3. Builds `public/` directory
4. Deploys to `gh-pages` branch
5. GitHub Pages serves from `gh-pages`

---

## Option 2: Vercel (Manual or Automatic)

Vercel provides **faster global CDN** and **CORS control** for API access. Use this when:
- GitHub Actions are disabled
- You want to restrict which domains can access your agents
- You need faster global performance

### Quick Setup

1. **Go to [vercel.com/new](https://vercel.com/new)**

2. **Import your repository**

3. **Configure build settings:**
   | Setting | Value |
   |---------|-------|
   | Framework Preset | Other |
   | Build Command | `bun run build` |
   | Output Directory | `public` |
   | Install Command | `bun install` |

4. **Add environment variables:**
   ```
   OPENAI_API_KEY=sk-your-key-here
   ```

5. **Deploy!**

### CORS Configuration

The included `vercel.json` restricts API access to authorized origins:

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Access-Control-Allow-Origin",
          "value": "https://sperax.io"
        }
      ]
    }
  ]
}
```

**To allow multiple origins**, update `vercel.json`:

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Access-Control-Allow-Origin",
          "value": "*"
        }
      ]
    }
  ]
}
```

**To allow specific origins**, use Vercel Edge Middleware (create `middleware.ts`).

### Caching Configuration

The included `vercel.json` uses aggressive caching to minimize costs:

```json
{
  "headers": [
    {
      "source": "/(.*)",
      "headers": [
        {
          "key": "Cache-Control",
          "value": "public, max-age=3600, s-maxage=86400, stale-while-revalidate=604800"
        }
      ]
    }
  ]
}
```

This means:
- Browser caches for 1 hour
- CDN caches for 24 hours
- Stale content served for up to 7 days while revalidating

### Manual Build for Vercel

If you want to build locally before deploying:

```bash
# Using the local release script
./scripts/local-release.sh

# Or manually
bun install
bun run format   # Requires OPENAI_API_KEY
bun run build
# Deploy public/ to Vercel
```

---

## Comparison: GitHub Pages vs Vercel

| Feature | GitHub Pages | Vercel |
|---------|--------------|--------|
| **Cost** | Free | Free (with limits) |
| **Global CDN** | ✅ Cloudflare | ✅ Vercel Edge |
| **Custom Domain** | ✅ Yes | ✅ Yes |
| **HTTPS** | ✅ Yes | ✅ Yes |
| **CORS Control** | ❌ No | ✅ Yes |
| **Build on Push** | ✅ Auto | ✅ Auto |
| **Requires Actions** | ✅ Yes | ❌ No |
| **Analytics** | ❌ No | ✅ Yes |
| **Rate Limiting** | ❌ No | ✅ Yes |

---

## Domain Configuration

### For GitHub Pages

**Subdomain (Recommended):**
```
Type: CNAME
Host: agents
Value: [username].github.io
```

**Apex Domain:**
```
Type: A
Host: @
Values: 185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153
```

### For Vercel

**Subdomain:**
```
Type: CNAME
Host: agents
Value: cname.vercel-dns.com
```

**Apex Domain:**
```
Type: A
Host: @
Value: 76.76.21.21
```

---

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `OPENAI_API_KEY` | ✅ Yes | For agent translation to 18 languages |
| `OPENAI_PROXY_URL` | ❌ No | Custom OpenAI API proxy |

---

## Local Development

```bash
# Clone
git clone https://github.com/nirholas/defi-agents.git
cd defi-agents

# Install
bun install

# Create an agent
# Add your-agent.json to src/

# Translate (requires OpenAI API key)
export OPENAI_API_KEY=sk-your-key
bun run format

# Build
bun run build

# Preview
npx serve public
```

---

## Troubleshooting

### GitHub Pages Issues

**Build failing?**
- Check `OPENAI_API_KEY` secret is set
- Review Actions logs for errors

**Custom domain not working?**
- Verify DNS with `dig yourdomain.com`
- Wait 24-48 hours for propagation
- Check CNAME file exists in root

### Vercel Issues

**Build failing?**
- Ensure Output Directory is `public`
- Check `OPENAI_API_KEY` env var is set
- Review build logs

**CORS errors?**
- Update `vercel.json` with your domain
- Check browser console for exact error

---

## Migration

### From GitHub Pages to Vercel

1. Import repo to Vercel
2. Configure build settings (see above)
3. Update DNS to point to Vercel
4. (Optional) Disable GitHub Pages in settings

### From Vercel to GitHub Pages

1. Enable GitHub Actions
2. Add `OPENAI_API_KEY` secret
3. Update DNS to point to GitHub
4. Enable GitHub Pages with `gh-pages` branch
