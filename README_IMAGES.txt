================================================================================
PURIM & PESACH QUIZ GAME - IMAGE GENERATION WITH GEMINI API
================================================================================

QUICK START
────────────────────────────────────────────────────────────────────────────

1. Get an API key (choose one):
   • Gemini: https://ai.google.dev/ (FREE - RECOMMENDED)
   • OpenAI: https://platform.openai.com/api-keys ($0.08/image)
   • Stability: https://platform.stability.ai/ ($0.003/image)

2. Set environment variable:
   export GEMINI_API_KEY='your-api-key-here'

3. Run the generator:
   cd /tmp/purim-home
   ./generate-images.sh

4. Check results:
   ls /tmp/purim-home/games/quiz-images/
   Should show 10 JPEG files

WHAT GETS GENERATED
────────────────────────────────────────────────────────────────────────────

10 beautiful, kid-friendly illustrations (800x800 JPG):

PURIM HOLIDAY:
  1. purim-megila.jpg - Queen Esther reading the Megillah scroll
  2. purim-costumes.jpg - Happy children in colorful Purim costumes
  3. purim-mishloach.jpg - Gift baskets with hamantaschen cookies

PESACH HOLIDAY:
  4. pesach-seder.jpg - Jewish family at Passover Seder table
  5. pesach-sea.jpg - Splitting of the Red Sea
  6. pesach-matzah.jpg - People baking matzah quickly

HEROES:
  7. heroes-soldiers.jpg - Israeli soldiers at border at sunset
  8. heroes-medics.jpg - Military medics helping people

GOOD DEEDS:
  9. gooddeeds-helping.jpg - Children helping elderly people
  10. gooddeeds-packages.jpg - Kids packing care packages for soldiers

SCRIPTS PROVIDED
────────────────────────────────────────────────────────────────────────────

1. generate-images.sh (RECOMMENDED)
   Main entry point. Auto-detects Python or Node.js.
   Usage: ./generate-images.sh

2. generate_images_v2.py
   Direct Python implementation.
   Usage: python3 generate_images_v2.py

3. generate_images.js
   Direct Node.js implementation.
   Usage: node generate_images.js

API COMPARISON
────────────────────────────────────────────────────────────────────────────

GEMINI API (RECOMMENDED)
  Cost: FREE (free tier)
  Quality: Excellent for kids' storybook style
  Speed: Fast
  Limit: 15 requests/min (free tier)
  Setup: https://ai.google.dev/
  Perfect for: This quiz game

OPENAI DALL-E 3
  Cost: $0.08 per image (10 images = $0.80)
  Quality: Highest quality, most realistic
  Speed: Medium
  Limit: Depends on account tier
  Setup: https://platform.openai.com/api-keys
  Perfect for: Premium quality

STABILITY AI
  Cost: $0.003 per image (10 images = $0.03)
  Quality: Very good
  Speed: Fastest
  Limit: Depends on account tier
  Setup: https://platform.stability.ai/
  Perfect for: Budget-conscious

TROUBLESHOOTING
────────────────────────────────────────────────────────────────────────────

Q: "No API keys found"
A: Make sure to set the environment variable BEFORE running:
   export GEMINI_API_KEY='your-key'
   echo $GEMINI_API_KEY  (verify it was set)

Q: "Neither Python 3 nor Node.js found"
A: Install one:
   • Python: https://www.python.org/downloads/
   • Node.js: https://nodejs.org/

Q: Only some images generated
A: Run the script again. Failed images will be retried.
   The script only overwrites if generation succeeds.

Q: Rate limiting errors
A: Wait 30 seconds and try again, or switch to a different API.

Q: Images don't look right
A: Try a different API:
   - Gemini: Best for kids' storybook style
   - DALL-E 3: Best quality
   - Stability: Good balance

INTEGRATION WITH QUIZ GAME
────────────────────────────────────────────────────────────────────────────

Add images to your HTML:

<div class="quiz-question">
  <img src="/games/quiz-images/purim-megila.jpg" 
       alt="Purim scene" 
       class="quiz-image"
       style="max-width: 500px; height: auto;">
  <p class="question">Who is reading the Megillah in this picture?</p>
  <button onclick="checkAnswer('Esther')">Queen Esther</button>
  <button onclick="checkAnswer('Mordecai')">Mordecai</button>
  <button onclick="checkAnswer('King')">King Ahasuerus</button>
  <button onclick="checkAnswer('Haman')">Haman</button>
</div>

ENVIRONMENT SETUP (Windows PowerShell)
────────────────────────────────────────────────────────────────────────────

# Set API key
$env:GEMINI_API_KEY = 'your-key-here'

# Verify
$env:GEMINI_API_KEY

# Run
cd C:\path\to\purim-home
bash generate-images.sh

ENVIRONMENT SETUP (macOS/Linux)
────────────────────────────────────────────────────────────────────────────

# Set API key
export GEMINI_API_KEY='your-key-here'

# Verify
echo $GEMINI_API_KEY

# Run
cd /tmp/purim-home
bash generate-images.sh

MAKE IT PERMANENT (Optional)
────────────────────────────────────────────────────────────────────────────

macOS/Linux (add to ~/.bashrc or ~/.zshrc):
  echo "export GEMINI_API_KEY='your-key-here'" >> ~/.bashrc
  source ~/.bashrc

Windows PowerShell (edit profile):
  notepad $PROFILE
  Add: $env:GEMINI_API_KEY = 'your-key-here'

FEATURES
────────────────────────────────────────────────────────────────────────────

✓ Beautiful warm storybook illustrations
✓ 800x800 pixel JPG format
✓ Kid-friendly content (4-8 years old)
✓ Supports 3 major AI APIs
✓ Auto-detects Python or Node.js
✓ API key validation before running
✓ Rate limiting built-in
✓ Clear progress feedback
✓ Easy retry for failures
✓ Warm, colorful, educational

FILE PATHS
────────────────────────────────────────────────────────────────────────────

Generator scripts:
  /tmp/purim-home/generate-images.sh
  /tmp/purim-home/generate_images_v2.py
  /tmp/purim-home/generate_images.js

Output directory:
  /tmp/purim-home/games/quiz-images/

Generated images (after running):
  /tmp/purim-home/games/quiz-images/purim-megila.jpg
  /tmp/purim-home/games/quiz-images/purim-costumes.jpg
  (and 8 more...)

NEXT STEPS
────────────────────────────────────────────────────────────────────────────

1. Get an API key from https://ai.google.dev/
2. Set it: export GEMINI_API_KEY='your-key'
3. Run: cd /tmp/purim-home && ./generate-images.sh
4. Wait for images to generate
5. Check: ls /tmp/purim-home/games/quiz-images/
6. Integrate into quiz HTML
7. Create questions for each image
8. Test in your game

API DOCUMENTATION
────────────────────────────────────────────────────────────────────────────

Gemini API: https://ai.google.dev/docs/
OpenAI API: https://platform.openai.com/docs/guides/images
Stability AI: https://platform.stability.ai/docs

SECURITY NOTE
────────────────────────────────────────────────────────────────────────────

⚠️  NEVER commit your API key to Git!
    Use: git config user.useConfigOnly true
    And: export GEMINI_API_KEY='...'

Ready to generate beautiful quiz images! 🎨

================================================================================
