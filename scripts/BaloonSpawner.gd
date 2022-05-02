extends Position2D


var BalloonScene : PackedScene = load("res://scenes/Balloon.tscn")

# screen size
var SCREEN_SIZE := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	SCREEN_SIZE = get_viewport_rect().size
	randomize()



func _on_Timer_timeout():
	print("adding new balloon")
	var balloon = BalloonScene.instance()
	balloon.position = Vector2(
		rand_range( 2, SCREEN_SIZE.x - 20 ), 0
	)
	get_tree().root.add_child(balloon)
	$Timer.start( rand_range( .2, 1.6 ) )
