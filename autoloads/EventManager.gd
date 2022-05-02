extends Node


signal gain_made
signal player_died


func gain_made_event(gain: int)-> void:
	emit_signal("gain_made", gain)


func player_died_event()-> void:
	emit_signal("player_died")
