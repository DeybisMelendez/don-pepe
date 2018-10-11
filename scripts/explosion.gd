extends Area2D

func _ready():
	$anim.play("explotar")
	yield($anim,"animation_finished")
	get_parent().queue_free()

func _on_explosion_body_entered(body):
	if body.is_in_group("caja"):
		body.queue_free()
	elif body.is_in_group("jugador"):
		body.queue_free()