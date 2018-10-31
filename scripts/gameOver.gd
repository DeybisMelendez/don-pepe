extends CenterContainer

var menu = load("res://escenas/menu.tscn")

func _ready():
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")
	get_tree().change_scene_to(menu)