# **Bug description**

Some tattoos are not syncing to other players. In other words, you have a tattoo, but someone else does not see it. This seems like a problem with quick answer and solution, however the more we digged into it, the more we got confused.

### **Here’s all we know** _(Bug reproduction script at the end)_

1. The tattoos you don’t see depend on the server build you have. Best guess for this is that each new dlc adds some tattoos and probably shifts some indexes of loaded textures?
2. Tattoos sometimes aren't visible even on the player themselves, but most of the time, the player can see their own tattoos while others can't.
3. The number of tattoos does not seem to affect the issue. We tried adding different quantities of addon tattoos, and oddly enough, a larger number of tattoos sometimes synced when smaller did not.
4. Initially, we thought the issue could be related to having too many addon textures streamed, but even after loading our server with every addon we could find (including a custom addon clothes pack with over 15000 different ytds), the problem remained. The number of ytds that aren't tattoos doesn't seem to affect the problem. (the ytds were loaded for player, we precisely loaded amount to be a bit lower than TxdStore pool to not crash the game if anything else loads)
5. We tried it on different PCs and various servers (ESX, QB, vRP, clean, with scripts/without, with small/large amount of addon stuff and more..). Same results on all platforms.
6. We made different addon tattoo packs and streamed them as separate scripts for testing. Interestingly, when we loaded e.g. 4 packs and started only 3, the tattoos from the third pack were not visible. When we started the fourth pack (with a server restart to load all textures), tattoos from the third pack started appearing, but some from other packs disappeared. (Another hint to the “index shifting” suggested in first point?)
7. We confirmed the problem is not related to exceeding the TxdStore pool. Adding more ytds (as in point 4) results in a crash due to exceeding the pool size (95500), which does not happen in the case of the tattoo syncing issue.
8. The ytd file for the non-loading tattoo is correctly listed in both players' streaming lists.
9. Manually requesting the ytd for a player who can't see it on another player doesn't fix the issue. The ytd is requested and loads correctly when checked with the native function, but the player still can't see it even after restarting the pack the ytd is from. (Example shown in script provided below)
10. It doesn't seem to be an issue with streaming list _(F8 > Tools > Streaming > Streaming list)_ indexes either. For example, a tattoo with index 35793 wasn’t syncing, but one with index 35818 was.
11. One idea to overcome this was to check for players in close radius, get their tattoos and request all the ytds for yourself. This idea, as you may have guessed, didn’t work as we found out that requesting and loading the ytd is not the problem as said in point 9.
12. If it wasn’t obvious from the points above, we don’t think the addon tattoo files are the problem. They seem to stream just fine when we start different numbers of packs or use them on another server build (where of course some tattoos that worked before stop working).
13. You can actually see the non-syncing tattoo on yourself, so it is loaded for you, but can’t get it to sync from other player to see it on their body.
14. The character with the tattoo has the texture dict loaded (checking with `HasStreamedTextureDictLoaded` ), whereas the second char, that does not see it, doesn’t. (Can be tried out in the testing script with `/tat_request`)
15. One interesting thing we have found while finishing the bug reproduction script, is that the name of the xml files of addon tattoos affect the loading of the textures. (= differently named xml files resulted in different tattoos visible ingame, both base and addon)
16. And the last point where it get’s even crazier.. it does not happen only with addon tattoos, but with base GTA tattoos too. You can see it even in the reproduction package.

❗ **Steps to reproduce are in [README](README.md)**. Pay attention to the requirements, as said before, each server build has this problem only with some tattoos, to see it in action, use server build provided in README to see the bug with tattoos in this build. (other build would have same problem only with different tattoos).
