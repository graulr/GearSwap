## Want the benefits of gearswap without having to learn how to program?
### You've come to the right place. <br> Create a fully functional gearswap file in under 10 minutes.
###### This guide assumes you have downloaded and installed [Windower](http://windower.net/)
<br/>

## 1. Enable the gearswap addon in Windower

<p align="center">
  <img src="http://g.recordit.co/X5bGnwoCYE.gif">
</p>
<br/>

## 2. Download [Sublime Text](https://www.sublimetext.com/3), install, and pin to task bar
<p align="center">
    <img src="http://g.recordit.co/0KlKSu6GDs.gif">
</p>
<br/>

## 3. Download the <a href="https://github.com/graulr/GearSwap/releases">latest release</a> and unzip
#### Take note where you unzip the folder
<br/>

## 4. Navigate to `windower/addons/gearswap/data/`
<p align="center">
    <img src="http://g.recordit.co/tRaVbyLdip.gif">
</p>
<br/>

## 5. Set `windower/addons/gearswap/data/` in quick access
#### You will be going here often and this will make it much easier to find
<p align="center">
    <img src="http://g.recordit.co/sQe9Cplwj7.gif">
</p>
<br/>

## 6. Copy `base_gearswap +1.lua` into `windower/addons/gearswap/data/`
<p align="center">
    <img src="http://g.recordit.co/cIbiaYDCtk.gif">
</p>
<br/>

## 7. Create a duplicate `base_gearswap +1.lua`
#### Name the duplicate in the following format: `charactername-job.lua`
#### Example: `graulr-cor.lua` if my character's name is **Graulr** and my job is **Corsair**
<p align="center">
    <img src="http://g.recordit.co/QKzG5KPXc1.gif">
</p>
<br/>

## 8. Associate `.lua` files with Sublime Text editor 
#### **Do not** use Microsoft Word or other rich text editors to edit .lua files
<p align="center">
    <img src="http://g.recordit.co/eoeNyHbwMi.gif">
</p>
<br/>

## 9. In FFXI equip your idle set
#### A base set of gear that you typically stand around in
<p align="center">
    <img src="https://i.imgur.com/4LIjJxQ.gif">
</p>
<br/>

## 10. Run `//gs export` in game
<p align="center">
    <img src="http://g.recordit.co/Rc8JB8mm5T.gif">
</p>
<br/>

## 11. Open up `windower/addons/gearswap/data/` in Sublime Text editor
<p align="center">
    <img src="http://g.recordit.co/eN4AM7OMyN.gif">
</p>
<br/>

## 12. Copy the set you exported, paste it into the Idle set within your new gearswap file, and **save**
<p align="center">
    <img src="https://i.imgur.com/svKztVj.gif">
</p>
<br/>

## 13. Run `//gs load charactername-job.lua` in game
#### After running this command, this file will be automatically loaded whenever you switch to this job in game.
<p align="center">
    <img src="https://i.imgur.com/9Sh0kt8.gif">
</p>
<br/>

## 14. Setup macros in your new gearswap file
#### Whenever you switch jobs/subjobs, your macro books will automatically be set by default
<p align="center">
    <img src="https://i.imgur.com/ldfn3yK.gif">
</p>
<p align="center">
    <img src="http://g.recordit.co/5O7STfxGbk.gif">
</p>
<br/>

## 15. Run `//gs reload` in game
#### Whenever you update a gearswap file **while playing the game**, you need to run the reload command to get your latest changes.
<p align="center">
    <img src="https://i.imgur.com/83xkiom.gif">
</p>
<br/>
