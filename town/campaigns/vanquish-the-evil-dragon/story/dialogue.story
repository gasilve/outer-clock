== rally
if not party:seraphine
  party join seraphine as cleric support
if not party:lyra
  party join lyra as icemage balanced
if not party:brannoc
  party join brannoc as greatshield balanced

== opening
cutscene
# (a new journey: nobody is in the party yet — plain joins, no block before the fade in, so the game opens on black)
party join seraphine as cleric support
party join lyra as icemage balanced
party join brannoc as greatshield balanced
music dread
teleport player road-start up
# on black: low behind the party on the south road; the walk and the crane start under the fade in, so the first image moves (promo CR-07)
shot on player yaw 0 pitch 6 dist 9 fov 32 lift 1.4
walk player road-halt nowait
shot on player pitch 26 dist 24 fov 36 lift 2 5.6 nowait
fade in 2.5
wait 0.9
effect fireball fireball-cooper
pose vil_3 cower 3
wait 1.1
shake 0.35
effect flames fireball-cooper 1.2
effect smoke fireball-cooper 1.6
wait 1.1
wait player
# establishing: the whole village under smoke from high, a slow push in that runs under the title (promo S05); the party falls in line abreast meanwhile
shot on vista yaw 0 pitch 46 dist 50 fov 40 lift 0
walk seraphine halt-seraphine nowait
walk lyra halt-lyra nowait
walk brannoc halt-brannoc nowait
shot on vista pitch 40 dist 40 7 nowait
wait 0.4
sfx roarFar
wait 0.4
effect fireball fireball-street 1.2
wait 1.4
# the title hit: the blast, a gold flash, a shake and the card on one instant (promo S05)
effect explosion fireball-street 1.3
flash gold 0.35
shake 0.4
title Vanquish the Evil Dragon #line:495085D1F1D7D1BC3F0D45DF183A92F6
# the four from the front, high enough for the road and the window (promo S02 v4); the members show the row they are given (down: toward the camera); Mira runs down the main street while Brannoc speaks
shot on road-group yaw 165 pitch 28 dist 17 fov 32 lift 0.3
face seraphine down
face lyra down
face brannoc down
pose player ready
walk mira mira-meet run nowait
shot on road-group yaw 170 pitch 26 dist 15 4.5 nowait
Brannoc: Smoke on the road, smoke in the sky. And that was no thunder. #line:25F95BCA52C0365C964031E841B8516C
wait mira
# Mira from the front through the gap between Aldric and Lyra (nothing white on the axis), kneeling, a slow push; every reverse is a cut
shot on mira yaw 2 pitch 22 dist 8.5 fov 28 lift 0.4
# (a villager's facing is taken against the camera's yaw: face her again after every turn of the camera)
face mira player
pose mira kneel
shot on mira dist 7.5 6 nowait
Mira: Please — you have swords! Monsters came down from the mountain at first light. They're tearing Sunhallow apart! #line:1A890C7DB4CEACA68F6D9B6F0547EE4E
shot on brannoc yaw 200 pitch 12 dist 9 fov 28 lift 0.6
face brannoc mira
face mira player
shot on brannoc dist 8 3 nowait
Brannoc: Breathe, lass. How many, and where? #line:26AE2B22E4A2780578FCDDD8BED4F7E6
pose mira none
# her warning from the other side, closer (not the same angle twice)
shot on mira yaw 330 pitch 20 dist 7.5 fov 26 lift 0.5
face mira player
shot on mira dist 6.5 8 nowait
Mira: Seven packs — the granary, the smithy, the temple… And above it all, a dragon. No arrow can reach it. You see its shadow, then the fire falls. #line:9F60B8C551D0101FD3F56106315A062D
# the line answered: the fire falls on the road ahead of them (promo S02 -> S03)
sfx roarFar
shot on fireball-road yaw 6 pitch 14 dist 20 fov 34 lift 1.5
shot on fireball-road dist 17 2.6 nowait
wait 0.6
effect fireball fireball-road 1.3
wait 1.2
shake 0.4
effect flames fireball-road 1.2
wait 0.6
shot on lyra yaw 160 pitch 12 dist 9 fov 28 lift 0.6
emote mira !
face lyra mira
face brannoc mira
face mira player
shot on lyra dist 8 3.5 nowait
Lyra: A dragon, then. And here I thought this would be a quiet errand. #line:98C06C4A7DBD2A9BA04A46838375B1CE
shot on seraphine yaw 185 pitch 12 dist 9 fov 28 lift 0.6
face seraphine mira
face lyra mira
face mira player
shot on seraphine dist 8 4 nowait
Seraphine: Peace, child. You ran through fire to find us. It will not be for nothing. #line:0CD94747E9EFEEFB435D3A29538E9F36
shot on player yaw 200 pitch 12 dist 8.5 fov 30 lift 0.5
face mira player
shot on player yaw 196 dist 7.5 6 nowait
player: Brannoc, the front. Lyra, Seraphine, the flanks. Mira — get clear. We'll give you your village back. #line:8C2263DD7E7B487646D5277D0281EC5C
bark mira Go — and may the sun go with you! #line:BFA99A7C02160ECD6C686CFAFFBEBEF9
walk mira mira-refuge run nowait
home mira 37.6 90.6
quest defend start
quest defend stage routing
pose player none
music siege
shot reset 1.2

== victory
cutscene
wait 0.6
music off
sfx roar
shake 0.7
# Lyra hears it: high in front of her, her face turned up (clear of the roofs wherever the last pack fell); a zero-length walk directs her
walk lyra lyra
shot on lyra yaw 0 pitch 48 dist 13 fov 32 lift 0.8 1.2
face lyra down
shot on lyra dist 11 4 nowait
Lyra: That was the last of them. Listen — the beast knows it, too. #line:4DC4E0257DABE66F50252F8DBFC5537D
# the dragon leaves (the chapter banner held until play): its shadow sweeps low over the square, then away north to the pass (promo S11; the escape enters behind the look point)
shot on stage-centre yaw 0 pitch 34 dist 34 fov 36 lift 1
set village-saved
sfx wingbeat
shot on escape-north pitch 30 dist 40 5 nowait
wait 4.6
shot on pass-view yaw 0 pitch 30 dist 40 fov 38 lift 0 2.5
# from the pass, back over the smoking village
shot on vista yaw 180 pitch 30 dist 42 fov 34 lift 2
shot on vista yaw 186 dist 38 2.4 nowait
wait 1.6
fade out 0.8
teleport player stage-aldric up
teleport seraphine stage-seraphine up
teleport lyra stage-lyra up
teleport brannoc stage-brannoc up
# (each member pinned on its mark: a zero-length walk directs it, so the follow does not pull it out of the row)
walk seraphine stage-seraphine nowait
walk lyra stage-lyra nowait
walk brannoc stage-brannoc nowait
teleport mira stage-mira down
teleport hesk stage-hesk down
# (the village is calm now: the panicking villagers are replaced by their calm copies, out of the shots)
set sunhallow-calm
# (they live here now: nobody walks home mid-speech, and the festival finds them in the square)
home mira 41.2 48.2
home hesk 47.4 47.8
effect dust stage-centre 0.6
# the square over the heroes' shoulders, a slow push through the fade in (each villager faced again after every turn of the camera)
shot on stage-centre yaw 0 pitch 22 dist 16 fov 34 lift 0.4
face mira player
face hesk player
music ascent
shot on stage-centre yaw 6 pitch 20 dist 13 6 nowait
fade in 1.2
pose mira cheer 2.5
wait 0.6
# Mira alone under her awning (nobody on the axis)
shot on mira yaw 345 pitch 14 dist 8.5 fov 28 lift 0.5
shot on mira dist 7.5 4 nowait
Mira: You did it! Not one of them left standing! #line:5BCE86FC68404546A48B01C049881B61
# the elder, from the side he faces (the player's), clear of the heroes
shot on hesk yaw 310 pitch 15 dist 9 fov 28 lift 0.6
pose hesk bow 2
shot on hesk dist 8 5 nowait
Hesk: Sunhallow will not forget this day, strangers. Nor the names of those who saved it. #line:DB626B812298E24D8FCA8D6D9A365660
# the reverse: the four abreast, their faces from the north
shot on stage-row yaw 180 pitch 16 dist 13 fov 32 lift 0.4
face seraphine down
face lyra down
face brannoc down
shot on stage-row yaw 176 dist 11.5 5 nowait
Brannoc: Save the thanks, Elder. That beast will be back — and hungrier. #line:F9FEB7FBDFEA269A9F57631900159C88
# the elder names the dragon and the north: his face, a slow push through both lines
shot on hesk yaw 320 pitch 16 dist 8.5 fov 28 lift 0.6
face hesk player
shot on hesk yaw 326 dist 7.2 12 nowait
Hesk: Aye. Vorthrax, the Ashen Tyrant. My grandfather's grandfather saw him last, and lived to wish he hadn't. #line:DF96C9C1B992DAD2A4DB1DE3D77BAAEC
Hesk: He nests on the Ashen Throne, in the Wyrmspine — the mountains to the north. The old pass road climbs straight to it. #line:99867B51504884DA39C72D8800FBFE64
shot on mira yaw 330 pitch 16 dist 8 fov 28 lift 0.5
face mira player
shot on mira dist 7 3.5 nowait
Mira: Half a day's walk. If nothing stops you. #line:3684124DF102AE903016671118B76777
shot on stage-aldric yaw 175 pitch 14 dist 10 fov 30 lift 0.4
face seraphine down
face lyra down
face brannoc down
shot on stage-aldric yaw 182 dist 8.8 7 nowait
Lyra: Something will. Something always does. #line:4BBECCAF0A9843667D853E023A608228
Seraphine: Then we go now, while the light holds. No other village will burn. #line:E0098904C939D8FC666B6AC077CF4A57
shot on player yaw 205 pitch 14 dist 9 fov 30 lift 0.6 0.8
face mira player
face hesk player
pose player victory 2
shot on player yaw 200 dist 8 4 nowait
player: Before nightfall, then. We end this on the Ashen Throne. #line:8E371938CF6319DEFE548D573A3D708C
# on black into the Wyrmspine (its arrival opens with a fade in); the quests move on under the black (their toasts stacked over the resolve and the fade: the arrival's own tells the player), the title card over it
fade out 1.5
quest defend done
quest slay start
quest slay stage hunt
title Golden Hour | The road to the Ashen Throne #line:19EEA82C21F95BB4BEC5EC2037861CF3
travel wyrmspine trailhead

== ascent
cutscene
music ascent
# on black: high over the Dragon's Fangs, the long road climbing to the peaks
shot on fangs yaw 0 pitch 30 dist 46 fov 34 lift 4
shot on fangs pitch 28 dist 42 2.6 nowait
fade in 2
# (a start preset: the companions waiting at the trailhead join while the camera is far; all fall in beside Aldric)
call rally
teleport seraphine trail-seraphine up
teleport lyra trail-lyra up
teleport brannoc trail-brannoc up
# (pinned on their marks: zero-length walks direct them)
walk seraphine trail-seraphine nowait
walk lyra trail-lyra nowait
walk brannoc trail-brannoc nowait
wait 0.6
# the crane comes down the road to the party at the trailhead
shot on player yaw 0 pitch 16 dist 15 fov 32 lift 1.8 4.5
sfx roarFar
# their faces in the low sun, the road behind them: one slow push through the three lines (promo S13)
shot on trail-row yaw 178 pitch 14 dist 12 fov 30 lift 0.4
face seraphine down
face lyra down
face brannoc down
shot on trail-row yaw 182 dist 9.5 12 nowait
Lyra: Golden hour. Of course it is golden hour. Every legend ends at golden hour. #line:0EB63BE99A2115313B665FA2363EDCF0
Brannoc: Then let's not make it ours. Shields up from here on. #line:B22DA4B99D6EC706F4079CF3603B0376
pose brannoc ready
Seraphine: Look at the ridges — the brood is everywhere. He knows we are coming. #line:2115B9DED68EB4585310053C3610D61D
shot on player yaw 195 pitch 12 dist 8.5 fov 28 lift 0.5
pose player ready
shot on player dist 7.5 3 nowait
player: Let him know. Up, and quickly. #line:E883853BE8DBFAC22A2A734B4EC19907
quest slay stage climb
shot reset 1

== wave-1
cutscene
set wave-1
var waves + 1
# Brannoc steps out in front of the others to hold the line while the camera finds the brood on the canyon floor
walk brannoc canyon-line run nowait
shot on canyon-floor yaw 0 pitch 26 dist 18 fov 36 lift 1 0.8
sfx yip
shot on canyon-floor yaw 4 dist 15.5 2.5 nowait
wait 0.9
wait brannoc
# Brannoc, out in front, turns to the others: nobody between him and the camera
shot on brannoc yaw 190 pitch 12 dist 8.5 fov 30 lift 0.5
face brannoc down
pose brannoc ready 1.5
shot on brannoc dist 7.5 3 nowait
Brannoc: Scalekin, down the canyon! Hold the line! #line:960A89778A18D9121A26A3CE17C82844
shot reset 0.8

== wave-6
cutscene
set wave-6
var waves + 1
# high over the vents, then down into the brood (promo S15); the imps in the vents
shot on vents-floor yaw 0 pitch 40 dist 30 fov 38 lift 0 0.8
sfx screech
shot on vents-floor yaw 10 pitch 20 dist 17 fov 34 lift 1.2 2.5
shot on wave6_imps yaw 20 pitch 18 dist 14 fov 34 lift 1
shot on wave6_imps yaw 26 dist 12.5 2.5 nowait
wait 1
# the speakers, each turned to the others (zero-length walks direct them)
walk seraphine seraphine
shot on seraphine yaw 165 pitch 14 dist 8.5 fov 30 lift 0.5
face seraphine down
shot on seraphine dist 7.5 3 nowait
Seraphine: The ground itself is burning. The Throne must be close. #line:8B34AEBD5608510792C2491581C8C5EE
walk brannoc brannoc
shot on brannoc yaw 330 pitch 18 dist 9 fov 32 lift 0.6
face brannoc down
pose brannoc ready
shot on brannoc dist 8 3 nowait
Brannoc: Then they'll make their stand here. Hold together! #line:34E8FF8495EE8E772577036D01BFD1CE
shot reset 0.8

== lair
cutscene
# (no music from the walk to the touchdown: the silence is meant — the dragon theme comes in with him)
music off
walk player throne-halt
face player up
walk brannoc throne-brannoc nowait
walk seraphine throne-seraphine nowait
walk lyra throne-lyra nowait
# the empty caldera, a slow push in, wordless
shot on throne-centre yaw 0 pitch 26 dist 34 fov 34 lift 2
shot on throne-centre dist 28 4 nowait
wait 2.5
# the four seen from the empty throne: their faces, a slow push (promo S13)
shot on throne-halt yaw 180 pitch 14 dist 10.5 fov 30 lift 0.4
face seraphine down
face lyra down
face brannoc down
shot on throne-halt yaw 180 dist 9 6 nowait
Seraphine: The Ashen Throne… #line:FF74106C4838048B918E3AD43185CA31
Lyra: Bones. Old gold. More bones. Charming. #line:3526357A99028BEE1358BE5C0C6167E4
# low behind the heroes, the caldera before them: a roar from above, then he drops in (promo S22); the look low enough that the four backs stand above the bottom bar
shot on throne-fall yaw 8 pitch 10 dist 13 fov 46 lift 1.6
shot on throne-fall yaw 7 dist 12.5 1.9 nowait
face seraphine up
face lyra up
face brannoc up
wait 0.5
sfx roar
shake 0.6
effect roar throne-sky 1.4
wait 1.4
# the shadow is gone — Vorthrax drops out of the sky (the boss's intro plays during the scene)
set dragon-descends
shot on throne-fall yaw -4 pitch 11 dist 15 6 nowait
wait 2.4
effect shockwave throne-centre 2
effect dust throne-centre 2.5
flash red 0.3
shake 0.9
music dragon
# (the card once the intro's raised wing is down, 2 s after the touchdown: the wing touched the Japanese and Chinese titles' last glyphs)
wait 2
# the name card beside him: the dragon right of the card in all three languages (VQ-11, promo CR-01); a push under it
shot on throne-card yaw 0 pitch 24 dist 29 fov 36 lift 2.5
shot on throne-card dist 26 4.5 nowait
title Vorthrax | The Ashen Tyrant #line:B9F77B69A9D0FFEFB7D86F7733519EF3
# each hero turns to the others, the dragon behind them; a push under every line (the landed dragon is still while the scene holds him)
# (Brannoc on the line from the dragon to the camera: the dragon over him, not at the frame's edge)
shot on brannoc yaw 38 pitch 20 dist 8.5 fov 34 lift 1.2
face brannoc down
pose brannoc ready
shot on brannoc yaw 41 pitch 20 dist 7 3 nowait
Brannoc: Behind my shield, all of you! #line:E6E32EA6E020BF64B32D0B0888D8DD9A
shot on lyra yaw 37 pitch 26 dist 7.5 fov 32 lift 0.8
face lyra down
shot on lyra yaw 40 dist 6.5 3 nowait
Lyra: Big. Why are they always so big? #line:51C5868F68BAB12F59ECBBCDC7C6E8AE
shot on seraphine yaw 325 pitch 24 dist 7 fov 34 lift 0.8
face seraphine down
shot on seraphine dist 6 3 nowait
walk player throne-rally nowait
Seraphine: Light keep us. Light keep us all. #line:C9E8AEB3BE1E9338B3A9C2C24EBBD93E
pose seraphine cast 1.2
wait player
# Aldric has stepped forward and turns to them: the dragon towers behind him (the camera at the rig's closest, ahead of Seraphine and Lyra: nobody between him and the lens; the push a slow zoom)
face player down
face seraphine up
face lyra up
shot on player yaw 0 pitch 4 dist 4 fov 40 lift 0.7
pose player ready
shot on player pitch 5 fov 36 3 nowait
player: For Sunhallow! Bring him down! #line:C36C6B8E659DB913AD640234258AB7CE
quest slay stage throne
shot reset 0.8

== death
cutscene
music off
# the throes at half speed, low across the floor, then a slow push in on the collapse (promo research A3_death_push_in): the camera follows the fallen boss (E6)
slowmo 0.5 0.4
shot on throne-centre yaw 0 pitch 9 dist 30 fov 38 lift 3 1.2
sfx roar
shake 0.5
shot on vorthrax yaw -10 pitch 7 dist 17 fov 34 lift 2.5 6 nowait
wait 4
# the body hits the ground (a short dust: the fallen body and the heroes stay readable through the stillness)
shake 0.9
effect dust throne-centre 1.4
wait 0.6
effect embers throne-centre 2.5
wait 0.8
# the fallen tyrant; a breath of stillness
slowmo 0.3 0.6
wait 1.2
flash white 0.4
fade out 2.5 white
slowmo 1
set dragon-slain
quest slay stage slain
quest slay done
travel sunhallow festival

== festival
cutscene
music festival
# (the opening sent Mira down the road and the victory homed her and the elder in the square: tonight they dance by the fire)
home mira 39.8 49.4
home hesk 48.6 49.2
teleport player fest-aldric down
teleport seraphine fest-seraphine down
teleport lyra fest-lyra down
teleport brannoc fest-brannoc down
# (the members pinned in one row: zero-length walks direct them — promo S33)
walk seraphine fest-seraphine nowait
walk lyra fest-lyra nowait
walk brannoc fest-brannoc nowait
# the camera circles the great bonfire, then rises so the card sits over the fire, not on it
shot on bonfire-view yaw 0 pitch 20 dist 26 fov 34 lift 1.5 orbit 6
# (a breath of white: the death's quest toasts run out before the picture comes, the promo's silence under the white)
wait 1.5
fade in 2.5
# (a start preset: the companions, put at their marks above, join where they stand)
call rally
walk seraphine fest-seraphine nowait
walk lyra fest-lyra nowait
walk brannoc fest-brannoc nowait
shot on bonfire-view lift 5 2 nowait
title The Bonfire | That night, in Sunhallow #line:452EBB6C7861C53088B071E7E2634BF7
# Lyra casts her frost fireworks (the orbit stops)…
shot on lyra yaw 25 pitch 10 dist 8 fov 30 lift 0.8 orbit 0
face lyra down
effect frost lyra
pose lyra cheer 1.5
wait 1.4
# …and they burst over the upper town, the look on the bursts (sharp, not bokeh)
shot on 44 40 yaw 0 pitch 10 dist 28 fov 44 lift 7
effect fireworks fireworks-1 1.4
sfx firework
wait 0.6
effect fireworks fireworks-2 1.2
flash gold 0.25
wait 0.8
effect fireworks fireworks-3 1.6
wait 1.4
# the last words, one by one: every change of speaker a cut (a swing would pass through the bonfire's glare), a push under each line
shot on mira yaw 15 pitch 24 dist 9 fov 30 lift 0.6
face mira down
pose mira dance
shot on mira dist 8 4 nowait
Mira: Look at it! The whole village came out — even Old Marta is dancing! #line:74C7D09ED30B78182AAD14CB2A7E641B
shot on hesk yaw 340 pitch 12 dist 9 fov 30 lift 0.6
face hesk down
pose hesk cheer 2
shot on hesk dist 8 6 nowait
Hesk: Sunhallow has burned before, and always been built again. But never, I think, with such a fire as this one. #line:B500EA07E5DB0A4865636446ABAFC8DA
shot on brannoc yaw 10 pitch 12 dist 9.5 fov 28 lift 0.6
face brannoc down
shot on brannoc dist 8.5 5 nowait
Brannoc: Best fire I've seen all year. And the only one I didn't have to put out. #line:CDB134564626AE6CBA246C85DC2ECEFF
shot on lyra yaw -10 pitch 12 dist 9.5 fov 28 lift 0.6
face lyra down
shot on lyra dist 8.5 4 nowait
Lyra: A toast — to the dragon. May his bones make a very fine fence. #line:5B89F6C3FD1EEF2F62EE2D332028F55B
shot on seraphine yaw 15 pitch 10 dist 8 fov 28 lift 0.6
face seraphine down
shot on seraphine dist 7 4 nowait
Seraphine: To Sunhallow. And to those who did not live to see tonight. #line:60DDDEA56B2FE931ADFF8E5BDC0651A7
effect holy seraphine 0.6
# the toast: Aldric on his own single, his face lit and the fire beside him (on the row's axis he stood against the bonfire, a silhouette)…
shot on player yaw 25 pitch 10 dist 8 fov 28 lift 0.5
face player down
face seraphine down
face lyra down
face brannoc down
shot on player yaw 22 dist 7 4 nowait
effect sparkle player 0.6
pose player cheer 2.5
player: To all of you. Rest now. The night is yours. #line:FCBA4448EEC04CB4A0A4D25E1E71E3B8
# …then the four in one row by the fire (promo S33), and all four cheer
shot on fest-row yaw 0 pitch 8 dist 11 fov 32 lift 0.3
face player down
face seraphine down
face lyra down
face brannoc down
shot on fest-row dist 9.5 4 nowait
pose seraphine cheer 2.5
pose lyra cheer 2.5
pose brannoc cheer 2.5
pose player cheer 2.5
wait 1.6
music triumph
# the credits: the square turning slowly, closer and lower, the fire under the cards
shot on bonfire-view yaw 0 pitch 24 dist 30 fov 34 lift 6 orbit 4 3
effect sparkle bonfire-view 1.5
title Vanquish the Evil Dragon | A Luminati campaign #line:A9B64D9CD4C4AB2AB73A38EAF7B16615
title Aldric · Seraphine · Lyra · Brannoc | The heroes of Sunhallow #line:FBDB8F0F4DBA6E80283D29347A555341
title The people of Sunhallow | Mira · Elder Hesk · and every voice that cried for help #line:31D6E2BC8D44CDFEC876F73A75737C6F
title Vorthrax, the Ashen Tyrant | Slain on the Ashen Throne #line:97CDCDE19C8509147DC56A5B0028072D
title Made with Luminati | A 2.5D pixel-art engine on three.js #line:0F5B1484C875F5DF654431AE338E8B3B
ending victory The End #line:179F5787B15E344239DC5B4D8D2A5BAA

== seraphine
if party:seraphine
  cycle seraphine-words
    * Seraphine: The light is with us. Lead, and I will mend what breaks. #line:BCEBB889360FD743F47E824AF87F1B74
    * Seraphine: Breathe. Steady hands make steady blades. #line:F0D4DA37D3C6538EB00E9284AA192913
    * Seraphine: I am here, Aldric. I will not fall behind. #line:A8EC2C2DB61B48B9E870C32F8BD3D799
  choice How shall I serve? #line:93308FE7B87E821D388D53BF56AD0790
    > Tactics… #line:E9565BD85CE59177DF779E056D08B8A5
      party menu seraphine
    > Lead on #line:8E50F05CC3E48B99B719619E1925B851
      Seraphine: Then let us go, and quickly. #line:C9AF30A05BA1784006E6934C83CAFF67
  stop
Seraphine: The road is long and the light is short. Shall we? #line:EF04D1D00BDDE502194E6FECEEB6C524

== lyra
if party:lyra
  cycle lyra-words
    * Lyra: My hands are cold, my temper is colder. Point me at something. #line:D434257AB33C41E6D7051339F285DBF2
    * Lyra: If you are about to say "be careful", I will freeze your boots to the road. #line:D4C5123249612DEDDC50E6D8A574DE8A
    * Lyra: Still alive? Good. I hate breaking in new swordsmen. #line:9EE808D7D4588C621C94A72E11484770
  choice What now, fearless leader? #line:FCCD221F499D87A273F31CBB2714679D
    > Tactics… #line:DDD9CE3E01C80F3577E107640BFF8109
      party menu lyra
    > Lead on #line:8484F3D5CF936371F696B200CEF7D7F0
      Lyra: Lead on. I'll be the one behind you, saving your life. #line:FD8F5DFFBC1D0FF6AD3E6BE191F5A6F0
  stop
Lyra: Dragons, brood, a burning village. And they said this errand would be dull. #line:D81FB9B0C33426FCF6B3D2EA65605C20

== brannoc
if party:brannoc
  cycle brannoc-words
    * Brannoc: Shield's up, mace is heavy. We're ready. #line:C8976F8EC74EB6F9D2BCB76FB4E7C067
    * Brannoc: Stay behind the steel. That's what it's for. #line:577FFAE687BD50B2258619C727FAC10F
    * Brannoc: Easy breaths. One fight at a time. #line:06B8E48EFB16951DC5B08F3B767932AC
  choice Orders? #line:B341CCA235E6F92E98FDC28C550D9FDA
    > Tactics… #line:78BD033F74F5C861248FE73BD83C8307
      party menu brannoc
    > Lead on #line:706C8CF8ECDC444432B8908B5D4EDEF3
      Brannoc: Lead on. I've got your back. #line:829BD8D326FD9D2855F25782C4812E83
  stop
Brannoc: Whatever comes, it comes through me first. #line:8235353B597A2421705A39B69094B695

== mira
if dragon-slain
  Mira: Dance with me! Come on — heroes are allowed to dance. #line:DFA4AF5F9B2B47AD8B652FBEF7BC7D73
  stop
if village-saved
  Mira: The Wyrmspine is north, up the pass road. Come back to us. Promise? #line:89BC89D1F89445CB0E9A7DF4CBD06EA9
  stop
Mira: I'll keep down the road, like you said. Please — hurry! #line:5B120EFA0ADB9DF8AB3CE28A47949C01

== hesk
if dragon-slain
  Hesk: Sit, sit. The fire burns till dawn, and so will the dancing. #line:13C5088AA5BB6649FADC01129E7D0387
  stop
if village-saved
  Hesk: The Ashen Throne lies at the top of the pass road. May the dawn light your way. #line:9DA6312C34CE8E6B313896291CDE9F92
  stop
Hesk: My house holds, for now. Never mind an old man — save the others! #line:2469B28F8122D60E385629FCC3387ADF
