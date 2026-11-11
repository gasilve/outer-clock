== bw-arrival
cutscene
set bw-arrived
teleport player bw-entry up
# on black: high in the crown of the cherry by the road, the branches heavy with snow; the walk and the crane start under the fade in
shot on bw-crown yaw 350 pitch 6 dist 11 fov 24 lift 4.8
walk player bw-halt nowait
fade in 2
shot on bw-crown yaw 20 pitch 20 dist 9 fov 32 lift 1.2 5 nowait
wait 3.2
wait player
# her face as she looks up into the branches (from the west: the road clear between)
face player bw-crown
shot on player yaw 288 pitch 12 dist 9 fov 26 lift 0.6
shot on player yaw 291 dist 7.8 6.7 nowait
player: Buds. Every one of them shut tight under the ice, like a casting left too long in the mould. #line:1415FC8BF825157FC3641C5ECF17A75F
# the wood beyond: the way north, high over the valley of the chimes
shot on bw-wood yaw 0 pitch 40 dist 44 fov 38 lift 2
shot on bw-wood yaw 0 pitch 36 dist 40 6 nowait
player: Grandda said the Bell of Waking was tuned to open them. Let's see if he was right. #line:66461843AFE2664B2C921FD3BFC01A5A
shot reset 1
quest bw-chimes start

== bw-snare
cutscene
# the cord snaps tight round her ankle: down she goes
teleport player bw-snare-linnet up
sfx iceCrack
shake 0.25
pose player kneel
emote player !
shot on player yaw 20 pitch 14 dist 8.5 fov 28 lift 0.6
shot on player yaw 26 dist 7.5 2.4 nowait
wait 1
# Corin bursts out from behind his crates, crowing
walk corin bw-snare-corin run nowait
shot on corin yaw 320 pitch 14 dist 10 fov 30 lift 0.6
bark corin Got you, you thieving— #line:D724AB7DB72A9DB188242386269828EE
wait corin
# the hammer by reflex: one swing, the flat of it
face player corin
pose player ready
wait 0.3
sfx hammerHit
shake 0.4
emote corin sweat
pose corin kneel
pose player none
face player bw-snare-look
face corin bw-snare-look
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
shot on corin yaw 355 dist 7.8 3.5 nowait
Corin: Ow! I set it for a bear. A small bear. #line:02D0F74A755B45E4E022B09E00525D04
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
shot on player yaw 11 dist 7.8 2.6 nowait
player: You set it on the road. #line:65A88D3BE005F7EFDB9AF760C5A56F71
pose corin none
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin bw-snare-look
shot on corin yaw 355 dist 7.8 13.3 nowait
Corin: Bears use roads. Everybody uses roads. That's what makes them roads. #line:9377D55DCBB2B23262FCE0FA13FC9C07
Corin: Corin Ashby — poacher, guide, last man in the Blossomwood. And that's a bell-founder's hammer, so you're the Halloway girl. #line:5E013A7011D4E45A2E6F370B7B0873A0
# the two abreast, from the front
shot on bw-snare-mid yaw 0 pitch 14 dist 11 fov 30 lift 0.6
face player bw-snare-look
face corin bw-snare-look
shot on bw-snare-mid yaw 4 dist 10 4.8 nowait
player: Linnet. I'm going up to the shrine to ring the Bell of Waking. #line:5D11B696F6241D99F268EBAD5CFF5A13
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
shot on corin yaw 355 dist 7.8 11.6 nowait
Corin: Up past the chimes, past the falls, past whatever's been living on that hill since the frost came. You'll want a guide. #line:00492F4FD3DB19F280C3D5F186AE70F7
Corin: I'll take you. For a bell's worth of bronze. #line:6566875B293A95FDC8A339400AE6D075
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
shot on player yaw 11 dist 7.8 4.1 nowait
player: Do you know what a bell's worth of bronze weighs? #line:561BE8996D1A052B4D6A891E92E4468A
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
shot on corin yaw 355 dist 7.8 3.5 nowait
Corin: No. That's what makes it a good price. #line:7C67DFA011C799CEBD216E7B35D6DC3C
party join corin as ranger
set corin-joined
shot reset 1
quest bw-chimes stage guide

== bw-chime-turn
if bw-chime-turn
  face player chime_turn
  toll chime_turn 0.7
  call bw-note-turn
  stop
cutscene
walk player bw-turn-linnet nowait
if party:corin
  walk corin bw-turn-corin nowait
wait player
face player chime_turn
shot on chime_turn yaw 300 pitch 12 dist 8 fov 28 lift 1.4
shot on chime_turn yaw 306 dist 7 3 nowait
wait 0.4
sfx hammerHit
toll chime_turn 1
set bw-chime-turn
var bw-chimes + 1
wait 1.4
# the stream runs: a log comes down it and lodges across the ravine where the bridge was
shot on bw-log yaw 70 pitch 22 dist 12 fov 32 lift 0.6
shot on bw-log yaw 76 dist 11 4.5 nowait
wait 1.4
if party:corin
  Corin: That log's been stuck upstream since the first winter. I'd have charged you a toll to cross it. #line:5CD43AA8DFC6E0BE2B25CA543BBFE101
else
  player: The stream heard it. Well. There's my bridge. #line:BF019AE9C109FC59C17C58021946CD0C
if bw-chimes >= 3 and not bw-gate-open and not bw-song-heard
  call bw-song-turn
call bw-note-turn

== bw-chime-gold
if bw-chime-gold
  face player chime_gold
  toll chime_gold 0.7
  call bw-note-gold
  stop
cutscene
walk player bw-gold-linnet nowait
if party:corin
  walk corin bw-gold-corin nowait
wait player
face player chime_gold
shot on chime_gold yaw 60 pitch 12 dist 8 fov 28 lift 1.4
shot on chime_gold yaw 54 dist 7 3 nowait
wait 0.4
sfx hammerHit
toll chime_gold 1
set bw-chime-gold
var bw-chimes + 1
wait 1.4
# the falls burst free; the ice drops off the recess beside them
shot on bw-falls yaw 350 pitch 20 dist 15 fov 34 lift 1.6
shot on bw-falls yaw 346 dist 13 5 nowait
sfx fallsBreak
wait 0.8
sfx iceBreak
effect thaw bw-recess 0.8
wait 1.2
if party:corin
  Corin: Seven years that water's been holding its breath. Hark at it go. #line:9631D691C9E69DCE2A71726F95863BB4
else
  player: There was a hollow behind the ice all along. #line:575DF8030F6943FEEE753A17EF7B2CCB
if bw-chimes >= 3 and not bw-gate-open and not bw-song-heard and bw-song != 2
  call bw-song-gold
call bw-note-gold

== bw-chime-wake
if bw-chime-wake
  face player chime_wake
  toll chime_wake 0.7
  call bw-note-wake
  stop
cutscene
walk player bw-wake-linnet nowait
if party:corin
  walk corin bw-wake-corin nowait
wait player
face player chime_wake
shot on chime_wake yaw 300 pitch 12 dist 8 fov 28 lift 1.4
shot on chime_wake yaw 306 dist 7 3 nowait
wait 0.4
sfx hammerHit
toll chime_wake 1
set bw-chime-wake
var bw-chimes + 1
wait 1.4
# the drift on the brook slumps and runs away: the old root bridge underneath
shot on bw-roots yaw 340 pitch 24 dist 12 fov 32 lift 0.6
shot on bw-roots yaw 346 dist 10.5 5 nowait
effect thaw bw-roots 0.9
wait 1.6
if party:corin
  Corin: The root bridge. I'd forgotten it was under there. So had the roots, I expect. #line:5BE10955762EE8A1241BC9D7CFF0B253
else
  player: A bridge under the drift. Roots, grown across on purpose. #line:487DF1D93605F4337760EE4CA480315C
if bw-chimes >= 3 and not bw-gate-open and not bw-song-heard
  call bw-song-wake
call bw-note-wake

== bw-song-wake
cutscene
set bw-song-heard
face player bw-wake-look
face corin bw-wake-look
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-wake-look
face corin bw-wake-look
shot on corin yaw 355 dist 7.8 6.7 nowait
Corin: Three chimes rung, and the hill's still shut. Maybe it wants a fourth. Maybe it wants a fee. #line:C0C63D0FBE6F6F1EC5EC20CC4D4973B9
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-wake-look
face corin bw-wake-look
shot on player yaw 11 dist 7.8 11 nowait
player: It wants them in order. Those three notes — they're the start of Mam's song. #line:E24A0C67E11B8A78DBF5BE8D84483A6D
player: Wake, little blossom… turn, little tide… gold, little field. Wake, turn, gold. #line:CDF64CE00F013692428A8B42DB6B57D7
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-wake-look
face corin bw-wake-look
shot on corin yaw 355 dist 7.8 4.7 nowait
Corin: You're telling me somebody tuned a whole wood to a lullaby. #line:F41439BE9912BF2F3859B6055130D96F
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-wake-look
face corin bw-wake-look
shot on player yaw 11 dist 7.8 5 nowait
player: Somebody tuned these chimes. Bronze does what it was cast to do. #line:16514465F679A4C83DD9A19C9DDE2C2D
quest bw-chimes stage order
shot reset 0.8

== bw-song-turn
cutscene
set bw-song-heard
face player bw-turn-look
face corin bw-turn-look
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-turn-look
face corin bw-turn-look
shot on corin yaw 355 dist 7.8 6.7 nowait
Corin: Three chimes rung, and the hill's still shut. Maybe it wants a fourth. Maybe it wants a fee. #line:BCD89318AC14CEC01D4367BF1A069601
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-turn-look
face corin bw-turn-look
shot on player yaw 11 dist 7.8 11 nowait
player: It wants them in order. Those three notes — they're the start of Mam's song. #line:5EF55C0F1BADA46EA5CD682CDD055A76
player: Wake, little blossom… turn, little tide… gold, little field. Wake, turn, gold. #line:4145B64221771864267D938BD0A3026A
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-turn-look
face corin bw-turn-look
shot on corin yaw 355 dist 7.8 4.7 nowait
Corin: You're telling me somebody tuned a whole wood to a lullaby. #line:94E21402652E5FF943820583F5B7F7E0
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-turn-look
face corin bw-turn-look
shot on player yaw 11 dist 7.8 5 nowait
player: Somebody tuned these chimes. Bronze does what it was cast to do. #line:EAF1BD5552BB72CFD50B98F1766D4666
quest bw-chimes stage order
shot reset 0.8

== bw-song-gold
cutscene
set bw-song-heard
face player bw-gold-look
face corin bw-gold-look
shot on corin yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-gold-look
face corin bw-gold-look
shot on corin yaw 11 dist 7.8 6.7 nowait
Corin: Three chimes rung, and the hill's still shut. Maybe it wants a fourth. Maybe it wants a fee. #line:8B9F6CE4D810477B36E765533B5602B5
shot on player yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-gold-look
face corin bw-gold-look
shot on player yaw 355 dist 7.8 11 nowait
player: It wants them in order. Those three notes — they're the start of Mam's song. #line:FB3E2248685742C1CF347027B647EAC6
player: Wake, little blossom… turn, little tide… gold, little field. Wake, turn, gold. #line:56DBA1618D1132450691B66996A8C164
shot on corin yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-gold-look
face corin bw-gold-look
shot on corin yaw 11 dist 7.8 4.7 nowait
Corin: You're telling me somebody tuned a whole wood to a lullaby. #line:58D553E8AAE21DE3185CAAC570886056
shot on player yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-gold-look
face corin bw-gold-look
shot on player yaw 355 dist 7.8 5 nowait
player: Somebody tuned these chimes. Bronze does what it was cast to do. #line:7BBCB1C5FF4F14E75ABE71CDE53FC787
quest bw-chimes stage order
shot reset 0.8

== bw-note-wake
var bw-song = 1
bark player Wake… #line:88FB4D00085E583208F38489712C9775

== bw-note-turn
if bw-song = 1
  var bw-song = 2
  bark player …turn… #line:3116F7320ED8FE64043636F3F519B6CF
  stop
var bw-song = 0
if bw-song-heard
  emote player ...

== bw-note-gold
if bw-song = 2
  var bw-song = 3
  call bw-gate
  stop
var bw-song = 0
if bw-song-heard
  emote player ...

== bw-gate
cutscene
wait 0.6
# up on the hill, the gate between the old statues: its ice cracks and falls away
shot on bw-gate yaw 0 pitch 22 dist 16 fov 32 lift 2
shot on bw-gate yaw 6 dist 14 5 nowait
wait 0.5
sfx iceCrack
wait 0.5
set bw-gate-open
sfx iceBreak
effect thaw bw-gate 1.3
shake 0.3
wait 1.6
shot on player yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-gold-look
shot on player yaw 355 dist 7.8 4.5 nowait
player: Wake, turn, gold. The gate heard it. Up the hill, then. #line:F6EA5DE509F7F52D6AF9DBCBD60ED1AD
shot reset 0.8
quest bw-chimes stage gate

== bw-hum
emote corin note
cycle bw-hum
  * bark corin ♪ Wake, little blossom… ♪ #line:D981DCF8160EB16D5976E042862A2EA1
  * bark corin Wake first. Then turn. Then gold. Even I've got it now. #line:8CB15DD04B2B4A1CBD7D9295181ACA3F
  * bark corin ♪ …turn, little tide… gold, little field… ♪ #line:6EA3DEBB5AE2F0B313AC84C33956A6F1

== bw-tale
cutscene
walk player bw-tale-linnet nowait
walk corin bw-tale-corin nowait
# the falls frozen mid-pour, from the pool's shore (B1: the morning shafts through the spray of ice)
shot on bw-falls yaw 340 pitch 24 dist 26 fov 26 lift 3
shot on bw-falls yaw 344 pitch 22 dist 23 6 nowait
wait player
wait corin
face player bw-tale-look
face corin bw-tale-look
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on corin yaw 355 dist 7.8 6.9 nowait
Corin: See the falls? Froze the night the bells stopped. Mid-pour. I was standing about where you are. #line:4C6D5EC1CFF8A67F52BEF4BAAB999C95
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on player yaw 11 dist 7.8 1.7 nowait
player: Poaching. #line:19ED5DC70B7C4E1E9A80D0FD86572A8F
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on corin yaw 355 dist 7.8 19.6 nowait
Corin: Observing. Black as a boot, that night, and a man came up the north road through the storm — tall, a long coat, striking something on his hand. A little fork. Ting. Ting. #line:816035CD9279065DAEA62356DF6D2628
Corin: And the Hushguard came out of the snow behind him. Dozens. Following the note like hounds after a horn. North, the lot of them. #line:C5900A5C01904326D4422451BA9FEBEA
# Linnet: the fork. She says nothing more (a silence, written: her grandfather's fork is gone from its hook)
shot on player yaw 8 pitch 12 dist 8 fov 24 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on player yaw 11 dist 6.8 1.7 nowait
player: …A fork. #line:B7E1A25F42CD61A7A6C088BDF402D0EA
wait 1.6
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on corin yaw 355 dist 7.8 4.3 nowait
Corin: Every word of it's true. Most of the words, anyway. #line:599F001E2C16AFD2F20ED5487FE55492
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on player yaw 11 dist 7.8 2.9 nowait
player: Nobody believes you, do they? #line:8DD9E2A4436CD063F424B39CED938A5C
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player bw-tale-look
face corin bw-tale-look
shot on corin yaw 355 dist 7.8 2.4 nowait
Corin: Not for seven years. #line:6681ECAACC0E8D634CC7C7A24BE7BC05
shot reset 1

== bw-stag
cutscene
walk player bw-mouth-linnet nowait
walk corin bw-mouth-corin nowait
# B2: the glade between two snow-capped cherries at the gate, still and white
shot on bw-glade yaw 20 pitch 10 dist 16 fov 30 lift 3.5
shot on bw-glade yaw 22 dist 14.5 6 nowait
wait player
wait corin
# the two from behind as they look into the empty glade
shot on bw-mouth-mid yaw 0 pitch 12 dist 9 fov 30 lift 1.2
face player up
face corin up
shot on bw-mouth-mid yaw 4 dist 8 4.4 nowait
Corin: Never been up this far. The deer won't come past the steps. #line:A515B41BA4A729AF6C2EEA33804899D4
# the stag comes with the flag; its intro plays in the scene (the ambient step): the head rises out
# of the frost at f40, the bellow at f84, the intro done at f150 — framed through the gate, between
# its two cherries
shot on rimehart yaw 0 pitch 10 dist 16 fov 30 lift 3.5
set bw-stag-wakes
shot on rimehart yaw 0 dist 14.5 3.2 nowait
wait 1.4
shake 0.35
emote player !
emote corin !
wait 1.2
# the card after the bellow, beside the stag (from the south-south-west: it stands in the left third)
shot on bw-stag-card yaw 340 pitch 10 dist 16 fov 30 lift 3.5
title Rimehart | the Stag of the Waking Wood #line:097A0D0E486470324A142517BA7C97AC
# their singles from inside the glade, the stag's side (the arena's ice wall rose south of them: behind them now)
# (from due north: the old cherry east of the way in keeps its crown off the lens)
shot on corin yaw 184 pitch 12 dist 7 fov 22 lift 0.6
# (a member is pinned on its mark — a zero-length walk directs it — and re-faced after every cut;
# toward a place, so he faces the glade and the lens: a member's `face up` is the screen's up)
walk corin bw-mouth-corin
face corin bw-glade
shot on corin yaw 182 dist 6.4 2 nowait
Corin: …That's not a bear. #line:39772AB5249F1C71931530190C22ABE8
shot on player yaw 190 pitch 12 dist 7 fov 22 lift 0.6
shot on player yaw 192 dist 6.4 1.5 nowait
player: No. #line:93E991B0C77484FFCC34E40B79FF8F8A
shot reset 0.6

== bw-stag-down
cutscene
set bw-stag-down
# the two walk to their marks south of the arena while the stag falls into its shell
walk player bw-down-linnet nowait
if party:corin
  walk corin bw-down-corin nowait
wait 1
shot on rimehart yaw 0 pitch 16 dist 13 fov 30 lift 2
shot on rimehart yaw 4 dist 11.5 4 nowait
wait player
if party:corin
  wait corin
  face corin rimehart
face player rimehart
# their singles from the south-west and the south-east: the shell behind them
if party:corin
  shot on corin yaw 30 pitch 12 dist 8 fov 26 lift 0.6
  shot on corin yaw 33 dist 7 2.6 nowait
  Corin: Is it… dead? #line:AFD5691D92F07763AFF92EFB355DC0F1
shot on player yaw 330 pitch 13 dist 9 fov 26 lift 0.6
face player rimehart
shot on player yaw 327 dist 7.8 7.2 nowait
player: It's breathing. Frost, but breathing. It isn't the stag that's wrong — it's the cold in it. #line:4CAD349F5ACF46B61C222BF88420EF13
if party:corin
  shot on corin yaw 30 pitch 12 dist 8 fov 26 lift 0.6
  face corin player
  shot on corin yaw 33 dist 7 4.4 nowait
  Corin: Then ring your bell, bell-founder, and let's see what it does. #line:9BA22EB7888D8E6BACB5AAEFCE974080
shot reset 0.8
quest bw-chimes done

== bw-toll
cutscene
teleport player bw-ring up
# (Corin parked south-east of the ring point: out of the hammer's close-up from the east)
if party:corin
  teleport corin 45.5 13.3 up
  walk corin 45.5 13.3
# (the flag first: the release waits for the thaw, and the front stages what it brings and takes —
# the drifts, the dust and mist, the petals, the birds, the keeper, the stag's shell)
set bell-waking
# the shared toll shot to the bell, the front leaving it (18 s across the wood: slower than the
# default, so the landmark comes after the stag with the front still in its frame)
# the hammer: a close-up from the east side, the tower beside it (every ring point stands 3.4–4.2 u
# south of its bell: a camera north of the player would stand in the belfry); her whole figure
# above the letterbox, the hammer raised in frame; the wind-up slowed
shot on player yaw 100 pitch 16 dist 5.6 fov 28 lift 0.2
face player belfry
shot on player dist 5.2 1.4 nowait
pose player ready
slowmo 0.5 0.2
wait 0.9
# the strike: the sound, then a cut to the bell from below as it swings — the toll, its ring, a
# short gold flash (never white on snow), and the Thaw leaves the belfry
sfx hammerHit
pose player none
slowmo 1 0.1
shot on belfry yaw 0 pitch 4 dist 12 fov 32 lift 6
toll belfry
flash gold 0.15
thaw belfry 18
shot on belfry dist 11 1.3
# the front through the glade: the stag cracks its shell, stands, shakes off the frost and walks north
shot on rimehart yaw 0 pitch 14 dist 15 fov 30 lift 2.5
shot on rimehart yaw 0 dist 13.5 5 nowait
wait 1.2
player: It wasn't dead. It was waiting. #line:F65F145CDC71A1F171798C77182B55DB
wait 1.6
# the landmark: the front rolls down the ravine toward the lens
shot on toll-landmark yaw 0 pitch 28 dist 24 fov 34 lift 0
shot on toll-landmark dist 22 3.4 nowait
wait 3.4
# the card over the steps (the belfry above the frame), thawed; the hour glides to the spring morning over the front's run
shot on bw-card yaw 0 pitch 34 dist 30 fov 34 lift 0
title The Bell of Waking | Wake, little blossom, the frost's letting go #line:5A88CF2F3BC3629F146ECE34F7AEFAA7
shot reset 1
quest year stage tides

== bw-memory
cutscene
walk player bw-steps-linnet nowait
walk corin bw-steps-corin nowait
shot on bw-steps-mid yaw 0 pitch 16 dist 12 fov 30 lift 0.8
effect petals bw-steps-mid 0.7
shot on bw-steps-mid yaw 4 dist 10.5 6 nowait
wait player
wait corin
face player bw-steps-look
face corin bw-steps-look
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-steps-look
face corin bw-steps-look
shot on player yaw 11 dist 7.8 3.3 nowait
player: Dilly's going to want one of these. #line:709FB7D7A90330AED5F9E054D25DF6DC
# the memory: the shared white veil and chime, a woman's voice
call memory-in
Elin: Sing her the end of it, Da. #line:64C8D4A471E1BD705C9E0E95CF9921AA
call memory-out
wait 0.6
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin player
shot on corin yaw 355 dist 7.8 2 nowait
Corin: You all right? #line:225AAD957D3581370349D80E10CD3694
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player bw-steps-look
shot on player yaw 11 dist 7.8 2.5 nowait
player: …Someone was singing. #line:0592E5567DEFC9D48E693F88C18423FF
# a rime crow on the shrine's roof lifts and flies north
shot on bw-crow yaw 0 pitch 20 dist 24 fov 32 lift 5
wait 0.4
sfx crowCaw
effect crows bw-crow 0.4
wait 2
shot reset 1
give blossom

== bw-spring-valley
bark corin Listen to that. Running water. I'd forgotten it had a voice. #line:CB275E1E80F35C8A12A67898064AB304
wait 4
bark corin Petals in my hair. Seven years of snow and now petals. I'll never get them out. #line:EFA64D82760CE69E89E0D382383017CE

== bw-cache-hint
emote corin idea
bark corin My drift's gone — by the woodpile. I buried a little something under it, seven winters back. #line:9ACFB782784FAA85E3188A7960F14A41
