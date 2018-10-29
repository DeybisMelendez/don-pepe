extends CenterContainer

var menu = load("res://escenas/menu.tscn")

func _on_Timer_timeout():
	get_tree().change_scene_to(menu)