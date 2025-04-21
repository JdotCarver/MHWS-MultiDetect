# 🌟 The Good Stuff
[🔗 **Direct link to the method]**
  
# Overview
This project is a plug-and-play Situation Watcher for Monster Hunter: Wilds, specifically developed with mod safety and multiplayer integrity in mind. It helps modders and toolmakers reliably detect in-game player states—such as online/offline status, quest involvement, and lobby contexts—using internal situation flags exposed by the game.

The goal is simple:  
Prevent mods from unintentionally breaking multiplayer experiences or risking account bans.  
As we all know they are carefully watching. No-one would wish modders to be conflated with cheaters. By identifying and understanding the player's context, your mods can behave more responsibly.  
  
  <br />
  
![image](https://github.com/user-attachments/assets/957d5394-05f0-4592-89c0-214125fad68a)  
_Don't let this be you. :[_
  
  <br />
  
# Installation & Usage
This repo contains two versions :

### [🔗 **The Testing version]**  
For debug usage and creating more human readable states.  
Includes debug prints, enum suggestions, and logs to help improve detection accuracy.  
Plop the lua in your autorun folder and open the REFramework console to see the logs it prints in-game!


### [🔗 **The Production version]**  
Lightweight, stripped of noise, and built for seamless integration into your mod! :)  
Just drop the code into your mod's script and select the states you want to monitor.
  
  <br />
  
# 🔎 How It Works
This project hooks the ```ToArray()``` method of the internal ```List<app.cGUIMaskContentsManager.SITUATION>``` type in REFramework. When the situation list changes (i.e., the player's in-game state updates), the hook intercepts the new data and compares it to the last known situation state.

### Current Known Situations
The MHWilds tracks the changes in and out of these situations :  [🔗 **Link to file with og situations**]  
So if your mod can benefit from detecting when a player is in like being in the Lobby, Training Area, or Solo Online), this system is built for you.  
(this list will most likely grow as the game has more features added, so please contribute back any newly verified situations!) 
  
  <br />
  
## 🙏 Credits & Thanks
Special thanks to:

- [**LordGregory**](https://github.com/Synthlight) – For dumping the RSZ.
- [**Fexty**](https://github.com/Fexty12573) – For being kind enough to point me in the right direction on one of his good days.
- [**Daniel7400**](https://github.com/Daniel7400) – For the top notch polish in their work. Inspiring the persistence and dedication to see this through. You reminded me why doing it right matters.

## License & Community Use
🆓 This project is free to use, fork, modify, and improve for any open-source or private mod that benefits from better state awareness.
💡 If your mod is open source, integration is extremely simple. I took extra care to make the code as readable as could be.

This exists so we can all enjoy the game safely and responsibly. Let’s take care of our community and our game together.

If you find a new situation or improve the logic, PRs are warmly welcome.

Happy modding!
