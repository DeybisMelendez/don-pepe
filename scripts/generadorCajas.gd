extends TileMap

const idTerreno = 0
export var multiplayer = false
export (PackedScene) var caja
export (PackedScene) var enemigo

func _ready():
	randomize()
	var terreno = get_used_cells_by_id(0)
	for i in terreno.size():
		if randi()%2 == 0:
			var nCaja = caja.instance()
			nCaja.global_position = Vector2(terreno[i].x ,  terreno[i].y) * 16
			add_child(nCaja)
		elif !multiplayer:
			if randi()%10 == 0:
				var nE = enemigo.instance()
				nE.global_position = Vector2(terreno[i].x,  terreno[i].y) * 16
				nE.global_position.x += 8
				nE.global_position.y += 8
				add_child(nE)

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()