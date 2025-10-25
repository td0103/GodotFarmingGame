class_name Player extends CharacterBody2D

@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var current_dir: String = "down"

func _ready() -> void:
	player_state_machine.init(self)

func _physics_process(delta: float) -> void:
	player_state_machine.physics_process(delta)

func set_dir():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if input_dir.x > 0:
		current_dir = "right"
	elif input_dir.x < 0:
		current_dir = "left"
	if input_dir.y < 0:
		current_dir = "up"
	elif input_dir.y > 0:
		current_dir = "down"

func update_anim(state: String):
	anim.flip_h = false
	if current_dir == "right":
		anim.play(state + "_" + "side")
	elif current_dir == "left":
		anim.flip_h = true
		anim.play(state + "_" + "side")
	else:
		anim.play(state + "_" + current_dir)
