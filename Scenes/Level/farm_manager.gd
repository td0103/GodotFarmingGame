class_name TileMapManager extends Node2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var interaction_area: InteracionArea = $InteractionArea

enum TileType {DRY, WET}

class TileInfo:
	var tilled: bool
	var watered: bool
	var crop: Crop

var tile_info: Dictionary[Vector2i, TileInfo]

var tile_atlas_coords: Dictionary[TileType, Vector2i] = {
	TileType.DRY: Vector2i(0, 0),
	TileType.WET: Vector2i(3, 1),
}

const CROP = preload("res://Scenes/Crop/crop.tscn")

func _ready() -> void:
	for cell in tile_map_layer.get_used_cells():
		tile_info[cell] = TileInfo.new()
		tile_info[cell].tilled = true
		tile_info[cell].watered = false
	interaction_area.interact = Callable(self, "_on_interact")

#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("test"):
		#_on_interact()

func _on_interact():
	var cell = tile_map_layer.local_to_map(to_local(PlayerManager.player.global_position))
	var atlas_coord = tile_map_layer.get_cell_atlas_coords(cell)
	if atlas_coord == Vector2i(-1, -1):
		pass
	elif atlas_coord == tile_atlas_coords[TileType.DRY]:
		tile_map_layer.set_cell(cell, 1, tile_atlas_coords[TileType.WET])
		tile_info[cell].watered = true
	elif atlas_coord == tile_atlas_coords[TileType.WET]:
		if tile_info[cell].crop:
			if tile_info[cell].crop.sprite_2d.texture == tile_info[cell].crop.seed_data.growth_texture[tile_info[cell].crop.seed_data.growth_days]:
				tile_info[cell].crop._on_interact()
				tile_info[cell].crop = null
				PlayerHud.hotbar_ui.update_slot()
		else:
			var data = PlayerManager.inventory_data
			if data.slots[0] == null:
				return
			if data.slots[0].item_data.item_type != ItemData.Type.SEED:
				return
			set_crop(cell)
			PlayerHud.hotbar_ui.update_slot()

func set_crop(cell):
	var data = PlayerManager.inventory_data
	var crop = CROP.instantiate()
	crop.seed_data = data.slots[0].item_data
	add_child(crop)
	tile_info[cell].crop = crop
	crop.global_position = cell * 16
	data.use_seed(data.slots[0])
	return true
