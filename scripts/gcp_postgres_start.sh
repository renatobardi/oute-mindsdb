#!/bin/bash

# Este script LIGA o banco PostgreSQL no GCP (oute-main).
echo "🚀 Ligando o banco PostgreSQL (oute-postgres)..."

gcloud sql instances patch oute-postgres \
    --project=oute-main \
    --activation-policy=ALWAYS

echo "✅ Banco de dados PostgreSQL está ONLINE."
