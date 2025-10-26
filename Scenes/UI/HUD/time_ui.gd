extends Control

@onready var label: Label = $Label
@onready var color_rect: ColorRect = $ColorRect
var day_length: float = 2.0 * 5
var night_length: float = 1.0 * 5
var total_day_length: float = day_length + night_length
var current_time: float = 0.0
var change_speed: float = 0.125
signal change_day


func _process(delta: float) -> void:
	current_time += delta
	if current_time < day_length:
		label.text = "昼"
		color_rect.color.a = max(color_rect.color.a - delta * change_speed, 0)
	elif current_time < total_day_length:
		label.text = "夜"
		color_rect.color.a = min(color_rect.color.a + delta * change_speed, 0.7)
	else:
		current_time = 0
		change_day.emit()
