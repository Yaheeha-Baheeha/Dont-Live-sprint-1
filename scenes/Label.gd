extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.win == true:
		text = "Hp didnt matter :)"
	else:
		text = "Health: " + str(GameManager.score)
