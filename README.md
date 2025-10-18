# 🚀 OpenInCursor - Linux File Manager Integration

> **VibeFaster!** when using Cursor IDE on Linux - automatically open files and directories in Cursor with a simple right-click!

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Linux](https://img.shields.io/badge/Platform-Linux-blue.svg)](https://www.linux.org/)
[![File Managers](https://img.shields.io/badge/File%20Managers-Nautilus%20%7C%20Nemo-green.svg)](https://github.com/kellybrianx/OpenInCursor)

## 🎯 What This Does

Ever found yourself in your file manager, staring at a beautiful code file, and thinking *"Man, I wish I could just right-click this and open it in Cursor instead of navigating through 47 folders and 3 coffee breaks?"* 

**Well, friend, your prayers have been answered!** 🙏

This project automatically integrates Cursor IDE with your Linux file manager, so you can:
- **Right-click any file** → "Open with Cursor" 
- **Right-click any folder** → "Open in Cursor"
- **Look like a coding wizard** to your colleagues (optional but highly recommended)

## ✨ Features

### 🔍 **Smart Detection**
- Automatically detects whether you're using **Nautilus** or **Nemo**
- No manual configuration needed (because who has time for that?)
- Works with both file managers seamlessly

### 🛠️ **Easy Setup & Removal**
- **One-command installation**: `./setup_cursor_shortcut.sh`
- **One-command removal**: `./remove_cursor_shortcut.sh`
- **Zero coffee breaks required** (though we still recommend them)

### 🎨 **Rich MIME Type Support**
Supports opening virtually any code file in Cursor:
- **C/C++** files (`.c`, `.cpp`, `.h`, `.hpp`)
- **Python** files (`.py`) - *snake charming made easy*
- **JavaScript/TypeScript** (`.js`, `.ts`, `.jsx`, `.tsx`)
- **Java** files (`.java`) - *because enterprise development needs love too*
- **PHP** files (`.php`) - *the web's favorite punching bag*
- **HTML/CSS** (`.html`, `.css`) - *making the web beautiful, one right-click at a time*
- **SQL** files (`.sql`) - *database queries deserve good tooling*
- **JSON/XML** (`.json`, `.xml`) - *data formats that make developers cry*
- **And many more!** (We're not kidding, the list is impressive)

### 🧹 **Clean Integration**
- Creates proper desktop entries
- Updates system databases automatically
- Restarts file manager gracefully (no more "why is my file manager acting weird?")
- Removes all traces when uninstalling (we're not leaving digital breadcrumbs)

## 📸 Screenshots

### Context Menu Integration
![Context Menu](screenshots/context-menu.png)
*Right-click any file to see the "Open with Cursor" option appear in your file manager*

### Installation Process
![Installation](screenshots/install.png)
*The setup script automatically detecting your file manager and creating the Cursor integration*

### Removal Process
![Removal](screenshots/removal.png)
*Clean uninstallation that removes all traces of the integration*

## 🚀 Quick Start

### Prerequisites
- Linux system (because Windows users have their own problems)
- Cursor IDE installed (if you don't have it, what are you even doing here?)
- Nautilus or Nemo file manager
- A sense of adventure (optional but recommended)

### Installation

1. **Clone this repository** (or download the scripts if you're feeling rebellious):
   ```bash
   git clone https://github.com/kellybrianx/OpenInCursor.git
   cd OpenInCursor
   ```

2. **Make the scripts executable** (because security matters):
   ```bash
   chmod +x setup_cursor_shortcut.sh remove_cursor_shortcut.sh
   ```

3. **Run the setup script** and watch the magic happen:
   ```bash
   ./setup_cursor_shortcut.sh
   ```

4. **Right-click any file** in your file manager and bask in the glory of the new "Open with Cursor" option! 🎉

### Uninstallation

When you're ready to part ways (we won't judge):
```bash
./remove_cursor_shortcut.sh
```

## 🎭 How It Works (The Technical Magic)

### The Setup Script (`setup_cursor_shortcut.sh`)
1. **Detects your file manager** using the ancient art of process detection
2. **Creates a desktop entry** with all the proper MIME types
3. **Makes it executable** (because non-executable files are just sad)
4. **Restarts your file manager** to apply the changes
5. **Provides encouraging feedback** (because everyone needs a pat on the back)

### The Removal Script (`remove_cursor_shortcut.sh`)
1. **Detects your file manager** (same ancient art, different purpose)
2. **Removes the desktop entry** (like a digital Marie Kondo session)
3. **Updates the desktop database** (keeping things tidy)
4. **Restarts your file manager** (because change is good)
5. **Verifies the removal** (because we're thorough like that)

## 🐛 Troubleshooting

### "I don't see the 'Open with Cursor' option!"
- **Check**: Did you run the setup script? (We've all been there)
- **Check**: Is Cursor installed? (It's kind of important)
- **Check**: Did you restart your file manager? (Sometimes it needs a gentle nudge)

### "The script says 'No supported file manager detected'"
- **Solution**: Make sure you have Nautilus or Nemo running
- **Alternative**: Try opening a file manager window first, then run the script
- **Pro tip**: We only support Nautilus and Nemo because we're not overachievers

### "I'm getting permission errors"
- **Solution**: Make sure the scripts are executable (`chmod +x`)
- **Alternative**: Check if you have write permissions to `~/.local/share/applications/`
- **Nuclear option**: Run with `sudo` (but please don't, it's not necessary)

## 🤝 Contributing

Found a bug? Have an idea? Want to add support for more file managers?

1. **Fork the repository** (because forking is fun)
2. **Create a feature branch** (because organization is key)
3. **Make your changes** (and make them awesome)
4. **Test thoroughly** (because nobody likes broken code)
5. **Submit a pull request** (and we'll shower you with praise)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Translation**: Use it, modify it, distribute it, just don't blame us if your computer starts speaking in binary. 😄

## 🙏 Acknowledgments

- **Cursor IDE** - For being an awesome code editor
- **Linux community** - For making file managers that actually work
- **Coffee** - For keeping developers alive during long coding sessions
- **You** - For reading this far and not giving up on us

## 🎉 Fun Facts

- This project was born out of pure laziness (the best kind of motivation)
- The scripts contain exactly 0 lines of spaghetti code (we're proud of this)
- We tested this on both Nautilus and Nemo (because we're thorough like that)
- The emoji usage in this README is scientifically proven to increase happiness by 47%

---

**Made with ❤️ and ☕ by developers who believe that right-clicking should be magical.**

*P.S. If this script saves you even 5 minutes of your life, we consider it a success. Time is precious, and file navigation shouldn't be a time sink!*
