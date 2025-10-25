class_name ConfirmUI extends Control

@onready var confirm_1: Control = $Confirm1
@onready var confirm_2: Control = $Confirm2
@onready var button_container_1: VBoxContainer = $Confirm1/ButtonContainer1
@onready var button_container_2: VBoxContainer = $Confirm2/ButtonContainer2
@onready var label: Label = $Confirm1/Label
@onready var label_2: Label = $Confirm2/Label2
@onready var button_yes_2: Button = $Confirm2/ButtonContainer2/ButtonYes2
signal finished
const ActionType = {
	MOVE_ITEM = "move_item",
	SPLIT_ITEM = "split_item",
	TRASH_ITEM = "trash_item",
	BUY_ITEM = "buy_item",
	SELL_ITEM = "sell_item",
}
var action_type: String = ""

func _ready() -> void:
	confirm_2.get_child(0).get_child(0).pressed.connect(_on_button_yes_2_pressed)
	confirm_2.get_child(0).get_child(1).pressed.connect(_on_button_no_2_pressed)
	hide_confirm()

func show_confirm():
	action_type = ""
	visible = true
	confirm_1.visible = true
	confirm_2.visible = false
	Ui.is_confirmed = true
	button_container_1.get_child(0).grab_focus()

func hide_confirm(action_name: String = "", number: int = 0):
	visible = false
	Ui.is_confirmed = false
	emit_signal("finished", action_name, number)

func show_confirm_2(label_text: String):
	confirm_1.visible = false
	confirm_2.visible = true
	label_2.text = label_text
	button_container_2.get_child(0).grab_focus()

func _on_button_yes_2_pressed() -> void:
	hide_confirm(action_type)

func _on_button_no_2_pressed() -> void:
	hide_confirm()
