extends Node2D


onready var SpeedTimer = $SpeedTimer

export var last_increase_wait_time := 0



func _ready()-> void:
	randomize()
	last_increase_wait_time = rand_range(15, 20)
	SpeedTimer.start( rand_range(15, 20) )


func _on_SpeedTimer_timeout():
	print("last_increase_wait_time ", last_increase_wait_time)
	last_increase_wait_time = rand_range(
		last_increase_wait_time * 0.25,
		last_increase_wait_time * 0.5
	)
	print("last_increase_wait_time ", last_increase_wait_time)
	
	EventManager.increase_speed_event(last_increase_wait_time)
	
	SpeedTimer.start( last_increase_wait_time )
