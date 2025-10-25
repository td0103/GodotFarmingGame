extends ConfirmUI

@onready var button_select: Button = $Confirm1/ButtonContainer1/ButtonSelect

func show_confirm():
	super()
	button_select.number = 1

func _on_button_sell_pressed() -> void:
	print("item is selled")
	var number: int = button_select.number
	action_type = ActionType.SELL_ITEM
	print("number: ", button_select.number)
	hide_confirm(action_type, number)

func _on_button_back_pressed() -> void:
	hide_confirm()
