extends Node


signal new_game
signal new_score
signal gain_made
signal player_died



func new_game_event()-> void:
	emit_signal("new_game")
	emit_signal("new_score", 0)


func new_score_event(score: int)-> void:
	emit_signal("new_score", score)


func gain_made_event(gain: int)-> void:
	emit_signal("gain_made", gain)


func player_died_event()-> void:
	emit_signal("player_died")
