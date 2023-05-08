#!/bin/bash

MODEL_WEIGHTS_DIR=models/gpt4-x-alpaca-13b-native-4bit-128g
# download

if [ ! -f "$MODEL_WEIGHTS_DIR/gpt-x-alpaca-13b-native-4bit-128g-cuda.pt" ]; then
    wget -O "$MODEL_WEIGHTS_DIR/gpt-x-alpaca-13b-native-4bit-128g-cuda.pt" https://huggingface.co/anon8231489123/gpt4-x-alpaca-13b-native-4bit-128g/resolve/main/gpt-x-alpaca-13b-native-4bit-128g-cuda.pt
fi

# Start the server
python3 server.py --wbits 4 --model_type LLaMa --listen --listen-port 5000

# Run the default command (this line is important to keep the container running)
exec "$@"
