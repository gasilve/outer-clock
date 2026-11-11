== ev-forge-opening
cutscene
music off
teleport player forge-bell left
teleport dilly_forge forge-door-out up
# the bell blank on its beam, the forge's fire behind it, Linnet beside it with the hammer
shot on bellblank yaw 340 pitch 30 dist 9 fov 28 lift 0.6
shot on bellblank dist 8 7 nowait
fade in 2.6
wait 1.2
# the strike: a cut to the bell from low as it rings; the motif, once
sfx hammerHit
toll bellblank 0.4
shot on bellblank yaw 350 pitch 18 dist 5 fov 24 lift 1
shot on bellblank dist 4.5 3 nowait
sfx motif
wait 2.2
# the card as the ring fades: the dark rafters fill the band, the bell swings below it
shot on bellblank yaw 0 pitch 40 dist 9 fov 30 lift 3.4
shot on bellblank dist 8.2 5 nowait
title The Bells of Evermere | A tale of the year that stopped #line:32018271A8F5AC0865D05E3D9A1BB023
# the song: lines one to three, and the fourth broken off
# (she turns from the bell to the door, and the dark beyond it)
face player down
shot on player yaw 345 pitch 16 dist 5.6 fov 26 lift 0.3
shot on player dist 5 13 nowait
player: Wake, little blossom, the frost's letting go… Turn, little tide, bring the boats back to shore… #line:4BF9BB5909038F123D8508B626DAFB7D
player: Gold, little field, for the reapers are home… Rest, little year— #line:333CBF51E114510EA1F5C6016294156F
# (a silence written on purpose: the song stops where it always stops; only the fire answers)
wait 2.2
# Dilly bursts in out of the snow
walk dilly_forge forge-dilly run nowait
shot on dilly_forge yaw 180 pitch 22 dist 7 fov 30 lift 0.4
wait dilly_forge
face dilly_forge player
face player dilly_forge
shot on dilly_forge yaw 300 pitch 12 dist 6 fov 28 lift 0
shot on dilly_forge dist 5.4 6 nowait
Dilly: Linnet! Gran says flowers are like snow, only they come up instead of down! Have you ever seen one? #line:8A4E2301E36F1838AFC85C8CA4D73143
shot on player yaw 60 pitch 12 dist 6 fov 28 lift 0.4
shot on player dist 5.4 5 nowait
player: Every spring, till I was ten. …I can't remember the colour. #line:649E39BA6C67E508C74DB47E41D50B91
set ev-woke
shot reset 1.2

== ev-forge-hook
player: Grandda's tuning fork hung on this hook every night of his life. It went where he went. #line:9C96E1E4B4335BF4C8FA982A635454F8

== ev-forge-mould
player: The great mould. He broke it open the night he left, and never said what he'd poured. #line:1BAFE622A8C45A61355C9E8C88B1B442

== ev-forge-shawl
if bell-harvest
  player: Mam's shawl. I remember the last line now. I'll sing it to her when it's morning. #line:F7FFD77E037C4ED2CDAB865C79D9C9B2
  stop
player: Mam's shawl. Some nights I can hear the song she sang me, right up to the last line. Then nothing. #line:B52988BD981613DBDEDBC260AD425B98

== ev-forge-blank
face player bellblank
sfx hammerHit
toll bellblank 0.3
if bell-harvest
  player: Three notes true. The last is the one I could never hold. #line:A300BD460FD79E1DDC003EA758B9DFBC
elif bell-tides
  player: Truer again. Two notes of the four. #line:4B9A2793E4D66F76C3AFA1482EAC6341
elif bell-waking
  player: Truer. As if it heard the west bell too. #line:41EAB4F305D21EDF3115F7DD9D5F2F27
else
  player: Still flat. Grandda could tune a bell by ear in an afternoon. Seven years, and I've got this far. #line:746E47ACEF4B918B04B218F87C1B9877
