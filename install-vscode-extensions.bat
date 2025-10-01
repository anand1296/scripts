@echo off
echo ==========================================
echo 🎨 VS Code Frontend Setup
echo ==========================================
echo.

:: Install VS Code Extensions
echo 📦 Installing extensions...
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension eamodio.gitlens
code --install-extension bradlc.vscode-tailwindcss
code --install-extension ritwickdey.liveserver
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension rangav.vscode-thunder-client
code --install-extension yoavbls.pretty-ts-errors
code --install-extension usernamehw.errorlens
code --install-extension humao.rest-client

:: Create VS Code settings.json with Prettier + ESLint + Tailwind config
echo 🛠 Creating settings.json...

:: Ensure settings directory exists
if not exist "%APPDATA%\Code\User" mkdir "%APPDATA%\Code\User"

(
echo {
echo   "editor.formatOnSave": true,
echo   "editor.codeActionsOnSave": {
echo     "source.fixAll.eslint": true
echo   },
echo   "editor.defaultFormatter": "esbenp.prettier-vscode",
echo   "files.autoSave": "onWindowChange",
echo   "javascript.validate.enable": false,
echo   "typescript.validate.enable": true,
echo   "eslint.validate": [
echo     "javascript",
echo     "javascriptreact",
echo     "typescript",
echo     "typescriptreact"
echo   ],
echo   "tailwindCSS.includeLanguages": {
echo     "plaintext": "html",
echo     "javascript": "javascript",
echo     "typescript": "typescript",
echo     "javascriptreact": "javascriptreact",
echo     "typescriptreact": "typescriptreact"
echo   },
echo   "workbench.colorTheme": "Default Dark+",
echo   "git.confirmSync": false,
echo   "git.autofetch": true,
echo   "files.exclude": {
echo     "**/.git": true,
echo     "**/.DS_Store": true,
echo     "**/node_modules": true,
echo     "**/dist": true
echo   }
echo }
) > "%APPDATA%\Code\User\settings.json"

echo.
echo ✅ VS Code setup complete! Extensions installed + settings configured.
echo 👉 Open VS Code and start coding like a pro 🚀
pause
