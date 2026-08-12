#!/usr/bin/env bash
# Helper script to discover and add stack-specific skills via `npx skills`

set -e

STACK_QUERY="${1:-react}"

echo "🔍 Searching skills.sh for stack keyword: '$STACK_QUERY'..."
npx skills find "$STACK_QUERY"

echo ""
echo "💡 To install any of the discovered skills globally, run:"
echo "   npx skills add <owner/repo@skill-name> -g -y"
