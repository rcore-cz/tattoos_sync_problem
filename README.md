# FiveM Addon Tattoos Bug

## Brief problem description

Some tattoos are not syncing to other players, even though they are loaded and streamed correctly. This happens only with some tattoos, and the ones that are not visible depend on the server build. The problem does not seem to be related to exceeding the TxdStore pool, loaded ytds, or the number of addon tattoos ingame. The problem also occurs with base GTA tattoos.

Long description and stuff we know so far available in the [forum post](https://forum.cfx.re/).

<!-- TODO: add link -->

## How to use

1. ❗ Use server build 2802 (`set sv_enforceGameBuild 2802` in server.cfg) ❗
2. Start the resource as a whole folder to also load the addon tattoos! - `ensure [tattoos_problem]`
3. Make sure to not have any other addon tattoos loaded.
4. Regarding point 4, a clean server is recommended.
5. Go ingame with two different clients/players

- **P1** - Player 1
- **P2** - Player 2

1. **P1** - `/tat_naked` (_get's naked, if not, change id's in config_)
2. **P1** - `/tat_apply` (_applies 3 tattoos, 1 from GTA (tribal), 2 addon (flame, chicken)_)
3. **P2**
   1. Look at P1 body, you should see flame tattoo on left forearm and chicken tattoo on right calf.
   2. There is also a tribal tattoo on right shoulder you don't see.
4. **P2** - `/tat_request` (_requests the texture dir of the tribal tattoo (`mp_bea_tat_m_009.ytd`) for P2, but doesn't help_)
5. **P1** - `/tat_apply` (_Reapply tattoos just to be sure_)
6. **P2** - Still shouldn't see the tribal tattoo
7. **P1** - `/tat_restart` (_Restarts `addon_tattoos_test2` pack so it loads it's textures_)
8. **P1** - `/tat_apply` (_Reapply tattoos after pack restart_)
9. **P2** - Should now see the tribal tattoo even though all started textures are the same as before, just the order changed in step 7
