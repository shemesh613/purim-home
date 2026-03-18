#!/bin/bash
FILE="index.html"

# ══════════════════════════════════════════════
# 1. REMOVE CONTINUOUS ANIMATIONS
# ══════════════════════════════════════════════

# Remove confetti background animation CSS
sed -i 's/animation: confDrop var(--d, 6s) linear infinite;/animation: none;/g' "$FILE"

# Remove bounce on header
sed -i 's/animation: bounce 2s ease-in-out infinite;//g' "$FILE"

# Remove gradient shift on h1
sed -i 's/animation: gradShift 4s ease-in-out infinite;//g' "$FILE"

# Remove badge pulse
sed -i 's/animation:badgePulse 1.5s ease-in-out infinite;//g' "$FILE"

# Remove zone float
sed -i 's/animation: zoneFloat 3s ease-in-out infinite;//g' "$FILE"

# Remove hero bounce
sed -i 's/animation: heroBounce 2s ease-in-out infinite;//g' "$FILE"

# Remove CTA pulse
sed -i 's/animation: ctaPulse 2.5s ease-in-out infinite;//g' "$FILE"

# Remove hero spin
sed -i 's/animation: heroSpin 8s linear infinite;//g' "$FILE"

# Remove fab pulse
sed -i 's/animation: fabPulse 3s ease-in-out infinite;//g' "$FILE"

# Remove fab label bounce 
sed -i 's/animation: fabLabelBounce 4s ease-in-out infinite;//g' "$FILE"

# Remove feedback fab pulse
sed -i 's/animation: fbPulse 4s ease-in-out infinite;//g' "$FILE"

# Remove feedback label show
sed -i 's/animation: fbLabelShow 6s ease-in-out infinite;//g' "$FILE"

echo "✅ Step 1: Removed continuous animations"

# ══════════════════════════════════════════════
# 2. PREMIUM COLOR PALETTE
# ══════════════════════════════════════════════

# Body background - clean cream
sed -i "s|background: linear-gradient(180deg, #fef9ef 0%, #fff7ed 30%, #fdf4ff 60%, #f0f9ff 100%);|background: #f8fafc;|g" "$FILE"

# Header h1 - clean indigo gradient (no animation)
sed -i "s|background: linear-gradient(135deg, #7c3aed, #ec4899, #f97316, #fbbf24);|background: linear-gradient(135deg, #4f46e5, #2563eb);|g" "$FILE"
sed -i 's/background-size: 300% 300%;//g' "$FILE"

# Tab active - solid indigo
sed -i "s|background: linear-gradient(135deg, #7c3aed, #ec4899);|background: #4f46e5;|g" "$FILE"
sed -i "s|box-shadow: 0 4px 15px rgba(124,58,237,0.3);|box-shadow: 0 2px 8px rgba(79,70,229,0.25);|g" "$FILE"

# Tab btn border
sed -i "s|border: 2px solid rgba(124,58,237,0.2);|border: 2px solid rgba(79,70,229,0.15);|g" "$FILE"
sed -i "s|background: rgba(124,58,237,0.05);|background: rgba(79,70,229,0.04);|g" "$FILE"

# Section title color
sed -i 's/color: #4c1d95;/color: #1e1b4b;/g' "$FILE"

# Subtitle color
sed -i 's/color: #6b21a8;/color: #4338ca;/g' "$FILE"

echo "✅ Step 2: Applied premium color palette"

# ══════════════════════════════════════════════
# 3. CLEAN CARD STYLE
# ══════════════════════════════════════════════

# Cards - cleaner shadow and hover
sed -i "s|box-shadow: 0 2px 12px rgba(0,0,0,0.04);|box-shadow: 0 1px 3px rgba(0,0,0,0.08);|g" "$FILE"

# Card hover - subtle
sed -i "s|transform: translateY(-7px) scale(1.02);|transform: translateY(-3px);|g" "$FILE"
sed -i "s|box-shadow: 0 16px 38px var(--card-shadow, rgba(124,58,237,0.18));|box-shadow: 0 8px 24px rgba(0,0,0,0.12);|g" "$FILE"

# Card border radius - slightly less round
sed -i 's/border-radius: 20px;/border-radius: 14px;/g' "$FILE"

# Remove shimmer effect on cards
sed -i "s|background: linear-gradient(135deg, transparent 40%, rgba(255,255,255,0.2) 50%, transparent 60%);|background: none;|g" "$FILE"
sed -i 's/transform: translateX(-100%);//g' "$FILE"

echo "✅ Step 3: Cleaned card styles"

# ══════════════════════════════════════════════
# 4. TABS - CLEANER STYLE
# ══════════════════════════════════════════════

# Tab bar background - cleaner
sed -i "s|background: rgba(255,255,255,0.9);|background: rgba(255,255,255,0.95);|g" "$FILE"
sed -i "s|backdrop-filter: blur(16px) saturate(180%);|backdrop-filter: blur(12px);|g" "$FILE"

# Tab button - cleaner
sed -i 's/border-radius: 24px;/border-radius: 10px;/g' "$FILE"

echo "✅ Step 4: Cleaned tabs"

# ══════════════════════════════════════════════
# 5. CONFETTI - HIDE BY DEFAULT (CSS only, JS stays)
# ══════════════════════════════════════════════

# Hide confetti container by default
sed -i 's|pointer-events: none; z-index: 0;|pointer-events: none; z-index: 0; display: none;|g' "$FILE"

echo "✅ Step 5: Hidden confetti (available for events via JS)"

# ══════════════════════════════════════════════
# 6. HEADER - PREMIUM CLEAN
# ══════════════════════════════════════════════

# Header background - subtle
sed -i "s|background: linear-gradient(180deg, rgba(251,191,36,0.1) 0%, transparent 100%);|background: transparent;|g" "$FILE"

# Header h1 font size - slightly smaller
sed -i "s|font-size: clamp(2.5rem, 8vw, 4.5rem);|font-size: clamp(2rem, 6vw, 3.5rem);|g" "$FILE"

echo "✅ Step 6: Premium header"

# ══════════════════════════════════════════════
# 7. NEW BADGE - REMOVE PULSE, CLEANER
# ══════════════════════════════════════════════

sed -i "s|background:linear-gradient(135deg,#ef4444,#f97316);|background:#4f46e5;|g" "$FILE"

echo "✅ Step 7: Clean badges"

# ══════════════════════════════════════════════
# 8. ZONE HEADERS - KEEP BUT REFINE
# ══════════════════════════════════════════════

# Purim header - cleaner gradient
sed -i "s|background: linear-gradient(135deg, #5b21b6 0%, #7c3aed 40%, #a855f7 80%, #c084fc 100%);|background: linear-gradient(135deg, #4338ca 0%, #4f46e5 100%);|g" "$FILE"

# Pesach header - warmer
sed -i "s|background: linear-gradient(135deg, #78350f 0%, #92400e 30%, #b45309 60%, #d97706 100%);|background: linear-gradient(135deg, #92400e 0%, #b45309 100%);|g" "$FILE"

echo "✅ Step 8: Refined zone headers"

# ══════════════════════════════════════════════
# 9. ROLE SIDEBAR - CLEANER
# ══════════════════════════════════════════════

sed -i "s|background: linear-gradient(180deg, #1e1b4b, #4c1d95, #7c3aed);|background: linear-gradient(180deg, #1e1b4b, #312e81);|g" "$FILE"
sed -i "s|box-shadow: -4px 0 20px rgba(124,58,237,0.3);|box-shadow: -2px 0 12px rgba(30,27,75,0.2);|g" "$FILE"

echo "✅ Step 9: Cleaned sidebar"

# ══════════════════════════════════════════════
# 10. SHARE FAB - KEEP BUT CLEANER
# ══════════════════════════════════════════════

# Remove WhatsApp fab glow animation
sed -i "s|animation: fabPulse 3s ease-in-out infinite;||g" "$FILE"

echo "✅ Step 10: Cleaned FABs"

echo ""
echo "🎉 Premium redesign complete!"
