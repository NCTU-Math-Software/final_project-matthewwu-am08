##  Update Notes:

This version(2>3) fix the bugs for windows10's error while calling system command and add some tryment's protection for some More frequently happened bug for ginput and try relaunch it, and this version should not be able to work on linux(tested on 20.04LTS ubuntu),if needed to port back. change the systemcall eval(['!del' 32 't2.csv']) to eval(['!rm' 32 't2.csv']) should be work.

The software abstact for convert t1 as a editable's change can not work fine, so they would be keeped in Debug Branch only and will not be pushed to Main Branch.

# Introduction:

This is a relatively stable version, support directly edit at any time of run rather than hardcode in code.

Notice that this still required at least two Matlab boot simultaniously, and in author's computer, this cost at least 3.3GB ram.

# Launch Method:

1. Launch 2 Matlab(Recommend 2020a or later) simultaniously.

2. Switch the dictionary to folder with two matlab script(v2_main.m and v2_t1.m)

3. Open two script separately with 2 matlab.

4. Launch v3_main.m and v3_t1.m seperately.

5. Enjoy.



# Operation Method:

Use "space" to pause/resume the stimulation..

while it's currently on puase method, use directly mouse's left click(or any un-defined key to add a new cell.

Press R(or r) while pause to wipe all to white(Reset all condition.)

Press G(or g) while pause to exit the simulation.

# Notice:

In execution, X.dat and Y.dat would be create as the shared memory for two matlab, and a file named "t1.csv" might generate as the tmp conditonal marker.
Please do NOT delete or mv them while running.

The reason why still choose Multi matlab is due to the matlab's timer function's feature, it would "stop" the main function while times up and executing the timerFunction,and the Calculation for this project is a little bit too massive(In Author's 3300X, Cost 0.17 to 0.19 second for all 100x100 matrix calculation).

So if use only timer function to calculate and all in one matlab, most of time would all stuck in calculation and can't get user's input correctly.

The solution here used is boot a timer function, which active each 0.2second, and for each boot would draw previous' image and call t1 to calculate for next round.

For this solution, only mostly not enough 0.02second per 0.2 second can't get user input, the FPS can be maintain at roundly 4.5~5.

##### Edited extra for this version:
Unfortunately after some test over win10, the systemcall's eval command can not be actually called over win10(Same issue also happened for the ginput's error), and this should have been fixed for MultiThread3_stable, but actually can not sure it can worked correctly, if occur any werid case(like the animation's roll back, or any other unpredictable event such as crashed, try to slow down the number define at line 69, which is the system's tick, or contact me with email(written in root's READ.md)

I hope you enjoy with this project's stimulation's effect.

# Known Issue:

Thx for matlab's bug, sometimes while for a too much frequency's click, the function ginput might break, which would make it unable to get any input and system would stuck.

Hold down Ctrl+C on cmd line of v2_main.m to force stop the operation.

In some extreme cases, while the Calculation thread completely lost from main function, please use system manager provided by OS to force stop the whole matlab.

v2_t1.m can't be turn off automatically.
   This will be fixed in next version if this can really be fixed.


