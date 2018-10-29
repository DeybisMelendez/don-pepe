extends HBoxContainer

var stage = load ("res://escenas/stage.tscn")
var gameOver = load ("res://escenas/gameOver.tscn")
onready var enemigos = get_tree().get_nodes_in_group("enemy")
onready var jugador = get_tree().get_nodes_in_group("jugador")

func _ready():
	global.time = 300

func _physics_process(delta):
	$left.set_text("Left: " + str(global.vidas_j1))
	$time.set_text("T: " + str(global.time))
	$score.set_text("Score: " + str(global.score))
	
	enemigos = get_tree().get_nodes_in_group("enemy")
	if enemigos.size() == 0:
		terminarJuego()
	if jugador[0].vidas <= 0:
		pierde_juego()

func _on_Timer_timeout():
	if global.time > 0:
		global.time -= 1
	else: #Death Match
		$Timer.stop()
		pierde_juego()

func pierde_juego():
	jugador[0].vidas = 0
	jugador[0].morir()
	terminarJuego()


func terminarJuego():
	if global.vidas_j1 > 0:
		global.stage += 1
		get_tree().change_scene_to(stage)
	else:
		get_tree().change_scene_to(gameOver)