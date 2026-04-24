#!/bin/bash
set -e

# 1. 调用 Claude Code 原生 review 能力
claude --no-stream --command "/review" > .review-log.md

# 2. 可选：如果是PR环境，自动评论到 GitHub PR
if [ -n "$PR_NUMBER" ]; then
  gh pr comment "$PR_NUMBER" --body "$(cat .review-log.md)"
fi

echo "✅ Claude Code Skill 自动代码评审完成"