# 🌟 The Good Stuff
### [🔗 Direct link to the method](https://github.com/JdotCarver/MHWS-MultiDetect/blob/main/Production%20Version/reframework/autorun/MultiDetect.lua)  
This method only supports 22 out of the 44 possible states!  
Please help out mapping the remaining ones! See [testing version](https://github.com/JdotCarver/MHWS-MultiDetect/tree/main?tab=readme-ov-file#-the-testing-version) on how you can help.
  
# Overview
The goal is simple:  
Prevent mods from unintentionally breaking multiplayer experiences or risking account bans.  
As we all know they are carefully watching. No-one would wish modders to be conflated with cheaters. By identifying and understanding the player's context, your mods can behave more responsibly.  
  
  <br />
  
![image](https://github.com/user-attachments/assets/957d5394-05f0-4592-89c0-214125fad68a)  
_Don't let this be you. :[_
  
  <br />

# 🔎 How It Works
<details>
<summary><h2> Give me the Short version </h2></summary>  

- The game has an internal tracker of the player's situation.  
- This script reveals every single situation change.  
- Since only some situations are ban worthy (say, playing Arena Quests = High chance of Ban, Offline = Low Chance of ban), your mod can use that information to only activate itself in the situations that you have set as Safe. :)  
</details> 
<details>
<summary><h2> I want the Long Version </h2></summary>
  
This project hooks the ```ToArray()``` method of the internal ```List<app.cGUIMaskContentsManager.SITUATION>``` type in REFramework. When the situation list changes (i.e., the player's in-game situation updates), the hook intercepts the new data and compares it to the last known situations. This function is **only** called when a situation change arises, making it extra efficient.

### Possible Situations
MH:Wilds tracks the changes in and out of these situations :    [🔗 **Possible Situations**](https://github.com/JdotCarver/MHWS-Multidetect/blob/67cc4e1e780a57c255a926d77d6249691b841946/Test%20Version/Possible_Situations.lua#L1)  

So if your mod can benefit from detecting when the player is in a Multiplayer quest, Hosting an Arena, in the Training Area, or Playing Offline for example, this system is built for you!  
Keep in mind that this list will most likely grow as they add more features to the game, so if you find a new situation or improve the logic, PRs are warmly welcome.  
</details>
  
  <br />
  

# Installation & Usage
This repo contains two versions :

### [🔗 The Production version](https://github.com/JdotCarver/MHWS-MultiDetect/releases/)  
Lightweight, stripped of noise, and built for seamless integration into your mod! :)  
Just drop the code into your mod's script and select the situations you want to monitor.  
*This method only supports 22 out of the 44 possible states!*  
*Please help out mapping the remaining ones! See the [testing version](https://github.com/JdotCarver/MHWS-MultiDetect/tree/main?tab=readme-ov-file#-the-testing-version) below for how you can help. :)*
  
  <br />

### [🔗 The Testing version](https://github.com/JdotCarver/MHWS-MultiDetect/releases/)  
For debug usage and creating more human readable situations.  
Includes debug prints, enum suggestions, and logs to help improve detection accuracy.  
<details><summary><h3>Step by step guide</h3></summary>

1. Put the files like this in your reframework folder :
```
MonsterHunterWilds
        │
        └── reframework/
                  │
                  └── autorun/
                          │
                          ├─ MultiDetect_Testing.lua
                          └── MultiDetect_TestingFiles/
                                          │
                                          ├─ MD_Known_Situations.lua
                                          └─ MD_Possible_Situations.lua     
```
2. Open MH:Wilds and in REFramework `Spawn Debug Console` to see the logs it prints while you test in-game.
   
   ![image](https://github.com/user-attachments/assets/87c75911-d1e9-4ea0-bf54-2601eba6dde1)  
   _Here we can see that game does the transition Out  
   of Suja and Into Grand Hub as 2 distinct events_

\
3. When a new un-confirmed situation arises, the log will notify you and attempt to suggest possible candidates.  
4. When you are pretty sure you can confirm the situation, add it in ```MD_Known_Situations.lua```, and save.  
5. In REFramework, `Reset scripts` and continue finding unconfirmed situations.  

  \
    ![image](https://github.com/user-attachments/assets/3ef37ae9-fff9-4ec2-a191-20e105bdcd9b)  
    _Location of the_ `Reset Scripts` _and_ `Spawn Debug Console` _buttons_

</details>


  
  <br />
  

## 🙏 Credits & Thanks
Special thanks to:

- [**LordGregory**](https://github.com/Synthlight) – For dumping the RSZ.
- [**Fexty**](https://github.com/Fexty12573) – For being kind enough to point me in the right direction on one of his good days.
- [**Daniel7400**](https://github.com/Daniel7400) – For the top notch polish in their work. _(Check out [Achievement Progress Tracker](https://www.nexusmods.com/monsterhunterwilds/mods/721)!)_ Inspiring the persistence and dedication to see this through. You reminded me why doing it right matters.
  
  <br />
 
## License & Community Use
- 🆓 This project is free to use, fork, modify, and improve for any open-source or private mod that benefits from better situation state awareness.  
- 💡 If the mod is open-source, integration is extremely simple. I took extra care to make the code as readable as could be so that even beginners could lend a hand. :)    
  
  <br />
 
This exists as a labour of love for what Monster Hunter is and has become. Standing strong for so many years, and with such a creative community, let’s take care of it.  

_Light the Way_  
🌟  
