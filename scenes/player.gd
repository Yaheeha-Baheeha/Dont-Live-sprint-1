extends CharacterBody2D

#Code for the player

@export var speed = 300.0 #main speed
@export var jump_velocity = -400.0 #Gravity
@export var acceleration : float = 15.0 #Acceleration
@export var jumps = 1 #disallows double jumps

enum state {IDLE, RUNNING, JUMPUP, JUMPDOWN, HURT} #available nimations states

var anim_state = state.IDLE #sets the state to idle as soon as the player starts

#this links to animations
@onready var animator = $AnimatedSprite2D 
@onready var animation_player = $AnimationPlayer
@onready var pause_menu = $Camera2D/PauseMenu
var paused = -1 #Sets the game to unpaused



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var start_pos = global_position

func reset():
	#resetting position and level
	global_position = global_position
	set_physics_process(true)
	anim_state = state.IDLE


func minus1():
	#removes 1 health point
	GameManager.hurt = true
	
func update_state():
	#Checks what do when the state should be updated
	if anim_state == state.HURT:
		#damages the player when hit
		GameManager.score += 1
		minus1()
		return
		 
	if is_on_floor():
		if velocity == Vector2.ZERO:
			anim_state = state.IDLE #if still onfloor set to idle state
		elif velocity.x != 0:
			anim_state = state.RUNNING #if moving on floor set to run state
	else:
		if velocity.y < 0:
			#sets the animation state to jumpup when moving up
			anim_state = state.JUMPUP
		else:
			#sets is to jump down when falling
			anim_state = state.JUMPDOWN

func update_animation(direction):
	#changes direction of model according to direction of movement
	if direction > 0:
		animator.flip_h = false
	elif direction < 0:
		animator.flip_h = true
	match anim_state:
		state.IDLE:
			animation_player.play("idle")
		state.RUNNING:
			animation_player.play("run")
		state.JUMPUP:
			animation_player.play("jump_up")
		state.JUMPDOWN:
			animation_player.play("jump_down")
		state.HURT:
			animation_player.play("hurt")
			$heal.play()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		if $jump.playing == false:
			$jump.play()
			
	
	#handle pause
	if Input.is_action_just_pressed("pause"):
		pause()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, acceleration)	
	move_and_slide()
	update_state()
	update_animation(direction)
	if GameManager.collected == true:
		$hit.play()
		GameManager.collected = false

const win_pos = preload("res://scenes/win pos.gd")


func pause():
	#handles the pausing mechanic
	if paused > 0:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused *= -1
	
	
	
	
	
func enemy_checker(enemy):
	#process if the player is being smoked by an enemy
	if enemy.is_in_group("Enemy") and velocity.y > 0:
		enemy.die()
		velocity.y = jump_velocity
		$"E die".play()
	elif enemy.is_in_group("Hurt"):
		anim_state = state.HURT
		$heal.play()
	elif enemy.is_in_group("Win"):
		#Teleports the player to winpos
		global_position = (Vector2(17053, -1))
		GameManager.win = true
		
func _on_hit_box_area_entered(area):
	
	enemy_checker(area) #runs the funstion above when hitting an enemy


func _on_hit_box_body_entered(body):
	enemy_checker(body) #same but for bodies instead of areas


func _on_background_music_finished():
	$"Background music".play()
