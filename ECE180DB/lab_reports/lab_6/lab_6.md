---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 6 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned
- help team with remaining threading issue in PyQT
- complete SVM classifier
    - install remaining packages since pi got bricked previously
    - run sampler on existing data base
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - add kalman filtering to the loop to help ensure that the data is less noisy and will hopefully provide more distinct features

## Tasks Completed
- MQTT Server/Integration
    - reworked the server to integrate acknolwledgements with the pyqt framework, as there were some bugs with the current integration and a code restructure was bieng performed
    - created new testing scripts to reflect the modified public interface
    - integrated final server implemenation with raspberry pi controller scripts
- looked into fixing relative imports, some patchy solutions found but nothing worth 
- Gesture detection
    - finstalling dependencies for our SVM classifier on the pi. There is a new issue with Scipy on the updated version of raspbian. As a result Cvxpy cannot be intalled on the pi. However, this is not necessary to execute the classifier--only for the training
        - code restructure to eliminate dependency on cvxpy for the actual classification
        - more modular
        - offload training to cpu that can actually perform fast
        - patched testing script to prevent corrupted csv file from being created from data recording
        - enforce a given sampling rate
        - included kalman filtering to provide more stable measurements 
- Integration
    - final integration for demo presented with extension
- read through pyqt implementation so can help edit front end issues

## Future Tasks

- help team with pyqt integration of any further developed features
    - possibly adding more keystroke actions for allowing better debugging not dependent on audio quality
- complete SVM classifier
    - run sampler on existing data base
    - modify data-base to include more gestures or remake if the live results are not what we expect
    - validate results on generated data base
- film video of state of project as presented on thursday for the ta's
