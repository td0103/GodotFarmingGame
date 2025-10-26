class_name Crop extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

var seed_data: SeedData
var growth_days: int
var passed_day: int = 0
var is_grown: bool = false

func _ready() -> void:
	set_data()
	PlayerHud.time_ui.change_day.connect(update_texture)

func set_data():
	sprite_2d.texture = seed_data.growth_texture[0]
	growth_days = seed_data.growth_days

func update_texture():
	passed_day = min(passed_day + 1, growth_days)
	sprite_2d.texture = seed_data.growth_texture[passed_day]
	if passed_day == growth_days:
		is_grown = true

func _on_interact():
	if is_grown:
		PlayerManager.inventory_data.add_item(seed_data, 10)
		PlayerManager.inventory_data.add_item(seed_data.crop_data, 10)
		queue_free()
