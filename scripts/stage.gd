extends CenterContainer

var juego = load("res://escenas/juego.tscn")

func _ready():
	$Label.set_text("Stage: " + str(global.stage))

func _on_Timer_timeout():
	get_tree().change_scene_to(juego)