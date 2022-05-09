extends "res://scripts/BarrierBase.gd"


var shield_active : bool = false

onready var Blaster := $CPUParticles2D



# Called when the node enters the scene tree for the first time.
func _ready():
	EventManager.connect("sheild_activated", self, "_onShieldActivated")
	EventManager.connect("sheild_deactivated", self, "_onShieldDeactivated")




func _on_Area2D_body_entered(body):
	if !shield_active and body.name == "Player":
		EventManager.player_died_event()
		
	if shield_active and body.name == "Player":
		EventManager.gain_made_event(20)
		$Area2D/Sprite.visible = false
		Blaster.emitting = true
		yield( get_tree().create_timer(3), "timeout" )
		queue_free()




func _onShieldActivated():
	shield_active = true
	
	
func _onShieldDeactivated():
	yield( get_tree().create_timer(2), "timeout" )
	shield_active = false
	
