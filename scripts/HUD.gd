extends CanvasLayer


onready var ScoreLabel := $ColorRect/HBoxContainer/Score



# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	EventManager.connect("new_score", self, "_on_NewScore")
	EventManager.connect("new_game", self, "_on_NewGame")


func _on_NewGame(score):
	ScoreLabel.text = str( 0 )

func _on_NewScore(score):
	ScoreLabel.text = str( score )


func _on_Button_pressed():
	if get_tree().paused:
		GameManager.unpause_game()
		$ColorRect/HBoxContainer/Button.text = "Pause" 
	else: 
		GameManager.pause_game()
		$ColorRect/HBoxContainer/Button.text = "Resume"
		
#
#func _process(delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		if get_tree().paused:
#			GameManager.unpause_game()
#		else:
#			GameManager.unpause_game()
#
#func _unhandled_key_input(event):
#	if Input.is_action_just_pressed("ui_cancel"):
#		if get_tree().paused:
#			GameManager.unpause_game()
#		else:
#			GameManager.unpause_game()
#
#	if get_tree().paused:
#		GameManager.unpause_game()
	
