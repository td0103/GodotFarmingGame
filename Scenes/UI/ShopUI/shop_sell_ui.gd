extends CanvasLayer

@onready var inventory_ui: InventoryUI = $InventoryUI
signal hidden

func _unhandled_input(event: InputEvent) -> void:
	if visible == false:
		return
	if event.is_action_pressed("ui_cancel"):
		hide_ui()

func show_ui():
	#get_tree().paused = true
	visible = true
	#Ui.is_paused = true
	inventory_ui.inventory.update_inventory()
	inventory_ui.inventory.get_child(0).grab_focus()


func hide_ui():
	#get_tree().paused = false
	visible = false
	#Ui.is_paused = false
	Ui.hidden.emit()
	hidden.emit()
