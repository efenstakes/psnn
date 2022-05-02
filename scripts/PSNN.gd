extends Node2D

onready var GameOverHUD : = $GameOverHUD


# Called when the node enters the scene tree for the first time.
func _ready():
	GameOverHUD.visible  = false
	EventManager.connect("new_game", self, "_onNewGameStarted")
	EventManager.connect("player_died", self, "_onPlayerDied")

	
func _onNewGameStarted()-> void:
	GameOverHUD.visible  = false
	

func _onPlayerDied()-> void:
	print("player died")
	GameOverHUD.visible  = true
