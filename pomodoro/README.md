Pomodoro
---
This is an [Automate](https://llamalab.com/automate/) flow.

The idea is to focus on the work for 2 houres, 4 intervals 30 minutes each, with 5 minutes gaps in between and 20 at the end.

The main variables are collected in a dictionary `Pomodoro`:

```
# Duration of the time intervals in minutes
array "Plan": [ 30, 5, 30, 5, 30, 5, 30, 20 ] 
dictionary "Twitting": {
# Time intervals in seconds, how often to twit during main intervals
  int "Interval": 60*5 
  dictionary "isActive": { 
# Set 1 or 0 to switch twitting on/off during 'work' or 'relax' intervals
    boolean "atWork": 1
    boolean "atRelax": 0
  }
}
dictionary "Sound": { 
# Connect special sounds to indicate events
  string "Work": "..."
  string "Relax": "..."
  string "Done": "..."
  string "Twit": "..."
}
# a switcher 'pause/continue' if available, should be zero at the beginning
boolean "isPaused": 0 
```

To change the number and duration of the **work**/**relax** intervals set them as the new value of the `Pomodoro["Plan"]` array.  The amount of numbers is the amount of intervals.  The value of each number is a duration of a corresponding interval in minutes. The first number is a **work** interval, the second - **relax**, and so on.

Twitting means _keep me awaken in case I get distracted_. By default it is activeated for **work** periods and deactivated when **relax**.

`Pomodoro["Sound"]` stores the paths of the melodies of events:
 - `"Work"`: the next **work** interval started
 - `"Relax"`: the **relax** time started
 - `"Done"`: all intervals passed
 - `"Twit"`: wake up and focus on the work

The sounds will be downloaded from [github repository](https://github.com/vitalizzare/termux_goodies/tree/main/pomodoro/Sounds) and stored in the local directory `Pomodoro_sounds`.

The script containes 29 blocks and can be used in the free of charge version of [Automate](https://play.google.com/store/apps/details?id=com.llamalab.automate)

Tested on Nexus and Pixel with Android 6 and 10.
