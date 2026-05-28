# ORISO-Database Understand-Anything Notes

> Scope: generated from ORISO-Database only. Parent folders and sibling repositories were not analyzed.

## Navigation

- [Knowledge graph](knowledge-graph.json)
- [Database architecture](ARCHITECTURE.md)
- [Developer and DevOps onboarding](ONBOARDING.md)
- [ORISO ecosystem integration](ORISO-ECOSYSTEM.md)
- [Findings and risk register](FINDINGS.md)
- [Configuration and dependency audit](DEPENDENCY-AUDIT.md)
- Visuals: [ER relationships](visuals/er-relationships.mmd), [platform flow](visuals/platform-flow.mmd), [tenant user flow](visuals/tenant-user-flow.mmd), [backup recovery](visuals/backup-recovery-flow.mmd), [initialization flow](visuals/initialization-flow.mmd)

## Dashboard

Knowledge graph saved at: /Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Database/.understand-anything/knowledge-graph.json

Open the dashboard with:

```bash
cd /Users/nikunjchampakbhairohit/.understand-anything/repo/understand-anything-plugin/packages/dashboard && GRAPH_DIR="/Users/nikunjchampakbhairohit/Developer/freelance/Germany/Oriso-frank-client/ORISO/ORISO-Database" pnpm exec vite --host 127.0.0.1
```

Then open the local URL printed by Vite.

## Quick Map

ORISO-Database is the platform persistence repository. It stores service-owned MariaDB schema exports, MongoDB collection dumps/docs, Matrix PostgreSQL docs, Redis/RabbitMQ operational docs, timestamped backups, and Kubernetes jobs for restore and system-user seeding.

- MariaDB has service-owned schemas for `agencyservice`, `consultingtypeservice`, `tenantservice`, `userservice`, `videoservice`, `uploadservice`, and `caritas`.
- `userservice` is the relational core with users, consultants, sessions, chats, notifications, assignments, and audit records.
- `tenantservice.tenant` is the tenant registry; `tenant_id` is repeated across service schemas as an application-enforced isolation boundary.
- MongoDB stores consulting type/application settings documents.
- PostgreSQL is Matrix Synapse-only and should not be manually changed by ORISO services.
- Redis and RabbitMQ are schema-less runtime stores documented operationally.

## Graph Stats

- Files scanned: 36
- Graph nodes: 192
- Graph edges: 312
- MariaDB databases: 7
- MariaDB tables: 46
- userservice tables: 26
- Sequences: 21
- Triggers: 13
- Timestamped backup directories: 7

## Important Schemas and Jobs

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
