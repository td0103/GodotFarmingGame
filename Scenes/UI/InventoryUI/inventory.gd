class_name Inventory extends GridContainer

const SLOT = preload("res://Scenes/UI/InventoryUI/slot.tscn")
@export var data: InventoryData
var _on_slot_action: Callable = func():
	pass

func _ready() -> void:
	for i in data.slots.size():
		var slot = SLOT.instantiate()
		add_child(slot)
		slot.slot_data = data.slots[i]
		slot.slot_index = i
		slot.slot_selected.connect(_on_slot_selected)


func clear_inventory():
	for child in get_children():
		child.set_slot_data(null)

func update_inventory():
	clear_inventory()
	for i in data.slots.size():
		var slot = get_child(i)
		slot.slot_data = data.slots[i]

func _on_slot_selected(slot: Slot):
	_on_slot_action.call(slot)
