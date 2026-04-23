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
