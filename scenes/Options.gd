extends Control

#Options screen

func _physics_process(delta):
	#continously plays music
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()


func _on_back_pressed():
	#goes to main menu
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_volume_pressed():
	#Opens the volume screen
	get_tree().change_scene_to_file("res://scenes/Volume.tscn")
