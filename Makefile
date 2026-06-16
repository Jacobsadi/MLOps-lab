.PHONY: setup check jupyter docker-up docker-down fetch-data clean

VENV := .venv
PYTHON := $(VENV)/bin/python
UV := uv

setup:
	$(UV) sync
	$(UV) run python -m ipykernel install --user --name=mlops-lab --display-name="MLOps Lab"

check:
	$(UV) run python -c "import pandas, sklearn, pyarrow; print('pandas', pandas.__version__); print('sklearn', sklearn.__version__)"
	docker compose -f infra/containers/compose.yaml version
	docker run --rm hello-world > /dev/null && echo "docker: ok"

jupyter:
	$(UV) run jupyter lab --notebook-dir=.

docker-up:
	docker compose -f infra/containers/compose.yaml up -d

docker-down:
	docker compose -f infra/containers/compose.yaml down

fetch-data:
	./scripts/fetch-tlc-data.sh

clean:
	rm -rf $(VENV) .pytest_cache .ruff_cache
