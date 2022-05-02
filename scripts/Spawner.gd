extends Position2D


var SCREEN_SIZE: Vector2 = Vector2.ZERO


var BarrierXL : PackedScene = load("res://scenes/BarrierXL.tscn")
var BarrierMD : PackedScene = load("res://scenes/BarrierMD.tscn")
var BarrierSM : PackedScene = load("res://scenes/BarrierSM.tscn")

var barriers := [
	BarrierXL,
	BarrierMD,
	BarrierSM
]

# Called when the node enters the scene tree for the first time.
func _ready():
	SCREEN_SIZE = get_viewport_rect().size
	randomize()




func _on_Timer_timeout():
	# create a barrier here
	print("spawn barrier now")
	
	# pick random
	var barrier = barriers[ rand_range( 0, barriers.size() ) ]
	var barrier_obj = barrier.instance()
	barrier_obj.position = Vector2(
		rand_range(10, SCREEN_SIZE.x-80),
		position.y
	)
	get_tree().root.add_child(barrier_obj)
	$Timer.start( rand_range( .8, 1.6 ) )
