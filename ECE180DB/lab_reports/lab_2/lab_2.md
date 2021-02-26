---
documentclass:
- article
geometry:
- top=1in
- left=1in
---


# ECE180DB : Lab 2 Report

$$\text{Thomas Kost}$$
$$UID:504989794$$

## Tasks Planned

- Setup Raspberry pi in new apartment (just ensuring basic setup is done so can resume development)
- define tasks for quarter
- begin architecture design for Stop and wait ARQ
- familiarize with pyQT to allow for UI integration of modules


## Tasks Completed
- get hardware given to Nico before leave of absence, also setup completed
- defined system requirements for stop and wait ARQ and began general sketch of architecture
- created clear cut goals in project proposal for stand alone apps and how they should be implemented in the sandbox like design

## Future Tasks
- further learn how event handling with pyqt is being done
- apply event handling to gesture recognition
    - functional testing
    - fix any bugs
    - try to downsample data until a minimum usable value is achieved
- add stop and wait ARQ to MQTT server to alllow for more concise messaging
    - create event handling to make application for messaging
    - can be expanded to a news app and a weather app
- begin working on some of the applications mentioned above, will provide functional examples that can be used in a generalized sandbox mode that other teams can use to simulate the dev experience without having to actually work with out API