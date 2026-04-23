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
