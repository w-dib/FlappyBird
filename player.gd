extends CharacterBody2D

@onready var move = $Move
@onready var death = $Death
@onready var player = $Sprite2D

const JUMP_VELOCITY = -400.0
const gravity = 980

var tween

signal touch

func _physics_process(delta):
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			tween = create_tween()
			tween.tween_property(move, "playing",true, 0.1)	
		move_and_slide()


func _on_area_2d_body_entered(_body):
	collision_layer = 0
	collision_mask = 0
	set_physics_process(false)
	death.play()

func _on_death_finished():
	touch.emit()
	collision_layer = 1
	collision_mask = 1
	queue_free()
