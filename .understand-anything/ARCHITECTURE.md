# ORISO-Database Architecture

## Navigation

- [Responsibility](#responsibility)
- [Storage engines](#storage-engines)
- [MariaDB service schemas](#mariadb-service-schemas)
- [Core business entities](#core-business-entities)
- [Tenant and user relationships](#tenant-and-user-relationships)
- [Service ownership boundaries](#service-ownership-boundaries)
- [Migrations](#migrations)
- [Indexes and performance](#indexes-and-performance)
- [Backup and recovery](#backup-and-recovery)

## Responsibility

This repository is the operational schema and data-management source for ORISO. Backend services have `spring.liquibase.enabled=false`, so schema creation and schema changes are handled outside service startup.

## Storage Engines

- MariaDB: primary relational database for ORISO backend services.
- MongoDB: consulting type and application settings documents.
- PostgreSQL: Matrix Synapse-only persistence.
- Redis: sessions, cache entries, tokens, and temporary/rate-limit data.
- RabbitMQ: queues/exchanges for async messages, notifications, and background tasks.

## MariaDB Service Schemas

- `agencyservice`: `agency`, `agency_postcode_range`, `agency_topic`, `diocese`, plus Liquibase bookkeeping tables.
- `consultingtypeservice`: `topic`, `topic_group`, `topic_group_x_topic`, plus Liquibase bookkeeping tables.
- `tenantservice`: `tenant`, plus Liquibase bookkeeping tables.
- `userservice`: 26 tables covering users, consultants, sessions, chats, assignments, notifications, audits, mobile tokens, and Liquibase bookkeeping.
- `uploadservice`: `uploadbyuser`, plus Liquibase bookkeeping.
- `videoservice`: `videoroom`, plus Liquibase bookkeeping.
- `caritas`: exported schema currently has no tables.

## Core Business Entities

- Tenant: `tenantservice.tenant` stores tenant name, subdomain, license limits, theming, legal content, content activation dates, and settings JSON.
- Agency: `agencyservice.agency` stores agency master data and routes through `agency_postcode_range` and `agency_topic`.
- User: `userservice.user` stores asker/user profile, tenant id, username/email, Matrix/Rocket.Chat ids, and account metadata.
- Consultant: `userservice.consultant` stores consultant profile, tenant id, Matrix/Rocket.Chat ids, notification settings, status, and language data.
- Session: `userservice.session` links users and consultants and stores status, agency id, consulting type, topic, tenant id, and Matrix room id.
- Chat: `userservice.chat`, `user_chat`, `chat_agency`, and `group_chat_participant` store chat/group relationships.
- Notification/audit: `event_notification`, `draft_message`, `counselor_rename_audit_log`, `identity_tombstone`, and `inactive_account_notification_audit_log` store operational and lifecycle records.
- Media: `uploadservice.uploadbyuser` and `videoservice.videoroom` attach file/video metadata to users, sessions, or chat contexts.

## Tenant and User Relationships

Tenant isolation is based on convention and service logic:

1. `tenantservice.tenant` is the tenant registry.
2. `tenant_id` appears in `agencyservice.agency`, `agency_postcode_range`, `userservice.user`, `userservice.consultant`, `consultant_agency`, `session`, `draft_message`, `event_notification`, audit/tombstone tables, and `consultingtypeservice.topic`.
3. There are no cross-database foreign keys from these tables back to `tenantservice.tenant`.
4. Backend services must apply tenant filters and access checks consistently.

Important in-schema relationships:

- `userservice.session.user_id -> userservice.user.user_id`.
- `userservice.session.consultant_id -> userservice.consultant.consultant_id`.
- `userservice.session_data.session_id -> userservice.session.id`.
- `userservice.session_topic.session_id -> userservice.session.id`.
- `userservice.session_supervisor.session_id -> userservice.session.id`.
- `userservice.user_chat.user_id -> userservice.user.user_id` and `user_chat.chat_id -> chat.id`.
- `agencyservice.agency_postcode_range.agency_id -> agency.id`.
- `consultingtypeservice.topic_group_x_topic` links topic groups to topics with cascade delete/update.

## Service Ownership Boundaries

Each backend service owns its MariaDB schema. Cross-service ids are intentionally stored as raw ids instead of foreign keys when they cross database boundaries. This reduces coupling at the database layer but moves integrity enforcement into services and operational scripts.

## Migrations

The repository stores schema snapshots and historical `DATABASECHANGELOG` tables, but not the full ordered Liquibase migration source for each service. The documented process is manual: apply DB change, test services, export schema, review and commit.

## Indexes and Performance

The schema has useful indexes around primary keys, foreign key columns, mobile tokens, session user/consultant status, draft lookup, notifications, and audit logs. Gaps found in the export include unindexed tenant/id columns such as:

- `userservice.user.tenant_id`.
- `userservice.consultant.tenant_id`.
- `userservice.session.tenant_id`, `agency_id`, `main_topic_id`, and Matrix/Rocket.Chat room ids.
- `agencyservice.agency.tenant_id` and `agency_postcode_range.tenant_id`.
- `uploadservice.uploadbyuser.user_id` and `session_id`.
- `videoservice.videoroom.session_id` and group/chat id columns.

Before adding indexes, confirm actual production query patterns and cardinality.

## Backup and Recovery

Backups live under timestamped directories in `backups/`, with paired `mariadb-all-databases.sql.gz` and `mongodb-all-databases.archive.gz` files. `scripts/database-initialize.yaml` restores these archives after they are copied into the job pod. It reads `backupTimestamp` from `database-initialize-config`, waits for MariaDB and MongoDB pods, restores MariaDB through `mysql`, and restores MongoDB through `mongorestore`.
