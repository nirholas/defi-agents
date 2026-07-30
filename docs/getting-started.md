# Getting started with defi-agents

General Agent Index and library of specialized AI agents for general use, DeFi, portfolio management, yield optimization, trading, and blockchain automation. Supports linting, automated translation, and CI auto-build for seamless plugin discovery via index.json. Github Pages compatible.

## Install

```bash
npm install @nirholas/ai-agents-library
```

## Verify the install

Clone the repository and run its checks to confirm everything works on your machine:

```bash
git clone https://github.com/nirholas/defi-agents.git
cd defi-agents
```

Available commands:

| Command | Runs |
|---|---|
| `npm run build` | `bun scripts/commands/build.ts` |
| `npm run lint` | `eslint "scripts/**/*.ts" --fix` |
| `npm run test` | `bun scripts/commands/test.ts` |

## Next steps

- [Examples](./examples.md) shows runnable snippets.
- The [README](https://github.com/nirholas/defi-agents#readme) is the complete reference.
- Found a problem? [Open an issue](https://github.com/nirholas/defi-agents/issues).
