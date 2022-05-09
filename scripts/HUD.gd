extends CanvasLayer


onready var ScoreLabel := $VBoxContainer/HBoxContainer/ScoreContainer/Score
onready var PauseResumeButton: TextureButton = $VBoxContainer/HBoxContainer/PauseResume



onready var PauseTexture := load("res://assets/pause_button.png")
onready var ResumeTexture := load("res://assets/play_button.png")




# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	ScoreLabel.text = str( 0 )
	PauseResumeButton.texture_normal = PauseTexture
	EventManager.connect("new_score", self, "_on_NewScore")
	EventManager.connect("new_game", self, "_on_NewGame")


func _on_NewGame(score):
	print("new game in HUD")
	ScoreLabel.text = str( 0 )

func _on_NewScore(score):
	print("new score _on_NewScore in HUD")
	ScoreLabel.text = str( score )



#func _process(delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		if get_tree().paused:
#			GameManager.unpause_game()
#		else:
#			GameManager.unpause_game()
#
func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused:
		print("unpause ui_cancel")
		GameManager.unpause_game()
		get_tree().paused = false
		PauseResumeButton.texture_normal = PauseTexture
	if Input.is_action_just_pressed("ui_cancel") and !get_tree().paused:
		print("pause ui_cancel")
		GameManager.pause_game()
		PauseResumeButton.texture_normal = ResumeTexture
	


func _on_TextureButton_pressed():
	if get_tree().paused:
		print("ResumeTexture")
		PauseResumeButton.texture_normal = PauseTexture
		GameManager.unpause_game()
	else:
		print("PauseTexture")
		PauseResumeButton.texture_normal = ResumeTexture
		GameManager.pause_game()
		
