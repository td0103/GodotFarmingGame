class_name Inventory extends GridContainer

const SLOT = preload("res://Scenes/UI/Inventory/slot.tscn")
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
	#print(slot.slot_index)
	#if slot.slot_data:
	_on_slot_action.call(slot)

#func switch_slot(index: int):
	#if first_selected == -1:
		#first_selected = index
	#else:
		#data.swap_slot(first_selected, index)
		#first_selected = -1
		#update_inventory()

#func _on_slot_selected(index: int):
	#print(index)
