#!/usr/bin/env python3
import os, sys, requests, json, base64, time
from pathlib import Path

OUTPUT_DIR = Path('/tmp/purim-home/games/quiz-images')
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

IMAGES = [
    {'filename': 'purim-megila.jpg', 'prompt': 'Queen Esther reading the Megillah scroll in a beautiful ancient Persian palace. Colorful illustrated storybook style for children. Warm golden light, ornate decorations.'},
    {'filename': 'purim-costumes.jpg', 'prompt': 'Happy Jewish children in colorful Purim costumes celebrating together, confetti flying. Warm storybook illustration style.'},
    {'filename': 'purim-mishloach.jpg', 'prompt': 'Beautiful gift baskets with hamantaschen cookies and treats being given. Warm colorful storybook illustration.'},
    {'filename': 'pesach-seder.jpg', 'prompt': 'Jewish family gathered around a beautiful Passover Seder table with matzah and wine. Warm golden light, cozy.'},
    {'filename': 'pesach-sea.jpg', 'prompt': 'The splitting of the Red Sea with families walking through the parted waters. Dramatic and inspiring illustration.'},
    {'filename': 'pesach-matzah.jpg', 'prompt': 'People baking matzah quickly in an ancient setting, showing the urgency of leaving Egypt.'},
    {'filename': 'heroes-soldiers.jpg', 'prompt': 'Israeli soldiers standing guard at the border at sunset, respectful and dignified.'},
    {'filename': 'heroes-medics.jpg', 'prompt': 'Military medics helping and caring for wounded people, heroic and compassionate.'},
    {'filename': 'gooddeeds-helping.jpg', 'prompt': 'Children helping elderly people with kindness and warmth, heartfelt scene.'},
    {'filename': 'gooddeeds-packages.jpg', 'prompt': 'Kids packing care packages for soldiers together, patriotic and sweet scene.'},
]

class ImageGenerator:
    def __init__(self):
        self.gemini_key = os.environ.get('GEMINI_API_KEY')
        self.openai_key = os.environ.get('OPENAI_API_KEY')
        self.stability_key = os.environ.get('STABILITY_API_KEY')
        self.api_choice = self.detect_api()

    def detect_api(self):
        if self.gemini_key:
            print('✅ Gemini API detected')
            return 'gemini'
        elif self.openai_key:
            print('✅ OpenAI API detected')
            return 'openai'
        elif self.stability_key:
            print('✅ Stability AI detected')
            return 'stability'
        else:
            print('❌ No API keys found!')
            return None

    def generate(self, prompt, filename):
        if not self.api_choice:
            return False
        print(f"  {filename[:25]:<25} ", end='', flush=True)
        try:
            if self.api_choice == 'gemini':
                return self.generate_gemini(prompt, filename)
            elif self.api_choice == 'openai':
                return self.generate_openai(prompt, filename)
            elif self.api_choice == 'stability':
                return self.generate_stability(prompt, filename)
        except Exception as e:
            print(f"ERROR: {str(e)[:40]}")
            return False

    def generate_gemini(self, prompt, filename):
        url = f'https://generativelanguage.googleapis.com/v1beta/models/imagen-3.0-generate-002:generateContent?key={self.gemini_key}'
        payload = {'contents': [{'parts': [{'text': f'{prompt}\n\nGenerate as 800x800 pixel illustration for children.'}]}]}
        headers = {'Content-Type': 'application/json'}
        response = requests.post(url, json=payload, headers=headers, timeout=30)
        if response.status_code == 200:
            print("✅")
            return True
        print(f"ERROR {response.status_code}")
        return False

    def generate_openai(self, prompt, filename):
        url = 'https://api.openai.com/v1/images/generations'
        headers = {'Authorization': f'Bearer {self.openai_key}', 'Content-Type': 'application/json'}
        payload = {'model': 'dall-e-3', 'prompt': f'{prompt}\n\nBeautiful storybook style, warm, colorful.', 'n': 1, 'size': '1024x1024', 'quality': 'hd'}
        response = requests.post(url, json=payload, headers=headers, timeout=60)
        if response.status_code == 200:
            result = response.json()
            img_url = result['data'][0]['url']
            img_response = requests.get(img_url, timeout=30)
            if img_response.status_code == 200:
                (OUTPUT_DIR / filename).write_bytes(img_response.content)
                print("✅")
                return True
        print("ERROR")
        return False

    def generate_stability(self, prompt, filename):
        url = 'https://api.stability.ai/v1/generate'
        headers = {'authorization': f'Bearer {self.stability_key}', 'accept': 'application/json'}
        payload = {'prompt': f'{prompt}\n\nWarm children\'s book illustration style.', 'negative_prompt': 'dark, scary, violent', 'steps': 40, 'width': 800, 'height': 800, 'samples': 1}
        response = requests.post(url, headers=headers, files=payload, timeout=60)
        if response.status_code == 200:
            result = response.json()
            if result.get('artifacts'):
                img_data = result['artifacts'][0]['base64']
                img_bytes = base64.b64decode(img_data)
                (OUTPUT_DIR / filename).write_bytes(img_bytes)
                print("✅")
                return True
        print("ERROR")
        return False

def main():
    print('🎨 Purim & Pesach Quiz Images\n')
    gen = ImageGenerator()
    if not gen.api_choice:
        sys.exit(1)
    success, failed = 0, 0
    for i, config in enumerate(IMAGES, 1):
        if gen.generate(config['prompt'], config['filename']):
            success += 1
        else:
            failed += 1
        if i < len(IMAGES):
            time.sleep(1)
    print(f'\n✅ {success}/{len(IMAGES)} | ❌ {failed}/{len(IMAGES)}\n📁 {OUTPUT_DIR}')

if __name__ == '__main__':
    main()
