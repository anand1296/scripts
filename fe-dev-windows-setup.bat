@echo off
echo ==========================================
echo 🚀 Frontend Dev Environment Setup - Windows 11
echo ==========================================
echo.

:: Ensure PowerShell execution policy is relaxed
powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"

:: Install Scoop
echo 📦 Installing Scoop (if not already installed)...
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) { irm get.scoop.sh | iex } else { Write-Host '✅ Scoop already installed' }"

:: Add extras bucket
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop bucket add extras"

:: Core Tools
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop install git gh nodejs-lts python nvm"

:: Node.js package managers
powershell -NoProfile -ExecutionPolicy Bypass -Command "npm install -g yarn pnpm"

:: IDE
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop install vscode"

:: API Tools
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop install postman insomnia"

:: Database
powershell -NoProfile -ExecutionPolicy Bypass -Command "scoop install mongodb"

:: Git Config (change this to your info!)
powershell -NoProfile -ExecutionPolicy Bypass -Command "git config --global user.name 'Your Name'"
powershell -NoProfile -ExecutionPolicy Bypass -Command "git config --global user.email 'your@email.com'"

:: Enable WSL2
powershell -NoProfile -ExecutionPolicy Bypass -Command "wsl --install"

echo.
echo ✅ Frontend Dev Setup Complete!
echo 👉 Restart your computer once, then start coding 🚀
pause
