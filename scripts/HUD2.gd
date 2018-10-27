extends HBoxContainer

func _physics_process(delta):
	$p1.set_text("P1 Left: " + str(global.vidas_j1))
	$p2.set_text("P2 Left: " + str(global.vidas_j2))
	$time.set_text("T: " + str(global.time))