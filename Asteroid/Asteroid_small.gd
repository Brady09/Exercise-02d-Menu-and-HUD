extends KinematicBody2D

var health = 1
var velocity = Vector2.ZERO

var Effects
onready var Explosion = load("res://Effects/Explosion.tscn")


func _physics_process(_delta):
	position += velocity
	position.x = wrapf(position.x,0,Global.vp.x)
	position.y = wrapf(position.y,0,Global.vp.y)

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(100)
		Effects = get_node_or_null("/root/Game/Effects")
		if Effects != null:
			var explosion = Explosion.instance()
			Effects.add_child(explosion)
			explosion.global_position = global_position
		queue_free()
