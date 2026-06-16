# MLOps Lab

Reproducible ML experimentation workspace local development, containerized runtimes, and versioned artifacts.

## Stack

| Tool | Purpose |
|------|---------|
| Python 3.12 + [uv](https://docs.astral.sh/uv/) | Dependency management |
| Docker + Compose | Containerized Jupyter (optional) |
| JupyterLab | Interactive analysis |

## Quick start

```bash
chmod +x scripts/bootstrap.sh
./scripts/bootstrap.sh
make jupyter
```

## Layout

```
├── infra/containers/          # Compose services
├── experiments/               # ML workloads and notebooks
├── data/raw/                  # Source datasets (gitignored)
├── artifacts/                 # Trained models and outputs
├── scripts/                   # Bootstrap and data ingestion
└── pyproject.toml
```

## Workloads

| Workload | Description | Path |
|----------|-------------|------|
| NYC taxi duration | Regression baseline on TLC trip records | [`experiments/nyc-taxi-duration/`](experiments/nyc-taxi-duration/) |

## Data

NYC TLC trip records: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

```bash
make fetch-data
```

## Commands

```bash
make setup       # install deps + register kernel
make check       # verify Python + Docker
make jupyter     # JupyterLab on localhost
make fetch-data  # download TLC parquet files
make docker-up   # Jupyter in Docker (port 8888)
```
