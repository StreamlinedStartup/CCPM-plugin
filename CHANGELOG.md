# CCPM Changelog

## [2.0.0] - Plugin Architecture Release

### 🎯 Overview
**Major architectural upgrade**: CCPM is now a Claude Code Plugin! This release transforms CCPM from a template system into a modern plugin that installs once and works across all projects. Includes automatic migration tooling and backwards compatibility.

### 🚀 Breaking Changes
- **Plugin Architecture**: System now distributed as Claude Code Plugin instead of copied template
- **Installation Method**: Changed from `curl | bash` to `/plugin install ccpm@automazeio`
- **File Organization**: Commands, agents, rules, scripts now in plugin; only user data (PRDs, epics, context) in project

### ✨ Added
- **`.claude-plugin/plugin.json`**: Plugin manifest with metadata and configuration
- **Plugin Path References**: All internal paths use `${CLAUDE_PLUGIN_ROOT}` variable
- **`/migrate-from-template` command**: Automated migration from v1.x template to v2.0 plugin
- **Migration script** (`scripts/migrate-to-plugin.sh`): Standalone migration utility
- **Self-hosted marketplace** (`marketplace/marketplace.json`): Plugin distribution infrastructure
- **MIGRATION.md**: Comprehensive migration guide for existing users
- **Plugin installation docs**: Updated README with plugin-first installation

### 🔄 Changed
- **Command references**: Updated 14 PM commands to use `${CLAUDE_PLUGIN_ROOT}/ccpm/scripts/...`
- **Rule references**: Updated 20+ files to use `${CLAUDE_PLUGIN_ROOT}/ccpm/rules/...`
- **Agent references**: Updated test-runner agent to use plugin paths
- **Init command**: Modified to create project directories instead of copying template files
- **README.md**: Prioritizes plugin installation, moves manual installation to advanced section
- **CLAUDE.md**: Updated to reflect plugin architecture
- **Repository structure**: Kept `ccpm/` directory for plugin contents

### 🛠️ Migration Path
**For existing users (v1.x template)**:
1. Run `/migrate-from-template` in your project
2. Or manually remove `.claude/{commands,agents,rules,scripts}`
3. Keep `.claude/{prds,epics,context}` (your data)
4. Install plugin: `/plugin install ccpm@automazeio`

**For new users**:
1. Install plugin: `/plugin install ccpm@automazeio`
2. Initialize project: `/pm:init`
3. Create context: `/context:create`

### 📦 Benefits
- ✅ Single installation for all projects
- ✅ Easy updates via `/plugin update ccpm`
- ✅ Cleaner project structure
- ✅ Version management with rollback
- ✅ Marketplace distribution

### 🔧 Technical Details
- Plugin paths use `${CLAUDE_PLUGIN_ROOT}` environment variable
- User data remains in project's `.claude/` directory
- Commands, agents, rules, scripts provided by global plugin installation
- Backwards compatible: Manual installation still supported

### 📚 Documentation
- Added `MIGRATION.md` - Complete migration guide
- Added `marketplace/README.md` - Marketplace setup guide
- Updated main `README.md` - Plugin-first approach
- Updated `CLAUDE.md` - Plugin architecture details

---

## [2025-01-24] - Major Cleanup & Issue Resolution Release

### 🎯 Overview
Resolved 10 of 12 open GitHub issues, modernized command syntax, improved documentation, and enhanced system accuracy. This release focuses on stability, usability, and addressing community feedback.

### ✨ Added
- **Local Mode Support** ([#201](https://github.com/automazeio/ccpm/issues/201))
  - Created `LOCAL_MODE.md` with comprehensive offline workflow guide
  - All core commands (prd-new, prd-parse, epic-decompose) work without GitHub
  - Clear distinction between local-only vs GitHub-dependent commands

- **Automatic GitHub Label Creation** ([#544](https://github.com/automazeio/ccpm/issues/544))
  - Enhanced `init.sh` to automatically create `epic` and `task` labels
  - Proper colors: `epic` (green #0E8A16), `task` (blue #1D76DB)  
  - Eliminates manual label setup during project initialization

- **Context Creation Accuracy Safeguards** ([#48](https://github.com/automazeio/ccpm/issues/48))
  - Added mandatory self-verification checkpoints in context commands
  - Implemented evidence-based analysis requirements
  - Added uncertainty flagging with `⚠️ Assumption - requires verification`
  - Enhanced both `/context:create` and `/context:update` with accuracy validation

### 🔄 Changed
- **Modernized Command Syntax** ([#531](https://github.com/automazeio/ccpm/issues/531))
  - Updated 14 PM command files to use concise `!bash` execution pattern
  - Simplified `allowed-tools` frontmatter declarations
  - Reduced token usage and improved Claude Code compatibility

- **Comprehensive README Overhaul** ([#323](https://github.com/automazeio/ccpm/issues/323))
  - Clarified PRD vs Epic terminology and definitions
  - Streamlined workflow explanations and removed redundant sections
  - Fixed installation instructions and troubleshooting guidance
  - Improved overall structure and navigation

### 📋 Research & Community Engagement
- **Multi-Tracker Support Analysis** ([#200](https://github.com/automazeio/ccpm/issues/200))
  - Researched CLI availability for Linear, Trello, Azure DevOps, Jira
  - Identified Linear as best first alternative to GitHub Issues
  - Provided detailed implementation roadmap for future development

- **GitLab Support Research** ([#588](https://github.com/automazeio/ccpm/issues/588))  
  - Confirmed strong `glab` CLI support for GitLab integration
  - Invited community contributor to submit existing GitLab implementation as PR
  - Updated project roadmap to include GitLab as priority platform

### 🐛 Clarified Platform Limitations
- **Windows Shell Compatibility** ([#609](https://github.com/automazeio/ccpm/issues/609))
  - Documented as Claude Code platform limitation (requires POSIX shell)
  - Provided workarounds and alternative solutions

- **Codex CLI Integration** ([#585](https://github.com/automazeio/ccpm/issues/585))
  - Explained future multi-AI provider support in new CLI architecture

- **Parallel Worker Agent Behavior** ([#530](https://github.com/automazeio/ccpm/issues/530))
  - Clarified agent role as coordinator, not direct coder
  - Provided implementation guidance and workarounds

### 🔒 Security
- **Privacy Documentation Fix** ([#630](https://github.com/automazeio/ccpm/issues/630))
  - Verified resolution via PR #631 (remove real repository references)

### 💡 Proposed Features
- **Bug Handling Workflow** ([#654](https://github.com/automazeio/ccpm/issues/654))
  - Designed `/pm:attach-bug` command for automated bug tracking
  - Proposed lightweight sub-issue integration with existing infrastructure
  - Community feedback requested on implementation approach

### 📊 Issues Resolved
**Closed**: 10 issues  
**Active Proposals**: 1 issue (#654)  
**Remaining Open**: 1 issue (#653)

#### Closed Issues:
- [#630](https://github.com/automazeio/ccpm/issues/630) - Privacy: Remove real repo references ✅  
- [#609](https://github.com/automazeio/ccpm/issues/609) - Windows shell error (platform limitation) ✅
- [#585](https://github.com/automazeio/ccpm/issues/585) - Codex CLI compatibility (architecture update) ✅  
- [#571](https://github.com/automazeio/ccpm/issues/571) - Figma MCP support (platform feature) ✅
- [#531](https://github.com/automazeio/ccpm/issues/531) - Use !bash in custom slash commands ✅
- [#323](https://github.com/automazeio/ccpm/issues/323) - Improve README.md ✅
- [#201](https://github.com/automazeio/ccpm/issues/201) - Local-only mode support ✅
- [#200](https://github.com/automazeio/ccpm/issues/200) - Multi-tracker support research ✅  
- [#588](https://github.com/automazeio/ccpm/issues/588) - GitLab support research ✅
- [#48](https://github.com/automazeio/ccpm/issues/48) - Context creation inaccuracies ✅
- [#530](https://github.com/automazeio/ccpm/issues/530) - Parallel worker coding operations ✅
- [#544](https://github.com/automazeio/ccpm/issues/544) - Auto-create labels during init ✅
- [#947](https://github.com/automazeio/ccpm/issues/947) - Project roadmap update ✅

### 🛠️ Technical Details
- **Files Modified**: 16 core files + documentation
- **New Files**: `LOCAL_MODE.md`, `CONTEXT_ACCURACY.md`  
- **Commands Updated**: All 14 PM slash commands modernized
- **Backward Compatibility**: Fully maintained
- **Dependencies**: No new external dependencies added

### 🏗️ Project Health
- **Issue Resolution Rate**: 83% (10/12 issues closed)
- **Documentation Coverage**: Significantly improved
- **Community Engagement**: Active contributor invitation and feedback solicitation
- **Code Quality**: Enhanced accuracy safeguards and validation

### 🚀 Next Steps
1. Community feedback on bug handling proposal (#654)
2. GitLab integration PR review and merge
3. Linear platform integration (pending demand)
4. Enhanced testing and validation workflows

---

*This release represents a major stability and usability milestone for CCPM, addressing the majority of outstanding community issues while establishing a foundation for future multi-platform support.*