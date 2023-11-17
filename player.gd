extends CharacterBody2D

const JUMP_VELOCITY = -400.0
@onready var move = $Move

var gravity = 980
var tween

func _physics_process(delta):
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			var tween = create_tween()
			tween.tween_property(move, "playing",true, 0.1)	
		move_and_slide()
