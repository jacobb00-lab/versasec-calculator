#!/bin/bash
# Lightning fast deploy: git push + vercel in parallel

set -e

MSG="${1:-Quick update}"

# Git add, commit, push (background)
git add -A && git commit -m "$MSG" 2>/dev/null || true
git push &

# Vercel deploy (background)
vercel --prod --yes &

# Wait for both
wait

echo "✅ Deployed!"
