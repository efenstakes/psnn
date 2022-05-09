extends Node


signal new_game
signal new_score
signal gain_made
signal player_died

signal game_paused
signal game_unpaused


signal sheild_activated
signal sheild_deactivated



func game_paused_event()-> void:
	emit_signal("game_paused")

func game_unpaused_event()-> void:
	emit_signal("game_unpaused")

func new_game_event()-> void:
	emit_signal("new_game")
	# emit_signal("new_score", 0)


func new_score_event(score: int)-> void:
	emit_signal("new_score", score)


func gain_made_event(gain: int)-> void:
	emit_signal("gain_made", gain)


func player_died_event()-> void:
	emit_signal("player_died")
	
	
func sheild_activated_event()-> void:
	emit_signal("sheild_activated")


func sheild_deactivated_event()-> void:
	emit_signal("sheild_deactivated")

	
