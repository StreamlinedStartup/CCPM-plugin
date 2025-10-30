#!/bin/bash

echo ""
echo "🔄 CCPM Migration: Template → Plugin"
echo "====================================="
echo ""

# Check if this is a template installation
if [ ! -d ".claude/commands/pm" ]; then
  echo "✅ No template installation detected."
  echo "   You can install CCPM as a plugin with:"
  echo "   /plugin install ccpm@automazeio"
  echo ""
  exit 0
fi

echo "📋 Template installation detected"
echo ""

# Confirm migration
echo "This will:"
echo "  ✅ Keep: Your PRDs, epics, and context (user data)"
echo "  🗑️ Remove: Commands, agents, rules, scripts (now in plugin)"
echo "  📦 Next: You'll install CCPM as a plugin"
echo ""
read -p "Continue with migration? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
  echo "❌ Migration cancelled"
  exit 1
fi

echo ""
echo "🚀 Starting migration..."
echo ""

# Create backup directory with timestamp
BACKUP_DIR=".claude-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup user data (just in case)
echo "📦 Creating backup in $BACKUP_DIR..."
if [ -d ".claude/prds" ]; then
  cp -r .claude/prds "$BACKUP_DIR/" 2>/dev/null && echo "  ✅ Backed up PRDs"
fi
if [ -d ".claude/epics" ]; then
  cp -r .claude/epics "$BACKUP_DIR/" 2>/dev/null && echo "  ✅ Backed up epics"
fi
if [ -d ".claude/context" ]; then
  cp -r .claude/context "$BACKUP_DIR/" 2>/dev/null && echo "  ✅ Backed up context"
fi
if [ -f ".claude/settings.local.json" ]; then
  cp .claude/settings.local.json "$BACKUP_DIR/" 2>/dev/null && echo "  ✅ Backed up settings"
fi

echo ""
echo "🗑️ Removing template files..."

# Remove template directories
if [ -d ".claude/commands" ]; then
  rm -rf .claude/commands && echo "  ✅ Removed commands/"
fi
if [ -d ".claude/agents" ]; then
  rm -rf .claude/agents && echo "  ✅ Removed agents/"
fi
if [ -d ".claude/rules" ]; then
  rm -rf .claude/rules && echo "  ✅ Removed rules/"
fi
if [ -d ".claude/scripts" ]; then
  rm -rf .claude/scripts && echo "  ✅ Removed scripts/"
fi
if [ -d ".claude/hooks" ]; then
  rm -rf .claude/hooks && echo "  ✅ Removed hooks/"
fi

# Remove template config files
if [ -f ".claude/ccpm.config" ]; then
  rm .claude/ccpm.config && echo "  ✅ Removed ccpm.config"
fi
if [ -f ".claude/settings.json.example" ]; then
  rm .claude/settings.json.example && echo "  ✅ Removed settings.json.example"
fi

echo ""
echo "✅ Migration Complete!"
echo "====================="
echo ""
echo "📊 What was kept:"
ls -d .claude/*/ 2>/dev/null | sed 's|.claude/||' | sed 's|/$||' | while read dir; do
  count=$(find ".claude/$dir" -type f 2>/dev/null | wc -l | tr -d ' ')
  echo "  ✅ .claude/$dir/ ($count files)"
done
if [ -f ".claude/settings.local.json" ]; then
  echo "  ✅ .claude/settings.local.json"
fi

echo ""
echo "📦 Backup created: $BACKUP_DIR/"
echo ""
echo "🎯 Next Steps:"
echo "  1. Install CCPM plugin:"
echo "     /plugin install ccpm@automazeio"
echo ""
echo "  2. Verify it works:"
echo "     /pm:help"
echo ""
echo "  3. If everything works, you can delete the backup:"
echo "     rm -rf $BACKUP_DIR"
echo ""
echo "📚 Documentation: https://github.com/automazeio/ccpm"
echo ""

exit 0
