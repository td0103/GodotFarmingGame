extends CanvasLayer

@onready var shop_ui: CanvasLayer = $ShopUI
@onready var pause_ui: CanvasLayer = $PauseUI
@onready var label_money: Label = $LabelMoney
var is_paused: bool = false
var is_confirmed: bool = false
var slot_selected: bool = false

signal hidden

func _ready() -> void:
	hidden.emit()

func is_process():
	if is_confirmed or slot_selected:
		return true
	return false

func _unhandled_input(event: InputEvent) -> void:
	if is_process():
		return
	if event.is_action_pressed("pause"):
		if shop_ui.visible:
			return
		if is_paused:
			pause_ui.hide_ui()
		else:
			pause_ui.show_ui()
