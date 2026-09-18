# Governance Seeds

Seeds are optional starting material for an explicitly authorized target
repository. They are not dynamically inherited governance and are not managed
baseline files.

- `repository/` identifies the local facts every repository supplement should
  resolve.
- `profiles/` adds questions and constraints for a real technical shape.
- `github/` provides work-management labels, forms, templates, and a
  non-blocking audit workflow.
- `delivery/` provides a responsibility matrix and immutable-promotion model.

Placeholders use `{{UPPER_SNAKE_CASE}}`. Resolve or remove every applicable
placeholder during initialization. Seed text intentionally has no formal
`R-A` or `R-G` identities; assign those only to normative rules adopted by the
target repository.
