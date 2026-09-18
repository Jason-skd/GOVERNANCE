# Delivery Pipeline Seed

Resolve the placeholders against the repository's real delivery shape. Remove
stages the repository does not own.

| Stage | Trigger | Responsibility | Output identity |
| --- | --- | --- | --- |
| PR gate | Pull request revision | `{{PR_REQUIRED_CHECKS}}` | Commit SHA and check results |
| Main gate | Every push or merge to `main` | `{{MAIN_BUILD_AND_CHECKS}}` | Commit SHA plus artifact digest |
| Production | Explicit release input | `{{DEPLOY_AND_RELEASE_CHECKS}}` | Certified input digest plus release record |

The main gate creates or certifies the deployable candidate once. Production
consumes that immutable candidate by revision and digest; it does not rebuild
source. A rebuild has a different digest and is a new candidate.

## External Deployment Prerequisites

- Environment and owner: `{{DEPLOYMENT_ENVIRONMENT_AND_OWNER}}`
- Credentials or identity provider: `{{DEPLOYMENT_IDENTITY}}`
- Protected environment or approval rule: `{{DEPLOYMENT_APPROVAL}}`
- Artifact registry and retention: `{{ARTIFACT_REGISTRY}}`
- Rollback identity and procedure: `{{ROLLBACK_PROCEDURE}}`
- Release evidence and observability: `{{RELEASE_EVIDENCE}}`

Do not add a production workflow until these prerequisites and an actual
deployment target exist.
