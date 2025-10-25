class_name ItemData extends Resource

@export var name: String
@export_multiline var description: String
@export var icon_texture: AtlasTexture
enum Type {GENERIC, SEED, CROP}
@export var item_type: Type = Type.GENERIC
