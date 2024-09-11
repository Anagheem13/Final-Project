% Run the Model
% The input video is split into a previous frame and current frame.
% Simulate the model to see the frame size and simulation results of the optical flow output.

sim("hdlFrame_OpticalFlow_LK_MLFB");

% Generate HDL Code
% Set properties for frame-to-sample conversion and generate HDL code.
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/PrevFrame', 'ConvertToSamples', 'on');
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/CurrFrame', 'ConvertToSamples', 'on');

hdlset_param('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK/MATLAB Function LK', 'Architecture', 'MATLAB Datapath');
hdlset_param('hdlFrame_OpticalFlow_LK_MLFB', 'FrameToSampleConversion', 'on');
makehdl('hdlFrame_OpticalFlow_LK_MLFB/DUT_LK');
