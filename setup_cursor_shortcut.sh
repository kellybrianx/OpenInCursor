#!/bin/bash

# Script to create Cursor shortcut in file manager
# Supports both Nautilus and Nemo file managers

set -e  # Exit on any error

echo "🔍 Detecting active file manager..."

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

# Function to create Nautilus shortcut
create_nautilus_shortcut() {
    echo "🔧 Creating Nautilus shortcut for Cursor..."
    
    # Create .local/share/applications directory if it doesn't exist
    mkdir -p ~/.local/share/applications
    
    # Create Cursor desktop entry
    cat > ~/.local/share/applications/cursor.desktop << 'EOF'
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=cursor %U
Icon=cursor
Terminal=false
Type=Application
MimeType=text/plain;text/x-chdr;text/x-csrc;text/x-c++hdr;text/x-c++src;text/x-java;text/x-dsrc;text/x-pascal;text/x-perl;text/x-python;application/x-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/javascript;application/json;text/css;text/html;text/xml;text/x-sql;text/x-diff;
Categories=Development;TextEditor;
StartupNotify=true
StartupWMClass=cursor
EOF
    
    # Make it executable
    chmod +x ~/.local/share/applications/cursor.desktop
    
    echo "✅ Nautilus shortcut created successfully"
}

# Function to create Nemo shortcut
create_nemo_shortcut() {
    echo "🔧 Creating Nemo shortcut for Cursor..."
    
    # Create .local/share/applications directory if it doesn't exist
    mkdir -p ~/.local/share/applications
    
    # Create Cursor desktop entry
    cat > ~/.local/share/applications/cursor.desktop << 'EOF'
[Desktop Entry]
Name=Cursor
Comment=AI-powered code editor
Exec=cursor %U
Icon=cursor
Terminal=false
Type=Application
MimeType=text/plain;text/x-chdr;text/x-csrc;text/x-c++hdr;text/x-c++src;text/x-java;text/x-dsrc;text/x-pascal;text/x-perl;text/x-python;application/x-php;application/x-httpd-php3;application/x-httpd-php4;application/x-httpd-php5;application/javascript;application/json;text/css;text/html;text/xml;text/x-sql;text/x-diff;
Categories=Development;TextEditor;
StartupNotify=true
StartupWMClass=cursor
EOF
    
    # Make it executable
    chmod +x ~/.local/share/applications/cursor.desktop
    
    echo "✅ Nemo shortcut created successfully"
}

# Function to restart file manager
restart_file_manager() {
    local manager=$1
    echo "🔄 Restarting $manager..."
    
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

# Main execution
main() {
    echo "🚀 Starting Cursor shortcut setup..."
    echo "=================================="
    
    # Detect file manager
    if detect_file_manager; then
        # Nautilus detected
        create_nautilus_shortcut
        restart_file_manager "nautilus"
    else
        # Nemo detected
        create_nemo_shortcut
        restart_file_manager "nemo"
    fi
    
    echo "=================================="
    echo "🎉 Setup completed successfully!"
    echo "💡 You can now right-click in your file manager to open files with Cursor"
}

# Run main function
main "$@"
