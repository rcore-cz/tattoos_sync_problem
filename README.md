# FiveM Addon Tattoos Bug

- This repository is used to reproduce tattoo texture and sync bug in FiveM.

## How to use

- **P1** = Player 1
- **P2** = Player 2

<br>

1. Start the resource as whole folder in server.cfg❗ - `ensure [tattoos_problem]`
2. Go ingame with two different clients/players

3. **P1** - `/tat_naked` (_get's naked, if not, change id's in config_)
4. **P1** - `/tat_apply` (_applies 3 tattoos, 1 from GTA (tribal), 2 addon (flame, chicken)_)
5. **P2**
   1. Look at P1 body, you should see tribal tattoo on right shoulder and flame tattoo on left forearm.
   2. There is also tattoo of a chicken on right calf that you don't see.
6. **P2** - `/tat_request` (_requests the texture dir of the chicken (`test2_10.ytd`) for P2, but doesn't help_)
7. **P1** - `/tat_apply` (_Reapply tattoos just to be sure_)
8. **P2** - Still shouldn't see the chicken tattoo
9. **P1** - `/tat_restart` (_Restarts `rcore_addon_tattoos_test2` pack so it becomes last pack started_)
10. **P1** - `/tat_apply` (_Reapply tattoos after pack restart_)
11. **P2** - Should now see the chicken, but flame tattoo from test pack 3. disappears
