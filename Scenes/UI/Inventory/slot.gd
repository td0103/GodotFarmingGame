class_name Slot extends Button

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect
@onready var label: Label = $Label
var slot_data: SlotData: set = set_slot_data
var slot_index: int
signal slot_selected

func _ready() -> void:
	texture_rect.texture = null
	label.text = ""

func set_slot_data(value: SlotData):
	slot_data = value
	if slot_data == null:
		texture_rect.texture = null
		label.text = ""
		return
	texture_rect.texture = slot_data.item_data.icon_texture
	label.text = "x" + str(slot_data.quantity)

func _on_pressed() -> void:
	emit_signal("slot_selected", self)
