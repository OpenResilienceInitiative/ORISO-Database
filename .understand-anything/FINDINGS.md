# Findings and Risk Register

## Navigation

- [High impact](#high-impact)
- [Missing indexes](#missing-indexes)
- [Schema and migration risks](#schema-and-migration-risks)
- [Security concerns](#security-concerns)
- [Scaling bottlenecks](#scaling-bottlenecks)
- [Data consistency concerns](#data-consistency-concerns)

## High Impact

1. `backups/targeted_shazia_cleanup_20260313_171710.sql` contains real-looking user, consultant, session, email, Matrix id, and password-like values. Treat it as sensitive data.
2. `scripts/system-users-job.yaml` embeds system user password material and a Matrix registration secret in YAML. Move these to externally managed Secrets and rotate existing values.
3. Services have Liquibase disabled, but this repo stores schema snapshots rather than executable ordered migrations. This makes environment drift and partial manual changes more likely.
4. Tenant isolation is mostly application-enforced through `tenant_id`; there are no cross-database foreign keys to `tenantservice.tenant`.
5. Several tenant/id columns that are likely filter/join columns are not indexed in the schema exports.

## Missing Indexes

Review actual query plans before adding indexes, but the exported schemas show likely gaps:

- `agencyservice.agency.tenant_id` and `agency_postcode_range.tenant_id`.
- `userservice.user.tenant_id`.
- `userservice.consultant.tenant_id`.
- `userservice.consultant_agency.tenant_id` and `agency_id`.
- `userservice.session.tenant_id`, `agency_id`, `main_topic_id`, `matrix_room_id`, and `rc_group_id`.
- `userservice.session_topic.topic_id`.
- `userservice.user_agency.agency_id` and `admin_agency.agency_id`.
- `uploadservice.uploadbyuser.user_id` and `session_id`.
- `videoservice.videoroom.session_id`, `group_chat_id`, and `rocketchat_room_id`.

## Schema and Migration Risks

- `DATABASECHANGELOG` tables exist, but Liquibase source changesets are not present for these service schemas.
- `caritas/schema.sql` contains no tables despite being listed as a shared/general database.
- Cross-service ids are stored without database-enforced referential integrity.
- Sequence start values are embedded in schema exports; restoring into non-empty databases can collide if reset incorrectly.
- Restore jobs assume backup files are manually copied into the job pod, which is easy to miss in automated setup.

## Security Concerns

- MariaDB docs and scripts use root/default password examples.
- MongoDB docs state no authentication is required.
- RabbitMQ docs show default user/password examples.
- SQL dumps contain sensitive user/session data and should not be committed if they are production-derived.
- phpMyAdmin is exposed by ingress; the design uses basic auth and a view-only DB user, which is good, but secrets must be created outside git.

## Scaling Bottlenecks

- `userservice.session` is a central high-growth table. Tenant, agency, topic, Matrix room, and status/time filters need query-plan review.
- Matrix PostgreSQL can grow quickly with message history; it is outside this repo's schema management but needs backup/vacuum/reindex operations.
- Redis stores sessions; clearing it logs users out.
- RabbitMQ queues are auto-created by services, so queue topology is not version-controlled here.

## Data Consistency Concerns

- `tenant_id` consistency depends on application code and operational data repair.
- Matrix ids and Rocket.Chat ids are duplicated in MariaDB and external communication systems.
- System user seed job updates MariaDB user rows and Matrix users; partial failure can leave the two systems out of sync.
- MongoDB schema validation is documented as disabled, so invalid consulting type documents can fail later at runtime.
