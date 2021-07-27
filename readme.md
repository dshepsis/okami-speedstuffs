# Ōkami Speedstuffs

**TL;DR** Speedtools. Read the first bulleted list below/just go through the repo.

This is, as you can tell at the top left of your screen, a fork of a repo for tools related to Ōkami speedrunning. FWIW, [here's the original repo](https://github.com/speedfuns/okami).

This repo includes:
- `okami.ct` - [Cheat Engine](https://cheatengine.org) Table for Ōkami on PC
- `okami.asl` - Autosplitter for [LiveSplit](https://livesplit.org). Refer to [Resources below](#resources)
-  `omg.cetrainer` - A cheat tool made by [Auride](https://github.com/dshepsis). Refer to [About the .CETrainer below](#about-the-cetrainer)

## About the .CETrainer
First off, `omg.cetrainer` is NOT intended to be used in actual runs, for soon-to-be obvious reasons.
It allows you to do a few things:
- Skip the splash images and head straight to the title screen
- Toggle movement cheats; see below
- Toggle noclip
- Teleport to specfic coordinates in your current level; see below

The movement cheats make you run super fast and have infinite jumps. Useful for debugging the autosplitter, for example.

The teleport input takes the format `<x, y, z>` or `<x y z>`. You can have any character surrounding the triplet; it just gets ignored. By current level, I mean all locations that are currently loaded in memory which constitute a level. For example, all interiors and exteriors of Sasa Sanctuary is in the same level. It will also teleport you out of bounds of course. 

## Resources

[Ōkami Leaderboard](https://www.speedrun.com/Okami)  
[Ōkami Speedrunning Discord](https://discord.gg/AQNKmMu)
[Link to their GH, specifically their repo that holds documentation on writing an autosplitter script](https://github.com/LiveSplit/LiveSplit.AutoSplitters)

## Contributors

[Cielos](http://fearlessrevolution.com/viewtopic.php?t=5629) for the original cheat table  
[Lyriati](https://www.github.com/lyriati)  
[rekyuu](https://www.twitch.tv/rekyuus)
[Auride](https://github.com/dshepsis)
<br />And me
