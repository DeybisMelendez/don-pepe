extends KinematicBody2D

var vel = 70
var vidas = 3
var colocarBomba = true
export (PackedScene) var bomba
export var idJugador = "1"
export (Resource) var j2
onready var hud = null
var tilemap = null
var bombas = null
var bombaCant = 1
var muerto = false
var distancia = 1
onready var posInicial = global_position

func _ready():
	if idJugador == "2":
		$anim.set_sprite_frames(j2)
	hud = get_tree().get_nodes_in_group("hud")

func _physics_process(delta):
	if idJugador == "1":
		global.vidas_j1 = vidas
	else:
		global.vidas_j2 = vidas
	if !muerto:
		tilemap = get_parent().get_node("TileMap")
		bombas = get_tree().get_nodes_in_group("bomba")
		if Input.is_action_pressed("j"+idJugador+"Aba"):
			move_and_slide(Vector2(0,vel))
			$anim.play("caminarAbajo")
		elif Input.is_action_pressed("j"+idJugador+"Arr"):
			move_and_slide(Vector2(0,-vel))
			$anim.play("caminarArriba")
		elif Input.is_action_pressed("j"+idJugador+"Der"):
			move_and_slide(Vector2(vel,0))
			$anim.play("caminarIzquierda")
			$anim.flip_h = true
		elif Input.is_action_pressed("j"+idJugador+"Izq"):
			move_and_slide(Vector2(-vel,0))
			$anim.play("caminarIzquierda")
			$anim.flip_h = false
		else:
			$anim.stop()
			$anim.set_frame(1)
		if Input.is_action_just_pressed("j"+idJugador+"Bomba") and colocarBomba:
			if bombas.size() < bombaCant:
				var nBomba = bomba.instance()
				nBomba.global_position = tilemap.world_to_map(global_position) * 16
				nBomba.distancia = distancia
				get_parent().add_child(nBomba)
		
		for i in bombas:
			if i.global_position == tilemap.world_to_map(global_position) * 16:
				colocarBomba = false
				break
			else:
				colocarBomba = true

func morir():
	muerto = true
	$anim.play("morir")
	if vidas > 0:
		vidas -= 1
		$Timer.start()
		yield($Timer,"timeout")
		global_position = posInicial
		muerto = false
		$anim.play("caminarAbajo")
		$anim.set_frame(1)
		colocarBomba = true

func powerUp(n): # 0 = B, 1 = L, 2 = P
	match n:
		0:
			bombaCant += 1
		1:
			vidas += 1
		2:
			distancia += 1