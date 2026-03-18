#!/bin/bash

# Purim & Pesach Quiz Game - Image Generator Wrapper
# Handles API key setup and runs the image generation

set -e

OUTPUT_DIR="/tmp/purim-home/games/quiz-images"
mkdir -p "$OUTPUT_DIR"

echo "🎨 Purim & Pesach Quiz Images Generator"
echo "📁 Output: $OUTPUT_DIR"
echo ""

# Check for API keys
GEMINI_KEY="${GEMINI_API_KEY:-}"
OPENAI_KEY="${OPENAI_API_KEY:-}"
STABILITY_KEY="${STABILITY_API_KEY:-}"

if [ -z "$GEMINI_KEY" ] && [ -z "$OPENAI_KEY" ] && [ -z "$STABILITY_KEY" ]; then
    echo "❌ No API keys found!"
    echo ""
    echo "Please set one of these environment variables:"
    echo ""
    echo "  Option 1: Gemini API (Recommended for kids' illustrations)"
    echo "  1. Visit: https://ai.google.dev/"
    echo "  2. Get your API key"
    echo "  3. Export it: export GEMINI_API_KEY='your-key'"
    echo ""
    echo "  Option 2: OpenAI DALL-E 3 (Highest quality)"
    echo "  1. Visit: https://platform.openai.com/api-keys"
    echo "  2. Get your API key"
    echo "  3. Export it: export OPENAI_API_KEY='your-key'"
    echo ""
    echo "  Option 3: Stability AI (Budget-friendly)"
    echo "  1. Visit: https://platform.stability.ai/"
    echo "  2. Get your API key"
    echo "  3. Export it: export STABILITY_API_KEY='your-key'"
    echo ""
    echo "After setting the key, run this script again."
    exit 1
fi

echo "✅ API key detected!"
echo ""

# Determine which tool to use
if command -v python3 &> /dev/null; then
    echo "🐍 Using Python..."
    cd "$(dirname "$0")"
    python3 generate_images_v2.py
elif command -v node &> /dev/null; then
    echo "⚙️  Using Node.js..."
    cd "$(dirname "$0")"
    node generate_images.js
else
    echo "❌ Neither Python 3 nor Node.js found!"
    echo "Please install one of them:"
    echo "  • Python: https://www.python.org/"
    echo "  • Node.js: https://nodejs.org/"
    exit 1
fi

echo ""
echo "✅ Generation complete!"
echo "📁 Images: $OUTPUT_DIR"
