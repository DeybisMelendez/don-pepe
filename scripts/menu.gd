extends Node2D

export (PackedScene) var single
export (PackedScene) var multi

func _on_Button_pressed():
	get_tree().change_scene_to(single)

func _on_Button2_pressed():
	get_tree().change_scene_to(multi)

func _on_Info_pressed():
	get_tree().change_scene("res://escenas/CreditsScreen.tscn")
