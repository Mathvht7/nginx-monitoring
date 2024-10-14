#!/bin/bash

# Definir variáveis
SERVICO="nginx"
DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")
STATUS=$(systemctl is-active $SERVICO)
ARQUIVO_ONLINE="/var/log/nginx_online.log"
ARQUIVO_OFFLINE="/var/log/nginx_offline.log"

# Função para verificar o status do serviço
verificar_servico() {
    if [ "$STATUS" == "active" ]; then
        # Serviço está online
        MENSAGEM="$DATA_HORA - $SERVICO - Status: ONLINE - O serviço está rodando normalmente."
        echo "$MENSAGEM" >> $ARQUIVO_ONLINE
    else
        # Serviço está offline
        MENSAGEM="$DATA_HORA - $SERVICO - Status: OFFLINE - O serviço não está rodando."
        echo "$MENSAGEM" >> $ARQUIVO_OFFLINE
    fi
}

# Executa a função de verificação
verificar_servico

