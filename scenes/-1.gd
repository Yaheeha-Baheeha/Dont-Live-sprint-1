extends Label
#Dont read this code

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

const player = preload("res://scenes/player.gd")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.hurt == true:
		GameManager.hurt = false
		die()
	if player.state.IDLE:
		hide()
		

func die():
	show()
	#this is my failed attempt to add a +1 label to the screen when hit

