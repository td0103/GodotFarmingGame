extends PlayerState

@onready var move = $"../Move"

func enter():
	parent.velocity = Vector2.ZERO
	parent.update_anim("idle")

func physics_process(_delta: float):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if input_dir:
		return move
	return null
