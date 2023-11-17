extends Node

@export var pipes: PackedScene

func spawn_pipe():
	var pipe = pipes.instantiate()
	pipe.position.y = randi_range(-184,-10)
	add_child(pipe)
#
func _on_timer_timeout():
	spawn_pipe()


func _on_player_touch():
	print("Test")
