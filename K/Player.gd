extends Area2D

var tilesize = 32
var inputs = {'ui_right': Vector2.RIGHT,
'ui_left': Vector2.LEFT,
'ui_up': Vector2.UP,
'ui_down': Vector2.DOWN}

onready var tween = $Tween
onready var ray = $RayCast2D




func _ready():
	position = position.snapped(Vector2.ONE * tilesize)
	position += Vector2.ONE * tilesize/2
	pass

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
func move(dir):
	if tween.is_active():
		return
	ray.cast_to = inputs[dir] * tilesize
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tilesize
