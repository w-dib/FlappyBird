extends Node2D

var speed = 75

signal score

func _process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_score_area_body_entered(body):
	print(body)
	score.emit()
