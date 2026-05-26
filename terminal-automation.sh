#!/bin/bash
# Terminal Automation Script for Claude Code Environment
# Provides setup, save, and restore functionality for terminal state

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to show usage
show_usage() {
    echo "Usage: $0 {setup|save|restore|help}"
    echo "  setup   - Setup Claude Code environment (installs dependencies, starts server)"
    echo "  save    - Save current terminal state (directory, env vars, history)"
    echo "  restore - Restore previously saved terminal state"
    echo "  help    - Show this help message"
}

# Function to setup Claude Code environment
setup_environment() {
    echo "Setting up Claude Code environment..."
    bash "$SCRIPT_DIR/setup-claude-env.sh" "$@"
}

# Function to save terminal state
save_state() {
    echo "Saving terminal state..."
    bash "$SCRIPT_DIR/save_terminal_state.sh"
}

# Function to restore terminal state
restore_state() {
    echo "Restoring terminal state..."
    bash "$SCRIPT_DIR/restore_terminal_state.sh"
}

# Main script logic
case "$1" in
    setup)
        shift
        setup_environment "$@"
        ;;
    save)
        save_state
        ;;
    restore)
        restore_state
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        echo "Error: Unknown command '$1'"
        show_usage
        exit 1
        ;;
esac