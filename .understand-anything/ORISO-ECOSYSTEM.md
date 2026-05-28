# ORISO Ecosystem Database Integration

## Navigation

- [Platform role](#platform-role)
- [Backend service ownership](#backend-service-ownership)
- [Tenant and identity flow](#tenant-and-identity-flow)
- [Communication stores](#communication-stores)
- [Operations boundary](#operations-boundary)

## Platform Role

ORISO-Database sits below the backend services as the schema and operational data source. It does not run services; it documents and stores the database structures that services expect.

## Backend Service Ownership

- TenantService owns `tenantservice.tenant`.
- UserService owns `userservice` tables for users, consultants, sessions, notifications, and chat/user mappings.
- AgencyService owns `agencyservice` tables for agency and routing metadata.
- ConsultingTypeService uses MariaDB topic tables and MongoDB document collections for consulting type settings.
- UploadService owns `uploadservice.uploadbyuser`.
- VideoService owns `videoservice.videoroom`.

## Tenant and Identity Flow

Keycloak provides identity and tenant claims to services, but persistence stores tenant/user relationships in MariaDB. `tenantservice.tenant` defines tenants, while `tenant_id` columns in user, consultant, session, agency, topic, notification, and audit tables carry tenant context.

## Communication Stores

Matrix Synapse owns its PostgreSQL database for rooms, messages, devices, and Matrix users. UserService stores Matrix ids in MariaDB to connect ORISO users/consultants/sessions to Matrix rooms/users. Redis stores runtime sessions/caches. RabbitMQ stores async messages and queues created by services.

## Operations Boundary

This repo contains restore and seed jobs that modify live data. Treat `scripts/database-initialize.yaml`, `scripts/system-users-job.yaml`, and SQL dumps as operational tools, not only documentation.
