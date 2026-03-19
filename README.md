# szkodnik-rp 
[![sampctl](https://img.shields.io/badge/sampctl-szkodnik--rp-2f2f2f.svg?style=for-the-badge)](https://github.com/sklawik/szkodnik-rp)

Multiplayer server written in Pawn scripting language (which is sandboxed like C# and syntax is strongly similiar to C language) for San Andreas: Multiplayer (SA-MP).
SA-MP used Raknet networking technology.

## Retro / Case Study (after 8 years)
What is this project about, what it does? The gameplay mechanics.
- If you own GTA San Andreas and want to play with friends, you need a server.
  So I made one while learning programming, all the knowledge I earned was handed to this project.
  I didn't use git nor github, I wrote the whole script in one big file till I learned it the hard way it is not proper way to write any software,
  while having this downside there is the upside, it is extremely simple to jump in and edit the code and just enjoy the effects.
  In this server gamemode you have systems for:
     1: Housing. Your own house or your own created group.
  
     2. Groups. You could create one, invite people to it, have dedicated chats, group types decided on what you can do while being on duty, for example:
      You could name your group anything you want, but mark group type as a police one. So you could you commands to /cuff other players. There are around 15 types of groups with various exciting features.
     
	 3. Items. Around 20 items, a player has their own inventory, item could be dropped on the ground, stored in vehicle or be given to other player, even sold or traded.
    
	 4. Weapons, as items. GTA had a lot of them but the script decided when, on what conditions will you withdraw them, how much damage will they take - even deciede that a pistol will not give a damage to      player but act as a tazer, so it freezes hit player and puts them correct animation for other players to see. (old SA-MP anim sync issue was fixed by re-applying animation when players render a player       that has the animation applied).
    
	 5. Vehicles. Player could own one, some vehicles were special (ex. undercover police). Vehicles could be traded, sold, assigned to a group (so members can use it). Fuel system, a lot more.
   
	 6. Objects. A system I'm proud of, you could edit the map of San Andreas by adding your own objects to it, edit interiors (ex. player or business house). Editor was written from scratch and was easy to      use, both with texture support for objects.
   
	 7. Animations system. Lots of hours put in reverse-engineering game's animation database so you could use /anim command and start playing an animation. Animations were also applied for various aspects       of the game, if player is drunk, damaged, etc.
   
	 8. Anti-cheat system. While simple it did its work. Server was public and occasionaly cheater/hacker joined the game, he was banned very easly since anti-cheat was written very strictly to the gamemode       logic, this topic deserves a litte more:
      Spawning a weapon using cheat is easy to detect. But some cheaters were smarted enough to not spawn weapon but send special Raknet packets to damage the players. I also detected if player was damaged        by a player who even doesn't have the weapon nor withdrawn it. There are few more wise examples in the script itself, including anti-speed hacks, anti-spam.
   
	 9. Chat system.
	The experience taught me that while my chat system was advanced and well protected there were vulnerabilities in regex itself. Text manipulation like JSON bombs, it had to be fixed in script aswell.

## What worked really well.
1. Security & Anti-cheat.
  I never trusted user input, not only input but just any Raknet data sent by a client (player). 
While normal players couldn't mess with their data before sent to a server, a malicious actor could using Cheat Engine to replace a data that server trusted a client with, or hacker could also send fake Raknet data to make other damages to the server network. I wouldn't mention SQL injections since it is most basic thing to protect a server from.
This experience taught me the importance of server-side validation, which is now my default mindset when building any API or backend service.

3. Stability (few to 20 players active at once). While SA-MP itself was not most stable application, the script didn't crash. All user data was parsed so most known vulnerabilities to crash server using various input text woulnd't work.
   At first, everything was stored in Array for maximum performance but then I switched to use Array as a cache from MySql data I fetched.
4. Used libraries and plugins.
  I stick to the KISS rule. It worked, after 8 years, tho codebase is hilariously unprofessionas, by looking at it for 5 minutes I remember the core structures and system designs. No additional libraries to learn, just everything that anyone can know in general - an SQL plugin to use MySQL database (mariaDB worked flawlessly).
## System Architecture & Scalability
1. Before doing a project even small, think big. What if codebase gets larger, what if it needs to be contenerized, automated?
  Here would came Docker in help, eventually Kubernates if one server dies for bug other would act as copies so players wouldn't lose any data and need just a simple reconnect.
2. I would use caching as main approach to fetch data.
3. Automatization is key. The less human resources have to deal with (clients requests, help) the more time there is to focus on engineering the project.
   Tools like ticket system is a must have.
## What I would do if I could start over again
I would plan the project from ground up first, decided on how many people should work with me (doing it all alone wouldn't make much sense).
Set up a git server to store the codebase, Docker and Kubernates.
If target was a multiplayer game in general, I would think twice about which app will last for a next decade.


# Summary
The project was key to learn programming without any pressure, having fun friends and got knowledge from it.
Fundamentals of C++ by Alex Allain were too boring, while I stopped at "loops" article, I switched to code a multiplayer server and then everything made it easy to finish the book itself.

Branch Master is most actual one, it contains attempts to revive branch Main, so it runs on new both hardware and software environments.





    
## Installation
# Do not expose this app to public internet. SA-MP is no longer suported nor plugins used for database managment for this project.
# GTA San Andreas is no longer avaliable to buy, this means it is more likely less people will look for vulnerability in good deed to patch them in the game itself.

It easly can be set up by using pawnctl tool but since it was written around 2016-2018 by 16 years old me it contains 
bugs that nowdays can't be even fixed because the platform written the script for is no longer supported (SA-MP).

Check out secure open.mp alternative if you really want to run the project: https://open.mp

Simply install to your project:

```bash
sampctl package install Hype02/szkodnik-rp
```

Include in your code and begin using the library:

```pawn
#include <szkodnik-rp>
```

## Usage

<!--
Write your code documentation or examples here. If your library is documented in
the source code, direct users there. If not, list your API and describe it well
in this section. If your library is passive and has no API, simply omit this
section.
-->

## Testing

<!--
Depending on whether your package is tested via in-game "demo tests" or
y_testing unit-tests, you should indicate to readers what to expect below here.
-->

To test, simply run the package:

```bash
sampctl package run
```
