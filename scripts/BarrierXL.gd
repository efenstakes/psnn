extends "res://scripts/BarrierBase.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body: KinematicBody2D):
	if body.is_in_group("Player"):
		print("collided")
		EventManager.player_died_event()
		queue_free()
