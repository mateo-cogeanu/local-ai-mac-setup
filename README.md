

## Chapter 1: Ollama

1. **Download and Setup Ollama**
2. Official link: [ollama.com](https://ollama.com/)
3. Open Terminal and run:
    
    ```bash
    ollama run llama3.2:3b
    ```
    
3. Test with a message:
    
    ```
    Hello!
    ```
    

---

## Chapter 2: Homebrew

1. Setup Homebrew with:
    
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    
2. Add Homebrew to your profile:
    
    ```bash
    echo >> /Users/mateocogeanu/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mateocogeanu/.zprofile
    ```
    
3. Close and reopen Terminal.
4. Verify Homebrew installation:
    
    ```bash
    brew --help
    ```
    

---

## Chapter 3: Conda

1. Download Conda: [Miniforge3 for MacOS ARM64](https://github.com/conda-forge/miniforge/releases/download/24.11.0-0/Miniforge3-MacOSX-arm64.sh)
2. Navigate to Downloads:
    
    ```bash
    cd Downloads
    ```
    
3. Run the installer:
    
    ```bash
    sh Miniforge3-MacOSX-arm64.sh
    ```
    
4. Activate Conda:
    
    ```bash
    eval "$(/Users/mateocogeanu/miniforge3/bin/conda shell.zsh hook)"
    ```
    
5. Check Python version:
    
    ```bash
    python --version
    ```
    
    _(It should display Python 3.12.8.)_

---

## Chapter 4: Open WebUI

1. Stay in Conda base and install Open WebUI:
    
    ```bash
    pip install open-webui
    ```
    
2. Start Open WebUI:
    
    ```bash
    open-webui serve
    ```
    
3. Open your browser and go to: `localhost:8080`
4. Sign up.
5. Test with a message:
    
    ```
    Hello!
    ```
    
6. Optional: Go to **Settings > Audio** and set voice to **Zarvox**.
7. Download additional models via Open WebUI:
    - Select a model (e.g., `smollm:1.7b`).
    - Click **Pull from Ollama**.

---

## Chapter 5: Stable Diffusion

1. Open a new Terminal window.
2. Create a Conda environment:
    
    ```bash
    conda create -n stable python=3.10.6
    ```
    
3. Activate the environment:
    
    ```bash
    conda activate stable
    ```
    
4. Verify Python version:
    
    ```bash
    python --version
    ```
    
5. Create a directory for Stable Diffusion:
    
    ```bash
    mkdir stablediff
    ```
    
6. Clone the AUTOMATIC1111 repository:
    
    ```bash
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
    ```
    
7. Navigate to the directory:
    
    ```bash
    cd stable-diffusion-webui
    ```
    
8. Download the Stable Diffusion model:  
    [Stable Diffusion v1.5 Model](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/blob/main/v1-5-pruned.safetensors)
9. Open the directory in Finder:
    
    ```bash
    open .
    ```
    
10. Place the downloaded model in:  
    **models > stable-diffusion**
11. Run the WebUI script:
    
    ```bash
    sh webui.sh
    ```
    
12. Open Safari, select the checkpoint:  
    **v1-5-pruned.safetensors**
13. Enter a prompt and click **Generate**.

---

## Chapter 6: Link Stable Diffusion to Open WebUI

1. Stop Stable Diffusion:
    - Use `Ctrl + C` in the terminal window of stable diffusion.
2. In Open WebUI:
    - Go to **Settings > Admin Settings > Images**.
    - Set the **Image Generation Engine** to **AUTOMATIC1111**.
    - Enable **Image Generation (Experimental)**.
    - Add the URL:
        
        ```
        http://127.0.0.1:7860
        ```
        
3. In Stable Diffusion Terminal:
    
    ```bash
    sh webui.sh --listen --api
    ```
    
4. Back in Open WebUI, click **Refresh** and then **Save**.
5. Verify the connection.

---

## Final Testing

1. In Open WebUI, ask the AI to generate a prompt for an image.
2. Click the **Image Icon** under the reply.
3. Wait approximately one minute for image generation.

---

I hope this tutorial helps you set up a fully functional local AI environment on your Mac. Happy experimenting!

