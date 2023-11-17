extends Node2D

var speed = 75

func _process(delta):
	position.x -= speed * delta
