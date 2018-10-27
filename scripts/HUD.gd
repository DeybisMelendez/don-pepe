extends HBoxContainer


func _physics_process(delta):
	$left.set_text("Left: " + str(global.vidas_j1))
	$time.set_text("T: " + str(global.time))
	$score.set_text("Score: " + str(global.score))