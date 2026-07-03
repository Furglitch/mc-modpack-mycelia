#!/bin/sh
set -eu

INSTALLER="neoforge-$NEOFORGE_VERSION-installer.jar"

pause() {
    printf "%s\n" "Press enter to continue..."
    read ans
}

# JAVA
if ! command -v "${CUSTOM_JAVA:-java}" >/dev/null 2>&1; then
    echo "Minecraft 1.21 requires Java 21 - Java not found"
    pause
    exit 1
fi

# NEOFORGE
cd "$(dirname "$0")"
if [ ! -d libraries ]; then
    echo "Running Neoforge installer."
    "${CUSTOM_JAVA:-java}" -jar "$INSTALLER" -installServer
fi

if [ "${INSTALL_ONLY:-false}" = "true" ]; then
    echo "INSTALL_ONLY: complete"
    exit 0
fi

JAVA_VERSION=$("${CUSTOM_JAVA:-java}" -fullversion 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)
if [ ! "$JAVA_VERSION" -ge 21 ]; then
    echo "Minecraft 1.21 requires Java 21 - found Java $JAVA_VERSION"
    pause
    exit 1
fi

# START
while true
do
    "${CUSTOM_JAVA:-java}" @user_jvm_args.txt @libraries/net/neoforged/neoforge/$NEOFORGE_VERSION/unix_args.txt nogui

    if [ "${AUTO_RESTART:-true}" = "false" ]; then
        exit 0
    fi

    echo "Restarting automatically in 10 seconds (press Ctrl + C to cancel)"
    sleep 10
done
