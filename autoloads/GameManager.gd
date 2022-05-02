extends Node


var GameOverHUD


var player_score : int = 0


func _ready()-> void:
	EventManager.connect("new_game", self, "_onNewGameStarted")
	EventManager.connect("new_score", self, "_onNewScore")
	EventManager.connect("player_died", self, "_onPlayerDied")



func new_game()-> void:
	EventManager.new_game_event()
	get_tree().paused = false
	
	
func pause_game()-> void:
	get_tree().paused = true
	
	
func unpause_game()-> void:
	get_tree().paused = false
	
	
	
func _onNewGameStarted()-> void:
	print("new game started  ")
	player_score = 0
	


func _onNewScore(score: int)-> void:
	print("new game score  ")
	player_score = score
	

func _onPlayerDied()-> void:
	print("player died")
	get_tree().paused = true
