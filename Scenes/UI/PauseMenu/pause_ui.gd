extends CanvasLayer

@onready var tab_container: TabContainer = $Control/TabContainer
@onready var inventory: InventoryUI = $Control/TabContainer/Inventory

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if Ui.slot_selected:
			return
		if event.keycode == KEY_1:
			tab_container.current_tab = 0
			inventory.inventory.get_child(0).grab_focus()
		elif event.keycode == KEY_2:
			tab_container.current_tab = 1

func show_ui():
	get_tree().paused = true
	visible = true
	Ui.is_paused = true
	inventory.inventory.update_inventory()
	tab_container.current_tab = 0
	inventory.inventory.get_child(0).grab_focus()


func hide_ui():
	get_tree().paused = false
	visible = false
	Ui.is_paused = false
	Ui.hidden.emit()
