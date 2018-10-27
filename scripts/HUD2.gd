extends HBoxContainer

func _ready():
	global.time = 300

func _physics_process(delta):
	$p1.set_text("P1 Left: " + str(global.vidas_j1))
	$p2.set_text("P2 Left: " + str(global.vidas_j2))
	$time.set_text("T: " + str(global.time))

func _on_Timer_timeout():
	if global.time > 0:
		global.time -= 1
	else: #Death Match
		global.vidas_j1 = 0
		global.vidas_j2 = 0
		$Timer.stop()