<!-- markdownlint-disable MD041 -->
## Contributing

- [Contributing](#contributing)
- [Recommended Learning](#recommended-learning)
  - [Git](#git)
- [Tooling](#tooling)
  - [Required Tooling](#required-tooling)
  - [Recommended Tooling](#recommended-tooling)
- [Formatting Guidelines](#formatting-guidelines)
  - [Code Styling](#code-styling)
  - [Resource API Versions](#resource-api-versions)
- [Git Information on Contributing](#git-information-on-contributing)

---

Looking to contribute to this project, whether that be code, examples, documentation or GitHub automation, you are in the right place. Please review the rest of this wiki page for important information to help you to start contributing to the project effectively. 

## Recommended Learning

Before you start contributing to the repo, it is **highly recommended** that you complete the following Microsoft Learn paths, modules & courses:

### Git

- [Introduction to version control with Git](https://docs.microsoft.com/learn/paths/intro-to-vc-git/)

## Tooling

### Required Tooling

To contribute to this project the following tooling is required:

- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/download)

### Recommended Tooling

The following tooling/extensions are recommended to assist you developing for the project:

- [ARM Tools extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)
- [ARM Template Viewer extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=bencoleman.armview)
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- For visibility of Bracket Pairs:
  - Inside Visual Studio Code, add `"editor.bracketPairColorization.enabled": true` to your `settings.json`, to enable bracket pair colorization.

## Formatting Guidelines

The below guidelines should be adhered to whilst contributing to this projects code.

## Code Styling

- Strict `camelCasing` must be used for all elements:
  - Symbolic names for:
    - Parameters
    - Variables
    - Resource
    - Modules
    - Outputs
- All parameters should have a **useful** description
- If relevant parameters should have a default value set.

### Resource API Versions

Each resource must use the latest available, working, API version. If the latest API version cannot be used for any reason, a comment must be placed above the resource in the module file stating why and also called out as part of the PR.

## Git Information on Contributing

To make contributions to this repo you must fork and clone the repo. You can follow the guidance here on how to do this [Fork a repo](https://docs.github.com/get-started/quickstart/fork-a-repo)

You **will not** be able to create a branch or push directly to this repo. All changes into this repo **must** be made via a Pull Request. This process is documented here: [Contributing to projects](https://docs.github.com/get-started/quickstart/contributing-to-projects)