# Environment Setup

## Prerequisites

- Linux
- Git
- Docker 29.x + Compose 2.x
- [uv](https://docs.astral.sh/uv/)
- Python 3.12 (via uv; system 3.14 is not used for ML deps)

## Bootstrap

```bash
./scripts/bootstrap.sh
```

1. Creates `.venv` from `pyproject.toml`
2. Registers Jupyter kernel **MLOps Lab**
3. Creates `data/raw`, `data/processed`, `data/interim`
4. Verifies Docker

## Jupyter — local

```bash
make jupyter
```

Open `experiments/nyc-taxi-duration/notebooks/duration_regression.ipynb`.

## Jupyter — Docker

```bash
make docker-up
docker logs mlops-lab-jupyter 2>&1 | grep token
```

Browse to `http://localhost:8888`.

## Troubleshooting

| Issue | Fix |
|-------|-----|
| Docker permission denied | `sudo usermod -aG docker $USER` then re-login |
| Kernel not listed in Jupyter | `make setup` |
| Parquet read errors | `uv sync` |
