extends "res://scripts/BarrierBase.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#print("collided")
		EventManager.player_died_event()
		# queue_free()
