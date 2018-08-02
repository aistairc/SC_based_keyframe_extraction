
# SC_based_keyframe_extraction

This repository contains the code of the following paper.
- Yujie Li, Atsunori Kanemura, Hideki Asoh, Taiki Miyanishi, and Motoaki Kawanabe, "Key frame extraction from first-person video with multi-sensor integration", _IEEE International Conference on Multimedia & Expo (ICME)_, pp. 1303–1308, July 2017.

This code costs time, maybe some hours.

This software is licensed under the Apache License 2.0.


## Information

We run this software on the following envirnment.

* Windows 10.
* MATLAB R2017b.
* Python
    * Anaconda2-5.2.0
    * Python 3.6.5
    * pandas 0.23.1
    * scipy 1.1.0
* 7-zip

This software use the following programs and data.

* Subject 08 Brownie (Video data)
    * http://kitchen.cs.cmu.edu/main.php
* Sparse Modeling Representative Selection (SMRS) 
    * http://www.ccs.neu.edu/home/eelhami/codes.htm 

## How to run.

1. Run setup.ps1 with Windows PowerShell.
2. Generate Yn2.mat data.
    1. Run saveYn2.py.
       (You can use any S08_Brownie_3DMGX1's data)
        * $ python saveYn2.py .\\S08_Brownie_3DMGX1\\2794_02-02_11_16_30-time.txt
3. Open main.m by MATLAB.
4. Run main.

