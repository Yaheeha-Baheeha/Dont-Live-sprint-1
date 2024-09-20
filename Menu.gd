extends Control

#Main menu
#No more explanation I barely coded this

var diff = 0

func _on_option_button_item_selected(index):
	if index == 0:
		diff = -1
	elif index == 1:
		diff = 0
	elif index == 2:
		diff = 1

func _on_play_pressed():
	if diff == 0:
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		Engine.time_scale = 1
		$AudioStreamPlayer.stop()
	elif diff == 1:
		get_tree().change_scene_to_file("res://scenes/worldz-hard.tscn")
		Engine.time_scale = 1
		$AudioStreamPlayer.stop()
	elif diff == -1:
		get_tree().change_scene_to_file("res://scenes/world-ez.tscn")
		Engine.time_scale = 1
		$AudioStreamPlayer.stop()		


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/Options.tscn")


func _on_quit_pressed():
	get_tree().quit()



