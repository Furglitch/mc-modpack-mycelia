---
title: Importing a Modpack
layout: default
parent: Setting up your Repository
nav_order: 1
---

# Importing an Existing Modpack

If you have an existing modpack that you'd like to use with this template, it's easy to import it into your project!

To start, you will need to download the modpack files from your chosen distribution platform (e.g., CurseForge, Modrinth). This should be a .zip file for CurseForge modpacks or a .mrpack file for Modrinth modpacks.<br>
You can also export modpacks from various launchers, like the CurseForge/Modrinth launchers or Prism Launcher. This is useful for pack developers with existing projects.<br>
<sub>Unfortunately, packwiz does not currently support URL imports as of this writing (February 2026).</sub>

Once you have the modpack file, run the following command in your terminal, replacing `<platform` with the source platform of the modpack, and `<path-to-modpack-file>` with the actual path to your downloaded modpack file:

```bash
packwiz <platform> import '<path-to-modpack-file>'
```

For example, if you downloaded the [FastNeo](https://www.curseforge.com/minecraft/modpacks/fastneo-fps-modpack-for-neo-forge) modpack from CurseForge and saved it to your Downloads folder, you would run:

```bash
packwiz curseforge import '~/Downloads/FastNeo 1.21.1 (FPS).zip'
```

This will extract the modpack contents and generate the necessary packwiz files in your project!

Of course, make sure to review the pack's license, and look over the imported mods and configurations to ensure everything is set up according to your preferences.