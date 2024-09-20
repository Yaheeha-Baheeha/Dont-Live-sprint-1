extends Control

#pausing the game

@onready var main = $"../../" #Checking parent files


func _on_resume_pressed():
	#resuming the game
	main.pause()


func _on_options_pressed():
	#Goes to the options screen and resets the game
	GameManager.score = 1000
	get_tree().change_scene_to_file("res://scenes/menu.tscn") # Replace with function body.


func _on_quit_pressed():
	#Ragequits the loser
	get_tree().quit()
