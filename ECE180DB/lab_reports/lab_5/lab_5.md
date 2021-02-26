---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 5 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned
- add emoji and additional user information to MQTT server with stop and wait ARQ to enhance chat fucntionaliuty
- integrate gesture classifier with MQTT server and create all logic necessary for controller to run
- work with team to integrate all comms and gestures with reasonable endpoints to serve as triggers in the PyQt framework

## Tasks Completed
- MQTT Server
    - added color and emoji support for the server to enchance chat features
    - added gesutre detection functionality to allow for gesture data to be seperately sent and flagged as such. Also established method for tying a single controller to a single user using the UserID system implemented in our server
- Gesture detection
    - fixed IMU bug preventing non-admin users from having access to I2C readouts
    - finished rough code and began testing on a live sampler that draws on our previous models of gestures to classify data points at run time and notify the client of any relevant updates
    - integrated MQTT server aswell to give an inbuilt connection point to ensure classifier only need run
    - integrated MQTT server with thresholding classifier on kalman filtered data (ensuring that we had a functional gesture detector to be integrated with the rest of the widget)
- Integration
    - worked with team to ensure consistency with code base, and integrate all modules together
    - ensure changes reflected properly in PyQt widgets

## Future Tasks

- help team with remaining threading issue in PyQT
- complete SVM classifier
    - install remaining packages since pi got bricked previously
    - run sampler on existing data base
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - add kalman filtering to the loop to help ensure that the data is less noisy and will hopefully provide more distinct features