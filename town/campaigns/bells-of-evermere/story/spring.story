== ev-sp-arrival
cutscene
# (the epilogue's track from the first frame: its frozen section on the frozen dawn, the whole
# motif — section A — at the bar the front reaches the camera)
music firstspring
teleport player square down
teleport osmund ev-sp-osmund down
teleport corin ev-sp-corin right
walk corin ev-sp-corin
teleport wenna ev-sp-wenna left
walk wenna ev-sp-wenna
shot on ev-sp-view yaw 0 pitch 42 dist 54 fov 34 lift 2
shot on ev-sp-view pitch 40 dist 52 7 nowait
fade in 3
wait 1.2
# the great Thaw: the frost let go, the front rolling south from the north edge toward the camera;
# the town steps out behind it; the hour glides toward the morning
set spring-came
thaw ev-sp-north 14
shot on ev-sp-view yaw 0 pitch 34 dist 46 fov 34 lift 1 12 nowait
time 7.6 12
wait thaw
# the card: the town thawed below it, the tower above it
shot on ev-sp-view yaw 0 pitch 30 dist 40 fov 34 lift 4
shot on ev-sp-view dist 38 5 nowait
title Day One #line:554430D00A6E2E189A2C4EB7602A2E52
# Osmund beside her in the square
face player osmund
face osmund player
shot on osmund yaw 200 pitch 12 dist 7.6 fov 28 lift 0.6
shot on osmund dist 6.8 6 nowait
Osmund: I should go and sit with your mother. Seven years, and I never once went. #line:C94D8E6407589853F2052A5E0113DE56
shot on player yaw 160 pitch 12 dist 7.4 fov 28 lift 0.6
shot on player dist 6.6 3 nowait
player: Go on. I'll find you. #line:4C2A6703E1F2A8D5181742F314443D32
walk osmund ev-sp-osmund-grave nowait
home osmund 15.6 69.8
quest year stage day-one
shot reset 1.2

== ev-sp-crown
bark dilly Linnet! LINNET! Look at my crown! #line:BE363A294AB868D7CBE98D4F75704A92
emote dilly !

== ev-sp-grave
cutscene
teleport player ev-grave up
walk player ev-grave
face player elin_grave
face osmund elin_grave
# (the companions stand back, east of the armour, out of the two-shot from the north)
walk corin ev-sp-grave-corin
walk wenna ev-sp-grave-wenna
face corin elin_grave
face wenna elin_grave
shot on tin_grave yaw 20 pitch 12 dist 6.6 fov 24 lift 0.1
shot on tin_grave dist 6 lift 0.1 6 nowait
wait 1
: Tin's armour stands beside the grave, empty. Blossom drifts down into its open helm. #line:E40FB6AE2E22C8C5F6F7C3665A0E965A
pose player kneel
pose osmund kneel
shot on 16.55 69.7 yaw 185 pitch 20 dist 11.6 fov 22 lift 0
shot on 16.55 69.7 dist 11 10 nowait
wait 1.4
player: It stood at our door every night. Seven years. #line:F0D43513A63A76CA7EBFFDF6D48D5501
shot on osmund yaw 215 pitch 16 dist 7 fov 28 lift 0
shot on osmund dist 6.2 4 nowait
Osmund: It stood where I should have stood. #line:7C08F75459B25A23376E95EBBBC275C4
# (the two again, closer and lower: both well inside a 4:3 frame too)
shot on 16.55 69.7 yaw 192 pitch 16 dist 9 fov 22 lift 0
shot on 16.55 69.7 dist 8.4 4 nowait
player: …Morning, Tin. #line:79B76B8F81902D62640584C16746B4CD
# (a quiet beat at the grave, written on purpose)
wait 1.6
pose player none
pose osmund none
shot on osmund yaw 215 pitch 14 dist 7.4 fov 28 lift 0.4
shot on osmund dist 6.6 6 nowait
Osmund: I'll be at the square, sparrow. There's something I should have given you a long time ago. #line:4091270AAA5DC37007FACF0C452F1C61
walk osmund ev-sp-osmund-bell nowait
home osmund 49.2 16.6
set ev-sp-grave
quest year stage bellkeeper
shot reset 1.2

== ev-sp-bell
cutscene
teleport player ev-sp-bell right
walk osmund ev-sp-osmund-bell
walk corin ev-sp-corin
walk wenna ev-sp-wenna
face player osmund
face osmund player
# the two at the bell, from the south
shot on ev-sp-two yaw 0 pitch 12 dist 9 fov 28 lift 0.8
shot on ev-sp-two dist 8 5 nowait
wait 0.6
# (from the south-west, over her shoulder: the lanterns at the bell's foot behind him, Corin out of the lens)
shot on osmund yaw 310 pitch 12 dist 7 fov 28 lift 0.6
shot on osmund dist 6.2 9 nowait
Osmund: My hands shake now. A Bellkeeper wants steady hands. #line:DD74520AB8B1FC3DF3FBC738E2302271
Osmund: Here. It's yours. It always was going to be. #line:CB5B2B9AC74F95DF33C9C54590868975
shot on osmund yaw 255 pitch 12 dist 6.4 fov 28 lift 0.6
shot on osmund dist 5.8 4 nowait
Osmund: Go on, Bellkeeper. Wake them. #line:B224E32F31E88C7B9B8CB4CE8D915E60
give fork
# the fifth toll: the hammer (a peaceful level: no combat stance — the cut lands on the sound),
# the bell from below, the petals; the year's quest closed on the ring
face player belfry
shot on player yaw 300 pitch 8 dist 5.5 fov 24 lift 0.9
shot on player dist 5 1.4 nowait
wait 1
sfx hammerHit
shot on belfry yaw 0 pitch 4 dist 12 fov 30 lift 7
toll belfry
effect petals belfry 2.4
shot on belfry dist 11 2
quest year done
# Dilly sings the whole song over the square
teleport dilly ev-sp-dilly down
walk dilly ev-sp-dilly
face dilly down
shot on dilly yaw 10 pitch 14 dist 8 fov 28 lift 0.5
shot on dilly dist 7 8 nowait
bark dilly ♪ Wake, little blossom, the frog's letting go… #line:465AFEF623F6A4A90F8F31814C5D2DBC
wait 3.4
shot on ev-sp-two yaw 0 pitch 18 dist 15 fov 30 lift 1
shot on ev-sp-two dist 13.6 10 nowait
bark dilly ♪ Turn, little tide, bring the boats back to shore… #line:BF862A40610621DE09F2998FC3135346
wait 3.4
bark dilly ♪ Gold, little field, for the reapers are home… #line:981331532385267FCFF012F36F9E741A
wait 3.4
bark dilly ♪ Rest, little year — and begin it once more. #line:A5383901E0EDA69A4DE530AB6F0DF339
wait 3.8
# a last word from each companion
face corin player
shot on corin yaw 120 pitch 12 dist 7.4 fov 28 lift 0.6
shot on corin dist 6.6 4 nowait
Corin: I'm staying. That's the whole story. #line:1CC4934F310A6F0A9033EA4EC8DCE731
face wenna player
shot on wenna yaw 240 pitch 12 dist 7.4 fov 28 lift 0.6
shot on wenna dist 6.6 6 nowait
Wenna: One kraken, removed. Paid: no. …Give it here. #line:AD875033023A8E2C00EC0083316BE36D
take receipt
: Wenna tears the receipt in half, and in half again, and lets the pieces go with the petals. #line:052C4EC1789CBB05F24B0EC9BE0EFE6C
Wenna: Call it settled. #line:856FD4964EE8DE54EE6F761F32812B46
# the end: H1's framing — the first image of the town — in spring, turning slowly (the look
# raised over it: the belfry's vane stays under the card's Press-Space row while it turns)
shot on belfry yaw 0 pitch 40 dist 62 fov 26 lift 21.4 orbit 3
wait 1.4
ending first-spring The Year Turns #line:B7BE46C717662040775B9E003B3014E2
