#!/bin/bash

# Diretório onde o script está localizado
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Encontrar o arquivo que contém "_pos.xls" no nome
file_to_keep=$(find "$script_directory" -type f -name "*_pos.xls" -print -quit)

# Verificar se foi encontrado um arquivo para manter
if [ -n "$file_to_keep" ]; then
    # Remover todos os arquivos, exceto o arquivo a ser mantido
    find "$script_directory" -type f ! -name "$(basename "$file_to_keep")" -exec rm -f {} +

    echo "Todos os arquivos, exceto '$file_to_keep', foram removidos da pasta '$script_directory'."
else
    echo "Nenhum arquivo com '_pos.xls' no nome encontrado na pasta '$script_directory'."
fi
