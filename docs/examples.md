# defi-agents examples

General Agent Index and library of specialized AI agents for general use, DeFi, portfolio management, yield optimization, trading, and blockchain automation. Supports linting, automated translation, and CI auto-build for seamless plugin discovery via index.json. Github Pages compatible.

## Example 1

```bash
# Get all agents (English)
curl https://sperax.click/index.json

# Get agents in any language
curl https://sperax.click/index.zh-CN.json

# Get agent manifest for indexing
curl https://sperax.click/agents-manifest.json
```

## Example 2

```text
https://sperax.click/index.json
```

## Example 3

```text
https://sperax.click/index.{locale}.json
```

## Example 4

```bash
git clone https://github.com/nirholas/defi-agents.git
cd defi-agents
bun install
bun run format
bun run build
```

## Example 5

```text
- Yield Optimizer (finds opportunities)
- Risk Assessment Agent (evaluates safety)
- Portfolio Tracker (monitors performance)
- Gas Optimizer (minimizes costs)
```

## Example 6

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

## Example 7

```bash
node split-agents.cjs
```

## Example 8

```bash
node emoji-converter.cjs
```


Every snippet above is taken from the [repository documentation](https://github.com/nirholas/defi-agents#readme).
