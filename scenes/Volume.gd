extends Control

#volume settings and yes i made two in case this one breaks because of parent node

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	#replays music after it's over
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn") #goes back to menu when done
