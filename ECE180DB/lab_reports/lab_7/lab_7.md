---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 7 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned

- help team with pyqt integration of any further developed features
    - possibly adding more keystroke actions for allowing better debugging not dependent on audio quality
- complete SVM classifier
    - run sampler on existing data base
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - validate results on generated data base
- film video of state of project as presented on thursday for the ta's

## Tasks Completed
- MQTT Server/Integration
    - helping with implementation of server to eliminate bugs in sending messages between users
- Gesture detection
    - installed pyqt on raspberry pi as it is a new dependency of our communicaitons link. Fun fact, this takes anywhere between 6 and 9 hours!
        - further code refactoring to divide functionality and eliminate cvxpy dependency for our controller script
        - enforce a given sampling rate, including forcing specific loop timers on the low pass, median, and kalman filtering process
        - added extra features to each sample to hopefully provide better resolution
- Integration
    - final run through of all capabililties of the chat application
    - debugging final issues
    - created demo video showcasing stable use of the chat

## Future Tasks
- complete SVM classifier
    - record data base using new objects
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - validate results on generated data base 
    - real time validation 
- user friendly
    - setup script for dependency both controller and application
    - can do powershell and `*.sh`
    - command line arguments for screen size, user name, and other currently hard coded paramaters
- possible performance boost
    - as we have removed several daemon threads, could add another for the purpose of sending acknowledgements for our server