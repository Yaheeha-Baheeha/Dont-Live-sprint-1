extends AnimatedSprite2D

#Explosion when killing enemies
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_animation_finished():
	#Kills the explosion
	queue_free()
