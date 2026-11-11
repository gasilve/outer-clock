# Outer Clock — diseño

La versión que se abre en el navegador está en la raíz del repo (`index.html`). El 11 de noviembre de 2026, antes de que empiece el jam, ya tiene la entrada, el taller, las dos muertes del futuro, el reloj real, el ámbar a 1/24 y el mapa de cien épocas. El jam, si se entrega, pide Unreal o UEFN desde el 12 y textos en inglés. Esta carpeta es el juego jugable sin instalar nada, y hay que declararla si se compite.

## Cómo se parte el trabajo

1. **Ya está:** reloj de afuera, ámbar, inventario, cuatro tipos de misión, cien fichas, foto del jugador.
2. **Pintura:** un fondo por época, en el estilo que se confirme. Hoy hay taller, calle del futuro e inventor.
3. **Inglés:** la entrega del jam pide todos los textos en inglés.
4. **Unreal, si hay una máquina que lo banque:** las mismas fichas de `js/eras.js` pasan al nivel. Esta PC no empaqueta Unreal.

## Artilugios

- **Ámbar de los lentos.** Pone a la gente y a los relojes de la época a 1/24. El jugador tiene dos días de ellos (48 horas) para buscar. Cada mirada gasta una hora de esos días. Sirve para el objeto que solo está quieto un instante.
- **Brújula de fechas.** Abre el mapa de los cien tiempos. Solo el día de hoy se puede jugar.
- **Abrigo de polvo.** Se cose en la ciudad partida y cambia el retrato.

## Misiones

Cada época tiene una: combinar dos objetos, seguir un orden, elegir una frase, o encontrar algo que solo aparece con el ámbar. La ficha que deja esa misión cambia el texto de la calle del futuro.

Aventura 3D de mirar, hablar, usar y combinar. El modelo es *Monkey Island*: el conflicto se resuelve con objetos y conversación. La primera versión jugable es un taller, una muerte en el futuro y una época que cambia ese futuro.

## Historia

1. **El taller.** El protagonista construye la máquina. Acá se aprende el verbo del juego. Una foto del jugador se convierte en la cara del personaje. La ropa y las herramientas cambian el aspecto; el cuerpo base queda fijo para que el juego no dependa de regenerar un modelo entero en cada objeto.
2. **El primer salto.** Un futuro cercano. Ve su muerte y no llega a ver de dónde viene. Vuelve al taller.
3. **Lo intenta de nuevo.** Cada regreso, la muerte cambia: un disparo desde fuera de cuadro, una explosión, otra forma. Quien lo causa no se muestra. Se cuenta como una cinemática de aventura, sin gore.
4. **La máquina se rompe.** Desde ese momento el viaje lo decide el reloj de la computadora.

Las figuras históricas (una guerra de mediados de siglo, un camino de hace dos mil años, un futuro donde alguien no murió) entran como capítulos. La consecuencia se ve en el lugar: otra calle, otro diario, otra versión de la muerte. La primera versión no representa esas escenas de forma gráfica.

## El reloj

Al crear la partida se guarda una semilla. Con el hash de esa semilla se baraja, una sola vez, la lista de épocas de `data/eras.json`.

- Si la fecha de hoy ya está guardada, se carga la época de esa fecha.
- Si el calendario avanzó, se abre la siguiente época que todavía no se vio.
- Si el reloj de la máquina vuelve a una fecha anterior desconocida, no se regala una época: se sigue en la última fecha válida.
- Cuando no quedan épocas, el taller vuelve como eco. El reloj de la pared sigue en hora real.

La semilla evita que dos partidas nuevas recorran las épocas en el mismo orden. Guardar la fecha evita repetir un día ya vivido. Un hash distinto por fecha, sin memoria, podría caer dos veces en la misma época; por eso el hash ordena la lista y la fecha solo abre la casilla siguiente.

En el prototipo, F2 y F1 mueven esa fecha sin tocar el reloj de Windows.

## Banderas

El futuro no simula la historia. Guarda sí o no.

| Bandera | Dónde se enciende | Qué cambia |
|---|---|---|
| `documento_salvado` | La ciudad partida | El futuro cercano muestra otra calle y otra muerte |
| `mensaje_entregado` | El camino de polvo | Un nombre aparece en un diario del futuro |

`futuro_escrito` lee esas banderas y elige la variante del nivel.

## Primera versión

Cabe en los días del jam.

1. Taller en bloque: mirar, tomar, combinar dos objetos.
2. Foto a la cara, sobre un cuerpo base.
3. Futuro cercano con dos variantes de la muerte.
4. Una época con un acertijo que enciende `documento_salvado`.
5. El reloj real en pantalla y la regla de un día, una época. Esto ya está en `scripts/day_clock.gd`.

## Después

Más épocas en `data/eras.json`, diálogo, inventario visible y la cinemática de la máquina rompiéndose. El prólogo (taller y primera muerte) no entra en el barajado: ocurre antes de que el reloj mande.

## Herramientas del jam

- **Meshy, Tripo, Hyper3D:** personaje desde la foto y objetos únicos.
- **PBRgen:** materiales.
- **iClone y Rokoko:** caminar, mirar, agarrar.
- **WeLoveIndies:** música y sonidos, solo uso no comercial.
- **fal:** imágenes de cada época antes de modelar.
- **Godot 4:** el juego.
- **GitHub:** este repositorio.

El cuerpo del personaje se modela una vez. Los cambios del inventario son mallas y telas encima. Así la foto sigue siendo la misma persona mientras el aspecto cambia con lo que encuentra.
