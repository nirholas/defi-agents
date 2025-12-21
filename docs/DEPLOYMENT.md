# 🚀 Deployment Guide

## GitHub Pages Deployment

This repository is configured for automatic deployment to GitHub Pages using GitHub Actions.

### For Your Own Fork

#### Option 1: Use Default GitHub Pages Domain

1. **Delete the CNAME file:**

   ```bash
   rm CNAME
   git add CNAME
   git commit -m "Remove custom domain"
   git push
   ```

2. **Enable GitHub Pages:**
   - Go to your repository Settings → Pages
   - Source: Deploy from a branch
   - Branch: `gh-pages` / `root`
   - Your site will be at: `https://[username].github.io/[repository]/`

#### Option 2: Use Your Custom Domain

1. **Update the CNAME file:**

   ```bash
   echo "yourdomain.com" > CNAME
   git add CNAME
   git commit -m "Update custom domain"
   git push
   ```

2. **Configure DNS:**
   - Add a CNAME record pointing to: `[username].github.io`
   - Or for apex domain, add A records to GitHub's IPs

3. **Enable GitHub Pages:**
   - Go to Settings → Pages
   - Add your custom domain
   - Enable "Enforce HTTPS" once DNS propagates

### How It Works

The automated deployment process:

1. **On every push to main:**
   - Runs tests and formatting
   - Builds the agent index with `bun run build`
   - Copies `CNAME` file (if exists) to `public/` directory
   - Deploys `public/` directory to `gh-pages` branch

2. **CNAME handling:**
   - If `CNAME` exists in root → Copied to `public/CNAME` → Custom domain preserved
   - If `CNAME` doesn't exist → No CNAME in public → Uses default GitHub Pages URL

### Troubleshooting

**Custom domain not working?**

- Verify DNS records are correct (use `dig yourdomain.com` or `nslookup`)
- Wait for DNS propagation (can take 24-48 hours)
- Check GitHub Pages settings show your domain correctly

**Still using old domain after fork?**

- Make sure you updated/deleted the `CNAME` file in the root directory
- Push changes and wait for GitHub Actions to complete
- Clear browser cache or try incognito mode

**Build failing?**

- Check that `OPENAI_API_KEY` secret is set in repository settings
- Review GitHub Actions logs for specific errors

### Manual Deployment

To build and test locally:

```bash
# Install dependencies
bun install

# Build the agent index
bun run build

# The public/ directory now contains your built site
# CNAME file is automatically copied if it exists
```

### Environment Variables

Required for CI/CD:

- `OPENAI_API_KEY` - OpenAI API key for translation generation (set in repository secrets)

Optional:

- `OPENAI_PROXY_URL` - Custom OpenAI API proxy URL

### Architecture

```
Root Directory
├── CNAME                          # Your custom domain (optional)
├── src/                           # Agent source files
│   └── *.json                     # Individual agent definitions
├── locales/                       # 18 language translations
│   └── agent-name/
│       └── index.[locale].json
└── public/                        # Build output (gitignored)
    ├── CNAME                      # Copied from root during build
    ├── index.json                 # Main agent index
    ├── agent-name.json            # Individual agent files
    └── index.[locale].json        # Localized indexes

GitHub Actions Workflow:
1. Trigger on push to main
2. Install dependencies
3. Run tests and formatting
4. Build agent index (includes CNAME copy)
5. Deploy public/ to gh-pages branch
```

### Domain Configuration Examples

**Subdomain (Recommended):**

```
Type: CNAME
Host: agents (or subdomain of choice)
Value: yourusername.github.io
```

Your agents will be at: `agents.yourdomain.com`

**Apex Domain:**

```
Type: A
Host: @
Value: 185.199.108.153
Value: 185.199.109.153
Value: 185.199.110.153
Value: 185.199.111.153
```

Your agents will be at: `yourdomain.com`

### Security Notes

- Never commit API keys to the repository
- Use GitHub Secrets for sensitive environment variables
- CNAME file is safe to commit (it's just your domain name)
- The `public/` directory is gitignored to prevent build artifacts in git

### Support

For issues or questions:

- Check [Troubleshooting Guide](./TROUBLESHOOTING.md)
- Review [GitHub Pages Documentation](https://docs.github.com/en/pages)
- Open an issue in this repository
