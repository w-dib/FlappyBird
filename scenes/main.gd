extends Node
@onready var player = $Player
@onready var game_over = $GUI/GameOver
@onready var start_game = $GUI/StartGame

@export var pipes: PackedScene

func _ready():
	game_over.hide()
	player.set_physics_process(false)
#	player.hide()

func spawn_pipe():
	if not start_game.visible:
		var pipe = pipes.instantiate()
		pipe.position.y = randi_range(-184,-10)
		add_child(pipe)
#
func _on_timer_timeout():
	spawn_pipe()


func _on_player_touch():
	game_over.show()
	player.queue_free()
	
func _unhandled_input(event):
	if event.is_action_pressed("jump") and start_game.visible:
		start_game.hide()
		player.set_physics_process(true)
