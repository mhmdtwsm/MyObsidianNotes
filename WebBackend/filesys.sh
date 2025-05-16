#!/bin/bash

# Base directory for Git notes (adjust if needed)
BASE_DIR=~/Documents/obsidian_git/WebBackend/Git/

# Create base directory
mkdir -p "$BASE_DIR"

# Create main topic folders
mkdir -p "$BASE_DIR"/{Basics,Commands,Branches,Remotes,Workflows,Tools,Patches,Concepts}

# Create Markdown files in Basics folder
cat <<EOF > "$BASE_DIR/Basics/Introduction.md"
# Introduction to Git
Overview of Git and its importance in version control.
EOF

cat <<EOF > "$BASE_DIR/Basics/Installation.md"
# Git Installation
How to install Git on different platforms.
EOF

cat <<EOF > "$BASE_DIR/Basics/Revision_Control.md"
# Revision Control Systems
What are revision control systems and why use Git.
EOF

# Create files in Commands folder
touch "$BASE_DIR/Commands/Basic_Commands.md"
touch "$BASE_DIR/Commands/Branch_Commands.md"
touch "$BASE_DIR/Commands/Merge_Commands.md"
touch "$BASE_DIR/Commands/Rebase_Commands.md"

# Create files in Branches folder
touch "$BASE_DIR/Branches/Branching.md"
touch "$BASE_DIR/Branches/Merging.md"
touch "$BASE_DIR/Branches/Rebasing.md"
touch "$BASE_DIR/Branches/Conflict_Resolution.md"

# Create files in Remotes folder
touch "$BASE_DIR/Remotes/Remote_Repositories.md"
touch "$BASE_DIR/Remotes/Cloning.md"
touch "$BASE_DIR/Remotes/Pushing.md"
touch "$BASE_DIR/Remotes/Fetching_and_Pulling.md"

# Create files in Workflows folder
touch "$BASE_DIR/Workflows/Forking.md"
touch "$BASE_DIR/Workflows/Pull_Requests.md"
touch "$BASE_DIR/Workflows/Feature_Branch_Workflow.md"
touch "$BASE_DIR/Workflows/Git_Flow.md"

# Create files in Tools folder
touch "$BASE_DIR/Tools/Gerrit.md"
touch "$BASE_DIR/Tools/Git_GUI.md"
touch "$BASE_DIR/Tools/Graphical_Interfaces.md"

# Create files in Patches folder
touch "$BASE_DIR/Patches/Creating_Patches.md"
touch "$BASE_DIR/Patches/Applying_Patches.md"
touch "$BASE_DIR/Patches/Synchronizing_Patches.md"

# Create files in Concepts folder
touch "$BASE_DIR/Concepts/Git_Architecture.md"
touch "$BASE_DIR/Concepts/Committing_vs_Publishing.md"
touch "$BASE_DIR/Concepts/File_Categories.md"
touch "$BASE_DIR/Concepts/Identifiers_and_Tags.md"

echo "Git notes folder structure created at $BASE_DIR"

