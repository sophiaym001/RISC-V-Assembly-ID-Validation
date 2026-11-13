# RISC-V-Assembly-ID-Validation
Created my own ID Validation Toolkit using assembly, as part of a class assignment.

FILE ORGANIZATION: This program consists of three files. Toolkit.asm holds the main body of code that welcomes the user and asks for their input. Analysis.asm is where the main subroutines are held, and these are the subroutines that complete checks on the given ID. Lastly, io.asm holds subroutines for system calls such as readInt or printString.

PROGRAM SUMMARY: The program takes user input in the form of an ID number and allows the user to complete different operations on the ID in order to validate it. There are five different operations that the user can choose from which include parity, checkSum, reverse, countDigits, and fraudCheck. The program runs on a loop and can check different IDs with different operations until the user wants to exit.

SKILLS LEARNED: Within this assignment I was able to practice implementing subroutines and different system calls in RARS. It was really good practice to write the subroutines and practice correct calling conventions for assembly code, and of course to practice debugging and fixing any errors I ran into during the process.
