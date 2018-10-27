extends Area2D

var n = randi()%3 # 0 = B, 1 = L, 2 = P

func _ready():
	$anim.play(str(n))

func _on_powerUp_body_entered(body):
	if body.is_in_group("jugador"):
		body.powerUp(n)
		queue_free()