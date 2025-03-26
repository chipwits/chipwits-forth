# Building ChipWits 1.2 for the Macintosh 128k

After a lot of reading and experimenting, I have now found a very easy way to build the Macintosh 128 version of ChipWits 1.2. This is the same version that runs in the emulator on the ChipWits website.

This guide provides step-by-step instructions for building the original ChipWits 1.2 for Macintosh 128k using MacForth. The process involves downloading a disk image with the source code, running it in a Macintosh emulator, and compiling the application. No additional build tools are required as the entire build process happens within the emulated environment.

## Table of Contents

1. [Preparation](#preparation)
2. [Setting Up the Emulator](#setting-up-the-emulator)
3. [Loading the Source Code](#loading-the-source-code)
4. [Building and Running ChipWits](#building-and-running-chipwits)

## Preparation

1. Download the virtual disk containing the source code for the Macintosh 128 ChipWits version 1.2:
   [GitHub Link](https://github.com/chipwits/chipwits-forth/blob/main/mac/disks/CW%2B%20Work%20Final%20Src/CW%2B%20Work%20Final%20Src.dc42)

2. Rename this disk image to, for example, **"CW+ Work Final Src.image"**.

## Setting Up the Emulator

1. Start the Macintosh emulator in the browser. You can find this emulator at:  
   [Infinite Mac Emulator (System 2.1, 1985)](https://infinitemac.org/1985/System%202.1)

2. Wait until the emulator has fully started. The screen should look like the image below.

   ![fully started emulator](docs/startup.png)

## Loading the Source Code

1. Drag and drop the virtual disk image (the one now named with the **.image** extension) onto the emulator.  

2. If everything has been done correctly, a window named **"CW Folder"** will open inside the emulator.

   ![CW Folder](docs/cwfolder.png)

## Building and Running ChipWits

1. Double-click the file named **"ChipWIts"** (the first file in the folder).  
   This will start the **MacForth** application, open the **Blocks file "ChipWIts"**, and begin compiling it.  

2. Wait for compilation to complete. This may take some time, and during compilation, the screen will turn almost completely white.

3. After waiting for a while, the screen will come back to life, and at the bottom, you will see **"ok"**.  

   ![ChipWits Compile ready](docs/buildready.png)

4. Now, click above the title bar that contains **"MacForth ..."**.  
   Your self-built version of ChipWits will now start.

   ![ChipWits Compile ready](docs/ChipWIts.png)

> [!NOTE]
> The version you just built is most likely **ChipWits 1.2**. I am still working on proving this, but this process is rather complex.
