@echo off
echo 🧩 Installing VS Code extensions...

code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension eamodio.gitlens
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension bradlc.vscode-tailwindcss
code --install-extension ritwickdey.LiveServer

echo ✅ VS Code extensions installed.
pause
