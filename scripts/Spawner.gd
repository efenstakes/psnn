extends Position2D


var SCREEN_SIZE: Vector2 = Vector2.ZERO


var BarrierXL : PackedScene = load("res://scenes/BarrierXL.tscn")

var barriers := [
	BarrierXL
]

# Called when the node enters the scene tree for the first time.
func _ready():
	SCREEN_SIZE = get_viewport_rect().size
	randomize()




func _on_Timer_timeout():
	# create a barrier here
	print("spawn now")
	
	# pick random
	var barrier = barriers[ rand_range( 0, barriers.size() ) ]
	var barrier_obj = barrier.instance()
	barrier_obj.position = Vector2(
		rand_range(10, SCREEN_SIZE.x-80),
		position.y
	)
	get_tree().current_scene.add_child(barrier_obj)
