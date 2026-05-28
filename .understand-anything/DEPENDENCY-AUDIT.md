# Configuration and Dependency Audit

## Navigation

- [Database engines](#database-engines)
- [Kubernetes dependencies](#kubernetes-dependencies)
- [Backup dependencies](#backup-dependencies)
- [Access tools](#access-tools)
- [Operational cautions](#operational-cautions)

## Database Engines

- MariaDB 10.11 exports are present for seven service databases.
- MongoDB dumps/docs are present for consulting type/application settings collections.
- PostgreSQL is documented only for Matrix Synapse and is managed by Synapse.
- Redis and RabbitMQ are documented as schema-less runtime stores.

## Kubernetes Dependencies

- Namespace assumptions: `caritas` throughout docs and jobs.
- Restore jobs require `kubectl`, pod labels `app=mariadb` and `app=mongodb`, and RBAC for pod exec/copy interactions.
- `system-users-job.yaml` requires Matrix pod label `app=matrix-synapse`, MariaDB pod label `app=mariadb`, Secrets, ConfigMaps, and RBAC.
- `k8s/mariadb-client` requires phpMyAdmin image, ingress, cert-manager/nginx annotations, and externally created Secrets.

## Backup Dependencies

Backups are stored as compressed archives in timestamped directories. The restore job expects files at `/tmp/mariadb-backup.sql.gz` and `/tmp/mongodb-backup.archive.gz` inside the job pod, so an external copy step is still required.

## Access Tools

- MariaDB CLI for schema import/export.
- mongodump/mongorestore for MongoDB.
- pg_dump/psql for Matrix PostgreSQL when available.
- redis-cli for Redis operations.
- rabbitmqctl and RabbitMQ management UI for messaging operations.
- phpMyAdmin for read-only MariaDB web inspection.

## Operational Cautions

- Do not use Matrix PostgreSQL for ORISO service tables.
- Do not manually mutate Matrix PostgreSQL schema.
- Do not run Redis `FLUSHALL` in a live environment unless logging out all users is acceptable.
- Do not purge RabbitMQ queues without confirming consumer state and message criticality.
- Do not apply schema exports over live databases without a backup and migration plan.
