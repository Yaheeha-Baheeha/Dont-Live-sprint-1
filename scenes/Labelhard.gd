extends Label

#This is the Label For the hard difficulty

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.score = 1500


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if GameManager.win == true:
		#Called when the player wins
		#Tells the user their mistake lol
		text = "Hp didnt matter :)"
		
		time_get()
		await get_tree().create_timer(1.3).timeout
		
		Engine.time_scale = 0 #Calculates and stops the time
		
	else:
		#Just the normal UI showing health
		text = "Health: " + str(GameManager.score)
		

func time_get():
	#Calculating the time at the end of the game and converting to MS
	var m = $Timer.time_left
	var x = 4080 - m
	var abcde =  "total time: " + "%d:%02d" % [floor(x / 60), int(x) % 60]
	text = str(abcde)
