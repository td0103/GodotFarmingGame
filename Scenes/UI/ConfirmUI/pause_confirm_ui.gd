extends ConfirmUI


func _on_button_move_pressed() -> void:
	action_type = ActionType.MOVE_ITEM
	hide_confirm(action_type)

func _on_button_trash_pressed() -> void:
	action_type = ActionType.TRASH_ITEM
	show_confirm_2("捨てる")

func _on_button_back_pressed() -> void:
	hide_confirm()
