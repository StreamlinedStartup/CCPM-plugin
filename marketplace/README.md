# CCPM Marketplace

This directory contains the marketplace configuration for the Claude Code PM plugin.

## Using This Marketplace

### Option 1: Add to Claude Code Settings

Add this marketplace to your Claude Code settings file (`.claude/settings.json` or global settings):

```json
{
  "marketplaces": [
    {
      "name": "streamlinedstartup",
      "url": "https://raw.githubusercontent.com/StreamlinedStartup/CCPM-plugin/main/marketplace/marketplace.json"
    }
  ]
}
```

Then install the plugin:

```bash
/plugin install ccpm@streamlinedstartup
```

### Option 2: Direct Git Installation

Install directly from the repository:

```bash
/plugin install https://github.com/StreamlinedStartup/CCPM-plugin.git
```

## Marketplace Structure

```json
{
  "name": "streamlinedstartup",
  "displayName": "StreamlinedStartup CCPM Marketplace",
  "plugins": [
    {
      "name": "ccpm",
      "displayName": "Claude Code PM",
      "version": "2.0.0",
      "installUrl": "https://github.com/StreamlinedStartup/CCPM-plugin.git"
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
