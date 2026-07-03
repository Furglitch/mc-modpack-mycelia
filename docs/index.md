---
title: Minecraft Modpack Template
layout: default
nav_order: 1
has_children: true
---

# Minecraft Modpack Template

This repository serves as a repo template for developing Minecraft modpacks, utilizing packwiz for mod management and GitHub Actions for automation.

## Getting Started

To get started with your own Minecraft modpack using this template, please refer to the [Setting Up Your Repository](./template-setup/setup-repo) guide, and follow from there.

## Issue Templates
This template includes predefined issue templates to help you manage bug reports and feature requests effectively. When users open a new issue in your repository, they will be presented with options to choose the appropriate template.

These templates have placeholders in the title that are automatically filled in via [GitHub Actions workflows](https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/.github/workflows/issue-title.yml) when issues are created for mod updates or modloader updates. 

## GitHub Actions
This template includes predefined GitHub Actions workflows to help automate many common tasks. Details on each workflow are provided below.

For more details on how to set up these workflows, please refer to [**Enabling GitHub Actions**](./template-setup/setup-repo/#enabling-github-actions).

> ### modpack-build.yml
> This workflow automatically builds your modpack whenever changes are pushed to the branch. It also runs on pull requests targeting the branch. 
> 
> It generates three files, two client-side files (.zip for CurseForge and .mrpack for Modrinth) and one server-side .zip file. These files are stored as artifacts in the workflow run, which you can download and use to distribute your modpack.
>
> It's recommended to comment out (using `#`) any steps in this workflow that you do not need, such as the Modrinth build step if you only plan to publish to CurseForge, or the server build step if you do not need a server version of your modpack.

> ### modpack-update.yml
> This workflow checks for updates to the mods and other resources in your modpack every two days. If updates are found, it automatically creates a pull request with the updated files.
> 
> Using `packwiz pin <mod>` pins the mod to its current version. This prevents it from being updated by `packwiz update` and the GitHub Actions workflow.

> ### packwiz-refresh.yml
> This workflow runs `packwiz refresh` on the `/packwiz/` folder whenever a push is made to the branch. This ensures that the packwiz metadata is always up to date. This also runs on pull requests targeting the branch to ensure consistency before merging.

> ### packwiz-update-modloader.yml
> This workflow checks for updates to the modloader (NeoForge) every Monday. If an update is found, it automatically creates a pull request to update the modloader version in your modpack.

> ### Dependabot
> Not a workflow, but this template is set up to use [Dependabot](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file) to automatically check for updates to GitHub Actions workflows used in this repository. If an update is found, Dependabot will create a pull request to update the workflow version.

> ### issue-title.yml
> The issue templates in this repository have placeholders such as `{modpack_version}` and `{mod_name}`. This workflow will automatically replace these placeholders based on what the user has filled out in the form when they create a new issue.