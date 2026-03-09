#!/bin/bash

# Este script DESLIGA o banco PostgreSQL no GCP (oute-main) para economizar custos.
echo "🛑 Desligando o banco PostgreSQL (oute-postgres)..."

gcloud sql instances patch oute-postgres \
    --project=oute-main \
    --activation-policy=NEVER

echo "✅ Banco de dados PostgreSQL está DESLIGADO (cobrando apenas pelo armazenamento do disco)."
