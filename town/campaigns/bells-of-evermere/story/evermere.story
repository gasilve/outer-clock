== ev-cold-open
cutscene
music off
shot on tin_door yaw 20 pitch 18 dist 7.6 fov 26 lift 0.4
shot on tin_door dist 6.8 6.5 nowait
fade in 3
wait 2.4
fade out 1.6
travel halloway-forge forge-hearth

== ev-first-out
cutscene
music hush
shot on belfry yaw 6 pitch 44 dist 50 fov 26 lift 6
shot on belfry pitch 36 dist 42 lift 4 5.4 nowait
fade in 2
wait 3.4
face player tin_door
shot on player yaw 24 pitch 13 dist 7.6 fov 26 lift 0.4
shot on player dist 6.8 4 nowait
wait 0.5
player: Night, Tin. #line:FF5F5ED5134FE573FD832C95791EADBC
shot on tin_door yaw 340 pitch 24 dist 7 fov 24 lift 0.4
shot on tin_door dist 6.2 3 nowait
# (it does not answer; it never has)
wait 2
shot on player yaw 30 pitch 12 dist 7 fov 26 lift 0.4
shot on player dist 6.2 3 nowait
player: Chatty as ever. #line:1C5CBF3C6F13F124888912C9C2DB1615
shot reset 1.2

== ev-night-tin
cycle ev-night-tin
  * bark player Night, Tin. #line:A20F4207AE3917B6EEC765E1E09C8FAE
  * bark player Still here, then. #line:0192B7FC27B9794DB5753629EB12A42A
  * bark player Don't wait up. #line:2CF3CACF27EC95B0CBE789E27C9A70E0
  * bark player You've snow on your shoulders again. #line:38C1EFA47EE528EAD53518D787BB7A96

== ev-square-bell
cutscene
face player belfry
shot on player yaw 300 pitch 10 dist 6.6 fov 26 lift 0.4
shot on player dist 5.8 8 nowait
player: Seven winters, and nobody's dared touch it. #line:6ACA84A842ABA8CB935BDC7CB300475C
player: Grandda used to say a bell's only a question you can hear across a valley. So. Let's ask one. #line:8A4C30FD032ADB0934B69DBDCDF8CBB5
pose player ready
wait 0.7
sfx hammerHit
pose player none
# the bell from below, swinging
shot on belfry yaw 0 pitch 4 dist 12 fov 30 lift 7
toll belfry 0.7
shot on belfry dist 11 2.2
# every Hushguard in Evermere turns its head: each seen still, from the side — then the turn #line:C81DAD9248A6E723DC09570FA85BFBEB
# toward her (a front view), the frost cracking off its joints in a burst of rime. Each from low,
# its helm against what light the blue hour has behind it (a lit wall, lit windows, the lamp-lit
# snow), never the dark cobbles
shot on hg_square yaw 248 pitch 5 dist 7.6 fov 26 lift 0.9
shot on hg_square dist 7 1.7 nowait
wait 0.5
face hg_square player
effect frost hg_square 0.5
sfx iceCrack
wait 1.2
shot on hg_quay yaw 118 pitch 4 dist 7.2 fov 26 lift 0.2
shot on hg_quay dist 6.6 1.6 nowait
wait 0.5
face hg_quay player
effect frost hg_quay 0.6
sfx iceCrack
wait 1.1
shot on hg_gate yaw 285 pitch 4 dist 7.2 fov 26 lift 0.2
shot on hg_gate dist 6.6 1.5 nowait
wait 0.5
face hg_gate player
effect frost hg_gate 0.6
sfx iceCrack
wait 1
shot on tin_door yaw 122 pitch 5 dist 7.2 fov 26 lift 0.5
shot on tin_door dist 6.6 1.9 nowait
wait 0.5
face tin_door player
wait 1.4
# and three come up out of the dark onto the quay
set ev-raid
shot on ev_raid yaw 8 pitch 20 dist 16 fov 30 lift 1
effect frost ev-raid-spot 1.2
sfx iceCrack
shot on ev_raid dist 14 3 nowait
wait 1.8
face player ev-raid-spot
shot on player yaw 12 pitch 12 dist 7.4 fov 28 lift 0.4
shot on player dist 6.6 3 nowait
player: …Well. That's an answer. #line:A364DCAF2E21D80785F46186F0751B2E
# Tin takes one step toward her — and stops
shot on tin_door yaw 330 pitch 22 dist 8 fov 26 lift 0.5
walk tin_door ev-tin-step
home tin_door 29.6 29.5
face tin_door player
shot on tin_door dist 7.2 1.6 nowait
wait 1.6
shot reset 1
bark player Iron's iron. Hit it till it rings — then hit what's underneath. #line:FD8F4E015A4CFAD000E9CC5171EC4DD0
# (the first fight of a new journey: its three keys, once)
toast J — strike · K — roll clear · L — lock on #line:8F599DA5245E6FBC5701FBF6C0B5335C

== ev-ring
cutscene
face player belfry
shot on belfry yaw 0 pitch 4 dist 12 fov 30 lift 7
sfx hammerHit
toll belfry 0.45
shot on belfry dist 11 2
shot reset 0.8
cycle ev-ring
  * bark player For luck. #line:8248F68E3290D73727BBCDD6650EE01D
  * bark player Still rings true. That's something. #line:E74454985700C6CE7FFFE8E8708F76E0
  * bark player Nobody came running. Good. #line:CBB5DCF7684798A96421E1CB23ABC172

== ev-set-out
cutscene
wait 1
fade out 0.8
teleport player ev-so-linnet down
teleport agathe ev-so-agathe down
walk agathe ev-so-agathe
teleport nettle ev-so-nettle down
walk nettle ev-so-nettle
teleport dilly ev-so-dilly down
walk dilly ev-so-dilly
shot on ev-so-mid yaw 0 pitch 18 dist 15 fov 30 lift 0.6
shot on ev-so-mid dist 13.6 6 nowait
fade in 1.2
wait 1
shot on agathe yaw 340 pitch 12 dist 7.4 fov 28 lift 0.6
shot on agathe dist 6.6 4 nowait
Agathe: Linnet Halloway! Are you hurt? What were they? #line:74F32A1A8BACC45E33ED8C11DC56A402
shot on player yaw 8 pitch 12 dist 7.6 fov 28 lift 0.6
shot on player dist 6.8 5 nowait
player: Nothing. Armour full of frost. Hit it hard enough and the cold lets go. #line:5C6A35E1BA9EFB59C776D1EE21FCA0D8
shot on nettle yaw 345 pitch 12 dist 7.4 fov 28 lift 0.6
shot on nettle dist 6.6 6 nowait
Old Nettle: Seven years they've stood about this town like coat-stands, and you go and ring the bell at them. #line:417454C44BDB6E7088FB6D8480A2F892
shot on player yaw 6 pitch 12 dist 7 fov 28 lift 0.6
shot on player dist 6.3 2.6 nowait
player: Somebody had to ask. #line:8ABC728EF6A18EE01EF7DA78045FBE60
# (the rule, said once, plainly: a wider shot of her and the ice she is looking out over)
shot on player yaw 352 pitch 16 dist 10.5 fov 28 lift 0.6
shot on player dist 9.3 10 nowait
player: The year turns in order. Waking, Tides, Harvest, Rest — four bells, one at each edge of the valley, and each one frees its own edge into the season it was holding. #line:A95F8AB9D69D11385A29AE6EC3F6C1AC
shot on player yaw 14 pitch 12 dist 6.6 fov 28 lift 0.6
shot on player dist 5.9 3 nowait
player: We're in the middle. We go last. #line:25644EE86D18D885FF660F35269B151A
shot on nettle yaw 350 pitch 12 dist 7 fov 28 lift 0.6
shot on nettle dist 6.2 4 nowait
Old Nettle: The bells are broken, girl. Everyone knows that. #line:DFA5B1CC79AEFD66267D5911FD5FE263
shot on player yaw 14 pitch 10 dist 6.6 fov 28 lift 0.6
shot on player dist 5.7 6 nowait
# (her defining line waits for the Bell Court, said to Osmund; here only its trade)
player: Then they'll be wanting a founder. #line:554B85172ADD64DD6797F7DBF4E29325
player: West first. The Bell of Waking. #line:C6154AC2C81DC921458ED3F97ACE307D
shot on dilly yaw 20 pitch 14 dist 6.4 fov 28 lift 0
shot on dilly dist 5.6 4 nowait
Dilly: Will you bring me a flower? A real one? #line:B78B2DC684DFCA249608AA5407CD0DE7
face player dilly
shot on player yaw 62 pitch 12 dist 7.4 fov 28 lift 0.6
shot on player dist 6.6 3 nowait
player: If they still make them. #line:7DF35A3435EB352FD36EDF2F73F57730
quest year stage waking
quest dilly stage blossom
set set-out
home agathe 9.2 29.4
home nettle 63.2 34.8
home dilly 50.2 21.4
shot reset 1.2
toast The west road to the Blossomwood is open. #line:B215E4DA49F9F4BC0FA7768DB9400FFF

== ev-lantern-1
cutscene
# the lantern lit for the west bell, at the belfry's foot, the tower above it
shot on lantern_1 yaw 330 pitch 14 dist 9 fov 30 lift 0.4
shot on lantern_1 dist 8.2 3.4 nowait
wait 1.8
face player belfry
face dilly player
shot on dilly yaw 15 pitch 14 dist 6.4 fov 28 lift 0
shot on dilly dist 5.6 5 nowait
Dilly: I lit it! Gran held the ladder. We heard it, Linnet — all the way from the west! #line:56500C6193C3B88C521991D3782F6FBF
shot reset 1

== ev-lantern-2
cutscene
shot on lantern_2 yaw 330 pitch 14 dist 9 fov 30 lift 0.4
shot on lantern_2 dist 8.2 3.4 nowait
wait 1.8
face dilly player
shot on dilly yaw 15 pitch 14 dist 6.4 fov 28 lift 0
shot on dilly dist 5.6 5 nowait
Dilly: Two! Cobb lit that one. He says he's a professional and I'm not allowed. #line:78FBECA7343A580764580095F3FEB452
shot reset 1

== ev-drift-dug
toast The town has dug the gorge road out. The way south to Saltcombe is open. #line:43465D418DAD6E4C29C5077C70D5E50F

== ev-ridge-look
player: Ice shove. The whole lake's been leaning on this shore since the freeze. I'd need a crowbar the size of a mast. #line:CDF301EFAD5DBE32E6A364B6FE0F3B07

== ev-ridge
cutscene
shot on ev-ridge yaw 300 pitch 14 dist 12 fov 30 lift 1.4
shot on ev-ridge dist 11 5 nowait
if party:wenna
  walk wenna ev-ridge-wenna
  face wenna ev-ridge
  shot on wenna yaw 240 pitch 12 dist 7.6 fov 28 lift 0.7
  shot on wenna dist 6.8 4 nowait
  Wenna: Ice shove. Seen one put a wall across Saltcombe harbour in a night. Stand back. #line:72552D8E133E0FD97AB5B4452C7DD4F3
  shot on ev-ridge yaw 300 pitch 12 dist 10 fov 30 lift 1.2
  sfx hammerSlam
  shake 0.4
  effect frost ev-ridge 1.6
  effect dust ev-ridge 1.2
  sfx iceBreak
  set ev-east-open
  wait 1.4
  shot on wenna yaw 230 pitch 12 dist 7.4 fov 28 lift 0.7
  shot on wenna dist 6.6 4 nowait
  Wenna: One ridge, removed. I'll put it on the account. #line:BEAC09F49B5A38FAF8CD511FF5C65FFA
else
  face player ev-ridge
  pose player ready
  wait 0.6
  sfx hammerSlam
  pose player none
  shake 0.35
  effect frost ev-ridge 1.4
  sfx iceBreak
  set ev-east-open
  wait 1.2
  bark player That's the east road, then. #line:1E894796E57D0298A3F25FBA8859403A
shot reset 1

== ev-frost-gate
cutscene
music off
teleport player ev-gate-linnet up
teleport corin ev-gate-corin up
teleport wenna ev-gate-wenna up
teleport tin ev-gate-tin up
walk corin ev-gate-corin
walk wenna ev-gate-wenna
walk tin ev-gate-tin
shot on ev-gate yaw 352 pitch 22 dist 26 fov 32 lift 3
shot on ev-gate dist 23 8 nowait
fade in 2
wait 0.8
# the west bell (the Bell of Waking, the shrine bell: A, from the west road)
sfx bellTollFar pitch 7 pan -0.8
shot on sign_west yaw 75 pitch 18 dist 12 fov 30 lift 1.4
effect toll sign_west 3.9
shot on sign_west dist 10.5 1.8 nowait
wait 1.8
shot on ev-gate yaw 0 pitch 16 dist 14 fov 30 lift 3
sfx iceCrack
effect frost ev-gate 0.8
wait 1
# the south bell (the Bell of Tides, the lighthouse bell: F♯, up the gorge road behind the camera)
sfx bellTollFar pitch 4 pan 0
shot on sign_south yaw 180 pitch 18 dist 12 fov 30 lift 1.4
effect toll sign_south 3.9
shot on sign_south dist 10.5 1.8 nowait
wait 1.8
shot on ev-gate yaw 8 pitch 16 dist 13 fov 30 lift 3
sfx iceCrack
effect frost ev-gate 1.1
shake 0.2
wait 1
# the east bell (the Bell of Harvest, the abbey bell: B, from the east road) — and the gate goes
sfx bellTollFar pitch 9 pan 0.8
shot on sign_east yaw 270 pitch 18 dist 12 fov 30 lift 1.4
effect toll sign_east 3.9
shot on sign_east dist 10.5 1.8 nowait
wait 1.8
shot on ev-gate yaw 0 pitch 14 dist 16 fov 30 lift 3
sfx iceBreak
set ev-gate-open
effect thaw ev-gate 2
effect frost ev-gate 1.6
shake 0.45
shot on ev-gate dist 14 3 nowait
wait 2.4
# the party below the open gate
face corin player
face wenna player
face tin player
shot on corin yaw 240 pitch 12 dist 8 fov 28 lift 0.4
shot on corin dist 7.2 5 nowait
Corin: Every bell in the valley just rang at once, and you look like somebody stood on your foot. #line:CBA8AAFAE8F84F7DFA701E3AC658B088
# (she looks up the mountain road, past the broken gate)
face player ev-gate
shot on player yaw 160 pitch 12 dist 7.6 fov 28 lift 0.6
shot on player dist 6.8 5 nowait
player: He's up there. Grandda. He's been up there the whole time. #line:04AE3745C99EA961528F19948D8DF7FB
# (she looks down over the town she is leaving for the mountain: her face to the camera)
face wenna down
shot on wenna yaw 350 pitch 14 dist 7.6 fov 28 lift 0.4
shot on wenna dist 7.2 4 nowait
Wenna: Then we'll go up and have a word with him. I've brought the ledger. #line:EDD6FD65FF7C7F0B608EC9857814373F
# Tin strikes its fork: one note — Rest's (it looks out over the town, as at the door)
face tin down
shot on tin yaw 20 pitch 12 dist 7.4 fov 26 lift 0.5
shot on tin dist 6.8 3 nowait
bark tin ♪ #line:BFFE86F15EB58B2D9B297090FC24A433
sfx tuningFork
wait 1.8
face player tin
shot on player yaw 300 pitch 12 dist 7.2 fov 28 lift 0.4
shot on player dist 6.6 3 nowait
player: …That's the Rest note. #line:44F1465F1321D05FD3E4B03485176085
music on
shot reset 1.2

== ev-gate-look
cutscene
shot on ev-gate yaw 0 pitch 14 dist 13 fov 30 lift 3
shot on ev-gate dist 12 4 nowait
player: The Frost Gate. Ice to the sky — and it hums, when the wind's in the north. #line:B0F2DAA3FC939EDBDD9CAAF35AB38631
shot reset 0.8

== ev-grave
cutscene
face player elin_grave
# (over Mam's stone, Linnet kneeling beyond it, her face to the lens)
shot on elin_grave yaw 225 pitch 18 dist 7 fov 28 lift 0.8
pose player kneel
shot on elin_grave dist 6.2 6 nowait
wait 1.2
if bell-harvest
  player: I remember now, Mam. All of it. …I'm sorry. #line:7FEFD6C97E34C09471ACC7BD90BD86A0
  player: I'm going to let it be morning. #line:9D85FF4F5187435A7BEB3CA3A847B652
elif bell-tides
  player: Two bells, Mam. There's a harbour master who fights with a door. You'd have liked her. #line:B6B647CAB383E61BC67D2C7FB998B7DC
elif bell-waking
  player: One bell. It's blossom out west, Mam. Pink and white. You'd have picked an armful. #line:CD709F5A1B5B3DAEEA60B015A41BEEA5
else
  player: Morning, Mam. …Evening. It's always evening. #line:D2F2C5C6DA5420D07CB357A758D2D0EC
pose player none
shot reset 1

== ev-dilly
if bell-harvest
  if item:red-leaf
    take red-leaf
    Dilly: It's RED. Is it hot? It looks hot. …It's not hot. #line:DAFBF9B2DD4A76C1FB2AD2D62E4183ED
    Dilly: That's three. A blossom, a shell and a leaf. Gran says there's one more season, and it's ours. #line:80893500187C4AE13EE9DE1E015EF6A6
    quest dilly stage crown
    stop
  once ev-dilly-leaf
    Dilly: The east bell! Did you bring me a leaf? A red one? #line:0EF5CCC2237E3F96A161E632A7045B11
    player: They're all red over there. Red and gold, the whole field. Like the forge, but quiet. #line:E1DD52EE89296FD0473F1A61205DAADE
    Dilly: Like the forge but quiet. …I'm going to think about that all night. #line:E9382E034A2573A229EBE3449E3C9A9B
    quest dilly stage crown
    stop
  Dilly: Gran says when it's spring here I'm to make a crown of everything. You'll have to help. I don't know what everything is yet. #line:64E136C097A63BDC0205CF01E5AC9EC8
  stop
if bell-tides
  if item:seashell
    take seashell
    Dilly: A shell! It sounds like snow inside. Is the sea made of snow? #line:78331B0A43E778C9E008884CDDB7D900
    player: Salt. Mostly salt, and boats, and one very large fish. #line:7D4A25FCCCCCA4A36C35E2D8669E4F33
    quest dilly stage leaf
    stop
  once ev-dilly-shell
    Dilly: The south bell! Is the sea real? Is it bigger than the lake? #line:22603117AA5C0F15647A4243E824A5B7
    player: Bigger than the lake. It doesn't stop. It just goes on till it's sky. #line:C41BAE39479C4C203E8FB58172E98B05
    Dilly: Now bring me a leaf. A red one. Gran says they go red before they fall, like they're embarrassed. #line:C69DC76944273D4BCA15572C4BCDA9F1
    quest dilly stage leaf
    stop
  Dilly: A red leaf next. Don't forget. I've written it on my hand. #line:5E7E55F781922778EE7838EADABA5C5F
  stop
if bell-waking
  if item:blossom
    take blossom
    Dilly: …It's so small. Gran said they'd be small. I didn't believe her. #line:02F77C53E3F9DD4280E22BC0212B89AC
    Dilly: Can I keep it forever? Will it stay? #line:E4D5ECE328FD596C7C9216DC359997C0
    player: Not forever. That's the point of them, I think. #line:70CF989EF6A799E22F8EDC077E4E1A88
    quest dilly stage shell
    stop
  once ev-dilly-blossom
    Dilly: You rang it! Did you see one? A flower? #line:2BCE368F30A851C752ADB1730B56FE7A
    player: Thousands. White, mostly, and pink at the edges. They smell like a clean shirt. #line:94D1394602282AC38DF05823F95FDACE
    Dilly: That's not a smell. …Bring me a seashell next. From the sea. Gran says it's south. #line:3532C9A803900A18EA6555655BCFC25C
    quest dilly stage shell
    stop
  Dilly: A seashell, Linnet. From the sea. South. #line:4C419B9939AD9AE35CD3E895A0414EC4
  stop
if set-out
  Dilly: A flower. A real one. Not a paper one — Cobb made me a paper one and it doesn't count. #line:6B810FD127C9667831360F91317CD6D6
  stop
cycle ev-dilly-prologue
  * Dilly: Gran says flowers are like snow, only they come up instead of down. #line:0F6597ED174915F23FD974DAF331519A
  * Dilly: Is it true there was a colour called green? Not pine green. Grass green. #line:AA9F16CB048532F5377C0F72CE368408
  * Dilly: When I'm big I'm going to see a summer. Gran says they're mostly flies, but I don't mind. #line:54C2BD4729D9E73E5ABD2F6C3152349A

== ev-agathe
if bell-harvest
  if party:tin
    once ev-agathe-tin
      Agathe: Your knight's gone from the door, love. Gave me a turn this morning. #line:2B8477359E1102F01F9C90859FB26030
      Agathe: …Oh. There it is. Hello, dear. Does it eat cake? #line:35936BB3F046552C85F0C8343196F79C
      bark tin ♪ #line:92CDA0A8C9206C18CA57150084F31BC1
      stop
  Agathe: Three bells. Number 2,578, iced. I've a feeling about tomorrow's. Don't you laugh. #line:819E1018476644D60E4187E02F4B581E
  stop
if bell-tides
  Agathe: Two bells! I've started icing them. That's how hopeful I am. Number 2,570, with a cherry on. #line:A6CD5251D2F661EBDA47FD458C780444
  stop
if bell-waking
  Agathe: The west bell! I put an extra egg in this morning's, for luck. Number 2,563. #line:3DFEE3ACF2425866EA197404D86E9336
  stop
if set-out
  Agathe: Take a slice for the road. …No? Nobody ever does. The crows won't touch them any more either. #line:C2B45788C7CC702B17E993273B07AAE8
  stop
cycle ev-agathe-prologue
  * Agathe: A Waking Cake, fresh this morning. In case today's the day. #line:02A7D8A78786BED13876D9C6B08D183C
  * Agathe: That's number 2,557. I bake one every morning. One morning somebody's going to need it. #line:0316673FCCBD4D85BAEB1EA76123B2DF
  * Agathe: Your knight's at the forge door again. Every night. You'd think it'd want a sit-down. #line:4DE0AD811E9D04BE4E212EF383540099

== ev-nettle
if bell-harvest
  Old Nettle: Mark me — it'll turn. I've a knee for weather, and it's itched since your first bell. #line:43F507C10B304B1F9BA76396D3EF50C3
  stop
if bell-tides
  Old Nettle: When I was a girl the sun went backwards for a whole afternoon. Nobody else noticed. Typical. #line:D83C7F1FCE4E049A94B295B1354931F5
  stop
if bell-waking
  Old Nettle: I've seen the sea, you know. Twice. Once it was the wrong colour. #line:2C0D8E087698C1BB49B364B941A4C0EE
  stop
if set-out
  Old Nettle: I taught your grandfather to ring. Left hand on the rope, right hand on your heart. He never listened. #line:F48DC95D1282E7B3B721D3FE454C1545
  stop
Old Nettle: The year's stopped before, you know. For a fortnight, when I was small. We liked it. #line:14A74EAA4EF446BB873015B8A5A820AF

== ev-maud
if bell-harvest
  Gran Maud: Three lanterns. I've been telling that child stories about spring since she could talk. She likes yours better. #line:21555E80C2D7514ECA86D777ED3EF7FE
  stop
if bell-waking
  Gran Maud: She climbed that ladder steadier than I held it. Seven, and she's never seen a lantern lit for anything good. #line:2EC69AEB831FEFFC7B012D5F72893726
  stop
Gran Maud: I tell her what I remember. Flowers, rain, the smell of cut grass. Some of it I make up. She'll not know the difference till she sees it. #line:7E0C4F974B3332B9A0CD750F636F7489

== ev-cobb
if bell-harvest
  Cobb: Three lanterns. I've started a fourth. Optimism, the child calls it. #line:9362FBDAEF5A313E4152F911ECA4BF85
  stop
if bell-tides
  Cobb: I lit the second lantern. Professional job. The child's not allowed up ladders after the first one. #line:47978D2E3280E3440105C9C70687CD5E
  stop
if bell-waking
  Cobb: The child lit the first one herself. Up the ladder before I'd found my boots. #line:56EF80924F9FB924A7CA59CD459D4F58
  stop
cycle ev-cobb
  * Cobb: I light them every evening. It's always evening. You do the sums. #line:44CB964823CCDFC7318399803DCE6221
  * Cobb: All that lamp oil. The harbour master down at Saltcombe counts hers, I hear. Every lamp. #line:AA8FE585E5A1A1A6CB2AF960C4C831C4

== ev-gilly
if bell-harvest
  Gilly: Three bells! I've been practising on the well with a stick. Forty hits. It hasn't rung once. #line:2935D88BB2BDE520A75CCB8190A17D8A
  stop
if bell-tides
  Gilly: Did you fight a kraken? Corin says you fought a kraken. Corin says a lot of things. #line:77F24A99ED605420E44ED69C568081A2
  stop
if bell-waking
  Gilly: A knight walked right past the forge last night. I hid. Bravely. #line:E7134DE65A4DC2BE6BB76D82B6C2A82C
  stop
if set-out
  Gilly: You hit a knight! With a hammer! Do it again, I wasn't looking at the start! #line:52E02EFBF79016A95E5FA84127DD5E75
  stop
Gilly: Race you to the island! …Oh. You've got a hammer. Never mind. #line:8C8A82780AA07D50034408A5671373AD

== ev-bryn
if bell-harvest
  Bryn: They say Amberfield's mills are turning. Mine's next. She's next, isn't she? #line:6D3AEA8FA4A947FF9F16FE6D7F02596F
  stop
if bell-tides
  Bryn: The stream's talking under the ice by the wheel. First time since that night. I put my ear to it. #line:74160077D540C32C80F7463EA219995A
  stop
if bell-waking
  Bryn: The west bell, was it? Then I'll have flour on my hands by summer. Mark me. #line:D838037F0C3A5672E04F0CCE85461DD3
  stop
Bryn: Her sails haven't turned since that night. I grease her every week anyway. You never know. #line:C573BB3E8EB4BFE7CA73F85FC246CF33

== ev-osric
if bell-harvest
  Osric: Seven years I watched that wall, and I'd have sworn nothing could shift it. Mind how you go up there. #line:D8281F683C5E2A76E35A4233104168D5
  stop
if bell-tides
  Osric: Two bells. The ice on the gate's gone grey at the edges. Like a beard. Like mine. #line:090DC39E99484B42CC5643E3CE63DEF9
  stop
if bell-waking
  Osric: The west bell rang, and the wall up there sang back. Never heard it do that. #line:08093F5D1642708D5C648DDE7B6A9FC8
  stop
cycle ev-osric
  * Osric: Nothing comes down through that ice. Nothing goes up. I watch it anyway. #line:432C61663E40CED38D3A88290AF422C3
  * Osric: Some nights the wall hums. Same note every time. Gets in your teeth. #line:2C1629F4DC2EE2B87C89C7A22D3BD17B
