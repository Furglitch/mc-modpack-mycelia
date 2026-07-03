---
title: Setting up your Repository
layout: default
parent: Minecraft Modpack Template
has_children: true
nav_order: 1
---

# Setting up your Repository

## Using the Template
To create a new modpack project using this template, click the "Use This Template" button at the top-right corner of the template's GitHub page.<br>
<center><img src="https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/docs/assets/template-setup/repo_use-this-template_button.png" alt="Use This Template Button" height=150px></center><br>
<i>Make sure to use this button, and not the "Fork" button.</i>

This will prompt you to create a new repository in your GitHub account with the same directory structure and files as this template. From there, you can adjust the repository name and description as needed.

<b>Note:</b> This repository splits into multiple branches for different Minecraft versions and modloaders. Make sure to enable 'Include all branches' when creating the repository so that you can select the correct branch for your modpack.

After creating your repository, you can change the default branch in `Settings`, or delete the other branches that you won't be using to avoid confusion and excess Actions runs.
<center><img src="https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/docs/assets/template-setup/settings_default-branch.png" alt="Branch Selection" height=300px></center><br>

## Enabling GitHub Actions
To use the predefined GitHub Actions workflows included in this template, you'll need to enable GitHub Actions in your repository settings.

Once you've created your repository from the template, navigate to the `Settings` tab, then go to `Actions` > `General`.<br>
Enable the following settings:
- Under `Actions permissions`, choose `Allow all actions and reusable workflows`.
  <center><img src="https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/docs/assets/template-setup/settings_actions-permissions.png" alt="Actions Permissions" height=300px></center><br>
- Under `Workflow permissions`, select `Read and write permissions`.
- Under `Workflow permissions`, enable `Allow GitHub Actions to create and approve pull requests` if you want to use the automatic mod/-loader update feature.
  <center><img src="https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/docs/assets/template-setup/settings_workflow-permissions.png" alt="Workflow Permissions" height=300px></center><br>

## 'Initializing' your Modpack
After enabling GitHub Actions, navigate to the `Actions` tab in your repository. You should see a workflow named `Create New Modpack`.

This workflow will prompt you to provide your modpack's name, version, and author (you!). This information will be used to update `pack.toml`. Additionally, the workflow will remove any unnecessary files for you (like this documentation or Furglitch's Sponsor information).

Run the `Create New Modpack` workflow and provide the requested information when prompted.<br>
<center><img src="https://raw.githubusercontent.com/Furglitch/mc-modpack-template/refs/heads/1.21.1-NeoForge/docs/assets/template-setup/actions_create-pack_prompt.png" alt="Create New Modpack workflow prompt" height=300px></center><br>

## Cloning your Repository
Once you've set up your repository:

1. Clone it to your local machine using Git.
  ```bash
  git clone <your-repo-url> -b <branch> '<desired-folder>'
  ```

2. Navigate to the project directory.
  ```bash
  cd '<desired-folder>'
  ```

3. Open the project in your preferred code editor (e.g., VSCode).

## Choosing Modpack Distribution Platforms
This template supports building modpacks for multiple distribution platforms, including CurseForge and Modrinth.

By default, both CurseForge and Modrinth builds are enabled in the GitHub Actions workflows.
If you only want to distribute your modpack on one platform, you can disable the other platform's workflow jobs by adjusting the `env` variables in the [workflow file](https://github.com/Furglitch/mc-modpack-template/blob/1.21.1-NeoForge/.github/workflows/modpack-build.yml).

## Setting up Packwiz
This template is set up to use [packwiz](https://packwiz.infra.link/) for managing mods and other resources.<br>
To get started with packwiz:
1. Install packwiz on your machine by following the instructions [here](https://packwiz.infra.link/installation/).
2. Open a terminal in your project directory and navigate to the `/packwiz/` folder.</br>
   ```bash 
   cd packwiz
   ```
3. Use packwiz commands to add, remove, and manage mods for your modpack, as described in the [packwiz documentation](https://packwiz.infra.link/tutorials/creating/adding-mods).
   ```bash
   packwiz curseforge add <mod-id>
   ```
4. Whenever you make a change inside the `/packwiz/` folder without the `packwiz` command, make sure to run:
   ```bash
   packwiz refresh
   ```
   This ensured the `pack.toml` and `index.json` files are updated with the correct hashes and metadata.
   This is also handled automatically by the `packwiz-refresh.yml` GitHub Actions workflow on every push to the repository when you make changes to the `/packwiz/` folder.

### Packwiz GUI
If you prefer a graphical interface for managing packwiz, you can use [AmberIsFrozen/PW-GUI](https://github.com/AmberIsFrozen/PW-GUI), a community-developed GUI wrapper for packwiz.
That being said, this documentation will focus on using the command-line interface (CLI) for packwiz.
PW-GUI is not created, maintained, or supported by the packwiz developers, nor will it be officially supported by this template. It's just an option.