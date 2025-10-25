extends CharacterBody2D

@onready var interaction_area: InteracionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	Ui.shop_ui.show_ui()
