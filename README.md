These are some simple SNES trainer fixes. Most trainer options in ROMs don't work on modern SNES emulators.

It seems the trainer authors would use SRAM or RESERVED RAM to store variables. This memory area may have worked on the old backup units, but is not commonly emulated by modern SNES emulators.

```
+---------+-------------+------------------------------------+---------+
| $70-$77 | $0000-$7FFF | (Mode 20 SRAM) 256KBytes           | ------- |
|         | $8000-$FFFF | • RESERVED                         | ------- |
+---------+-------------+------------------------------------+---------+
```

A simple fix to some trainers is to enable SRAM by changing a byte in the [internal ROM header](http://old.smwiki.net/wiki/Internal_ROM_Header).

Another fix is to change access from $70:8000 to $70:0000 by changing some code in the rom.

---

Also, some trainers were made for an early beta release ROM. Here I ported the code from a beta version of Alien 3 and Wildguns to the final ROM version.

Below are the source files to be patched, they are not included. I used [xkas v0.06](http://www.romhacking.net/utilities/269/) as the assembler.

```
  File: Alien 3 (US).sfc
  Size: 1,048,576 bytes
CRC-32: 98e2ac15
   MD4: 1274710018a8eb7cc639972388a02e45
   MD5: 09120ba8c0052997481117683b4e70db
 SHA-1: 7c29a915c28c534c8a67a940e86d8346958f4fa1
```

```
  File: Batman Returns (US).sfc
  Size: 1,048,576 bytes
CRC-32: e87dfdf6
   MD4: 49b80b7fb79b7adbed185ed640da1872
   MD5: 5ef8e1f3e88c86f149838c569a0c0328
 SHA-1: 087f414d51c999e25ced561fe21503c559d8050f
```

```
  File: Majyuuou (english v1.01).sfc
  Size: 1,572,864 bytes
CRC-32: 14dcc20d
   MD4: 88ad98fcdd1d555c328e27c36acb459a
   MD5: 3e972724ddbac41dec86035f6ebe9fa5
 SHA-1: 2147c2b1fd24184e54e774f9afb92059d40ffacb
```

```
  File: Wild Guns (US).sfc
  Size: 1,048,576 bytes
CRC-32: 085d8d14
   MD4: 841c0da4f07a25a29e242c4e783f1d3c
   MD5: 94d30063d9b17567d32079e766251569
 SHA-1: 1ecf28d5f3d2e84e3cc58ed621cb0fc0dd9d70d0
```
