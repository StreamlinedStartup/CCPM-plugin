# CCPM Marketplace

This directory contains the marketplace configuration for the Claude Code PM plugin.

## Using This Marketplace

### Option 1: Add to Claude Code Settings

Add this marketplace to your Claude Code settings file (`.claude/settings.json` or global settings):

```json
{
  "marketplaces": [
    {
      "name": "automazeio",
      "url": "https://raw.githubusercontent.com/automazeio/ccpm/main/marketplace/marketplace.json"
    }
  ]
}
```

Then install the plugin:

```bash
/plugin install ccpm@automazeio
```

### Option 2: Direct Git Installation

Install directly from the repository:

```bash
/plugin install https://github.com/automazeio/ccpm.git
```

## Marketplace Structure

```json
{
  "name": "automazeio",
  "displayName": "Automaze CCPM Marketplace",
  "plugins": [
    {
      "name": "ccpm",
      "displayName": "Claude Code PM",
      "version": "2.0.0",
      "installUrl": "https://github.com/automazeio/ccpm.git"
    }
  ]
}
```

## Updating the Marketplace

When releasing a new version:

1. Update `version` in `marketplace.json`
2. Update `version` in `.claude-plugin/plugin.json`
3. Tag the release: `git tag v2.0.0`
4. Push: `git push origin main --tags`

## Documentation

- [Plugin Architecture](../README.md)
- [Migration Guide](../MIGRATION.md)
- [Commands Reference](../COMMANDS.md)
