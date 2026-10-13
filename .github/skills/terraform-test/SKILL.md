# Terraform Test Skill

Use this skill when a changed module needs a new or updated test.

1. Read the module's variables, resources, outputs and existing tests.
2. Add a test under `modules/<name>/tests/` using a mocked provider.
3. Assert observable resource settings or outputs that matter to callers.
4. Run `terraform init -backend=false` and `terraform test` in the module.
5. Summarize the modules changed and the test command result.