extends Control

@onready var slot: Slot = $PanelContainer/MarginContainer/GridContainer/Slot

func _ready() -> void:
	Ui.hidden.connect(update_slot)
	#slot.disabled = true

func update_slot():
	var data = PlayerManager.inventory_data
	slot.set_slot_data(data.slots[0])
