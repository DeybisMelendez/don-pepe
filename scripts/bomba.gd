extends Area2D

export (PackedScene) var explosion
var distancia = 1
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
	$anim.hide()
	var nExplosion = explosion.instance()
	nExplosion.position = offset
	add_child(nExplosion)
	for a in dir.size():
		var hayCaja = false
		for i in distancia:
			if dir[a] != Vector2(0,0):
				var posMap = pos/16 + dir[a] * (i + 1)
				if tilemap.get_cellv(posMap) == 0 or tilemap.get_cellv(posMap) == 2:
					var cajas = get_tree().get_nodes_in_group("caja")
					for b in cajas:
						if tilemap.world_to_map(b.global_position) + dir[a] == tilemap.world_to_map(global_position + dir[a] * tileTam * (i + 1)):
							hayCaja = true
					if !hayCaja:
						nExplosion = explosion.instance()
						nExplosion.global_position = offset + (dir[a] * tileTam * (i + 1))
						add_child(nExplosion)
					else:
						dir[a] = Vector2(0,0)
				else:
					dir[a] = Vector2(0,0)

func _on_bomba_area_entered(area):
	if area.is_in_group("explosion"):
		$anim.set_frame(10)
		