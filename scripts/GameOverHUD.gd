extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	
	



func _on_Quit_pressed():
	get_tree().quit()


func _on_New_pressed():
	EventManager.new_game_event()
