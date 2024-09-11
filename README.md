# 🚀 Generate HDL Code from Frame-Based Models by Using Neighborhood Modeling Methods

This repository demonstrates how to model optical flow algorithms using multiple neighborhood processing methods and generate synthesizable pixel-based HDL code from frame-based models using MATLAB and Simulink tools. 

## 🔧 Tools Used
- *HDL Coder*
- *Simulink*
- *Computer Vision Toolbox*

## 📖 Overview

If you have a frame-based model, this example guides you in modeling an optical flow algorithm using two different neighborhood processing methods. It highlights the use of HDL Coder™ for frame-to-sample conversion optimization to generate HDL code.

Two approaches are demonstrated in this repository:
1. *MATLAB Function Block* utilizing the hdl.npufun for processing.
2. *Neighborhood Processing Subsystem Block* for modular processing.

## 🔍 Model Algorithm with MATLAB Function Block

In the model hdlFrame_OpticalFlow_LK_MLFB, a single MATLAB Function block contains the Lucas Kanade method for optical flow. The function hdl.npufun converts frame-based operations into a sample-based neighborhood processing algorithm suitable for HDL generation.

### 🧩 Lucas Kanade Optical Flow Algorithm:
```matlab
function flowVector  = opticalFlowForHDL_lk(I, Idelay)
% Implements the Lucas Kanade method for optical flow
end
💡 Key Steps:
Open the Model:
load_system("hdlFrame_OpticalFlow_LK_MLFB");
open_system("hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/MATLAB Function LK");
Simulate the Model:
sim("hdlFrame_OpticalFlow_LK_MLFB");
Generate HDL Code:
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/PrevFrame','ConvertToSamples','on');
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/CurrFrame','ConvertToSamples','on');
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/MATLAB Function LK','Architecture','MATLAB Datapath');
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB','FrameToSampleConversion','on');
makehdl('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK');
