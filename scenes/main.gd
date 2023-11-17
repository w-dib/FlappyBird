extends Node
@onready var player = $Player
@onready var game_over = $GUI/GameOver
@onready var start_game = $GUI/StartGame
@onready var score_text = $GUI/Label

@export var pipes: PackedScene

var score_value = 0 

func _ready():
	game_over.hide()
	player.set_physics_process(false)

func spawn_pipe():
	if not start_game.visible:
		var pipe = pipes.instantiate()
		pipe.connect("score", _on_player_score)
		pipe.position.y = randi_range(-184,-10)
		add_child(pipe)
#
func _on_timer_timeout():
	spawn_pipe()

func _on_player_touch():
	game_over.show()

func _on_player_score():
	print(score_text)
	score_value += 1
	score_text.text = "Score: %s" % score_value

func _unhandled_input(event):
	if event.is_action_pressed("jump") and game_over.visible:
		get_tree().reload_current_scene()
	if event.is_action_pressed("jump") and start_game.visible:
		start_game.hide()
		player.set_physics_process(true)

