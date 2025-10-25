extends CanvasLayer

@onready var control: Control = $Control
@onready var v_box_container: VBoxContainer = $Control/VBoxContainer
@onready var shop_sell_ui: CanvasLayer = $ShopSellUI

func _ready() -> void:
	shop_sell_ui.hidden.connect(return_focus)

func show_ui():
	get_tree().paused = true
	visible = true
	Ui.is_paused = true
	v_box_container.get_child(1).grab_focus()

func hide_ui():
	get_tree().paused = false
	visible = false
	Ui.is_paused = false
	Ui.hidden.emit()

func return_focus():
	v_box_container.get_child(1).grab_focus()

func _on_button_buy_pressed() -> void:
	hide_ui()

func _on_button_sell_pressed() -> void:
	shop_sell_ui.show_ui()

func _on_button_back_pressed() -> void:
	hide_ui()
