== sc-arrival
cutscene
set sc-arrived
teleport player sc-entry up
# on black: S1 — the ships locked in the floes, from high over the cove
shot on sc-bay yaw 345 pitch 40 dist 40 fov 28 lift 2
walk player sc-road-linnet nowait
walk corin sc-road-corin nowait
fade in 2.4
shot on sc-bay yaw 350 pitch 36 dist 36 7 nowait
wait 4
wait player
wait corin
face player sc-road-look
face corin sc-road-look
shot on player yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face player sc-road-look
face corin sc-road-look
shot on player yaw 11 dist 7.8 6.5 nowait
player: Ships. Stuck in the ice like flies in amber. Seven years, and not one of them has rotted. #line:950A443931569FD3A40D45CA8D780066
shot on corin yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face player sc-road-look
face corin sc-road-look
shot on corin yaw 355 dist 7.8 6.5 nowait
Corin: Saltcombe. I came here once to sell a fox fur. The harbour master fined me for the smell. #line:6E14B357EF73D44E6D520FCC4376467A
shot reset 1
quest sc-ledger start

== sc-wenna
cutscene
walk player sc-quay-linnet nowait
walk corin sc-quay-corin nowait
# Wenna on the quay, writing in a ledger at a row of gulls
face wenna sc-gulls
shot on wenna yaw 30 pitch 14 dist 9 fov 28 lift 0.6
shot on wenna yaw 36 dist 8 4.8 nowait
sfx gullCry
Wenna: That's a mooring fee, that is. And that one. And you, with the face. #line:BF3F630A881569C982792909A5A3E15D
walk wenna sc-quay-wenna
wait player
wait corin
face corin sc-quay-look
face player sc-quay-look
face wenna sc-quay-look
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-quay-look
face player sc-quay-look
face wenna sc-quay-look
shot on wenna yaw 355 dist 7.8 11.3 nowait
Wenna: Visitors. First since the ice. Morwenna Gale, harbour master — that'll be a landing fee. #line:E341E44CD2E349322EEF6863C2459B7A
face wenna corin
Wenna: And you. The fox fur. I never forget a smell. #line:5000E7D86E0F2DCCA38711F22142D7C6
emote corin sweat
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face corin sc-quay-look
face player sc-quay-look
face wenna sc-quay-look
shot on player yaw 3 dist 7.8 3.4 nowait
player: I've come to ring the Bell of Tides. #line:E1FAC7E383054A75AB00207F90175C66
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-quay-look
face player sc-quay-look
face wenna sc-quay-look
shot on wenna yaw 355 dist 7.8 21.4 nowait
Wenna: I've lit the harbour lamp every night since the ice came. Two thousand five hundred and fifty-seven lamps. Somebody owes me for the oil. #line:6C250C869543A5049B80F53D972AACB5
Wenna: Bar six nights I was down with the ague. I've billed myself for those. #line:87A6FDB06D91E4D4DF9B53E312B48180
Wenna: My brother's boat was out that night. If a bell brings the tide back, it brings the Patience back. Wait there. #line:073711B15C683E1DBD31D652BE6A6D7A
# the office door: she wrenches it off its hinges (off screen — the two of them watch, from the door's side)
walk wenna sc-office-door nowait
shot on sc-quay-mid yaw 180 pitch 14 dist 5.6 fov 34 lift 0.6
face player sc-office-door
face corin sc-office-door
shot on sc-quay-mid yaw 176 dist 5 1.6 nowait
wait 1.6
# the door from the quay side: she reaches it, the slam
shot on sc-office-door yaw 0 pitch 14 dist 8 fov 28 lift 1
wait wenna
sfx hammerSlam
shake 0.45
effect thaw sc-office-door 0.7
wait 0.6
# and back across the quay with the door on her arm
walk wenna sc-quay-wenna nowait
shot on wenna yaw 0 pitch 12 dist 9 fov 26 lift 0.6
emote player !
emote corin !
wait wenna
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-quay-look
face player sc-quay-look
face wenna sc-quay-look
shot on wenna yaw 355 dist 7.8 3.8 nowait
Wenna: A shield, if you like. I'll want that back. #line:BC808E4453575F099BE08F1204038C0E
party join wenna as greatshield
set wenna-joined
shot reset 1
quest sc-ledger stage lamps

== sc-hold
cutscene
walk player sc-hold-linnet nowait
walk wenna sc-hold-wenna nowait
shot on sc-prosper yaw 330 pitch 22 dist 15 fov 32 lift 1
shot on sc-prosper yaw 336 dist 13 5 nowait
wait wenna
wait player
# (Wenna from the south-west: the sloop frozen in the gap stands on the row's front axis, its mast in the frame)
shot on wenna yaw 320 pitch 12 dist 9 fov 26 lift 0.6
face player sc-hold-look
face wenna sc-hold-look
shot on wenna yaw 323 dist 7.8 7.6 nowait
Wenna: The Prosper. Wool and brandy for Evermere, seven years overdue. I've a key for every hold in this harbour. #line:403AFDD6C72CF9BBE8DC76D50BFD16C8
sfx open
wait 0.6
# the hatch flies open: the Hushguard stowed in the hold climb out onto the mole
shot on sc-prosper yaw 330 pitch 22 dist 15 fov 32 lift 1
sfx iceCrack
shake 0.35
set sc-boarding
effect thaw sc-prosper 1
wait 1.2
shot on wenna yaw 320 pitch 12 dist 9 fov 26 lift 0.6
face wenna sc-prosper
shot on wenna yaw 323 dist 7.8 3.7 nowait
Wenna: Stowaways. Every one of you owes passage! #line:54FAB1EB76732B9DEF50B4DD22969F2D
shot reset 0.4

== sc-gullet
cutscene
walk player sc-mole-linnet nowait
walk corin sc-mole-corin nowait
walk wenna sc-mole-wenna nowait
# the basin from the south-west, high: flat ice round the old mooring rock, the party on the mole's end
shot on sc-basin yaw 330 pitch 26 dist 24 fov 32 lift 1
shot on sc-basin yaw 334 dist 22 5 nowait
wait player
wait corin
wait wenna
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on wenna yaw 355 dist 7.8 7.1 nowait
Wenna: Nobody moors in the basin. Not since my father's day. The fishermen say there's something under it. #line:C24B250B6F2CB96ABB31816F1C4568A4
# S2: the ice cracks; something vast moves beneath; tentacles through the ice
sfx iceCrack
shake 0.3
wait 0.8
# its intro plays in the scene (the ambient step), slowed through the card: the card's shot framed
# before the burst (the look 9 u south of the rock: the beast above the text), the card while it is
# up, then the sink at full speed
shot on sc-gullet-card yaw 0 pitch 20 dist 18 fov 32 lift 2
shot on sc-gullet-card yaw 0 dist 16.5 5 nowait
wait 0.6
slowmo 0.4 0.2
set sc-gullet-rises
wait 1.9
shake 0.5
title Old Gullet | the Thing under the Bay #line:9F4DF2BAF87069CBB9B6BCAD1092E7CE
slowmo 1 0.5
# Corin's line on Corin, the beast gone under: he turns from the basin to the others
shot on corin yaw 30 pitch 12 dist 9 fov 26 lift 0.6
face corin down
shot on corin yaw 33 dist 7.8 4.3 nowait
Corin: The fishermen were right. I hate it when fishermen are right. #line:40F82067E96F9766A3F19C30D47AE685
shot reset 0.6

== sc-gullet-down
cutscene
set sc-gullet-down
wait 1.2
shot on gullet yaw 0 pitch 20 dist 16 fov 32 lift 1.5
walk player sc-mole-linnet nowait
walk corin sc-mole-corin nowait
walk wenna sc-mole-wenna nowait
shot on gullet dist 14 4 nowait
wait 2.6
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on wenna yaw 355 dist 7.8 5.8 nowait
Wenna: There. Gone back down where it came from. And you'll want a receipt for that. #line:B2074D4B3CA3577442F3A7C748761760
give receipt
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on player yaw 3 dist 7.8 3.1 nowait
player: "One kraken, removed. Paid: no." #line:5163B39B69D17A5465B1506E8D38E46F
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face corin sc-mole-look
face player sc-mole-look
face wenna sc-mole-look
shot on wenna yaw 355 dist 7.8 4.5 nowait
Wenna: I'm the harbour master. Somebody has to keep the books. #line:47013EEA9B37BF439B90E47E8EB30BC1
shot reset 0.8
quest sc-ledger stage kraken

== sc-toll
cutscene
teleport player sc-ring up
# (the two parked south of the ring point: out of the hammer's close-up from the east)
if party:corin
  teleport corin 95.5 17.9 up
  walk corin 95.5 17.9
if party:wenna
  teleport wenna 94.5 18.9 up
  walk wenna 94.5 18.9
# (the flag first: the release waits for the thaw, and the front stages the ice, the drifts, the
# Patience, Jory and Bessa)
set bell-tides
call toll-shot
# S3: the bay from the lighthouse as the floes go under and the water turns turquoise (the lighthouse behind the camera)
shot on sc-bay yaw 58 pitch 52 dist 46 fov 34 lift 0
shot on sc-bay yaw 50 pitch 48 dist 42 5 nowait
title The Bell of Tides | Turn, little tide, bring the boats back to shore #line:5B53A66D7B3DFCB22696BB8C87CFA118
# a rime crow on the lighthouse gallery lifts and flies north (the King's eyes)
shot on belfry yaw 0 pitch 18 dist 24 fov 32 lift 6
sfx crowCaw
effect crows belfry 0.4
wait 1.8
shot reset 1
quest year stage harvest

== sc-jory
cutscene
walk player sc-jory-linnet nowait
walk corin sc-jory-corin nowait
walk wenna sc-jory-wenna nowait
walk jory sc-jory-jory nowait
# the Patience at the quay, her sails set, as if she had come in on the morning tide
shot on sc-patience yaw 330 pitch 18 dist 16 fov 32 lift 2
shot on sc-patience yaw 336 dist 14 5 nowait
wait wenna
wait jory
wait player
face jory wenna
face wenna jory
shot on jory yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face jory wenna
shot on jory yaw 355 dist 7.8 2.6 nowait
Jory: You've gone grey, Wenna. #line:DA4BDD1373FB0C2E68FBC8D42DA2AC4D
shot on wenna yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face wenna jory
shot on wenna yaw 3 dist 7.8 3.6 nowait
Wenna: And you've gone nowhere, you great lump. #line:60A6B0ADC85AEB21359211AE210CEF11
shot on jory yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face jory sc-jory-look
shot on jory yaw 355 dist 7.8 16.8 nowait
Jory: Gone nowhere? We came round the head in a fog so thick you could lean on it. Last thing I saw before it closed — old Halloway, up on the north road, ringing a bell black as a kettle. #line:C4A51D895A57E22C298716C09CDE9C84
Jory: Black bell, white fog, and then you, grey as a gull. What day is it? #line:2DD390B8865572D9797FA2DD4D27B678
# Linnet says nothing (a silence, written): the black bell, the north road, her name
shot on player yaw 0 pitch 11 dist 8 fov 20 lift 0.6
face player sc-jory-look
shot on player yaw 3 dist 6.8 3.6 nowait
wait 2.4
# memory flash 2: the shared white veil, and the voice again
call memory-in
Elin: Tell her it's only one night. #line:43227DC6BF1126C52A705A7FF39AFE38
call memory-out
wait 0.8
shot on wenna yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face corin sc-jory-look
face player sc-jory-look
face wenna sc-jory-look
face jory sc-jory-look
shot on wenna yaw 3 dist 7.8 7.6 nowait
Wenna: The harbour's got its master back. And I've an invoice to deliver, soon as I find out who it's made out to. #line:800A126C13328C21C1B35D7D5E4B0D40
shot on jory yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face jory sc-jory-look
shot on jory yaw 355 dist 7.8 4.1 nowait
Jory: Here — first thing the tide brought in. For luck. #line:8022428E64A4AFBAE670D68B7FA08634
home jory 32 23.6
shot reset 1
quest sc-ledger stage home
give seashell
quest sc-ledger done

== jory
cycle sc-jory-talk
  * Jory: Seven years? It was Tuesday a minute ago. Is old Penhallow still at the chandlery? He owes me a rope. #line:CE2F936AC804510CBC4CFE43C14549BE
  * Jory: Wenna says the chandler went to Evermere and married a baker. That can't be right. He hated bread. #line:833F681391E1D2AD5E2A00DC0432F871
  * Jory: I keep looking at the sea and waiting for it to stop again. Silly. It's only water. #line:27982778F2FEC5F58540700F08321189

== sc-gull-steps
bark wenna Gull Steps, clear again. My father carried his lamps up these every evening for forty years. #line:CC7A7DF3429A0959D9CC1F7AB49FC317

== sc-cache-hint
emote corin idea
bark corin That drift on the beach went with the ice. And there's a box under it. Finders keepers is a harbour rule, isn't it? #line:5F7A1DBA5E2DE7E91E6F38E7403BF2E0
wait 3.4
bark wenna It is not. #line:F8AAD04566E53CA4F1A7248C1C9ABB81
