extends Area2D

var m = get_global_position()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body. no


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#this is what i copied to find where to tp the player when in winzone
	position = (Vector2(17053, -1)) 
