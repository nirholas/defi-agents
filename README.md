# 🤖 AI Agents Library - DeFI Agents

> **Universal AI agent library, index, and marketplace for DeFi, crypto, development, metaverse, MCP, and beyond**

A comprehensive collection of specialized AI agents with universal compatibility. Works with any AI platform that supports agent indexes - no vendor lock-in, no platform restrictions.

---

## ✨ Key Features

- ✅ **41 Specialized Agents** - DeFi, crypto, development, writing, education, and more
- ✅ **18 Languages** - Automated i18n translation workflow ([Learn More →](./docs/I18N_WORKFLOW.md))
- ✅ **Agent Teams** - Multi-agent collaboration with coordinated workflows
- ✅ **Universal Format** - Standard JSON schema works everywhere
- ✅ **No Vendor Lock-in** - Switch platforms without losing work
- ✅ **Open Source** - MIT licensed, fully transparent
- ✅ **API Access** - RESTful API via GitHub Pages CDN
- ✅ **Custom Domain Ready** - Easy white-labeling

---

## 🚀 Quick Start

### For Users

Add agents to your AI platform:

```
https://nirholas.github.io/defi-agents/index.json
```

### For Developers

```bash
git clone https://github.com/nirholas/defi-agents.git
cd defi-agents
bun install
bun run format
bun run build
```

---

## 📦 Agent Categories

### 🪙 DeFi & Crypto (41 Specialized Agents)

**Sperax Ecosystem (10 Agents):**

- USDs Stablecoin Expert, SPA Tokenomics Analyst, veSPA Lock Optimizer
- Governance Guide, Liquidity Strategist, Bridge Assistant
- Yield Aggregator, Risk Monitor, Onboarding Guide, Portfolio Tracker

**General DeFi (31 Agents):**

- Yield Farming Optimizer, Impermanent Loss Calculator, Gas Optimizer
- Smart Contract Auditor, MEV Protection Advisor, Whale Watcher
- Protocol Comparator, Token Unlock Tracker, Liquidation Risk Manager
- Airdrop Hunter, Alpha Leak Detector, APY vs APR Educator
- Bridge Security Analyst, Crypto Tax Strategist, DeFi Insurance Advisor
- DeFi Onboarding Mentor, DeFi Protocol Comparator, DeFi Risk Scoring Engine
- DEX Aggregator Optimizer, Governance Proposal Analyst, Layer 2 Comparison Guide
- Liquidation Risk Manager, Liquidity Pool Analyzer, Narrative Trend Analyst
- NFT Liquidity Advisor, Portfolio Rebalancing Advisor, Protocol Revenue Analyst
- Protocol Treasury Analyst, Stablecoin Comparator, Staking Rewards Calculator
- Wallet Security Advisor, Yield Dashboard Builder, Yield Sustainability Analyst

[View Full Agent List →](https://nirholas.github.io/AI-Agents-Library/)

---

## 🤝 Agent Teams

Create collaborative teams of specialized agents that work together on complex tasks.

**Example Team - DeFi Strategy:**

```
- Yield Optimizer (finds opportunities)
- Risk Assessment Agent (evaluates safety)
- Portfolio Tracker (monitors performance)
- Gas Optimizer (minimizes costs)
```

The host agent coordinates discussion, ensuring each specialist contributes their expertise while building toward a comprehensive solution.

[Read Teams Guide →](./docs/TEAMS.md)

---

## 🌍 Multi-Language Support

All agents automatically available in 18 languages:

🇺🇸 English・🇨🇳 简体中文・🇹🇼 繁體中文・🇯🇵 日本語・🇰🇷 한국어・🇩🇪 Deutsch・🇫🇷 Français・🇪🇸 Español・🇷🇺 Русский・🇸🇦 العربية・🇵🇹 Português・🇮🇹 Italiano・🇳🇱 Nederlands・🇵🇱 Polski・🇻🇳 Tiếng Việt・🇹🇷 Türkçe・🇸🇪 Svenska・🇮🇩 Bahasa Indonesia

---

## 🛠️ API Reference

### Endpoints

```bash
# Main index (all agents)
GET https://nirholas.github.io/AI-Agents-Library/index.json

# Individual agent (English)
GET https://nirholas.github.io/AI-Agents-Library/{agent-id}.json

# Localized agent
GET https://nirholas.github.io/AI-Agents-Library/{agent-id}.zh-CN.json

# Language-specific index
GET https://nirholas.github.io/AI-Agents-Library/index.zh-CN.json
```

### Quick Integration

```javascript
// Load all agents
const response = await fetch('https://nirholas.github.io/AI-Agents-Library/index.json');
const { agents } = await response.json();

// Load specific agent
const agent = await fetch(`https://nirholas.github.io/AI-Agents-Library/defi-yield-optimizer.json`);
const agentConfig = await agent.json();
```

[Full API Documentation →](./docs/API.md)

---

## 🤖 Contributing an Agent

We welcome contributions! Submit your agent to expand the library.

### Quick Submit

1. **Fork this repository**
2. **Create your agent** in `src/your-agent-name.json`

```json
{
  "author": "your-github-username",
  "config": {
    "systemRole": "You are a [role] with expertise in [domain]..."
  },
  "identifier": "your-agent-name",
  "meta": {
    "title": "Agent Title",
    "description": "Clear, concise description",
    "avatar": "🤖",
    "tags": ["category", "functionality", "domain"]
  },
  "schemaVersion": 1
}
```

3. **Submit a Pull Request**

Our automated workflow will translate your agent to 18 languages and deploy it globally.

### Quality Guidelines

✅ Clear purpose - solves a specific problem\
✅ Well-structured prompts - comprehensive but focused\
✅ Appropriate tags - aids discovery\
✅ Tested - verified functionality

[Full Contributing Guide →](./docs/CONTRIBUTING.md)

---

## 📖 Documentation

### For Users

- [Agent Teams Guide](./docs/TEAMS.md) - Multi-agent collaboration
- [FAQ](./docs/FAQ.md) - Common questions
- [Examples](./docs/EXAMPLES.md) - Real-world use cases

### For Developers

- [API Reference](./docs/API.md) - Complete API documentation
- [Agent Creation Guide](./docs/AGENT_GUIDE.md) - Design effective agents
- [18 Languages i18n Workflow](./docs/I18N_WORKFLOW.md) - Automated translation system
- [Prompt Engineering](./docs/PROMPTS.md) - Writing better prompts
- [Model Parameters](./docs/MODELS.md) - Temperature, top_p explained
- [Troubleshooting](./docs/TROUBLESHOOTING.md) - Common issues

---

## 🚀 Deployment

### GitHub Pages (Automatic)

1. Enable GitHub Pages in repository settings
2. Set source branch to `gh-pages`
3. Push to main - GitHub Actions handles deployment

Agents live at: `https://[username].github.io/[repository]/index.json`

### Custom Domain

1. Add `CNAME` file with your domain
2. Configure DNS: `CNAME` → `[username].github.io`
3. Enable HTTPS in repository settings

[Full Deployment Guide →](./docs/DEPLOYMENT.md)

---

## 🔧 Development Tools

### Split Agent Batches

```bash
node split-agents.cjs
```

Converts batch JSON into individual agent files.

### Emoji Converter

```bash
node emoji-converter.cjs
```

Converts emoji URLs to native Unicode.

---

## 🌐 Integration Examples

### Custom Application

```javascript
// Fetch agents
const agents = await fetch('https://nirholas.github.io/AI-Agents-Library/index.json').then((r) =>
  r.json(),
);

// Use with your AI model
const systemPrompt = agents.agents[0].config.systemRole;
```

### Python

```python
import requests

# Load agents
response = requests.get('https://nirholas.github.io/AI-Agents-Library/index.json')
agents = response.json()['agents']

# Filter by tag
defi_agents = [a for a in agents if 'defi' in a['meta']['tags']]
```

---

## 🔐 Security & Privacy

- **No data collection** - Static JSON index, zero tracking
- **Agents run locally** - Execute in your AI platform's environment
- **Open source** - Full transparency, audit every line
- **No external calls** - Pure JSON configuration files

---

## 📊 Stats

- **41 Agents** - DeFi-focused coverage
- **18 Languages** - Global accessibility via automated translation
- **10 Sperax Specialists** - Ecosystem-specific agents
- **31 General DeFi Agents** - Comprehensive DeFi toolkit
- **\~200 KB Index** - Fast loading (gzipped: \~45 KB)
- **80-120ms** - Global CDN delivery
- **0 Vendor Lock-in** - True interoperability

---

## 🔗 Projects Building with AI Agents Library 🤍

- **SperaxOS** - [Application Branch](https://github.com/nirholas/AI-Agents-Library/tree/speraxos)

---

## 📜 License

MIT License - see [LICENSE](LICENSE) file for details.

**Open Source • Open Format • Open Future**

---

<!-- AWESOME PROMPTS -->

### [Crypto Whale Watcher](https://os.sperax.io/crypto/agents/whale-watcher)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Track and analyze large wallet movements and whale behavior

`on-chain` `whale` `analytics` `trading` `monitoring`

---

### [Cross-Chain Bridge Security Analyst](https://os.sperax.io/crypto/agents/bridge-security-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Evaluate bridge security and recommend safest cross-chain routes

`bridge` `security` `cross-chain` `risk` `multichain`

---

### [Token Unlock Schedule Tracker](https://os.sperax.io/crypto/agents/token-unlock-tracker)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Monitor and analyze token unlock events and their market impact

`tokenomics` `unlocks` `vesting` `supply` `analysis`

---

### [veSPA Lock Optimizer](https://os.sperax.io/crypto/agents/vespa-optimizer)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Maximize returns through optimal veSPA locking strategies

`sperax` `vespa` `staking` `optimization` `voting-power`

---

### [Sperax Portfolio Tracker](https://os.sperax.io/crypto/agents/sperax-portfolio-tracker)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Track and analyze your complete Sperax ecosystem holdings

`sperax` `portfolio` `tracking` `analytics` `dashboard`

---

### [DeFi Insurance & Risk Coverage Advisor](https://os.sperax.io/crypto/agents/defi-insurance-advisor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Navigate DeFi insurance options for smart contract protection

`insurance` `protection` `risk` `coverage` `safety`

---

### [NFT Liquidity & Lending Advisor](https://os.sperax.io/crypto/agents/nft-liquidity-advisor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Navigate NFT-backed lending and liquidity solutions

`nft` `liquidity` `lending` `collateral` `defi`

---

### [USDs Stablecoin Expert](https://os.sperax.io/crypto/agents/usds-stablecoin-expert)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Specialist in Sperax USDs mechanism, collateralization, and yield strategies

`sperax` `stablecoin` `usds` `defi` `yield`

---

### [DEX Aggregator Route Optimizer](https://os.sperax.io/crypto/agents/dex-aggregator-optimizer)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Find optimal swap routes across DEX aggregators

`dex` `swap` `routing` `aggregator` `optimization`

---

### [Crypto Tax Strategy Advisor](https://os.sperax.io/crypto/agents/crypto-tax-strategist)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Optimize crypto taxes and provide tax-efficient DeFi strategies

`tax` `strategy` `accounting` `optimization` `compliance`

---

### [Smart Contract Security Auditor](https://os.sperax.io/crypto/agents/smart-contract-auditor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Review and assess smart contract security for DeFi protocols

`security` `smart-contracts` `audit` `solidity` `risk`

---

### [Sperax Yield Aggregator](https://os.sperax.io/crypto/agents/sperax-yield-aggregator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Find and optimize best yield opportunities in Sperax ecosystem

`sperax` `yield` `farming` `optimization` `apy`

---

### [Personal DeFi Dashboard Builder](https://os.sperax.io/crypto/agents/yield-dashboard-builder)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Design and track your custom DeFi portfolio dashboard

`dashboard` `tracking` `portfolio` `analytics` `monitoring`

---

### [Crypto Wallet Security Advisor](https://os.sperax.io/crypto/agents/wallet-security-advisor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Best practices for securing crypto wallets and assets

`security` `wallet` `safety` `best-practices` `hardware`

---

### [DeFi Yield Sustainability Analyst](https://os.sperax.io/crypto/agents/yield-sustainability-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Analyze whether high yields are sustainable or temporary

`defi` `yield` `sustainability` `analysis` `tokenomics`

---

### [Stablecoin Deep Comparator](https://os.sperax.io/crypto/agents/stablecoin-comparator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Compare stablecoin mechanisms, risks, and use cases

`stablecoin` `usdc` `dai` `usdt` `comparison`

---

### [DeFi Portfolio Rebalancing Advisor](https://os.sperax.io/crypto/agents/portfolio-rebalancing-advisor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Optimize portfolio allocation and rebalancing strategies

`portfolio` `rebalancing` `allocation` `strategy` `optimization`

---

### [Sperax Ecosystem Onboarding Guide](https://os.sperax.io/crypto/agents/sperax-onboarding-guide)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Help newcomers understand and start using Sperax protocol

`sperax` `education` `onboarding` `beginner` `tutorial`

---

### [DeFi Yield Farming Strategist](https://os.sperax.io/crypto/agents/defi-yield-farmer)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Identify and optimize yield farming opportunities across DeFi protocols

`defi` `yield-farming` `apy` `strategy` `optimization`

---

### [Sperax Governance Guide](https://os.sperax.io/crypto/agents/sperax-governance-guide)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Navigate Sperax DAO proposals, voting, and protocol upgrades

`sperax` `governance` `dao` `voting` `proposals`

---

### [DeFi Protocol Comparison Expert](https://os.sperax.io/crypto/agents/defi-protocol-comparator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Compare similar DeFi protocols across features, risks, and yields

`defi` `comparison` `protocols` `analysis` `research`

---

### [DeFi Beginner Onboarding Mentor](https://os.sperax.io/crypto/agents/defi-onboarding-mentor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Guide complete beginners through their first DeFi experiences

`education` `beginner` `onboarding` `tutorial` `defi-basics`

---

### [APY vs APR Educator](https://os.sperax.io/crypto/agents/apy-vs-apr-educator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Explain and calculate the difference between APY and APR in DeFi

`defi` `education` `apy` `apr` `yields`

---

### [Protocol Revenue & Fundamentals Analyst](https://os.sperax.io/crypto/agents/protocol-revenue-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Analyze DeFi protocol business models and revenue generation

`defi` `revenue` `analysis` `fundamentals` `tokenomics`

---

### [DAO Governance Proposal Analyst](https://os.sperax.io/crypto/agents/governance-proposal-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Analyze and explain DAO governance proposals and their implications

`governance` `dao` `voting` `proposals` `analysis`

---

### [Impermanent Loss Calculator](https://os.sperax.io/crypto/agents/impermanent-loss-calculator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Calculate and explain impermanent loss scenarios for LP positions

`defi` `liquidity` `impermanent-loss` `calculator` `amm`

---

### [DAO Treasury & Resource Analyst](https://os.sperax.io/crypto/agents/protocol-treasury-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Analyze DAO treasury holdings, runway, and capital allocation

`treasury` `dao` `capital` `runway` `allocation`

---

### [Liquidation Risk Manager](https://os.sperax.io/crypto/agents/liquidation-risk-manager)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Monitor and manage liquidation risks in lending protocols

`lending` `liquidation` `risk` `collateral` `defi`

---

### [Crypto Narrative & Trend Analyst](https://os.sperax.io/crypto/agents/narrative-trend-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Track and analyze dominant narratives and trends in crypto markets

`narrative` `trends` `analysis` `sentiment` `market-cycles`

---

### [Sperax Protocol Risk Monitor](https://os.sperax.io/crypto/agents/sperax-risk-monitor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Track and analyze security risks across Sperax smart contracts

`sperax` `security` `risk` `audit` `monitoring`

---

### [Liquidity Pool Deep Analyzer](https://os.sperax.io/crypto/agents/liquidity-pool-analyzer)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Analyze LP pool health, risks, and optimal entry/exit timing

`defi` `liquidity-pools` `amm` `analysis` `risk`

---

### [SPA Tokenomics Analyst](https://os.sperax.io/crypto/agents/spa-tokenomics-analyst)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Expert in SPA token economics, staking rewards, and protocol revenue

`sperax` `spa` `tokenomics` `staking` `governance`

---

### [Gas Cost Optimization Expert](https://os.sperax.io/crypto/agents/gas-optimization-expert)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Minimize gas costs and optimize transaction timing

`ethereum` `gas` `optimization` `layer-2` `efficiency`

---

### [Crypto Alpha & Signal Detector](https://os.sperax.io/crypto/agents/alpha-leak-detector)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Identify trading alpha and early signals in DeFi markets

`alpha` `trading` `signals` `research` `opportunities`

---

### [MEV Protection Advisor](https://os.sperax.io/crypto/agents/mev-protection-advisor)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Protect users from front-running, sandwich attacks, and MEV exploitation

`mev` `security` `front-running` `flashbots` `protection`

---

### [Sperax Liquidity Provider Strategist](https://os.sperax.io/crypto/agents/sperax-liquidity-strategist)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Optimize liquidity provision strategies across Sperax pools

`sperax` `liquidity` `amm` `yield-farming` `impermanent-loss`

---

### [Sperax Bridge Assistant](https://os.sperax.io/crypto/agents/sperax-bridge-assistant)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Guide users through cross-chain bridging with optimal routes and costs

`sperax` `bridge` `cross-chain` `arbitrum` `layer-2`

---

### [Staking Rewards Calculator](https://os.sperax.io/crypto/agents/staking-rewards-calculator)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Calculate and optimize staking rewards across protocols

`staking` `rewards` `calculator` `pos` `yields`

---

### [DeFi Protocol Risk Scoring Engine](https://os.sperax.io/crypto/agents/defi-risk-scoring-engine)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Comprehensive risk assessment framework for DeFi protocols

`risk` `assessment` `scoring` `analysis` `framework`

---

### [DeFi Airdrop Hunter](https://os.sperax.io/crypto/agents/airdrop-hunter)

<sup>By **[@sperax](https://github.com/nirholas/AI-Agents-Library)** on **2024-12-16**</sup>

Identify and strategize for potential protocol airdrops

`airdrop` `rewards` `strategy` `farming` `allocation`
