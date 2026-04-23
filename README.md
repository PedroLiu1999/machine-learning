# Machine Learning Projects

A collection of ML notebooks and experiments using Kaggle and other datasets.

## Stack

- **Python 3.12** managed via [uv](https://github.com/astral-sh/uv)
- numpy, pandas, scikit-learn, statsmodels, matplotlib, jupyterlab

## Getting Started

```bash
# Clone and set up the environment
uv sync

# Install the nbstripout git hook (strips cell outputs before every commit)
uv run nbstripout --install

# Launch JupyterLab
uv run jupyter lab
```

## Project Set Up

Use one folder per dataset under `projects/`.

```bash
# 1) Create a new project folder
mkdir -p projects/titanic/{notebooks,data/raw,data/processed,models}

# 2) Download dataset reproducibly with metadata recorded
scripts/download_kaggle.sh titanic heptapod/titanic

# 3) Record raw-data checksums for reproducibility
scripts/hash_data.sh titanic

# 4) Validate raw-data checksums (OK/FAILED per file)
scripts/verify_data.sh titanic

# 5) Start notebooks
uv run jupyter lab
```

Reproducibility notes:

- Commit `pyproject.toml` and `uv.lock` for environment reproducibility.
- Keep `projects/<name>/data/source.json` and `projects/<name>/data/raw.sha256` in Git.
- Keep `projects/<name>/data/raw/` and `projects/<name>/data/processed/` out of Git.
- Keep Kaggle credentials in `~/.kaggle/kaggle.json` (never commit).

## Project Structure

```
machine-learning/
├── projects/
│   ├── titanic/
│   │   ├── notebooks/
│   │   ├── data/
│   │   │   ├── raw/          # gitignored
│   │   │   └── processed/    # optional
│   │   ├── models/           # gitignored
│   │   └── README.md
│   └── house-prices/
│       └── ...
├── shared/                   # reusable helper code across projects
├── scripts/                  # automation scripts (download, prep, train)
├── pyproject.toml   # Project dependencies
└── uv.lock          # Pinned lockfile for reproducibility
```

Recommended approach: create one folder per dataset/project under `projects/`.

Example:

```bash
mkdir -p projects/titanic/{notebooks,data/raw,data/processed,models}
```

## Adding Dependencies

```bash
uv add <package>     # adds and updates uv.lock
```
