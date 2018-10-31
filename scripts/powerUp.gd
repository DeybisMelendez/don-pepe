extends Area2D

var n = randi()%3 # 0 = B, 1 = L, 2 = P
var tomado = false

func _ready():
	$anim.play(str(n))

func _on_powerUp_body_entered(body):
	if body.is_in_group("jugador") and !tomado:
		tomado = true
		body.powerUp(n)
		$AudioStreamPlayer2D.play()
		yield($AudioStreamPlayer2D,"finished")
		queue_free()