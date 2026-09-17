# Repository Governance Supplement

Use this file for rules that are specific to this repository. Remove this
guidance as real supplements are added; do not create rules merely to fill the
sections.

Repository rules may define:

- product, package, directory, and contract ownership;
- local architecture and dependency direction;
- protocol, schema, code-generation, database, and framework constraints;
- exact validation entry points and permitted test substitutes;
- issue taxonomy, release workflow, and explicit main-branch exceptions;
- cross-repository dependency ownership and handoff topology.

Action supplements use the `R-A` prefix and begin at number 001. Acceptance
supplements use the `R-G` prefix and begin at number 001. In each family, add
new rules at the next unused maximum, preserve IDs when rules move, and never
reuse deleted IDs. Do not continue the common `A` or `G` sequences here.

Keep action supplements for repository-specific workflows, tools, or owner
operations. Keep acceptance supplements for repository-specific facts that a
reviewer can verify afterward from the complete pull-request diff, commits,
tests, and recorded validation. The `pr-self-review` checklist includes every
acceptance supplement but does not create checklist rows for action
supplements.

Project exceptions belong here before they are considered for the common
baseline. Promote a rule to common governance only when it has demonstrated
cross-repository value, not in response to one isolated incident.
