extends Area2D

export (PackedScene) var powerUp

func _ready():
	$anim.play("explotar")
	yield($anim,"animation_finished")
	get_parent().queue_free()

func _on_explosion_body_entered(body):
	if body.is_in_group("caja"):
		body.queue_free()
		if randi()%5 == 0:
			var p = powerUp.instance()
			p.global_position = global_position + Vector2(-8,-8)
			#p.global_position += Vector2(-8,-8)
			get_parent().get_parent().add_child(p)
	elif body.is_in_group("jugador"):
		body.morir()
	elif body.is_in_group("enemy"):
		body.dead()