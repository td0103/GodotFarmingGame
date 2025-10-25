extends Node

var list_area: Array[InteracionArea]
#var input_delay: float = 5.0
#var input_timer: float = 0.0

#func _process(delta: float) -> void:
	#input_timer += delta
	#if input_timer < input_delay:
		#return
	#if Input.is_action_pressed("interact"):
		#if list_area.size() > 0:
			#list_area[check_distance()].interact.call()
			#input_timer = 0
	#input_timer = input_delay + 50

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if list_area.size() > 0:
			list_area[check_distance()].interact.call()

func register_area(area: InteracionArea):
	list_area.append(area)

func unregister_area(area: InteracionArea):
	list_area.erase(area)

func check_distance():
	var player_pos: Vector2 = PlayerManager.player.global_position
	var tmp = -1
	var index: int = 0
	for i in list_area.size():
		var distance = (list_area[i].global_position - player_pos).length()
		if tmp == -1:
			tmp = distance
		else:
			if distance < tmp:
				tmp = distance
				index = i
	return index
