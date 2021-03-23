---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 9 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned

- complete SVM classifier
    - record data base using new objects
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - validate results on generated data base 
    - real time validation 

## Tasks Completed
- SVM data base created and training of the classifier has begun
    - enforced strict data rate with loop timers on the kalman filter
    - 30 Hz sampling frequency is less than ideal, but it is what the hardware is capable of to produce a stable sampling rate
    - added extra features per sample to hopefully imporve training results
    - added user friendly interactions for recording data to make the process less painful, and allow a larger data base to be created
    - since data is low pass filtered, we can hope that the end result will not be dramatically impacted by the decreasing in sampling rate
- integration
    - garuntee blank sends are created in the gui to help the acknowledgement process

## Future Tasks
- Testing, do more
- help with bug fixes
- finish svm validaition (currently in process)
- help with other teams testing
- final presentation