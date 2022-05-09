extends CanvasLayer


onready var ScoreLabel := $VBoxContainer/HBoxContainer/ScoreContainer/Score
onready var PauseResumeButton: TextureButton = $VBoxContainer/HBoxContainer/PauseResume

onready var Shield := $VBoxContainer/HBoxContainer/Sheld
onready var ShieldLifeLabel := $VBoxContainer/HBoxContainer/Sheld/RemainingTime
onready var ShieldStatusLabel := $VBoxContainer/HBoxContainer/Sheld/status


onready var ActivateShieldAfterTimer := $VBoxContainer/ActivateSheldAfterTimer
onready var DeactivateSheldAfterTimer := $VBoxContainer/DeactivateSheldAfterTimer
onready var ShieldLifeSoFarTimer := $VBoxContainer/ShieldLifeTimer


onready var PauseTexture := load("res://assets/pause_button.png")
onready var ResumeTexture := load("res://assets/play_button.png")
onready var ActiveTexture := load("res://assets/shield_indicator.png")
onready var InActiveTexture := load("res://assets/shield_indicator_inactive.png")



var deactivate_after : int = 0
var last_time_out_after : int = 10

var deactivated_color := Color( 1, .6, .6, .8 )


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	ScoreLabel.text = str( 0 )
	PauseResumeButton.texture_normal = PauseTexture
	EventManager.connect("new_score", self, "_on_NewScore")
	EventManager.connect("new_game", self, "_on_NewGame")
	last_time_out_after = int(rand_range(15, 32))
	ActivateShieldAfterTimer.start(last_time_out_after)
	#Shield.modulate = deactivated_color
	Shield.texture = InActiveTexture

func _on_NewGame(score):
	#print("new game in HUD")
	ScoreLabel.text = str( 0 )

func _on_NewScore(score):
	#print("new score _on_NewScore in HUD")
	ScoreLabel.text = str( score )



func _unhandled_input(event):
	if Input.is_action_just_pressed("ui_cancel") and get_tree().paused:
		#print("unpause ui_cancel")
		GameManager.unpause_game()
		get_tree().paused = false
		PauseResumeButton.texture_normal = PauseTexture
	if Input.is_action_just_pressed("ui_cancel") and !get_tree().paused:
		#print("pause ui_cancel")
		GameManager.pause_game()
		PauseResumeButton.texture_normal = ResumeTexture
	


func _on_TextureButton_pressed():
	if get_tree().paused:
		#print("ResumeTexture")
		PauseResumeButton.texture_normal = PauseTexture
		GameManager.unpause_game()
	else:
		#print("PauseTexture")
		PauseResumeButton.texture_normal = ResumeTexture
		GameManager.pause_game()
				
	

# emit sheild_activated_event
# start sheidl life to start counting how long we have till sheidl goes down
# start deactivate shield timer to know when to deactivate shield
# set new deactivate_after time
func _on_ActivateSheldAfterTimer_timeout():
	# stop the ActivateSheldAfterTimer till someone starts it
	ActivateShieldAfterTimer.stop()
	
	# emit sheild_activated_event
	EventManager.sheild_activated_event()
	
	# set new deactivate_after time
	deactivate_after = int(rand_range(4, 7))
	
	print("deactivate_after "+ str(deactivate_after))
	
	#start sheidl life to start counting how long we have till sheidl goes down
	ShieldLifeSoFarTimer.start()
	
	# start deactivate shield timer to know when to deactivate shield
	DeactivateSheldAfterTimer.start(deactivate_after)
	
	ShieldStatusLabel.text = "ACTIVATED"
	
	# set color
	#Shield.modulate = Color( 1, 1, 1, 1 )
	Shield.texture = ActiveTexture


# stop ShieldLifeSoFarTimer
# reset deactivate_after to 0
# set ShieldStatusLabel to disabled
# set ShieldRemainingLifeLabel to 0
# emit	EventManager.sheild_deactivated_event()
# start ActivateShieldAfterTimer
func _on_DeactivateSheldAfterTimer_timeout():
	# stop ShieldLifeSoFarTimer
	ShieldLifeSoFarTimer.stop()
	
	# reset deactivate_after to 0
	deactivate_after = 0
	
	# emit sheild_deactivated_event
	EventManager.sheild_deactivated_event()
	
	last_time_out_after += last_time_out_after * 0.25
	
	# start
	ActivateShieldAfterTimer.start(int(rand_range(last_time_out_after, last_time_out_after*0.5)))
	
	# stop deactivation timer
	DeactivateSheldAfterTimer.stop()
	
	# reset labels
	ShieldLifeLabel.text = "0"
	ShieldStatusLabel.text = "DEACTIVATED"
	
	print("deactivate")
	
	#Shield.modulate = deactivated_color
		
	Shield.texture = InActiveTexture


func _on_ShieldLifeTimer_timeout():
	deactivate_after -= 1
	ShieldLifeLabel.text = str( deactivate_after )
