---
title: Testing the Modpack
layout: default
parent: Minecraft Modpack Template
nav_order: 2
---

# Testing the Modpack

After setting up your modpack using this template and starting to develop it, it's important to test it thoroughly to ensure everything works as expected.

It's recommended to do local testing of both the client and server versions of your modpack before publishing it to any platform, to ensure a smooth experience for your users.

The <a href="../tips-and-tricks/">'Tips and Tricks' page</a> contains some recommended mods and tools that can help with testing and debugging your modpack.

## Client-side Testing
You can manually build the modpack by running the command `packwiz <platform> build` in your terminal, replacing `<platform>` with the desired platform (`CurseForge` or `Modrinth`). This will generate the modpack files in the `packwiz/` folder.<br>
Alternatively, you can use generated CLIENT artifact from the GitHub Actions workflow named `Build Modpack`.

After building, you can load the pack in your preferred launcher (e.g., Prism Launcher, MultiMC, CurseForge Launcher, Modrinth Launcher) by pointing it to the generated modpack folder.

## Server-side Testing
To build the server version of your modpack, you can use the generated SERVER artifact from the GitHub Actions workflow named `Build Modpack`. This artifact contains the necessary files to run a dedicated server for your modpack.

It's recommended to run the server on a separate, local machine in order to simulate a real multiplayer environment. 

Use the provided `startserver.sh` (Linux/Mac) or `startserver.bat` (Windows) scripts in the file to start the server. Make sure to review and adjust the `java-args.txt` file to find your modpack's requirements.

**Note:** The server pack includes the fully downloaded mods, so the file size may be significantly larger than the client pack.

## A note on Action artifacts
Due to the way GitHub Actions handles artifact creation, the generated artifacts for client files are .zip archives that CONTAIN the modpack archive inside of them (`.zip` for CurseForge and `.mrpack` for Modrinth). You will need to extract the modpack archive from the artifact .zip file before loading it into your launcher. This does not apply to the server artifact, which is ready to use as-is.

i.e. For a modpack named "My Modpack", version "1.0.0", the Modrinth client-side artifact will be named `My Modpack 1.0.0 - Modrinth Client.zip`. Inside this .zip file, you will find the actual modpack file, named `My Modpack-1.0.0-CLIENT-MODRINTH.mrpack`. That is the file you will need to load into your launcher.