extends KinematicBody2D

var can_move = false

var directions = [
	Vector2(-1, 0),
	Vector2(0, -1),
	Vector2(1, 0),
	Vector2(0, 1)
]

var old_direction
var current_direction

# Vertical change direction
var v_keep_direction = true
# Horizontal change direction
var h_keep_direction = true

# Kinematic collider
var k_collider

func _ready():
	randomize()
	
	current_direction = random_direction()
	old_direction = current_direction
	
	for enemy in get_tree().get_nodes_in_group("enemy"):
		add_collision_exception_with(enemy)
	
func _physics_process(delta):
	if not can_move:
		return
	
	if current_direction == Vector2():
		current_direction = random_direction()

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
		var dir = posible_directions[int(round(rand_range(0, posible_directions.size() - 1)))]
		return dir
	else:
		return Vector2(0,0)

func dead():
	$Anim.play("dead")

func _on_Anim_animation_finished(anim_name):
	if anim_name == "show":
		can_move = true
	elif anim_name == "dead":
		queue_free()

func _on_Anim_animation_started(anim_name):
	if anim_name == "dead":
		can_move = false
