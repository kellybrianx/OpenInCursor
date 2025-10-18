#!/bin/bash

# Script to remove Cursor shortcut from file manager
# Supports both Nautilus and Nemo file managers

set -e  # Exit on any error

echo "🗑️  Removing Cursor shortcut from file manager..."

# Function to detect file manager
detect_file_manager() {
    if pgrep -x "nautilus" > /dev/null; then
        echo "📁 Nautilus detected"
        return 0
    elif pgrep -x "nemo" > /dev/null; then
        echo "📁 Nemo detected"
        return 1
    else
        echo "❌ No supported file manager detected (Nautilus or Nemo)"
        return 2
    fi
}

# Function to remove Cursor shortcut
remove_cursor_shortcut() {
    echo "🔧 Removing Cursor shortcut..."
    
    # Remove the desktop entry file
    if [ -f ~/.local/share/applications/cursor.desktop ]; then
        rm ~/.local/share/applications/cursor.desktop
        echo "✅ Cursor desktop entry removed"
    else
        echo "ℹ️  Cursor desktop entry not found (may have been already removed)"
    fi
    
    # Update desktop database
    if command -v update-desktop-database >/dev/null 2>&1; then
        echo "🔄 Updating desktop database..."
        update-desktop-database ~/.local/share/applications/ 2>/dev/null || true
        echo "✅ Desktop database updated"
    fi
}

# Function to restart file manager
restart_file_manager() {
    local manager=$1
    echo "🔄 Restarting $manager to apply changes..."
    
    # Kill the file manager process
    pkill -f "$manager" || true
    
    # Wait a moment
    sleep 2
    
    # Start the file manager in background
    if [ "$manager" = "nautilus" ]; then
        nautilus --new-window &
    elif [ "$manager" = "nemo" ]; then
        nemo &
    fi
    
    echo "✅ $manager restarted successfully"
}

# Function to clean up any additional files
cleanup_additional_files() {
    echo "🧹 Cleaning up additional files..."
    
    # Remove any cursor-related desktop files in other locations
    find ~/.local/share/applications/ -name "*cursor*" -type f -delete 2>/dev/null || true
    
    # Remove from system applications if it exists there
    if [ -f /usr/share/applications/cursor.desktop ]; then
        echo "⚠️  Found system-wide Cursor desktop entry at /usr/share/applications/cursor.desktop"
        echo "   This requires sudo privileges to remove. You may need to run:"
        echo "   sudo rm /usr/share/applications/cursor.desktop"
    fi
    
    echo "✅ Additional cleanup completed"
}

# Function to verify removal
verify_removal() {
    echo "🔍 Verifying removal..."
    
    if [ ! -f ~/.local/share/applications/cursor.desktop ]; then
        echo "✅ Cursor desktop entry successfully removed"
        return 0
    else
        echo "❌ Cursor desktop entry still exists"
        return 1
    fi
}

# Main execution
main() {
    echo "🚀 Starting Cursor shortcut removal..."
    echo "====================================="
    
    # Detect file manager
    if detect_file_manager; then
        # Nautilus detected
        remove_cursor_shortcut
        cleanup_additional_files
        restart_file_manager "nautilus"
    else
        # Nemo detected
        remove_cursor_shortcut
        cleanup_additional_files
        restart_file_manager "nemo"
    fi
    
    # Verify removal
    if verify_removal; then
        echo "====================================="
        echo "🎉 Cursor shortcut removal completed successfully!"
        echo "💡 Cursor will no longer appear in your file manager's context menu"
    else
        echo "====================================="
        echo "⚠️  Removal completed with warnings"
        echo "💡 Some files may still exist - check manually if needed"
    fi
}

# Run main function
main "$@"
