extends "../scripts/GenericEnemy.gd"

func _ready():
	speed = 0.3
	
	for caja in get_tree().get_nodes_in_group("caja"):
		add_collision_exception_with(caja)
