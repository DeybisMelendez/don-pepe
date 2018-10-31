extends CenterContainer

var juego = load("res://escenas/juego.tscn")

func _ready():
	$Label.set_text("Stage: " + str(global.stage))
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	get_tree().change_scene_to(juego)