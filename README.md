# Machine Learning Projects

A collection of ML notebooks and experiments using Kaggle and other datasets.

## Stack

- **Python 3.12** managed via [uv](https://github.com/astral-sh/uv)
- numpy, pandas, scikit-learn, statsmodels, matplotlib, jupyterlab

## Getting Started

```bash
# Clone and reproduce the exact environment
uv sync

# Launch JupyterLab
uv run jupyter lab
```

The `uv.lock` file pins all dependency versions so the environment is fully reproducible.

## Project Structure

```
machine-learning/
├── notebooks/       # Jupyter notebooks by project/dataset
├── data/            # Raw and processed data (raw/ is gitignored)
├── models/          # Saved model artifacts (gitignored)
├── pyproject.toml   # Project dependencies
└── uv.lock          # Pinned lockfile for reproducibility
```

## Adding Dependencies

```bash
uv add <package>     # adds and updates uv.lock
```
