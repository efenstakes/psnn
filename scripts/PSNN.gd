extends Node2D

onready var GameOverHUD : = $GameOverHUD


# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.connect("new_game", self, "_onNewGameStarted")
	EventManager.connect("player_died", self, "_onPlayerDied")

	
func _onNewGameStarted()-> void:
	for item in get_tree().get_nodes_in_group("Barrier"):
		item.queue_free()
		
	for item in get_tree().get_nodes_in_group("Balloon"):
		item.queue_free()
				
				
func _onPlayerDied()-> void:
	print("player died")
	
	
	
			
#func _process(delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		if get_tree().paused:
#			GameManager.unpause_game()
#		else:
#			GameManager.unpause_game()
			
#func _unhandled_key_input(event):
#	if Input.is_action_just_pressed("ui_cancel"):
#		if get_tree().paused:
#			GameManager.unpause_game()
#		else:
#			GameManager.unpause_game()
#
#	if get_tree().paused:
#		GameManager.unpause_game()
