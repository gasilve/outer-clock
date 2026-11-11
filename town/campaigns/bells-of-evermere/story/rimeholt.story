== rh-arrival
cutscene
# (the retrograde motif from the first frame: on black the runner waits for its renders)
music rimeholt
teleport player rh-arrive up
teleport corin rh-corin up
walk corin rh-corin nowait
teleport wenna rh-wenna up
walk wenna rh-wenna nowait
teleport tin rh-tin up
walk tin rh-tin nowait
# on black: the ice gate over the causeway, its fires, the barracks ward lit beyond; then up to the aurora for the toll
shot on rh-gate-view yaw 0 pitch 8 dist 26 fov 44 lift 7
fade in 2.5
shot on rh-gate-view pitch 3 dist 22 lift 13 8 nowait
wait 2.2
# the Hush Bell at the head of the climb: its motif comes down the mountain backwards
toll hush_bell 0.7
wait 3.6
# Linnet looks up at the citadel: a bell-founder hears what is wrong with that bell
shot on player yaw 190 pitch 10 dist 9 fov 28 lift 0.6
face player rh-vista
face corin rh-vista
face wenna rh-vista
face tin rh-vista
shot on player dist 8 5 nowait
player: Hear the beat in it? That bell's been tuned against itself. On purpose. #line:8AF07846858D073603992A5FD1B28CDB
# Corin, beside her, turns to the others
shot on corin yaw 145 pitch 12 dist 9.5 fov 28 lift 0.6
face corin player
shot on corin dist 8.5 5 nowait
Corin: Last chance for anyone to confess they've been lying this whole time… #line:A9250F38913DF9946C7FCD4430DBA047
# the silent knight answers with its note
shot on tin yaw 170 pitch 12 dist 9 fov 28 lift 0.8
face tin rh-vista
sfx tuningFork
bark tin ♪ #line:10BD03726AB2D361577E0BE0788A781D
shot on tin dist 8 3 nowait
wait 1.4
shot on corin yaw 145 pitch 12 dist 8.5 fov 28 lift 0.6
face corin player
shot on corin dist 8 3 nowait
Corin: No? Just me, then. #line:D9EE575DF5D3DFF1288A5ED48C22C053
shot on wenna yaw 215 pitch 12 dist 9 fov 28 lift 0.6
face wenna corin
shot on wenna dist 8 4 nowait
Wenna: Noted. One confession, unpaid. I'll put it under sundries. #line:87AF15969B89071A82C97BFCE688D9D5
shot reset 1

== rh-gate
bark wenna When that bell goes, stand by a fire. I'm not paying to dig anyone out. #line:D8E2694E8837AA82A1281352194E4B9C

== rh-barracks
cutscene
walk player rh-ward-linnet nowait
teleport corin rh-ward-corin up
walk corin rh-ward-corin nowait
teleport wenna rh-ward-wenna up
walk wenna rh-ward-wenna nowait
teleport tin rh-ward-tin up
walk tin rh-ward-tin nowait
# the ward from above its stair: the barracks, the dark braziers, the Long Stair beyond
shot on rh-ward yaw 0 pitch 36 dist 26 fov 34 lift 1
shot on rh-ward dist 22 6 nowait
wait 1
toll hush_bell 0.8
wait 2.4
wait player
# the four abreast at the head of the stair, looking over the ward: their faces from the north
shot on wenna yaw 200 pitch 12 dist 9 fov 28 lift 0.6
face wenna player
face player rh-ward
face corin rh-ward
face tin rh-ward
shot on wenna dist 8 6 nowait
Wenna: Three beats, then the cold comes down. Anyone not by a fire went flat at the gate — I counted. #line:4B94FDE9ADF44E03CA9A664D3194D811
shot on player yaw 165 pitch 12 dist 9 fov 28 lift 0.6
face player rh-ward
shot on player dist 8 5 nowait
player: Then we light our own. Brazier iron holds its heat. It only wants a spark. #line:FF7C628C654C9B791592CC71F852D85A
shot reset 1

== rh-lit
sfx braziersLit
seq rh-lit
  * bark player There. Warm iron. #line:F1BB36DB36B73C6C2B5E121F77FF279F
  * bark corin Oh, that's lovely. I'm never leaving this spot. #line:AF3C47DF8ED4F6DAB63D1003B1E920C6
  * bark wenna One brazier's worth of coal. Billed to the King. #line:492E37CE20A044CEC7004F8864407FEB
  *
    sfx tuningFork
    bark tin ♪ #line:6ECB2BF903918B9C3D251630CFDAF51E
  * bark player Stay by the fire when it rings. #line:698E7BC6E2982993DB1FF94F7161B297
  * bark corin Warmest I've been since the Blossomwood. Which was frozen. #line:5D05FFFEC6C4AE7C68BE9943E61052DF
  * bark wenna Seven fires. I'll want a receipt. #line:71FFBD8E462542C30069E8AAABE83EFE

== rh-long-stair
cutscene
set rh-stair
walk player rh-stair-linnet nowait
teleport corin rh-stair-corin up
walk corin rh-stair-corin nowait
teleport wenna rh-stair-wenna up
walk wenna rh-stair-wenna nowait
teleport tin rh-stair-tin up
walk tin rh-stair-tin nowait
# up the stair from the first landing: the Hushguard come down it in ranks
shot on rh-stair-top yaw 0 pitch 20 dist 24 fov 32 lift 2
toll hush_bell 0.9
shot on rh-stair-top dist 19 4.4 nowait
wait 3.4
wait player
# the four abreast on the landing, the stair before them: their faces from up the stair
shot on wenna yaw 195 pitch 12 dist 9 fov 28 lift 0.6
face wenna rh-stair-top
face corin rh-stair-top
face tin rh-stair-top
face player rh-stair-top
pose wenna ready
shot on wenna dist 8 3 nowait
Wenna: I make it seven. And two of the bell-ringers behind them. #line:439C6A299D3ACE8C0FE7856361DBB479
# (Corin stands west of the stair: his camera stays over the stair, clear of the wall beside it)
shot on corin yaw 150 pitch 12 dist 9 fov 28 lift 0.6
face corin rh-stair-top
shot on corin dist 8 3 nowait
Corin: That's not a garrison. That's a choir. #line:71C1A454071FCAF2CACE66704B195D0B
shot on player yaw 185 pitch 10 dist 8.5 fov 28 lift 0.6
face player rh-stair-top
pose player ready
shot on player dist 7.5 3 nowait
player: Light the fires first. Then them. #line:6F42793D49F87127B5EB32A4FD70F884
pose wenna none
pose player none
shot reset 0.8

== rh-last-waystone
cutscene
walk wenna rh-ws-wenna nowait
walk tin rh-ws-tin nowait
walk player rh-ws-linnet
wait wenna
face player wenna
shot on wenna yaw 220 pitch 12 dist 9 fov 28 lift 0.6
face wenna player
shot on wenna dist 8 6 nowait
Wenna: Whatever he is up there, he's your family. I'll bill him gently. #line:F1D94AF5443D52A52239E4BB504F88FC
# (from the north: the waystone, north-east of Wenna, stays out of the frame and off every face)
shot on player yaw 165 pitch 12 dist 9 fov 28 lift 0.6
face player wenna
shot on player dist 8 4 nowait
player: Itemise it. He likes a thing done properly. #line:61924768EAFE34937C1A7F273B5637B8
wait tin
shot on tin yaw 200 pitch 14 dist 10 fov 30 lift 1.2
face tin rh-doors
emote tin ...
shot on tin dist 9 3.5 nowait
wait 2.4
shot reset 1
