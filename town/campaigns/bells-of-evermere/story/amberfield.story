== af-arrival
cutscene
set af-arrived
teleport player af-entry up
# on black: A1 — the rimed mills against the low sun, low and long, frost on the standing wheat
shot on af-mills yaw 330 pitch 14 dist 30 fov 22 lift 3
walk player af-supper-linnet nowait
walk corin af-supper-corin nowait
walk wenna af-supper-wenna nowait
fade in 2.4
shot on af-mills yaw 334 pitch 13 dist 27 6 nowait
wait 4
# the supper in the farmyard, laid seven years under snow
shot on af-supper yaw 0 pitch 30 dist 15 fov 32 lift 0.6
shot on af-supper yaw 6 dist 13 6 nowait
wait player
wait corin
wait wenna
face mabry af-supper-look
face player af-supper-look
face corin af-supper-look
face wenna af-supper-look
shot on mabry yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face mabry af-supper-look
face player af-supper-look
face corin af-supper-look
face wenna af-supper-look
shot on mabry yaw 11 dist 7.8 4 nowait
Old Mabry: We sat down to eat, and the light never moved. #line:B63DD723BF57243D39782CDAD8D8B2A6
shot on wenna yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face mabry af-supper-look
face player af-supper-look
face corin af-supper-look
face wenna af-supper-look
shot on wenna yaw 355 dist 7.8 5.6 nowait
Wenna: Twelve places, eleven empty. And a pie nobody's cut. That's a supper owed. #line:ECB1EAC05E1951F03E414BCDA8DC1CE5
shot on mabry yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face mabry af-supper-look
face player af-supper-look
face corin af-supper-look
face wenna af-supper-look
shot on mabry yaw 11 dist 7.8 6.3 nowait
Old Mabry: Abbey bell's up the hill, past the mills. They've not turned since. Nor has anything. #line:BD81AA8799F6D6B835644ACE5E766438
shot reset 1
quest af-harvest start

== af-fallow
cutscene
set af-fallow-met
walk player af-press-linnet nowait
walk corin af-press-corin nowait
walk wenna af-press-wenna nowait
walk fallow af-press-fallow nowait
shot on af-press-mid yaw 4 pitch 16 dist 9 fov 40 lift 0.6
shot on af-press-mid yaw 8 dist 8.5 4 nowait
wait player
wait corin
wait wenna
face wenna af-press-look
face player af-press-look
face corin af-press-look
face fallow af-press-look
shot on corin yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face wenna af-press-look
face player af-press-look
face corin af-press-look
face fallow af-press-look
shot on corin yaw 3 dist 7.8 7.7 nowait
Corin: Afternoon, Brother! We're after the abbey bell, and I was just telling these two about the time I wrestled a— #line:9C53A429FA9F6F5C163EBB4D1F4B948D
# the handbell, once: Corin stops
sfx chime
emote fallow note
emote corin ...
wait 1.2
shot on fallow yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face wenna af-press-look
face player af-press-look
face corin af-press-look
face fallow af-press-look
shot on fallow yaw 355 dist 7.8 2.5 nowait
Brother Fallow: Works on novices too. #line:C41DCA6C0830624ED3CC5F6FA6862D30
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face wenna af-press-look
face player af-press-look
face corin af-press-look
face fallow af-press-look
shot on player yaw 3 dist 7.8 3.7 nowait
player: A handbell. Does it work on the Hushguard? #line:F50C2BA1A68135E546A8ADC2C503B082
shot on fallow yaw 352 pitch 12 dist 9 fov 26 lift 0.6
face wenna af-press-look
face player af-press-look
face corin af-press-look
face fallow af-press-look
shot on fallow yaw 355 dist 7.8 18.7 nowait
Brother Fallow: Seven years I've rung it at them. A bell-note stills them, for a breath. They listen. #line:78861D445BD30E77949546A44751EA1F
Brother Fallow: But there are cantors in the fields now — hollow things in choir robes, ringing bells of their own. When a cantor rings, the knights mend. #line:B87F147A588C90093704A1C2D0DFADCB
Brother Fallow: So. Ringers first. Then the knights. Then supper. #line:D0D35BECE39151DB5AAA8E0B7FCEC0D8
home fallow 58.4 78.6
shot reset 0.8
quest af-harvest stage mills

== fallow
if bell-harvest
  Brother Fallow: Gold to the hedges. I rang this little bell for seven years so I'd not forget what that sound was for. #line:53F3BC108FCDB6B5644BF9D250BACDC0
  Brother Fallow: Go on home, bell-founder. And mind your knight. It listens better than any novice I ever had. #line:9E589A1EBEE54144FE0282E89CA0D42C
  stop
cycle af-fallow-talk
  * Brother Fallow: Ringers first. The cantors mend the knights; a knight with no cantor is only armour with an opinion. #line:5013F6288CECF3AD033196A95FE183B9
  * Brother Fallow: The mills? Strike the hub. Old Mabry swears by it, and he's been wrong about everything else. #line:A2E780479F13F4047FDA9A3AA4846B73
  * Brother Fallow: Something walks in the Harvest Close at dusk. Which is always, now. It wears a coat. #line:C2180CC8B7356A3185F1C6A343D1D9A4

== af-mill-1
if af-mill-1
  face player mill_w
  sfx hammerHit
  bark player The sails are turning. That's all this one has to give. #line:512C27BC45EEF1EC3F90BE8E54D09E46
  stop
cutscene
face player mill_w
shot on mill_w yaw 20 pitch 14 dist 14 fov 32 lift 3
shot on mill_w yaw 26 dist 12.5 3 nowait
wait 0.4
sfx hammerHit
shake 0.25
set af-mill-1
sfx millStart
wait 1.6
# the gust: leaves streaming east along the lane, the fog bank torn away — and what it hid
shot on af-bank-1 yaw 70 pitch 40 dist 22 fov 30 lift 0.5
effect leaves af-bank-1 1.4
sfx windGust
shot on af-bank-1 yaw 76 dist 20 2 nowait
wait 1.4
# the line on its speaker
shot on corin yaw 0 pitch 12 dist 9 fov 26 lift 0.6
face corin down
shot on corin yaw 3 dist 7.8 5 nowait
Corin: There's the wind! And — oh, lovely. There's what was in the fog. #line:0DB5668DDCE3BDA407E640F76FE0B7DD
shot reset 0.6

== af-mill-2
if af-mill-2
  face player mill_c
  sfx hammerHit
  bark player The sails are turning. That's all this one has to give. #line:1BCD40537F29C567C0E862DCA86272B4
  stop
cutscene
face player mill_c
shot on mill_c yaw 20 pitch 14 dist 14 fov 32 lift 3
shot on mill_c yaw 26 dist 12.5 3 nowait
wait 0.4
sfx hammerHit
shake 0.25
set af-mill-2
sfx millStart
wait 1.6
# the gust: leaves streaming east along the lane, the fog bank torn away — and what it hid
shot on af-bank-2 yaw 70 pitch 40 dist 22 fov 30 lift 0.5
effect leaves af-bank-2 1.4
sfx windGust
shot on af-bank-2 yaw 76 dist 20 2 nowait
wait 1.4
# the line on its speaker
shot on wenna yaw 0 pitch 12 dist 9 fov 26 lift 0.6
face wenna down
shot on wenna yaw 3 dist 7.8 5.3 nowait
Wenna: Fog cleared, hedge open, knights behind it. I'll invoice the miller. #line:469FA993835F3B9ADBBDC55DA7F7735A
shot reset 0.6

== af-mill-3
if af-mill-3
  face player mill_e
  sfx hammerHit
  bark player The sails are turning. That's all this one has to give. #line:DED0335C0D54F7B6C2175A490FEDDF84
  stop
cutscene
face player mill_e
shot on mill_e yaw 20 pitch 14 dist 14 fov 32 lift 3
shot on mill_e yaw 26 dist 12.5 3 nowait
wait 0.4
sfx hammerHit
shake 0.25
set af-mill-3
sfx millStart
wait 1.6
# the gust: leaves streaming east along the lane, the fog bank torn away — and what it hid
shot on af-bank-3 yaw 0 pitch 30 dist 22 fov 30 lift 0.5
effect leaves af-bank-3 1.4
sfx windGust
shot on af-bank-3 yaw 6 dist 20 2 nowait
wait 1.4
# the line on its speaker
shot on player yaw 0 pitch 12 dist 9 fov 26 lift 0.6
face player down
shot on player yaw 3 dist 7.8 4.2 nowait
player: The way up to the Close. Ringers first — remember. #line:3CE1F5A49B795A9DE08446055B9FB443
shot reset 0.6

== af-mawkin
cutscene
walk player af-close-linnet nowait
walk corin af-close-corin nowait
walk wenna af-close-wenna nowait
# the Close from its east end: stubble to the far hedges, the abbey above, crows on the furrows
shot on af-close yaw 70 pitch 16 dist 26 fov 30 lift 2
shot on af-close yaw 74 dist 23 6 nowait
wait player
wait corin
wait wenna
face player af-close
face corin af-close
face wenna af-close
wait 0.6
# A2: the field lifts — the Mawkin bursts out of the frozen wheat in its crows (its intro in the
# scene: the burst at f60, awake at f96, done at f156)
shot on af-close yaw 0 pitch 12 dist 18 fov 32 lift 4
set af-mawkin-rises
shot on af-close yaw 0 dist 16.5 3.4 nowait
wait 1
sfx crowFlock
shake 0.4
wait 1.6
# the card once it is awake, beside it (the look 5.5 u east of it: the Mawkin left of the text in every language)
shot on af-mawkin-card yaw 0 pitch 14 dist 18 fov 32 lift 3
title The Harvest Mawkin | Keeper of the Frozen Field #line:F0D8B412F04865D451794A85C8075066
shot on corin yaw 260 pitch 12 dist 9 fov 26 lift 0.6
face corin af-close
shot on corin yaw 263 dist 7.8 4.1 nowait
Corin: That's a scarecrow. Why is it the size of a barn? #line:7CE552962EA419CEB73FAB0B2B44C2B0
shot on wenna yaw 280 pitch 12 dist 9 fov 26 lift 0.6
face wenna af-close
shot on wenna yaw 283 dist 7.8 4.8 nowait
Wenna: It's wearing a coat. Who dresses a scarecrow in a good coat? #line:89BC687F1F0C92777F6DC5AE92FE9E48
shot reset 0.6

== af-wish
cutscene
wait 1.4
# the straw heap where the Mawkin fell, and the coat on it (the camera follows the fallen boss's body)
shot on mawkin yaw 10 pitch 20 dist 11 fov 30 lift 0.8
shot on mawkin yaw 14 dist 9.5 7.4 nowait
wait 1.4
player: It's Grandda's coat. These burns on the cuffs — that's bell-metal. He never would wear gloves. #line:535F5E04657D060D74FB309FABBF97A4
give osmund-coat
fade out 0.6
teleport player af-wish-linnet up
teleport corin af-wish-corin up
teleport wenna af-wish-wenna up
# (the members pinned on their marks: a zero-length walk directs them)
walk corin af-wish-corin
walk wenna af-wish-wenna
face corin af-wish-look
face player af-wish-look
face wenna af-wish-look
shot on player yaw 0 pitch 13 dist 8.6 fov 22 lift 0.6
fade in 0.6
pose player kneel
shot on player yaw 3 dist 7.4 2.4 nowait
player: There's something in the pocket. #line:A340FB352262BD0347C3FC026679EAEA
give drawing
# the drawing: four bells, and a fifth, black, in a child's hand
: A child's drawing, folded small. Four bells in a row, and a fifth, coloured in black. Under it, in big uneven letters: SO MAM CAN STAY. #line:14E9EDA8F6EA59E821778B13FD3D5FE3
pose player none
# the memory: the shared white veil, a girl's voice, an old man's (under the white the heap where
# the Mawkin fell goes: Linnet has the coat)
music off
sfx memoryChime
shot on player yaw 3 dist 6.8 6 nowait
# (the white held under both lines — the whole memory over white — and let go after them)
flash white 0.8 hold
wait 0.8
set af-coat-taken
Young Linnet: Don't let it be morning, Grandda. Please. #line:BE4C35F88F1D6CAAB12049824E78CEA6
Osmund: I'll see what I can do, sparrow. #line:4C11B998B3F8BB74246BF69804EA7ED2
# (the window closes on the white, a beat, then the white lets go)
wait 0.5
flash white 2
wait 1
# Linnet, now (her face, close; nobody else in frame)
shot on player yaw 0 pitch 10 dist 7.6 fov 20 lift 0.6
face player af-wish-look
shot on player yaw 3 dist 6.4 6.2 nowait
player: I asked him. I was ten, and Mam was cold, and I asked him not to let it be morning. #line:04CA36F8E1E38D0207C44A890F23BE07
# Corin says nothing (a silence, written); Wenna closes her ledger
shot on corin yaw 8 pitch 12 dist 9 fov 24 lift 0.6
face corin af-wish-look
shot on corin yaw 11 dist 7.8 2.8 nowait
emote corin ...
wait 2.4
shot on wenna yaw 352 pitch 12 dist 9 fov 24 lift 0.6
face wenna player
shot on wenna yaw 355 dist 7.8 2.8 nowait
sfx close
emote wenna ...
wait 2.2
set af-wish-done
music on
shot reset 1
quest af-harvest stage bell

== af-toll
cutscene
teleport player af-abbey-linnet up
walk corin af-abbey-corin nowait
walk wenna af-abbey-wenna nowait
wait corin
wait wenna
face wenna af-abbey-look
face corin af-abbey-look
face player af-abbey-look
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
shot on player yaw 3 dist 7.8 4 nowait
loop
  choice Ring the Bell of Harvest? #line:DE388EAE297F476D7F130A7536A1FC33
    > Ring it #line:199B35BC476DE7608EF1FA3B4D07BABD
      break
    > …I can't #line:E6227FBE1FF966E1FD5C9098BF7A7A1B
      shot on corin yaw 0 pitch 12 dist 9 fov 22 lift 0.6
      face wenna af-abbey-look
      face corin af-abbey-look
      face player af-abbey-look
      shot on corin yaw 3 dist 7.8 5.7 nowait
      Corin: You can. And if you can't, I'll tell everyone you did. I'm very convincing. #line:99628F533A34A8AF1764C846958DB01B
      shot on wenna yaw 8 pitch 12 dist 9 fov 26 lift 0.6
      face wenna af-abbey-look
      face corin af-abbey-look
      face player af-abbey-look
      shot on wenna yaw 11 dist 7.8 5.3 nowait
      Wenna: You were ten. A debt that old, the harbour writes off. Ring it, love. #line:88E9D082926A48D3E8B2774749B3C80F
      shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
      face player af-abbey-look
      shot on player yaw 3 dist 7.8 3 nowait
teleport player af-ring up
# (the two parked beside the ring point: out of the hammer's close-up)
teleport corin 55.4 13.4 up
walk corin 55.4 13.4
teleport wenna 57.2 12.6 up
walk wenna 57.2 12.6
# (the flag first: the release waits for the thaw, and the front stages what it brings and takes —
# drifts, fog, leaves, the farmers, Tin)
set bell-harvest
call toll-shot
# A3: the wheat wave from the south, low — white to gold under the turning sails behind the front
shot on af-wheat yaw 12 pitch 20 dist 30 fov 30 lift 2
shot on af-wheat yaw 15 pitch 19 dist 28 4 nowait
title The Bell of Harvest | Gold, little field, for the reapers are home #line:740AB65949EB9E4AD7D84A944D012077
# Tin walks out of the falling leaves to the row's east end
teleport player af-abbey-linnet up
shot on 56.6 12 yaw 0 pitch 14 dist 13 fov 30 lift 0.8
effect leaves af-abbey-tin 1.2
face wenna af-abbey-look
face corin af-abbey-look
face player af-abbey-look
walk tin af-abbey-tin nowait
shot on 56.6 12 yaw 6 dist 11.5 5 nowait
wait tin
face tin player
face player tin
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face player tin
shot on player yaw 3 dist 7.8 1.4 nowait
player: Tin? #line:EE3741554F67E93541275855FD39CDBC
# the coat: the two in one frame
shot on 53.7 12 yaw 0 pitch 12 dist 10 fov 30 lift 0.6
face tin player
pose tin kneel
: The knight takes the old coat from her arms and lays it around her shoulders. Then it kneels. #line:0A4B3979A41D06EDBFC4DE0ADD62E5EE
wait 1
shot on corin yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face corin tin
shot on corin yaw 3 dist 7.8 2.6 nowait
Corin: Does it… want something? #line:E55E79392C7F912BFD2D9645A670267F
shot on tin yaw 352 pitch 12 dist 9 fov 26 lift 0.8
face tin player
shot on tin yaw 355 dist 7.8 3 nowait
sfx tuningFork
bark tin ♪ #line:D3B8664BA79247879A41BB6D3919EED8
wait 1.6
pose tin none
party join tin as warden
set tin-joined
# a red leaf comes down: one for Dilly
effect leaves player 0.5
shot on player yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face player af-abbey-look
shot on player yaw 3 dist 7.8 2 nowait
player: One for Dilly. #line:4ED5735F6B25F30AA618A3402780F07C
quest af-harvest done
# a rime crow on the abbey's belfry lifts and flies north (the King's eyes)
shot on belfry yaw 0 pitch 18 dist 24 fov 32 lift 6
sfx crowCaw
effect crows belfry 0.4
wait 1.8
shot reset 1
quest year stage rest
give red-leaf

== af-scarecrow
cutscene
walk saffy af-yard-saffy nowait
walk cob af-yard-cob nowait
walk tin af-yard-tin nowait
walk wenna af-yard-wenna nowait
walk player af-yard-linnet nowait
walk corin af-yard-corin nowait
shot on af-yard-mid yaw 0 pitch 18 dist 9 fov 40 lift 0.8
shot on af-yard-mid yaw 3 dist 8.6 5 nowait
wait tin
wait saffy
wait cob
wait player
face saffy af-yard-look
face cob af-yard-look
face tin af-yard-look
face wenna af-yard-look
face player af-yard-look
face corin af-yard-look
face tin down
shot on saffy yaw 8 pitch 12 dist 9 fov 26 lift 0.6
face saffy tin
shot on saffy yaw 11 dist 7.8 5.2 nowait
Saffy: Oh, look, Cob — they've brought us a new mawkin. Isn't it handsome? #line:E41FF83703E8F311BF0F60BC990DB8FF
shot on cob yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face cob down
shot on cob yaw 3 dist 7.8 3.8 nowait
Cob: Doesn't even blink. Best one we've ever had. #line:798741E0D6A92A3A7F3E173F58C9A72B
# the crows come down and settle round it; it holds very still, politely
shot on tin yaw 0 pitch 18 dist 9 fov 28 lift 1
face tin down
sfx crowCaw
shot on tin yaw 4 dist 8 5 nowait
emote tin ...
wait 2.4
shot on wenna yaw 0 pitch 12 dist 9 fov 22 lift 0.6
face wenna saffy
shot on wenna yaw 3 dist 7.8 4.1 nowait
Wenna: It's a knight. It's with us. It doesn't do crows. #line:B0BE1480C30F38910ED2E903F8874225
bark tin ♪ #line:AD7BFC4A78831391914EC70315FC4563
home saffy 31.4 74
home cob 36.4 74.2
shot reset 0.8

== af-cellar-hint
emote corin idea
bark corin The drift's gone off the cellar hatch. Cider wife won't miss a bottle. Or a chest. #line:350018980D955E0E1A1A5092E01786EF
