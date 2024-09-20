extends CharacterBody2D

#Controls all enemies
var direction = 1 #walking direction
const SPEED = 50.0 #walking speed
const JUMP_VELOCITY = -400.0 #gravity

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const explosion = preload("res://scenes/explosion.tscn") #Loading the explosion script.

func die():
	#Using the explosion script
	var new_explosion = explosion.instantiate()
	new_explosion.global_position = global_position
	get_tree().current_scene.add_child(new_explosion)
	queue_free()
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	velocity.x = direction * SPEED

	# Handles the movement/deceleration.
	
	move_and_slide()
	$AnimatedSprite2D.flip_h = direction < 0

func _on_timer_timeout():
	#Changes Direction
	direction *= -1
