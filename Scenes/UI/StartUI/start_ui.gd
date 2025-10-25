extends CanvasLayer

@export_file("*.tscn") var level_path: String
@onready var button: Button = $Control/VBoxContainer/Button

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(level_path)
