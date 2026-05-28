# ORISO-Database Onboarding

## Navigation

- [First hour](#first-hour)
- [Local initialization](#local-initialization)
- [Schema change workflow](#schema-change-workflow)
- [Backend developer workflow](#backend-developer-workflow)
- [DevOps workflow](#devops-workflow)
- [Review checklist](#review-checklist)

## First Hour

Read these files first:

1. `mariadb/userservice/schema.sql` - Largest relational schema: 26 tables for users, consultants, sessions, chats, assignments, notifications, audit logs, and mobile tokens.
2. `mariadb/tenantservice/schema.sql` - Tenant registry schema with tenant table, theming/legal content/settings JSON, and sequence_tenant.
3. `mariadb/agencyservice/schema.sql` - Agency master data plus agency postcode ranges, agency topics, dioceses, sequences, and update triggers.
4. `mariadb/consultingtypeservice/schema.sql` - Topic, topic_group, and topic_group_x_topic relational metadata; main consulting type docs are in MongoDB.
5. `mariadb/uploadservice/schema.sql` - uploadbyuser table for file upload metadata.
6. `mariadb/videoservice/schema.sql` - videoroom table for Jitsi/video room metadata.
7. `mongodb/consulting_types/collections.txt` - MongoDB consulting/application settings collection list.
8. `scripts/database-initialize.yaml` - Kubernetes restore job for MariaDB and MongoDB backups.
9. `scripts/system-users-job.yaml` - Kubernetes seed job for Matrix and userservice system users.
10. `backups/targeted_shazia_cleanup_20260313_171710.sql` - Targeted SQL data dump with sensitive user/session rows; treat as a security-sensitive artifact.

Then open the graph tour and follow the platform boundary, MariaDB schemas, userservice core, tenant isolation, backup/restore, and risk map.

## Local Initialization

A local developer can initialize MariaDB from schema exports or from backups.

Schema-only approach:

```bash
docker run --name oriso-mariadb -e MARIADB_ROOT_PASSWORD=root -p 3306:3306 -d mariadb:10.11
mysql -h 127.0.0.1 -P 3306 -u root -proot -e "CREATE DATABASE tenantservice; CREATE DATABASE userservice; CREATE DATABASE agencyservice; CREATE DATABASE consultingtypeservice; CREATE DATABASE uploadservice; CREATE DATABASE videoservice; CREATE DATABASE caritas;"
mysql -h 127.0.0.1 -P 3306 -u root -proot tenantservice < mariadb/tenantservice/schema.sql
mysql -h 127.0.0.1 -P 3306 -u root -proot userservice < mariadb/userservice/schema.sql
mysql -h 127.0.0.1 -P 3306 -u root -proot agencyservice < mariadb/agencyservice/schema.sql
mysql -h 127.0.0.1 -P 3306 -u root -proot consultingtypeservice < mariadb/consultingtypeservice/schema.sql
mysql -h 127.0.0.1 -P 3306 -u root -proot uploadservice < mariadb/uploadservice/schema.sql
mysql -h 127.0.0.1 -P 3306 -u root -proot videoservice < mariadb/videoservice/schema.sql
```

Backup approach:

1. Pick a timestamped directory under `backups/`.
2. Restore `mariadb-all-databases.sql.gz` into MariaDB.
3. Restore `mongodb-all-databases.archive.gz` into MongoDB.
4. Run `scripts/system-users-job.yaml` only if Matrix/system users are needed.

## Schema Change Workflow

1. Identify the owning service database.
2. Apply DDL manually to a test database.
3. Run the affected backend service tests and smoke tests.
4. Export the updated schema into `mariadb/<service>/schema.sql`.
5. Review primary keys, indexes, foreign keys, triggers, sequences, and sensitive data.
6. Update `.understand-anything/` docs if the architecture changes.

## Backend Developer Workflow

- Treat `tenant_id` as an application-enforced isolation boundary.
- Do not assume cross-service database foreign keys exist.
- Read the owning service schema before changing JPA entities or query code.
- For users/sessions, start in `mariadb/userservice/schema.sql` around `user`, `consultant`, and `session`.
- For tenant metadata, start in `mariadb/tenantservice/schema.sql` and then inspect `tenant_id` usage in other schemas.

## DevOps Workflow

- Use timestamped backups for restore points.
- Keep backup artifacts out of public repos if they include production-like data.
- Create phpMyAdmin secrets externally before applying `k8s/mariadb-client`.
- Rotate static passwords in `scripts/system-users-job.yaml` and move Matrix registration secret to a Secret.
- Confirm whether services use ClusterIP, service DNS, or localhost/hostNetwork before changing connection docs.

## Review Checklist

- Does this schema change belong to the correct service database?
- Does it need an index on `tenant_id`, `user_id`, `session_id`, `agency_id`, or time/status columns?
- Does it introduce a cross-service id without a service-level integrity check?
- Does it affect backup/restore or seed jobs?
- Does it add or expose sensitive data in SQL dumps?
- Does it require backend DTO/entity/query changes?
