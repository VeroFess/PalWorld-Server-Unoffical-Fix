### The era of PalWorld-Server-Unofficial-Fix has come to an end!

Thank you all for your support! Currently, in the server version 1.3.1 of the game, the memory leak issue has been officially fixed. The current problem of excessive memory usage in some systems is mainly due to the allocation of too many objects, which is not something third-party fix programs should address. Please give the official team some time.

In the future, optimized binary files will be provided for Linux as I have some IDC friends who need them.

In the future, I will focus on API development, allowing us to intervene in the game's logic on the server side, enabling projects such as server-side anti-cheat implementations.

If you are interested, please visit https://github.com/VeroFess/PalWorld-Server-Unoffical-Api

VeroFess 2024-01-29

-----

### PalWorld-Server-Unoffical-Fix 的时代结束了！

非常感谢大家的喜爱！目前，在游戏的1.3.1版本的服务端中， 内存泄漏的部分已经被官方修复，目前部分系统中占用过多内存的问题仅仅是由于分配了过多的对象，这不是第三方修复程序应该做的，请给官方一些时间

之后，该项目将会针对 Linux 提供优化版的二进制文件，这是因为我有一些 IDC 朋友需要它们

未来，我将专注于对 API 的开发，这将允许我们在服务端干涉游戏的逻辑，实现类似服务端反作弊之类的项目。

如果你感兴趣，请访问 https://github.com/VeroFess/PalWorld-Server-Unoffical-Api

VeroFess 2024-01-29

-----
-----


#### Warn! It is very possible that there are two different servers in Linux! The basic server I use is Palworld Dedicated Server (ID: 2394010). Some people reported that the appid is different after replacing the file. Please check in advance!
#### 警告！Linux很有可能存在两个不同的服务端！我使用的基础服务端为 Palworld Dedicated Server (ID：2394010 )，有人反馈替换文件后出现appid不同的问题，请提前检查！

-----

#### Now we have Discord! Some friends and I believe this game has great potential, so we're preparing to create an unofficial server-side script system for it. Of course, if you have any questions about unofficial fixes, we also have a dedicated channel for that!
#### 现在我们有了Discord! 我和一些朋友认为这个游戏非常有潜力，所以我们准备为他制作非官方的仅服务端脚本系统。当然如果你有关于非官方修复的问题我们也有对应的频道！

[Discord](https://discord.gg/BFHEH2Mem5)

-----

# PalWorld-Server-Unoffical-Fix
This is an unofficial palworld server binary distribution project that fixes some problems with the original server.

## Fix what?
- [x] Memory leak and high cpu load from ```SymbolInfoToHumanReadableString```
- [x] Memory leak and high cpu load from ```ProgramCounterToHumanReadableString```
- [x] Memory leak and high cpu load from ```PopulateProgramCounterSymbolInfoFromSymbolFile```
- [ ] Disable profiling tracing
- [ ] Fix save broken

## How to use?
Download binary from [Release](https://github.com/VeroFess/PalWorld-Server-Unoffical-Fix/releases). Just overwrite the official files with the files I provided.

## It's safe?
Well, I personally swear not to insert harmful code, but if you don't believe me you can check using a tool like bindiff.

-----

# PalWorld 服务器非官方修复
这是一个非官方的 PalWorld 服务器二进制分发项目，修复了原始服务器的一些问题。

## 修复了什么？
- [x] 来自“SymbolInfoToHumanReadableString”的内存泄漏和高 CPU 负载
- [x] 来自“ProgramCounterToHumanReadableString”的内存泄漏和高 CPU 负载
- [x] 来自“PopulateProgramCounterSymbolInfoFromSymbolFile”的内存泄漏和高 CPU 负载
- [ ] 禁用分析跟踪
- [ ] 修复存档损坏的问题

## 如何使用？
从 [Release](https://github.com/VeroFess/PalWorld-Server-Unoffical-Fix/releases) 下载二进制文件。 用我提供的文件覆盖官方文件即可。

## 它安全不？
好吧，我对灯发誓不会插入有害代码，但是如果不相信我，可以使用像 Bindiff 这样的工具进行检查。
