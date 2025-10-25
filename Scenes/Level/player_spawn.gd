extends Node2D

const PLAYER = preload("res://Scenes/Characters/Player/player.tscn")

func _ready() -> void:
	var player = PLAYER.instantiate()
	get_parent().add_child.call_deferred(player)
	player.global_position = global_position
	PlayerManager.player = player
