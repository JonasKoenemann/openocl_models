# openocl_models

We plan to implement a direct interface to Peter Corke's robotics toolbox in OpenOCL soon, let me know if you would like to get involved!
https://github.com/OpenOCL/OpenOCL/issues/102


Collection of models for optimal control with OpenOCL

rtb: models used with Peter Corke's robotics toolbox

For optimal control example see rtb_puma560

## requirements (from https://github.com/jkoendev/): 

* https://github.com/openocl/toolbox-common-matlab
* https://github.com/openocl/robotics-toolbox-matlab
* https://openocl.org/

Setup RTB

```
git clone git@github.com:OpenOCL/toolbox-common-matlab.git
cd toolbox-common-matlab
git checkout rtb10
cd ..

git clone git@github.com:OpenOCL/robotics-toolbox-matlab.git
cd robotics-toolbox-matlab
git checkout rtb10
cd ..
```

In Matlab

```
addpath toolbox-common-matlab
cd robotics-toolbox-matlab
startup_rtb
```

Setup OpenOCL

```
ocl
```

this repository is very experimental!
