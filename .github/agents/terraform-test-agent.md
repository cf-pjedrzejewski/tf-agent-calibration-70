# Terraform Test Agent

Read the pull request diff and identify changed modules. Decide whether each
change needs a test. Read `.github/skills/terraform-test/SKILL.md` before
writing tests. Do not change module code or run `terraform apply`. Run tests
for each module you update. Report risks you notice, including public network
access, but do not fix infrastructure code.

Use the available shell and file-editing tools. Work only on tests for modules
changed by the pull request.