#!/bin/sh
set -eu

sql_escape() {
  printf "%s" "$1" | sed "s/'/''/g"
}

password="test'pass; SELECT 1;"
escaped_password=$(sql_escape "$password")

if [ "$escaped_password" != "test''pass; SELECT 1;" ]; then
  echo "SQL escaping failed: $escaped_password"
  exit 1
fi

sql="INSERT INTO user (matrix_password) VALUES ('$escaped_password');"

case "$sql" in
  *"test''pass; SELECT 1;"*) ;;
  *)
    echo "Escaped password missing from SQL"
    exit 1
    ;;
esac

echo "SQL escaping test passed"
