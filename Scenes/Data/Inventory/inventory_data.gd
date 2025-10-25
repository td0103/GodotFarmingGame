class_name InventoryData extends Resource

@export var slots: Array[SlotData]

func add_item(item: ItemData, count: int = 1):
	for slot in slots:
		if slot:
			if slot.item_data == item:
				var left = slot.MAX_STACK_SIZE - slot.quantity
				if count > left:
					slot.quantity = slot.MAX_STACK_SIZE
					count -= left
				else:
					slot.quantity += count
					return true

	for i in slots.size():
		if slots[i] == null:
			var new_slot = SlotData.new()
			new_slot.item_data = item
			new_slot.quantity = count
			slots[i] = new_slot
			return true
	print("inventory was full!")
	return false

func sub_item(slot: SlotData, count: int = 1):
	if slot:
		if slot.quantity < count:
			return false
		else:
			slot.quantity -= count
			slot_changed()
			return true
	return false

func use_seed(slot: SlotData):
	if slot:
		if slot.item_data.item_type == ItemData.Type.SEED:
			slot.quantity -= 1
			slot_changed()
			return true
	return false

func swap_slot(i1: int, i2: int):
	var tmp: SlotData = slots[i1]
	if !slots[i1] or !slots[i2]:
		slots[i1] = slots[i2]
		slots[i2] = tmp
		return
	if slots[i1].item_data != slots[i2].item_data:
		slots[i1] = slots[i2]
		slots[i2] = tmp
	else:
		var sum = slots[i1].quantity + slots[i2].quantity
		if sum <= SlotData.MAX_STACK_SIZE:
			slots[i1].quantity = 0
			slots[i2].quantity = sum
		else:
			slots[i1].quantity = SlotData.MAX_STACK_SIZE - slots[i2].quantity
			slots[i2].quantity = SlotData.MAX_STACK_SIZE
	slot_changed()


func slot_changed():
	for i in slots.size():
		if slots[i]:
			if slots[i].quantity < 1:
				print("slot is null")
				slots[i] = null
				#return true
			elif slots[i].quantity > slots[i].MAX_STACK_SIZE:
				slots[i].quantity = slots[i].MAX_STACK_SIZE
				#return true
	#return false
