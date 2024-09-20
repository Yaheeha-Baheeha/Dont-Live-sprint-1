extends Control

@onready var main = $"../../"


func _on_resume_pressed():
	main.pause()


func _on_options_pressed():
	GameManager.score = 1000
	get_tree().change_scene_to_file("res://scenes/menu.tscn") # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
