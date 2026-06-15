# Secret Management

Production secrets must not be committed to this repository as plaintext YAML,
SQL dumps, or shell scripts.

The `create-system-users` job expects this Kubernetes Secret to exist in the
same namespace before the job runs:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: system-users-credentials
type: Opaque
stringData:
  matrixRegistrationSecret: "<rotated-matrix-registration-secret>"
  caritasAdminPassword: "<rotated-caritas-admin-password>"
  orisoCallAdminPassword: "<rotated-oriso-call-admin-password>"
  groupChatSystemPassword: "<rotated-group-chat-system-password>"
```

Store the real manifest as a SealedSecret, SOPS-encrypted file, or External
Secrets Operator entry. Do not commit the unencrypted Secret.

After rotation, verify that the previous Matrix registration secret no longer
works and record the result in the incident evidence.
