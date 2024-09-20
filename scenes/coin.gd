extends Area2D

#Coin collection

func lost():
	# Adds health
	GameManager.score += 1

func collcted():
	#Removes health and plays hit sound
	GameManager.score -= 1
	GameManager.collected = true
	

func _on_body_entered(body):
	if body.is_in_group("Player"):
		#Killing the coin after collection
		collcted()
		queue_free()
