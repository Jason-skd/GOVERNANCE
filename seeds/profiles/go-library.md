# Go Library Profile

- Public packages and compatibility boundary: `{{PUBLIC_PACKAGES}}`
- Supported Go version and module policy: `{{GO_VERSION_AND_MODULE_POLICY}}`
- Consumer-owned construction and lifecycle boundary: `{{CONSUMER_BOUNDARY}}`
- Focused and complete verification, including race detection when applicable:
  `{{GO_LIBRARY_CHECKS}}`
- Tagging, module publication, and release owner: `{{GO_LIBRARY_RELEASE}}`

Do not add service deployment stages to a library unless the repository
actually owns a deployed process.
