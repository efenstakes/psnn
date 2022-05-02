extends Node


func _ready()-> void:
	EventManager.connect("player_died", self, "_onPlayerDied")


func _onPlayerDied()-> void:
	print("player died")
