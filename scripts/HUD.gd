extends CanvasLayer


onready var ScoreLabel := $ColorRect/HBoxContainer/Score



# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.connect("new_score", self, "_on_NewScore")


func _on_NewScore(score):
	ScoreLabel.text = str( score )
