extends Control

@onready var label: Label = $Label
var money: int

func update_money():
	money = PlayerManager.money
	label.text = "所持金: " + str(money)
