**Work**

4 Bit Johnson Counter Example with VHDL language. 

**Usage**

The codes are written in Windows XP operating system at Xilink ISE. Please run johnsoncounter.ise with Xilink. 

**Code**

![VHDL Module Johnson Counter Code](/images/johnsoncounter-vhdl-module.jpg) 

There are two inputs as clock and reset. We defined 4 outputs as 0 down to 3 and we will see it in the Synthesis Report. We start the process with clock and reset parameters. If Reset is "1", output will change as "0000". Because this a 4-bit Johnson (Ring) Counter. If Reset is "0", the clock value which we will see in the Test Branch will perform this procedure in the below in every clock cycle;  

 Put the least significant bit to one digit left. 

 Put the most significant bit to the least significant digit and change it to its not. (For this case it must be 0) In this situation Counter Binary will count from 0000 to 1111 and after that countdown from 1111 to 0000. 

**Synthesis Report**

![Synthesis Report Johnson Counter](/images/synthesis-report.jpg) 

After we write the code and compile it, Synthesis Report page will open. In this page there are inputs and outputs which are defined as vectors. Don't be surprised. Even if the inputs are seemed as "0", The input Clock is defined as GCK (Global Clock) and the input Reset is defined as GSR (Global Set/Reset) 

**RTL Schematic**

![Main RTL Schematic Johnson Counter](/images/rtl-schematic0.jpg) 

Here, we can simply see the main structure of the circuit. 

![RTL Schematic Johnson Counter](/images/rtl-schematic.jpg) 

Here, only the expansion of the output as vector. But as we can understand from the Q exit, there are 4 D type Flip/Flops. Because a D type Flip/Flop can only hold one-bit information in the same clock cycle. 

**Technology Schematic**

![Main Technology Schematic Johnson Counter](/images/technology-schematic0.jpg) 

Here, we simply see the main structure of the circuit. 

![Technology Schematic Johnson Counter](/images/technology-schematic.jpg) 

Here, it is seen that the circuit is completely open. We need to beware of FF exit being an invertor because we need for our counter to also countdown.  

**Testing**

![Test Branch Johnson Counter Code](/images/tbjohnsoncode0.jpg) 

As it is seen, we defined Clock Reset and the Q output as a component in vector form. We initialized our inputs' start value as "0". 

When the process starts, as it is seen, regardless of clock value the operation will wait for period/2 clock value. Clock period value was initialized as 10 Nano seconds for this example. This is an important encrypting technique for quadratic signals. Of course, there are other techniques but for this example value is defined as period/2 clock 0 and period/2 clock 1 or the exact opposite first 1 and then 0.  

![Test Branch Johnson Counter Code](/images/tbjohnsoncode.jpg) 

In this example reset will wait for the first 100 Nano seconds and will work in the second for 100 Nano seconds. 

![Test Branch Johnson Counter Simulation](/images/tbjohnson1.jpg) 

As it is seen when the test starts, in every clock period, the operation of counting happens. Of course, counting goes in binary form as 0000, 0001, 0011, 0111, 1111. In 100th Nano second, in the case that reset goes from 0 to 1 the counter will reset to "0000". During the reset period the counter will show "0000" value. In the 200th Nano second reset will finish and in the 205th Nano second with the beginning of the clock cycle (changing the value form "0" to "1") the counter will start to count again. 

![Test Branch Johnson Counter Simulation](/images/tbjohnson2.jpg) 

We can more closely and clearly see the value turning in binary form. 

![Test Branch Johnson Counter Simulation](/images/tbjohnson3.jpg) 

We can say that the circuit will count from 0000 to 1111 and from 1111 to 0000 forever (Except for 100th and 200th Nano seconds because of the reset). Of course, we can obtain different results by changing reset value in another testcase but it won't change the process of counting of counter. 

We examined an example scenario about 4-bit Johnson Counter. With the same logic by looking at the number of bit we can get an alternative Johnson Counter.