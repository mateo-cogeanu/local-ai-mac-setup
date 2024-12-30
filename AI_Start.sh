#!/bin/bash

# Text Colors
YELLOW='\033[1;33m'
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
RESET='\033[0m'

# Start open-webui serve in a new terminal window with Conda initialization
echo -e "${CYAN}🚀 STEP 1: Starting Open WebUI in a New Terminal Window with Conda Initialization...${RESET}"
osascript <<EOF
tell application "Terminal"
    do script "eval \"\$($HOME/miniforge3/bin/conda shell.zsh hook)\" && conda activate base && open-webui serve"
    activate
end tell
EOF

echo -e "${GREEN}✅ Open WebUI has been launched in a new terminal window with Conda initialized.${RESET}"
echo ""
echo -e "${YELLOW}🛠️ USER ACTION REQUIRED:${RESET}"
echo -e "${YELLOW}1️⃣ Open your browser and go to: http://localhost:8080/${RESET}"
echo -e "${YELLOW}2️⃣ Navigate to: Settings → Admin Settings → Images${RESET}"
echo -e "${YELLOW}3️⃣ Set 'Image Generation Engine' to: AUTOMATIC1111${RESET}"
echo -e "${YELLOW}4️⃣ Enter the following IP address: http://127.0.0.1:7860/${RESET}"
read -p "$(echo -e ${CYAN}⚠️ Press Enter once you have completed these steps to continue...${RESET})"

# Initialize Conda in the current terminal
echo -e "${CYAN}🚀 STEP 2: Initializing Conda in the Main Terminal...${RESET}"
eval "$($HOME/miniforge3/bin/conda shell.zsh hook)" || { echo -e "${RED}❌ Failed to initialize Conda.${RESET}"; exit 1; }

# Activate the Conda environment
echo -e "${CYAN}🚀 STEP 3: Activating Conda Environment 'stable'...${RESET}"
conda activate stable || { echo -e "${RED}❌ Failed to activate Conda environment.${RESET}"; exit 1; }

# Navigate to the stable diffusion directory
echo -e "${CYAN}🚀 STEP 4: Navigating to Stable Diffusion Directory...${RESET}"
cd ~/stablediff/ || { echo -e "${RED}❌ Failed to change directory to stablediff.${RESET}"; exit 1; }

# Navigate to the stable-diffusion-webui directory
echo -e "${CYAN}🚀 STEP 5: Navigating to Stable Diffusion WebUI Directory...${RESET}"
cd stable-diffusion-webui/ || { echo -e "${RED}❌ Failed to change directory to stable-diffusion-webui.${RESET}"; exit 1; }

echo -e "${YELLOW}🛠️ USER ACTION REQUIRED:${RESET}"
echo -e "${YELLOW}1️⃣ In Open Web UI, go to: Settings → Admin Settings → Images${RESET}"
echo -e "${YELLOW}2️⃣ Click the Refresh Button and then Save${RESET}"
read -p "$(echo -e ${CYAN}⚠️ Press Enter once you have completed these steps to continue...${RESET})"

# Run the web UI script
echo -e "${CYAN}🚀 STEP 6: Starting Stable Diffusion Web UI...${RESET}"
./webui.sh --listen --api || { echo -e "${RED}❌ Failed to start webui.sh.${RESET}"; exit 1; }

echo -e "${GREEN}✅ Stable Diffusion Web UI is now running successfully!${RESET}"

