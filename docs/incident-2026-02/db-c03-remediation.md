# DB-C03 Remediation Notes

## Code Changes

- Removed plaintext system-user passwords from `scripts/system-users-job.yaml`.
- Moved `matrixRegistrationSecret` out of the ConfigMap and into the
  `system-users-credentials` Secret contract.
- Added SQL single-quote escaping before interpolating values into the MariaDB
  heredoc.

## Operational Follow-Up

- Rotate `matrixRegistrationSecret`.
- Rotate the Caritas admin, ORISO Call admin, and group-chat-system passwords.
- Create `system-users-credentials` from an encrypted secret source.
- Confirm the previous Matrix registration secret returns an auth failure.
