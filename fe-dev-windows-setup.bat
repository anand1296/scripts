@echo off
echo ============================================
echo  🚀 Setting up Frontend Dev Environment...
echo ============================================
echo.

REM --- Install packages via winget ---
set PACKAGES=Git.Git Microsoft.VisualStudioCode Microsoft.WindowsTerminal Google.Chrome Mozilla.Firefox CoreyButler.NVMforWindows Figma.Figma Postman.Postman Docker.DockerDesktop

for %%i in (%PACKAGES%) do (
    echo 📦 Installing %%i...
    winget install --id %%i -e --accept-package-agreements --accept-source-agreements
)

REM --- Set environment variables for NVM (just in case) ---
setx NVM_HOME "%ProgramFiles%\nvm" /M
setx NVM_SYMLINK "%ProgramFiles%\nodejs" /M

REM --- Update PATH for current session ---
set "PATH=%ProgramFiles%\nvm;%ProgramFiles%\nodejs;%PATH%"

REM --- Install and use Node.js LTS via nvm ---
echo ⬇️ Installing Node.js LTS via nvm...
nvm install lts
nvm use lts

REM --- Install global npm packages ---
set NPM_GLOBALS=yarn pnpm typescript eslint prettier create-react-app vite serve

for %%p in (%NPM_GLOBALS%) do (
    echo 🌍 Installing npm package: %%p
    call npm install -g %%p
)

REM --- Create a Projects directory ---
set PROJECTS_DIR=%USERPROFILE%\Projects
if not exist "%PROJECTS_DIR%" (
    mkdir "%PROJECTS_DIR%"
    echo 📁 Created Projects folder at %PROJECTS_DIR%
)

REM --- Generate SSH Key (if needed) ---
set SSH_DIR=%USERPROFILE%\.ssh
if not exist "%SSH_DIR%" (
    echo 🔐 Generating new SSH key...
    powershell -Command "ssh-keygen -t ed25519 -C \"your_email@example.com\""
) else (
    echo ✅ SSH key already exists.
)

echo.
echo ============================================
echo ✅ Setup Complete!
echo --------------------------------------------
echo 💡 Next steps:
echo - Add SSH key to GitHub: https://github.com/settings/ssh/new
echo - Open VS Code and install recommended extensions.
echo - Happy coding!
echo ============================================
pause
