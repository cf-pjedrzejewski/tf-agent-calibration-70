---
name: terraform-test
description: Write and verify mocked Terraform tests for changed modules.
---

# Terraform Test Skill

Use this skill when a changed module needs a new or updated test.

1. Read the module's variables, resources, outputs and existing tests.
2. Add a test under `modules/<name>/tests/` using a mocked provider.
3. Assert observable resource settings or outputs that matter to callers.
4. Run `terraform init -backend=false` and `terraform test` in the module.
5. If a test fails, read the diagnostics, repair only the test and rerun it.
	Stop after three attempts per module and report unresolved failures.
6. A module passes only if terraform test exits zero and at least one run
	passes. Report modules with no executable runs as not tested.
7. Summarize each add, update or skip decision and the test command result in
	report.md. Include proposed test contents for the original PR comment.

Override external data sources so plan-time scripts are not executed in tests.
Never change module code to make a test pass. If the module looks risky,
record the location, impact and a recommended change for a human in report.md.