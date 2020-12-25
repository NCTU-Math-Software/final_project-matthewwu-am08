# Introduction:

This is a relatively stable version, support directly edit at any time of run rather than hardcode in code.

Notice that this still required at least two Matlab boot simultaniously, and in author's computer, this cost at least 3.3GB ram.

# Launch Method:

1. Launch 2 Matlab(Recommend 2020a or later) simultaniously.

2. Switch the dictionary to folder with two matlab script(v2_main.m and v2_t1.m)

3. Open two script separately with 2 matlab.

4. Boot v2_t1.m.

5. Boot v2_main.m.

6. Enjoy.



# Operation Method:

use "space" to pause/resume the stimulation..

while it's currently on puase method, use directly mouse's left click(or any un-defined key to add a new cell.

press R(or r) while pause to wipe all to white(Reset all condition.)

press G(or g) while pause to exit the simulation.

# Notice:

in execution, X.dat and Y.dat would be create as the shared memory for two matlab, and a file named "t1.csv" might generate as the tmp conditonal marker.
Please do NOT delete or mv them while running.

The reason why still choose Multi matlab is due to the matlab's timer function's feature

it would "stop" the main function while times up and executing the timerFunction,and the Calculation for this project is a little bit too massive(In Author's 3300X, Cost 0.17 to 0.19 second for all 100x100 matrix calculation).

So if use only timer function to calculate and all in one matlab, most of time would all stuck in calculation and can't get user's input correctly.

The solution here used is Boot a timer function, which active each 0.2second, and for each boot would draw previous' image and call t1 to calculate for next round.

For this solution, only mostly not enough 0.02second per 0.2 second can't get user input, the FPS can be maintain at roundly 4.5~5.


# Known Issue:

thx for matlab's bug, sometimes while for a too much frequency's click, the function ginput might break, which would make it unable to get any input and system would stuck.
Hold down Ctrl+C on cmd line of v2_main.m to force stop the operation.
In some extreme cases, while the Calculation thread completely lost from main function, please use system manager provided by OS to force stop the whole matlab.

v2_t1.m can't be turn off automatically.
   will be fixed in next version if this can really be fixed.

