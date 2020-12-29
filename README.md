
### this Assignment is mainly for Project 18(Conway's life game), and support two kind of executing method.

# Multi Thread.
For latest version on 2020/12/30, please open  [final_project-matthewwu-am08/Conway/MultiThread3_stable/](https://github.com/NCTU-Math-Software/final_project-matthewwu-am08/tree/main/Conway/MultiThread3_stable) and read the README over the folder.

# Single Thread.
For a relative simple version without multiple matlab(and less feature), please open  [final_project-matthewwu-am08/Conway/Default_Stable_3/](https://github.com/NCTU-Math-Software/final_project-matthewwu-am08/tree/main/Conway/Default_Stable_3) , and read the README over the folder.

# Extra
the folder ants provide two kind of Langton's ant's stimulation, both of them have no user interface, please execute directly and stop it with Ctrl+C.


## Some Notes.

For most of works, this project is developed over the Computer(AMD Ryzen 3300X/64GB DDR4-3600Mhz ram) with OS Ubuntu 20.04LTS, and so does the execute test, some of the execution's parameters(mainly the Timer Call's frequency) is based on this hardware's performance, if occur any werid case(like the animation's roll back, or any other unpredictable event such as crashed, try to slow down the number define at line 69, which is the system's tick.


Unfortunately after some test over win10, the systemcall's eval command can not be actually called over win10(Same issue also happened for the ginput's error), and this should have been fixed for MultiThread3_stable, but actually can not sure it can worked correctly, if there's any extra problem about execution, please contact me with following Email: matthewwu.am08@nctu.edu.tw .

I hope you enjoy with this project's stimulation's effect.
