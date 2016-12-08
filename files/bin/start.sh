#!/bin/sh

[ -z "${LUIGI_CONFIG_PATH}" ] && {

  mkdir -p /etc/luigi
  cat > /etc/luigi/client.cfg << EOF
[core]
logging_conf_file = /etc/luigi/logging.conf

[scheduler]
batch_emails = ${BATCH_EMAILS:-False}
disable_hard_timeout = ${DISABLE_HARD_TIMEOUT:-999999999}
disable_persist = ${DISABLE_PERSIST:-86400}
disable_window = ${DISABLE_WINDOW:-3600}
max_graph_nodes = ${MAX_GRAPH_NODES:-100000}
max_shown_tasks = ${MAX_SHOWN_TASKS:-100000}
prune_on_get_work = ${PRUNE_ON_GET_WORK:-False}
record_task_history = ${RECORD_TASK_HISTORY:-False}
remove_delay = ${REMOVE_DELAY:-600}
retry_count = ${RETRY_COUNT:-999999999}
retry_delay = ${RETRY_DELAY:-900}
state_path = ${STATE_PATH:-/var/tmp/luigi-state.pickle}
worker_disconnect_delay = ${WORKER_DISCONNECT_DELAY:-60}

[task_history]
db_connection = ${DB_CONNECTION:-sqlite:////var/tmp/luigi-task-hist.db}
EOF

}

exec luigid "$@"
