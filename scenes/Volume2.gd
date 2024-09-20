extends Control

@onready var menu = $"../"

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	if $"Background music".playing == false:
		$"Background music".play()


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
