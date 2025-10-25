extends PlayerState

@onready var idle = $"../Idle"
var move_speed: float = 70.0

func enter():
	parent.update_anim("move")

func physics_process(_delta: float):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	if input_dir == Vector2.ZERO:
		return idle
	movement(move_speed)
	parent.set_dir()
	parent.update_anim("move")
	return null

func movement(speed):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction := input_dir.normalized()
	if direction:
		parent.velocity = direction * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
		parent.velocity.y = move_toward(parent.velocity.y, 0, speed)
	parent.move_and_slide()
