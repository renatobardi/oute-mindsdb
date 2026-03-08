#!/bin/bash

# Este script LIGA a VM do MindsDB no GCP novamente.
echo "🚀 Ligando a infraestrutura do MindsDB no GCP (Projeto: oute-mind)..."

gcloud compute instances start mindsdb \
    --project=oute-mind \
    --zone=us-central1-c

echo "Esperando a máquina acordar para buscar qual foi o novo IP..."
sleep 5

NOVO_IP=$(gcloud compute instances describe mindsdb \
    --project=oute-mind \
    --zone=us-central1-c \
    --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

echo "✅ A máquina virtual do MindsDB está rodando!"
echo "O novo IP externo do MindsDB é: $NOVO_IP"
echo "Acesse a interface nos navegadores via http://$NOVO_IP:47334"
echo "NOTA: Você precisará ir no seu banco 'oute-postgres' (oute-main) e atualizar as 'Redes Autorizadas' com este novo IP: $NOVO_IP"
