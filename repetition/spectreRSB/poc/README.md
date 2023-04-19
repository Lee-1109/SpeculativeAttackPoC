# Proof of Concept for spectreRSB
this PoC show an RSB based attack that accomplishes the equivalent of spectre variant 1 through manipulation of the RSB instead of mistraining the branch predictor;
use this scenario to explain the principles of the attack,even though it may nit be practical

the more details you can borswe the paper if you are intested about the SpectreRSB
[Spectre Returns！Speculation Attack using the Return Stack Buffer](https://www.usenix.org/system/files/conference/woot18/woot18-paper-koruyeh.pdf)

anyway, if you have any questions about this PoC code,can contact me though email:`leeyang1109@163.com`

# Usage
use this command to begin the PoC program

```c
make
./spectreRSB
```

if you want to clean the all *.o *.a files can use
```c
make clean
```