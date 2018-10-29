extends CenterContainer

var menu = load ("res://escenas/menu.tscn")

func _ready():
	$Label.set_text("The winner is Player " + str(global.ganador))

func _on_Timer_timeout():
	get_tree().change_scene_to(menu)