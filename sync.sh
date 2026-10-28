#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

while true; do
    echo ""
    echo "===== Sincronizando $(date) ====="

    branch=$(git branch --show-current) || break

    if [[ -z "$branch" ]]; then
        echo "Nenhuma branch selecionada."
        break
    fi

    if ! git add -A; then
        echo "Erro ao preparar arquivos."
        break
    fi

    if ! git diff --cached --quiet; then
        if ! git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"; then
            echo "Erro no commit."
            break
        fi
    fi

    if ! git pull --rebase origin "$branch"; then
        echo "Erro no pull. Verifique o estado do Git."
        break
    fi

    if ! git push origin "$branch"; then
        echo "Erro no push."
        break
    fi

    echo "Próxima verificação em 60 segundos."
    sleep 60
done
