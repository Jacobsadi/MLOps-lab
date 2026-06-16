# NYC Taxi Duration

Linear regression baseline for predicting trip duration from pickup/dropoff location and distance.

## Notebooks

- [`notebooks/duration_regression.ipynb`](notebooks/duration_regression.ipynb) — EDA, feature encoding, train/val evaluation

## Data

Yellow taxi parquet (Jan–Feb 2023) in `data/raw/`:

```bash
make fetch-data
```

Columns: `tpep_pickup_datetime`, `tpep_dropoff_datetime`, `PULocationID`, `DOLocationID`, `trip_distance`.
