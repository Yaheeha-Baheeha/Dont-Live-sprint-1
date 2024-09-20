extends Area2D


func lost():
	GameManager.score += 1

func collcted():
	GameManager.score -= 1
	GameManager.collected = true
	

func _on_body_entered(body):
	if body.is_in_group("Player"):
		collcted()
		queue_free()
