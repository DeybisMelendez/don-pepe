extends Control

func _ready():
	pass

func _on_CreditsScreen_gui_input(ev):
	if ev.is_action_pressed("left_click"):
		get_tree().change_scene("res://escenas/menu.tscn")


func _on_Credits_meta_clicked(meta):
	OS.shell_open("meta")
