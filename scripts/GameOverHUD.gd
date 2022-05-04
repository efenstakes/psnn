extends Node2D


onready var BG = $CanvasLayer/ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	BG.visible = false
	EventManager.connect("new_game", self, "_onNewGame")
	EventManager.connect("game_paused", self, "_onGamePaused")
	EventManager.connect("game_unpaused", self, "_onGameUnpaused")
	EventManager.connect("player_died", self, "_onPlayerDied")


func _onNewGame():
	BG.visible = false

	
func _onGamePaused():
	BG.visible = true
	
	
func _onGameUnpaused():
	BG.visible = false


func _onPlayerDied():
	print("_onPlayerDied un GOH")
	BG.visible = true

func _on_Quit_pressed():
	get_tree().quit()


func _on_New_pressed():
	EventManager.new_game_event()
