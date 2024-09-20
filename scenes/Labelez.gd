extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.win == true:
		text = "Hp didnt matter :)"
		
		time_get()
		await get_tree().create_timer(1.3).timeout
		
		Engine.time_scale = 0
		
	else:
		text = "Health: " + str(GameManager.score)
		

func time_get():
	var m = $Timer.time_left
	var x = 4080 - m
	var abcde =  "total time: " + "%d:%02d" % [floor(x / 60), int(x) % 60]
	text = str(abcde)
