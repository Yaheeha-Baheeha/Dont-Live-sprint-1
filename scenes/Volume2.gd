extends Control

#Volume settings
@onready var menu = $"../" #finds parent node

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	#replays music after it's over
	if $"Background music".playing == false:
		$"Background music".play()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn") #goes back to menu when done
