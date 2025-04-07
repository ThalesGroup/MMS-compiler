The following security policies are applicable to the **MMS Compiler** source code, documentation and releases. Please, follow these rules if you wish to report a vulnerability, request an enhancement or otherwise contribute to the project.

## Good practices to follow

:warning:**Never store credentials information into source code or config file in a GitHub repository**
- Block sensitive data being pushed to GitHub by git-secrets or its likes as a git pre-commit hook
- Audit for slipped secrets with dedicated tools
- Use environment variables for secrets in CI/CD (e.g. GitHub Secrets) and secret managers in production
- Don't include links to external websites or files

# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0     | :white_check_mark: |

## Reporting a Vulnerability

Please, use the [Security Discussions](https://github.com/ThalesGroup/MMS-compiler/discussions/categories/security) section to report vulnerabilities or any other security concerns.

## Security Update policy

Vulnerabilities will be communicated via GitHub Advisories and a description of the issue will be included in the release notes.
