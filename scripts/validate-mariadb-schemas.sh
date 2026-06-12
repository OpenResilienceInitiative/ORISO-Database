#!/usr/bin/env bash
set -euo pipefail

agency_schema="mariadb/agencyservice/schema.sql"

if [[ ! -f "$agency_schema" ]]; then
  echo "::error file=$agency_schema::AgencyService schema file is missing"
  exit 1
fi

if ! awk '
  /CREATE TABLE `agency` \(/ { in_agency_table = 1 }
  in_agency_table && /`settings`[[:space:]]+longtext[[:space:]]+DEFAULT[[:space:]]+NULL/ { found_settings = 1 }
  in_agency_table && /^\) ENGINE=/ { in_agency_table = 0 }
  END { exit found_settings ? 0 : 1 }
' "$agency_schema"; then
  echo "::error file=$agency_schema::Agency table must define nullable settings longtext column"
  exit 1
fi

echo "AgencyService MariaDB schema validation passed."
