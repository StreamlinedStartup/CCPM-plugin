---
allowed-tools: Bash(bash ${CLAUDE_PLUGIN_ROOT}/ccpm/scripts/migrate-to-plugin.sh)
---

# Migrate from Template to Plugin

This command helps you migrate from the old template installation to the new plugin architecture.

## What This Does

1. **Detects template installation** - Checks if you have the old CCPM template files
2. **Backs up your data** - Creates a timestamped backup of PRDs, epics, and context
3. **Removes template files** - Deletes commands, agents, rules, scripts (now provided by plugin)
4. **Keeps your data** - Preserves PRDs, epics, context, and settings
5. **Guides next steps** - Instructions to install the plugin

## Usage

```
/migrate-from-template
```

## What Gets Kept

- ✅ `.claude/prds/` - Your Product Requirements Documents
- ✅ `.claude/epics/` - Your epics and tasks
- ✅ `.claude/context/` - Your project context
- ✅ `.claude/settings.local.json` - Your permissions

## What Gets Removed

- 🗑️ `.claude/commands/` - Now provided by plugin
- 🗑️ `.claude/agents/` - Now provided by plugin
- 🗑️ `.claude/rules/` - Now provided by plugin
- 🗑️ `.claude/scripts/` - Now provided by plugin
- 🗑️ `.claude/hooks/` - Now provided by plugin

## After Migration

1. Install the plugin:
   ```
   /plugin install ccpm@automazeio
   ```

2. Verify it works:
   ```
   /pm:help
   ```

3. Delete the backup when satisfied:
   ```bash
   rm -rf .claude-backup-*
   ```

## Safety

- Creates a timestamped backup before making changes
- Requires explicit "yes" confirmation
- Can be run multiple times safely

## Output

!bash ${CLAUDE_PLUGIN_ROOT}/ccpm/scripts/migrate-to-plugin.sh
