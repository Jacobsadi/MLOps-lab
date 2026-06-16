#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "==> Checking prerequisites"
command -v uv >/dev/null || { echo "uv not found — install: https://docs.astral.sh/uv/"; exit 1; }
command -v docker >/dev/null || { echo "docker not found"; exit 1; }
command -v git >/dev/null || { echo "git not found"; exit 1; }

echo "==> Syncing Python environment (3.12)"
uv sync

echo "==> Registering Jupyter kernel"
uv run python -m ipykernel install --user --name=mlops-lab --display-name="MLOps Lab"

echo "==> Creating data directories"
mkdir -p data/raw data/processed data/interim

echo "==> Verifying imports"
uv run python -c "
import pandas, sklearn, pyarrow
print(f'  pandas  {pandas.__version__}')
print(f'  sklearn {sklearn.__version__}')
print(f'  pyarrow {pyarrow.__version__}')
"

echo "==> Verifying Docker"
docker run --rm hello-world > /dev/null
echo "  docker: ok"

echo ""
echo "Setup complete."
echo "  make jupyter     — start JupyterLab locally"
echo "  make docker-up   — start Jupyter in Docker (port 8888)"
