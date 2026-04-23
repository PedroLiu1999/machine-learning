#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <project_slug>"
  echo "Example: $0 titanic"
  exit 1
fi

PROJECT_SLUG="$1"
RAW_DIR="projects/${PROJECT_SLUG}/data/raw"
HASH_FILE="projects/${PROJECT_SLUG}/data/raw.sha256"

if [[ ! -d "${RAW_DIR}" ]]; then
  echo "Raw data folder not found: ${RAW_DIR}"
  exit 1
fi

# Hash all raw files in stable sorted order for reproducibility checks.
find "${RAW_DIR}" -type f -print0 \
  | sort -z \
  | xargs -0 sha256sum > "${HASH_FILE}"

echo "Wrote checksums to ${HASH_FILE}"
