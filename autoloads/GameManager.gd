extends Node


var player_score : int = 0

var shield_active : bool = false



# Called when the node enters the scene tree for the first time.
func _ready()-> void:
	pause_mode = Node.PAUSE_MODE_PROCESS
	EventManager.connect("new_game", self, "_onNewGameStarted")
	EventManager.connect("new_score", self, "_onNewScore")
	EventManager.connect("player_died", self, "_onPlayerDied")
	EventManager.connect("sheild_activated", self, "_onShieldActivated")
	EventManager.connect("sheild_deactivated", self, "_onShieldDeactivated")


func new_game()-> void:
	EventManager.new_game_event()
	# $HUDDER.visible = true
	get_tree().paused = false
	
	
func pause_game()-> void:
	get_tree().paused = true
	
	
func unpause_game()-> void:
	get_tree().paused = false
	
	
	
func _onNewGameStarted()-> void:
	unpause_game()
	print("new game started  ")
	player_score = 0
	


func _onNewScore(score: int)-> void:
	print("new game score  ")
	player_score = score
	

func _onPlayerDied()-> void:
	print("player died")
	# $HUDDER.visible = false
	pause_game()
	
	
func _onShieldActivated():
	shield_active = true
	
func _onShieldDeactivated():
	shield_active = false
	
	
