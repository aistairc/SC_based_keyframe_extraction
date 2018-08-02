#!/usr/bin/env python
#
# Copyright 2018 National Institute of Advanced Industrial Science and Technology (AIST)
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import sys
import scipy.io as sio
import pandas as pd

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: $ {} IMU-data".format(sys.argv[0]))
        sys.exit(0)

    # Select data with Count column 0, 4, 8 ... 39360.
    COUNT_MAX = 39360
    COUNT_STEP = 4
    KEYS = [
        'Accel_X', 'Accel_Y', 'Accel_Z', 'Roll', 'Pitch', 'Yaw', 'Mag_X',
        'Mag_Y', 'Mag_Z'
    ]
    data = pd.read_csv(sys.argv[1], skiprows=1, sep="\t")
    yn = data[(data.Count <= COUNT_MAX)
              & ((data.Count % COUNT_STEP) == 0)][KEYS]
    sio.savemat('Yn2.mat', {'Yn': yn.T.values})

