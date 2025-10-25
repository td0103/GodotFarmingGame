class_name SeedData extends ItemData

@export var crop_data: CropData
@export var sell_price: int = 10
@export var growth_texture: Array[AtlasTexture]
@export var growth_days: int = 3

func _init() -> void:
	item_type = Type.SEED
