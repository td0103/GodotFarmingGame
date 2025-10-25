class_name PlayerStateMachine extends Node

@onready var start_state = $Idle
var current_state: PlayerState

func init(_parent):
	for child in get_children():
		child.parent = _parent
	change_state(start_state)

func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

func unhandled_input(event: InputEvent) -> void:
	var new_state = current_state.unhandled_input(event)
	if new_state:
		change_state(new_state)

func change_state(new_state: PlayerState):
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
