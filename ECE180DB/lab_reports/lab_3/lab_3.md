---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 3 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned
- get IMU hardware resetup
- Stop and wait ARQ implementation
- familiarize with pyQT to allow for UI integration of modules


## Tasks Completed
- It should be noted that I bricked my raspberry pi this week, as a result a large portion of time was dedicated to restoring that so that the gesture recognition can be performed and tested
    - resetup OS and all required software and envrionment handlers
    - setup IMU hardware and installed necessary packages

- Began modifying MQTT server to accept a sender reciever architecture. Added message ID tags and created a networking object to handle the routing of messages to higher blocks
    - automatic repeat requests and acknowledgement handling
    - routing for applicable users
    - user json object--defining all the information a user can tell others about themselves


## Future Tasks
- apply event handling to gesture recognition
    - functional testing
    - may have to recreate database
        - make recording script more robust so database doesnt require cleaning
    - fix any bugs
    - try to downsample data until a minimum usable value is achieved
- add stop and wait ARQ to MQTT server to alllow for more concise messaging
    - integrate networking layer with user information application with pyQT widget
- begin working on some of the applications mentioned above, will provide functional examples that can be used in a generalized sandbox mode that other teams can use to simulate the dev experience without having to actually work with out API