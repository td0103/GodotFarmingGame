class_name InventoryUI extends Control

@onready var inventory: Inventory = $PanelContainer/MarginContainer/Inventory
@export var confirm_ui: ConfirmUI
var current_slot: Slot
var first_selected: int = -1

func _ready() -> void:
	inventory._on_slot_action = Callable(self, "_on_slot_action")
	confirm_ui.finished.connect(return_focus)

func _on_slot_action(slot: Slot):
	current_slot = slot
	if first_selected != -1:
		move_item(current_slot)
		Ui.slot_selected = false
		return
	if slot.slot_data:
		confirm_ui.show_confirm()

func return_focus(action_name: String = "", number: int = 0):
	if action_name == "":
		pass
	elif action_name == "move_item":
		move_item(current_slot)
	elif action_name == "split_item":
		split_item()
	elif action_name == "trash_item":
		trash_item(current_slot)
	elif action_name == "sell_item":
		sell_item(current_slot, number)
	inventory.update_inventory()
	if current_slot:
		current_slot.grab_focus()
	else:
		inventory.get_child(0).grab_focus()



#せいとん: 1ボタンで実装したい, 種類順にソート, 同じものは上限まで合算
func sort_inventory():
	pass

func move_item(slot: Slot):
	Ui.slot_selected = true
	if slot == null:
		return
	if first_selected == -1:
		first_selected = slot.slot_index
	else:
		inventory.data.swap_slot(first_selected, slot.slot_index)
		first_selected = -1
		inventory.update_inventory()

#アイテムの分割: 個数選択 -> 空いている最初のスロットに分ける
func split_item():
	pass

func trash_item(slot: Slot):
	var data = inventory.data
	var slot_data = data.slots[slot.slot_index]
	if slot_data:
		data.sub_item(slot_data, slot_data.quantity)

func sell_item(slot: Slot, number: int):
	var data = inventory.data
	var slot_data: SlotData = data.slots[slot.slot_index]
	if slot_data:
		PlayerManager.money += number * slot_data.item_data.sell_price
		Ui.label_money.text = "所持金: " + str(PlayerManager.money)
		data.sub_item(slot_data, number)
