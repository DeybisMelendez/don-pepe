extends HBoxContainer

var gameOver = load ("res://escenas/finalMulti.tscn")
onready var jugadores = get_tree().get_nodes_in_group("jugador")
func _ready():
	global.time = 300

func _physics_process(delta):
	$p1.set_text("P1 Left: " + str(global.vidas_j1))
	$p2.set_text("P2 Left: " + str(global.vidas_j2))
	$time.set_text("T: " + str(global.time))
	jugadores = get_tree().get_nodes_in_group("jugador")
	for i in jugadores:
		if i.vidas <= 0:
			terminaPartida(i)

func _on_Timer_timeout():
	if global.time > 0:
		global.time -= 1
	else: #Death Match
		jugadores[0].vidas = 1
		jugadores[0].distancia = 20
		jugadores[0].vel = 140
		jugadores[0].bombaCant = 20
		jugadores[1].vidas = 1
		jugadores[1].distancia = 20
		jugadores[1].vel = 140
		jugadores[1].bombaCant = 20
		$Timer.stop()

func terminaPartida(j):
	if j.idJugador == "1":
		global.ganador = "2"
	else:
		global.ganador = "1"
	get_tree().change_scene_to(gameOver)