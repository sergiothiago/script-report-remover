#!/bin/bash

# Diretório onde o script está localizado
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Percorrer todas as pastas no diretório atual
for folder in "$script_directory"/*/; do
    # Verificar se é um diretório válido
    if [ -d "$folder" ]; then
        # Encontrar o arquivo que contém "_pos.xls" no nome
        file_to_keep=$(find "$folder" -type f -name "*_pos.xls" -print -quit)

        # Verificar se foi encontrado um arquivo para manter
        if [ -n "$file_to_keep" ]; then
            # Remover todos os arquivos, exceto o arquivo a ser mantido
            find "$folder" -type f ! -name "$(basename "$file_to_keep")" -exec rm -f {} +
            echo "Todos os arquivos, exceto '$file_to_keep', foram removidos da pasta '$folder'."
        else
            echo "Nenhum arquivo com '_pos.xls' no nome encontrado na pasta '$folder'."
        fi
    fi
done
