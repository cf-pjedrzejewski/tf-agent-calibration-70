# Calibration Solution

The pull request workflow uses Claude Code to inspect Terraform changes and
write module tests. The agent instructions and one reusable skill are under
`.github/`. The workflow runs Terraform tests without Azure credentials.

The workflow needs an `ANTHROPIC_API_KEY` secret. Terraform defaults to 1.9.8;
repositories can set `TERRAFORM_VERSION` to override it.

The function-app test mocks Azure and overrides the external build-info data
source. It checks HTTPS, but this mock does not include a recorded workflow run
or a pull-request report. Mocked provider tests do not prove that Azure accepts
the configuration. The workflow and test setup need more work before production
use, especially around publishing results and handling failures.