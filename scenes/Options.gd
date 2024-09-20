extends Control

func _physics_process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_volume_pressed():
	get_tree().change_scene_to_file("res://scenes/Volume.tscn")
