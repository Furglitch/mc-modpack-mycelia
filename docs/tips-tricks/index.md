---
title: Tips and Tricks
layout: default
parent: Minecraft Modpack Template
nav_order: 9
---

# Tips and Tricks

## Multi-Platform Mods
For mods that are available on both CurseForge and Modrinth, you should use the source where you plan to distribute your modpack.

If you plan to distribute your modpack on Modrinth, they only allow mods from their own platform.

CurseForge, on the other hand, has [a list](https://docs.google.com/spreadsheets/d/176Wv-PZUo9hFxy6oC6N8tWdquBLPRtSuLbNK-r0_byM) of allowed mods from third-party sources. If the mod you want to use is on that list, you can add it to your modpack from the listed source.

## Packwiz Tips
- Use `packwiz pin <mod>` to prevent a mod from being updated by `packwiz update` and the GitHub Actions workflow.
- `packwiz completion <shell>` can be used to create a shell autocompletion script for packwiz commands. This allows for easier use of packwiz in the terminal.
- When adding mods, you can use `packwiz <source> <mod-identifier> --file-id <file-id>` to add a specific version of a mod directly, rather than the latest version.
  - For example, to add Aether v1.5.5 (for NeoForge 1.21.1) from CurseForge, you can use:
    ```bash
    packwiz curseforge add aether --file-id 6211116
    ```
  - Alternatively, you can use the full URL of the file (not direct):
    ```bash
    packwiz curseforge add https://www.curseforge.com/minecraft/mc-mods/aether/files/6211116
    ```

## Recommended Mods
Here are some recommended mods that may help you in creating your modpack:<br>

### **Modpack Update Checker**
Notifies players of modpack updates in-game. Just update a file in the root of the git repo!<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/modpack-update-checker) and [*Modrinth*](https://modrinth.com/mod/modpack-update-checker).

### **Paxi**
Hard-loads resource packs and data packs to ensure they are always applied.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/paxi-neoforge) and [*Modrinth*](https://modrinth.com/mod/paxi).

### **Packed Packs**
An alternative (or complement) to *Paxi*. Allows you to create 'profiles' of predetermined, sorted pack lists for players to choose from.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/packed-packs) and [*Modrinth*](https://modrinth.com/mod/packed-packs).

### **Configured Defaults**
Allows you to set config defaults that won't be overridden by pack updates, for things such as keybinds and resource pack selections (options.txt).<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/configured-defaults) and [*Modrinth*](https://modrinth.com/mod/configured-defaults).

### **KubeJS**
Allows for custom scripts to add custom content and tweak existing content, without needing to create a full mod.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/kubejs) and [*Modrinth*](https://modrinth.com/mod/kubejs).

### **Memory Settings**
Lets you set a recommended RAM range. If the player is outside of that range, it will warn them.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/memory-settings).

### **Crash Assistant**
Shows a GUI after a crash, allowing players to easily gather logs for issue reports.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/crash-assistant) and [*Modrinth*](https://modrinth.com/mod/crash-assistant).

### **Startup Time**
Measures and displays the time taken for the modpack to start up, from launch to reaching the main menu. Useful for optimizing load times.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/startup-time) and [*Modrinth*](https://modrinth.com/mod/startup-time).

### **Loading Profiler**
This mod provides a detailed breakdown of the startup process helping you identify bottlenecks and optimize performance. Recommended for use alongside *Startup Time*.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/loading-profiler-forge-neoforge) and [*Modrinth*](https://modrinth.com/mod/loading-profiler).

### **Spark**
Similarly to *Loading Profiler*, spark provides in-depth performance profiling, but with a focus on in-world performance rather than startup. It can help identify lag sources and optimize gameplay performance.<br>
Get it on [*CurseForge*](https://www.curseforge.com/minecraft/mc-mods/spark) and [*Modrinth*](https://modrinth.com/mod/spark).

<sub>These mods are not sponsored or affiliated with this template in any way; they are simply suggestions based on how useful I've personally found them to be. They are not included in the modpack by default.</sub>