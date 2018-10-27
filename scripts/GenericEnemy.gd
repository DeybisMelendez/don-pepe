extends KinematicBody2D

var directions = [
	Vector2(-1, 0),
	Vector2(0, -1),
	Vector2(1, 0),
	Vector2(0, 1)
]

var current_direction

# Kinematic collider
var k_collider

func _ready():
	randomize()
	
	current_direction = random_direction()
	
	
#	add_collision_exception_with(
	
func _physics_process(delta):
	if k_collider != null:
		current_direction = random_direction()
	
	k_collider = move_and_collide(current_direction)

# Elije una dirección a la cual moverse y la devuelve en
# un Vector2
func random_direction():
	var direction_raycasts = $Directions.get_children()
	var posible_directions = []
	
	for i in direction_raycasts.size():
		if not direction_raycasts[i].is_colliding():
			posible_directions.append(directions[i])
	
	if posible_directions.size() > 0:
		return posible_directions[int(round(rand_range(0, posible_directions.size() - 1)))]
	else:
		print("00")
		return Vector2(0,0)