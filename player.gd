extends CharacterBody2D

const JUMP_VELOCITY = -400.0

var gravity = 980


func _physics_process(delta):
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
		move_and_slide()
