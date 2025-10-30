# Migration Guide: Template → Plugin

CCPM 2.0 introduces a plugin architecture that simplifies installation and updates. This guide helps you migrate from the old template system to the new plugin.

## What Changed?

### Before (Template Mode v1.x)
- Ran: `curl -sSL https://automaze.io/ccpm/install | bash`
- Copied entire system into each project's `.claude/` directory
- Commands, agents, rules, scripts duplicated per project
- Updates required re-copying or manual merging

### After (Plugin Mode v2.0)
- Run: `/plugin install ccpm@automazeio`
- Plugin installed once, used across all projects
- Only user data (PRDs, epics, context) stays in project
- Updates via: `/plugin update ccpm`

## Benefits

✅ **Single Installation** - Install once, use everywhere
✅ **Easy Updates** - One command updates all projects
✅ **Cleaner Projects** - No template files in `.claude/`
✅ **Faster Setup** - New projects start instantly
✅ **Version Management** - Semantic versioning with rollback

## Automatic Migration

Run the migration command in your project:

```bash
/migrate-from-template
```

This will:
1. ✅ Detect your template installation
2. 📦 Backup your data (PRDs, epics, context)
3. 🗑️ Remove template files (commands, agents, rules, scripts)
4. ✅ Keep your user data intact
5. 📋 Guide you through plugin installation

## Manual Migration

If you prefer manual migration:

### Step 1: Backup Your Data

```bash
mkdir .claude-backup
cp -r .claude/prds .claude-backup/
cp -r .claude/epics .claude-backup/
cp -r .claude/context .claude-backup/
cp .claude/settings.local.json .claude-backup/ 2>/dev/null || true
```

### Step 2: Remove Template Files

```bash
rm -rf .claude/commands
rm -rf .claude/agents
rm -rf .claude/rules
rm -rf .claude/scripts
rm -rf .claude/hooks
rm .claude/ccpm.config
rm .claude/settings.json.example
```

### Step 3: Install Plugin

```bash
/plugin install ccpm@automazeio
```

Or install directly from Git:

```bash
/plugin install https://github.com/automazeio/ccpm.git
```

### Step 4: Verify

```bash
/pm:help
/pm:status
```

### Step 5: Clean Up

```bash
rm -rf .claude-backup  # After verifying everything works
```

## What Gets Kept

Your data is preserved:
- ✅ `.claude/prds/` - All your PRDs
- ✅ `.claude/epics/` - All your epics and tasks
- ✅ `.claude/context/` - Your project context
- ✅ `.claude/settings.local.json` - Your permissions

## What Gets Removed

Template files (now in plugin):
- 🗑️ `.claude/commands/`
- 🗑️ `.claude/agents/`
- 🗑️ `.claude/rules/`
- 🗑️ `.claude/scripts/`
- 🗑️ `.claude/hooks/`
- 🗑️ `.claude/ccpm.config`

## Marketplace Setup (Optional)

For team-wide consistency, add the marketplace to your settings:

**Project Settings** (`.claude/settings.json`):
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

**Global Settings** (`~/.claude/settings.json`):
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

Then install with:
```bash
/plugin install ccpm@automazeio
```

## Troubleshooting

### Commands Not Found After Migration

```bash
# List installed plugins
/plugin list

# Reinstall if needed
/plugin install ccpm@automazeio
```

### Old Template Files Remain

```bash
# Check what's in .claude/
ls -la .claude/

# If old directories exist, remove them
rm -rf .claude/commands .claude/agents .claude/rules .claude/scripts
```

### Data Lost During Migration

Restore from backup:
```bash
cp -r .claude-backup/* .claude/
```

### Plugin Not Loading

```bash
# Check plugin installation
/plugin list

# Reinstall with force
/plugin uninstall ccpm
/plugin install ccpm@automazeio
```

## Multiple Projects

You only need to install the plugin once. It will work across all your projects:

```bash
# In project 1
cd ~/projects/project1
/plugin install ccpm@automazeio
/pm:init

# In project 2 - plugin already available!
cd ~/projects/project2
/pm:init  # Just create directories, plugin already installed
```

## Rollback to Template Mode

If you need to rollback (not recommended):

1. Uninstall plugin:
   ```bash
   /plugin uninstall ccpm
   ```

2. Reinstall template (v1.x):
   ```bash
   git clone https://github.com/automazeio/ccpm.git
   cd ccpm
   git checkout v1.x  # Last template version
   cp -r ccpm/* .claude/
   ```

## Version Compatibility

- **v2.0.0+**: Plugin mode
- **v1.x**: Template mode (deprecated)

Your PRDs, epics, and context files are compatible between versions.

## Support

- 📚 [Documentation](https://github.com/automazeio/ccpm)
- 🐛 [Report Issues](https://github.com/automazeio/ccpm/issues)
- 💬 [Discussions](https://github.com/automazeio/ccpm/discussions)
- 𝕏 [Follow @aroussi](https://x.com/aroussi)
