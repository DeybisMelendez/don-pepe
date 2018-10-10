extends KinematicBody2D

const VEL = 70
var colocarBomba = true
export (PackedScene) var bomba
export var idJugador = "1"
export (Resource) var j2
onready var celda = 0
var mapPos = Vector2()

func _ready():
	if idJugador == "2":
		$anim.set_sprite_frames(j2)

func _physics_process(delta):
	mapPos = get_parent().get_node("TileMap").world_to_map(global_position)
	if Input.is_action_pressed("j"+idJugador+"Aba"):
		move_and_slide(Vector2(0,VEL))
		$anim.play("caminarAbajo")
	elif Input.is_action_pressed("j"+idJugador+"Arr"):
		move_and_slide(Vector2(0,-VEL))
		$anim.play("caminarArriba")
	elif Input.is_action_pressed("j"+idJugador+"Der"):
		move_and_slide(Vector2(VEL,0))
		$anim.play("caminarDerecha")
		$anim.flip_h = false
	elif Input.is_action_pressed("j"+idJugador+"Izq"):
		move_and_slide(Vector2(-VEL,0))
		$anim.play("caminarDerecha")
		$anim.flip_h = true
	else:
		$anim.stop()
		$anim.set_frame(0)
	if Input.is_action_just_pressed("j"+idJugador+"Bomba") and colocarBomba:
		var nBomba = bomba.instance()
		nBomba.global_position = mapPos * 16
		get_parent().add_child(nBomba)