#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <project_slug>"
  echo "Example: $0 titanic"
  exit 1
fi

PROJECT_SLUG="$1"
HASH_FILE="projects/${PROJECT_SLUG}/data/raw.sha256"

if [[ ! -f "${HASH_FILE}" ]]; then
  echo "Checksum file not found: ${HASH_FILE}"
  echo "Run scripts/hash_data.sh ${PROJECT_SLUG} first."
  exit 1
fi

sha256sum -c "${HASH_FILE}"
