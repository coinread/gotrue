#!/bin/sh
set -eo pipefail

gotrue migrate || true

# file_env 'GOTRUE_MAIN_USER'
# file_env 'GOTRUE_MAIN_PASSWORD'
# if [ "$GOTRUE_MAIN_USER" -a "$GOTRUE_MAIN_PASSWORD" ]; then
#     ./gotrue admin createuser -i 00000000-0000-0000-0000-000000000000 $GOTRUE_MAIN_USER $GOTRUE_MAIN_PASSWORD
# fi

exec "$@"
