== rally-corin
party join corin as ranger

== rally-wenna
party join wenna as greatshield

== rally-tin
party join tin as warden

== toll-shot
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
thaw belfry
shot on belfry dist 11 1.3
# the crane: high over the belfry, where the front reads as a ring
shot on belfry yaw 0 pitch 60 dist 46 fov 40 lift 0 2.4
# the landmark south of it: the front rolls from the top of the frame to the bottom, toward the lens
shot on toll-landmark yaw 0 pitch 28 dist 24 fov 34 lift 0
shot on toll-landmark dist 22 3.4 nowait
wait 3.4

== memory-in
effect memory player
flash white 0.9 hold
wait 0.9

== memory-out
wait 0.4
flash white 0.9
wait 0.5

== corin
if not party:corin
  Corin: Mind the snares. Some of them are mine, and the bears are getting clever. #line:8D22FDF53C381BF30FEF2F7152D5550D
  stop
if spring-came
  Corin: Look at it. I couldn't have made this up. And I've made up a lot. #line:18DBDC855A6F04BA0FEA2A6665A9157E
  stop
if level = halloway-forge
  Corin: So this is where the hammer lives. Smaller than I pictured. Warmer, too. Nobody's been properly warm since the ice. #line:3C27DC030C66BA101CA86CA0DFC277A2
  stop
if bell-harvest
  cycle corin-rest
    * Corin: Seven years I've told that story about the man in the snow. Seven years of "yes, Corin". I'd like to be wrong, for once. #line:43EFB00CDA4EC57E0E7F608319DE438C
    * Corin: If it goes badly up there, I want it known I was the handsome one. Tell it bigger than it was. I would. #line:00D555ACFBBAD5C5A2E11F01CD4CC173
  stop
if bell-tides
  cycle corin-harvest
    * Corin: Did you see Wenna's face when that boat came in? Best thing I've seen since the ice came, and I've seen a bear in a hat. #line:98BBB980CB6FE551924F570995699C70
    * Corin: Amberfield. Monks and mills. I've never stolen from a monk. Never had the chance. #line:A5E7DCA4A3EBA090DC9C731BC1276937
  stop
cycle corin-tides
  * Corin: I've been as far south as Saltcombe twice. Once on purpose. #line:B45E50C4C2DF502F4823E1AA6B258963
  * Corin: They say the fish at Saltcombe come the size of carts. I'll believe it once I've told it myself. #line:F002B37EE197632642B6550D70B858A4

== wenna
if not party:wenna
  Wenna: Harbour's closed. Has been since the ice came in. There's a fee for asking. #line:821534D762A56BA3E20D92A87EBE7850
  stop
if spring-came
  Wenna: I've closed the ledger. First time it's balanced since the ice. I don't know what to do with my evenings. #line:470F892584693F79D0AE515108D6F3F1
  stop
if level = halloway-forge
  Wenna: Tidy forge. Your grandfather kept accounts, I'd wager. A man who hangs every tool on its own hook keeps accounts. #line:313F21D3F81E009299828C0B50FA481A
  stop
if bell-harvest
  cycle wenna-rest
    * Wenna: I've an invoice drawn up for whoever stopped the year. Lamp oil, one harbour, seven years of a brother. Itemised. #line:3AFD02ABD1C1E2E51641CB537BD7E456
    * Wenna: You're quiet, Halloway. Quiet costs extra. Talk to me. #line:1241E197947E267548E625A68DFB0336
  stop
cycle wenna-harvest
  * Wenna: Jory's asked after three girls who married other men and a dog that's dead. I tell him one a day. It's cheaper. #line:02169C44DD5953280A4B6161F051D6B3
  * Wenna: I'm keeping a tally. You'll want to be on the right side of it. #line:E9A8E8834A2C8AD8C396D43B4CA6DDC5

== tin
if not party:tin
  : Snow on its pauldrons, frost in every joint. It has stood at the forge door every night for seven winters, and never once crossed the threshold. #line:1F12C146BE96A587C5A3154F79312765
  stop
bark tin ♪ #line:B148D7EFEBB045D47C03369F1FBFD5EE
cycle tin-talk
  * : Tin strikes the fork on its gauntlet. One note, low and long. Linnet's hand goes to her throat, as if to catch it. #line:67826EA6E47E350EC1AE61AC6CEBE38F
  * : Tin looks at Linnet for a long moment. Then it reaches out and straightens her collar. #line:F88AE9FACD647FBD931A91EDC70112DB
  * : It tilts its helm, as if listening for something a long way off. #line:5F654F034973A7B308C4ED3CDBF04D4D
