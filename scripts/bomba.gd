extends Area2D

export (PackedScene) var explosion
var distancia = 4
var tileTam = 16
var pos = Vector2()
var offset = Vector2(8,8)
var liberar = false
var dir = [
	Vector2(0 , -1), #Arriba
	Vector2(0 , 1), #Abajo
	Vector2(-1 , 0), #Izquierda
	Vector2(1 , 0), #Derecha
]

func _ready():
	var tilemap = get_parent().get_node("TileMap")
	pos = global_position
	$anim.play("1")
	yield($anim,"animation_finished")
	for i in distancia:
		for a in dir.size():
			if dir[a] != Vector2(0,0):
				var posMap = pos/16 + dir[a] * (i + 1)
				if tilemap.get_cellv(posMap) == 0 or tilemap.get_cellv(posMap) == 4:
					var nExplosion = explosion.instance()
					nExplosion.global_position = offset + (dir[a] * tileTam * (i + 1))
					add_child(nExplosion)
				else:
					dir[a] = Vector2(0,0)