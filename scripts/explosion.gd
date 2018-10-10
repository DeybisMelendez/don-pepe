extends Area2D

func _ready():
	$anim.play("explotar")
	yield($anim,"animation_finished")
	get_parent().queue_free()