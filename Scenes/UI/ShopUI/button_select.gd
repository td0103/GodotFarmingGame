extends Button

var number: int: set = update_number

func _ready() -> void:
	disabled = true

func _unhandled_input(event: InputEvent) -> void:
	if !has_focus():
		return
	if event.is_action_pressed("ui_left"):
		number -= 1
	elif event.is_action_pressed("ui_right"):
		number += 1

func update_number(value):
	number = value
	number = clamp(number, 1, SlotData.MAX_STACK_SIZE)
	text = str(number) + "個"
