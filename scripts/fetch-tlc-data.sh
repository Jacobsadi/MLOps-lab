#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$ROOT/data/raw"
BASE="https://d37ci6vzurychx.cloudfront.net/trip-data"

mkdir -p "$DEST"

for month in 01 02; do
  file="yellow_tripdata_2023-${month}.parquet"
  echo "==> $file"
  curl -fsSL -o "$DEST/$file" "$BASE/$file"
done

echo "Done. Files in $DEST"
