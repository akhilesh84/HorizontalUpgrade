#!/bin/bash

# Default configuration mode to Debug if not provided
CONFIGURATION=${1:-Debug}

mkdir -p ImplAsm
mkdir -p RefAsm

# Build MyLib first
dotnet build MyLib/MyLib.csproj -c $CONFIGURATION
if [ $? -ne 0 ]; then
    echo "Failed to build MyLib"
    exit 1
fi

# Copy the assembly output of MyLib to ImplAsm
cp MyLib/bin/$CONFIGURATION/net8.0/MyLib.dll ImplAsm/

# Build ApplicationBoot first
dotnet build ApplicationBoot/ApplicationBoot.csproj -c $CONFIGURATION
if [ $? -ne 0 ]; then
    echo "Failed to build MyLib"
    exit 1
fi

# Copy the assembly output of MyLib to ImplAsm
cp ApplicationBoot/bin/$CONFIGURATION/net8.0/ApplicationBoot.dll ImplAsm/

# Build MyLib.Reference next
dotnet build MyLib.Reference/MyLib.Reference.csproj -c $CONFIGURATION
if [ $? -ne 0 ]; then
    echo "Failed to build MyLib.Reference"
    exit 1
fi

# Copy the assembly output of MyLib.Reference to RefAsm
cp MyLib.Reference/obj/$CONFIGURATION/net8.0/ref/MyLib.dll RefAsm/

# Build MyApp last
dotnet build MyApp/MyApp.csproj -c $CONFIGURATION
if [ $? -ne 0 ]; then
    echo "Failed to build MyApp"
    exit 1
fi

echo "All projects built successfully in $CONFIGURATION mode"