extends KinematicBody2D

const VEL = 70

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0,VEL))
		$anim.play("caminarAbajo")
	elif Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0,-VEL))
		$anim.play("caminarArriba")
	elif Input.is_action_pressed("ui_right"):
		move_and_slide(Vector2(VEL,0))
		$anim.play("caminarDerecha")
		$anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-VEL,0))
		$anim.play("caminarDerecha")
		$anim.flip_h = true
	else:
		$anim.stop()
		$anim.set_frame(0)