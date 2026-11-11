---
name: defi-agents-library
description: Browse and load DeFi, portfolio, trading and Web3 agent definitions (system prompt, opening questions, examples) from the public sperax.click JSON API. Use when you need a specialist persona such as a yield farmer, gas optimizer or liquidation risk manager.
---

# DeFi Agents library

The repo publishes each agent as a static JSON file on `https://sperax.click`. No key, no install, no MCP server: use plain HTTP GET (`curl`, `fetch`, WebFetch).

## Endpoints

| Request | Returns |
| --- | --- |
| `GET https://sperax.click/index.json` | `{"schemaVersion": 1, "agents": [...]}` with one summary per agent |
| `GET https://sperax.click/index.{locale}.json` | The same index translated, e.g. `index.zh-CN.json`, `index.fr-FR.json` |
| `GET https://sperax.click/{agent-id}.json` | One full agent definition |
| `GET https://sperax.click/{agent-id}.{locale}.json` | One agent in a locale, e.g. `defi-yield-farmer.fr-FR.json` |
| `GET https://sperax.click/agents-manifest.json` | Agents grouped by family (for example `sperax`) plus the access patterns above |

Locales listed in the repo's `docs/API.md`: `en-US`, `ar`, `bg-BG`, `zh-CN`, `zh-TW`, `de-DE`, `es-ES`, `fa-IR`, `fr-FR`, `it-IT`, `ja-JP`, `ko-KR`, `nl-NL`, `pl-PL`, `pt-BR`, `ru-RU`, `tr-TR`, `vi-VN`.

## Index entry fields

Each item in `agents` has `identifier`, `author`, `createdAt`, `homepage`, `knowledgeCount`, `pluginCount`, `schemaVersion`, `tokenUsage` and `meta` (`title`, `description`, `avatar`, `tags`, `category`). Filter on `meta.tags` or `meta.category`, then fetch by `identifier`.

## Full agent fields

`config.systemRole` (the system prompt), `config.openingMessage`, `config.openingQuestions`, plus top-level `examples`, `summary`, `meta` and `identifier`.

## Worked example

```bash
# 1. list ids and titles
curl -s https://sperax.click/index.json | jq -r '.agents[] | "\(.identifier)\t\(.meta.title)"'

# 2. pull one agent's system prompt
curl -s https://sperax.click/defi-yield-farmer.json | jq -r '.config.systemRole'
```

Use the `systemRole` text as the system prompt (or a subagent brief) for the task, and offer `openingQuestions` to the user to scope the request.

## Rules

- The agents are prompts, not live data sources: they do not fetch prices, TVL or APYs. Combine them with real market data tools and say so when numbers are unverified.
- Never execute transactions on the strength of an agent's advice; show the user recipient, amount and chain first.
- The live index is the source of truth. `docs/API.md` in the repo still describes `index.json` as a bare array; the deployed file wraps the list in an `agents` key.

## Contributing an agent

Agent sources live in `src/<id>.json` in the repo (`github.com/nirholas/defi-agents`). The build (`bun run build`) generates the per-locale files; `bun run format` normalises the source JSON.
