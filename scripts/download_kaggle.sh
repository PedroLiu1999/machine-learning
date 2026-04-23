#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <project_slug> <kaggle_dataset_slug>"
  echo "Example: $0 titanic heptapod/titanic"
  exit 1
fi

PROJECT_SLUG="$1"
DATASET_SLUG="$2"
PROJECT_DIR="projects/${PROJECT_SLUG}"
RAW_DIR="${PROJECT_DIR}/data/raw"
SOURCE_FILE="${PROJECT_DIR}/data/source.json"

mkdir -p "${RAW_DIR}"

# Download and unzip dataset into the project's raw data folder.
uv run kaggle datasets download -d "${DATASET_SLUG}" -p "${RAW_DIR}" --unzip

DOWNLOADED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
cat > "${SOURCE_FILE}" <<EOF
{
  "provider": "kaggle",
  "dataset_slug": "${DATASET_SLUG}",
  "downloaded_at_utc": "${DOWNLOADED_AT}",
  "command": "uv run kaggle datasets download -d ${DATASET_SLUG} -p ${RAW_DIR} --unzip"
}
EOF

echo "Downloaded ${DATASET_SLUG} into ${RAW_DIR}"
echo "Recorded metadata in ${SOURCE_FILE}"
