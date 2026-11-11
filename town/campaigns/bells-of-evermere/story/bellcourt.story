== bc-arrival
cutscene
# (no music: the court is silent but for his humming — the music comes back after his name, the boss theme with the fight)
music off
teleport player bc-halt-linnet up
teleport corin bc-halt-corin up
walk corin bc-halt-corin nowait
teleport wenna bc-halt-wenna up
walk wenna bc-halt-wenna nowait
teleport tin bc-halt-tin up
walk tin bc-halt-tin nowait
# (low enough that the whole of him stands above the dialog while he hums)
shot on hushedking yaw 0 pitch 14 dist 15 fov 30 lift 0.9
fade in 2.5
shot on hushedking dist 13.5 lift 0.9 7 nowait
wait 1.2
King: ♪ Wake, little blossom, the frost's letting go… ♪ #line:23B877B60FC9C3CBBEE760522A20DCA3
King: ♪ Turn, little tide… gold, little field… rest, little— ♪ #line:7EBC68DE7043EF24FF8ECEB054E73414
# he stops where she always stops: a silence written on purpose
wait 1.8
shot on player yaw 180 pitch 12 dist 9 fov 28 lift 0.6
face player hushedking
face corin hushedking
face wenna hushedking
face tin hushedking
shot on player dist 8 4 nowait
player: That's where I always stop. #line:43D30017A6A9D4BAF622046CD90B8C29
shot on hushedking yaw 0 pitch 12 dist 8.5 fov 26 lift 0.5
shot on hushedking dist 8 4 nowait
King: You've grown, sparrow. #line:509F29F06F3A9242F5F201D878E5C6BF
# the black bell answers him; then his name beside him (the card west of him: he stands right of it)
toll hush_bell 0.6
shot on bc-card yaw 0 pitch 18 dist 24 fov 34 lift 3
shot on bc-card dist 22 4.5 nowait
title The Hushed King #line:897F867F4F12918B8C5CCB7E12EEEC6B
music on
shot reset 1

== bc-fires-out
bark corin He's snuffing the fires! Light them again, quick! #line:97E63568D865FC653E9E7DF0319E9579

== bc-lit
sfx braziersLit

== bc-tin-step
cutscene
walk tin bc-tin-step run nowait
shot on hush_bell yaw 0 pitch 16 dist 16 fov 30 lift 3
shot on hush_bell dist 14 2.4 nowait
wait tin
# Tin under the bell, from the south-east (no fire behind his helm)
shot on tin yaw 60 pitch 12 dist 8 fov 28 lift 0.8
face tin hush_bell
shot on tin dist 7 3 nowait
wait 0.6
sfx tuningFork
bark tin ♪ #line:2DF742856727B48524022CF466530E8F
wait 1
# the one note of Rest against the black bell: it cracks — on the bell
shot on hush_bell yaw 0 pitch 16 dist 14 fov 30 lift 3
sfx iceCrack
effect frost hush_bell 0.9
flash white 0.3
shake 0.5
wait 1.2
shot on hushedking yaw 0 pitch 14 dist 10 fov 28 lift 0.6
shot on hushedking dist 9 2 nowait
wait 1.4
bark wenna Every fire's out — stand in your own bell's ring, Linnet! #line:CBD99F3126D6E1EAE9DDDECDF258F844
shot reset 0.6

== bc-crown
cutscene
music off
# the crown breaks: half speed from the killing blow (real = game ÷ 0.5), high over him
slowmo 0.5
# (the cut hides it: the party up on the dais, outside his arena — clear of him wherever he fell; Tin alone by the Bell of Rest)
teleport player bc-fall-linnet down
teleport corin bc-fall-corin down
walk corin bc-fall-corin nowait
teleport wenna bc-fall-wenna down
walk wenna bc-fall-wenna nowait
teleport tin bc-fall-tin down
walk tin bc-fall-tin nowait
shot on hushedking yaw 0 pitch 32 dist 8 fov 26 lift 0.2
shot on hushedking dist 6.8 4 nowait
effect frost hushedking 1.2
flash white 0.12
sfx crownShatter
shake 0.5
wait 1.6
# Tin falls empty, alone on the dais (low from the south, his helm against the snow; the cold
# leaves the armour as frost — white on the dark iron, where dust would bury him)
shot on tin yaw 345 pitch 12 dist 7 fov 26 lift 0.4
pose tin kneel
effect frost tin 0.7
sfx iceBreak
shot on tin dist 6.2 3 nowait
wait 1.8
fade out 1 white
slowmo 1
set crown-broken
party leave tin
# on white: everyone on their marks, Osmund kneeling where his King knelt, the empty armour beside him
teleport player bc-kneel-linnet up
teleport corin bc-kneel-corin up
walk corin bc-kneel-corin nowait
teleport wenna bc-kneel-wenna up
walk wenna bc-kneel-wenna nowait
face player osmund
pose osmund kneel
pose tin_empty kneel
shot on osmund yaw -35 pitch 14 dist 9 fov 26 lift -0.3
# A WRITTEN SILENCE: no music, no line — the white, then the court with the crown broken
wait 2.4
fade in 3
shot on osmund dist 8 7 nowait
wait 2.6
Osmund: You asked me for one more night, Linnet. I am a bell-founder. I made it last. #line:6DEF30B7C55F5625C8CD3214F074B80A
shot on player yaw 165 pitch 14 dist 11 fov 22 lift 0.6
face player osmund
shot on player dist 9.8 5 nowait
player: Mam's gone, Grandda. She was gone before morning. #line:E5F24F5335E9233AD1E4EE373D963EFB
shot on osmund yaw -35 pitch 14 dist 8.5 fov 26 lift -0.3
shot on osmund dist 7.5 5 nowait
Osmund: Seven winters of a wrong note, then. And a whole valley made to hold it. #line:AC0A3F898B7EE9F3C0883025CCFED5BD
shot on player yaw 165 pitch 14 dist 10.5 fov 22 lift 0.6
shot on player dist 9.3 5 nowait
player: A cracked bell can be recast. It's still the same bronze. #line:716633E638E6147138DC7F9A9CDA31FE
shot on osmund yaw -35 pitch 14 dist 8.5 fov 26 lift -0.3
shot on osmund dist 7 6 nowait
# the music comes back with the song: his track's reconciliation, the motif's three notes waiting on the fourth
music hushedking.rest
Osmund: Rest, little year— #line:C9F570528C76606DFAD3408D9B3DE347
wait 1.2
shot on player yaw 165 pitch 14 dist 10 fov 22 lift 0.6
shot on player dist 8.8 4 nowait
player: —and begin it once more. #line:63479C630960DA67F6C8315BF73A5D5F
# together they ring the Bell of Rest: a cut to its tower and its lit window, the two at its foot
pose osmund none
teleport player bc-rest-linnet left
teleport osmund bc-rest-osmund left
walk osmund bc-rest-osmund nowait
shot on belfry yaw 60 pitch 8 dist 22 fov 36 lift 9
shot on belfry dist 20 3.5 nowait
wait 2
# R3: the two-shot at the bell — wide, from the south-east past the Hush Bell's arch: the two in
# profile at the tower's foot, the Bell of Rest's chamber and its lamp in the top third
shot on bc-rest yaw 36 pitch 4 dist 22 fov 46 lift 5.4
shot on bc-rest dist 21 3 nowait
wait 1
sfx hammerHit
# the fourth toll breaks the pattern: no flash, no card — the night glides into dawn, and the motif is whole
toll belfry 1.4
music firstspring
effect toll belfry 1.5
thaw belfry 14
set bell-rest
wait 1.2
# the camera rises south over the valley as the aurora fades and the citadel's ice sublimates
shot on bc-court yaw 0 pitch 48 dist 56 fov 40 lift 0 12 nowait
time 6.7 12
wait thaw
# only now the card (the tower above it, the court floor under it)
title The Bell of Rest | Rest, little year — and begin it once more #line:F9BFB8171FC5D6CFB215F98AB284F329
# the south rim at dawn: abreast over the thawed valley, the empty armour kneeling behind them
teleport player bc-dawn-linnet down
teleport osmund bc-dawn-osmund down
walk osmund bc-dawn-osmund nowait
teleport tin_empty bc-dawn-armour down
pose tin_empty kneel
teleport corin bc-dawn-corin up
walk corin bc-dawn-corin nowait
teleport wenna bc-dawn-wenna up
walk wenna bc-dawn-wenna nowait
face osmund tin_empty
shot on osmund yaw -30 pitch 10 dist 9 fov 28 lift 0.6
shot on osmund dist 8 6 nowait
Osmund: Every knight carried a piece of my winter. That one carried the piece that was sorry. #line:AF59E643A09EBE93A87374FC4CF35BE2
shot on osmund yaw 15 pitch 10 dist 8.5 fov 28 lift 0.6
face osmund down
shot on osmund dist 7.5 5 nowait
Osmund: I stood at your door seven winters, and walked beside you from the abbey. Corin tells me you hit him with a hammer. #line:28780D8D87E4D1DFD12FEF4D93E1346A
shot on corin yaw 15 pitch 10 dist 8.5 fov 28 lift 0.6
face corin down
shot on corin dist 7.5 4 nowait
Corin: Once. The second was an accident. #line:1E0B6408C33C8801184060A002876F4A
# (a beat; then Corin, plainly — the first plain sentence of his life)
wait 1.2
shot on corin yaw 5 pitch 8 dist 7 fov 26 lift 0.6
shot on corin dist 6 5 nowait
Corin: I told you. I told everyone. #line:C04D4E2B0B8BDD6B38DE80F489DA9A40
wait 1
fade out 2 white
travel evermere square

== osmund
Osmund: My hands shake on the hammer now. Yours don't. That's as it should be. #line:392DBC16E8539499B5818C6DC64DE74B
