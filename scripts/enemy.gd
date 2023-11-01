extends Area2D

signal give_points(point:int)
@export var speed:int = 300
@export var points:int = 10

func _process(delta)->void:
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited()->void:
	queue_free()
	
func die() -> void:
	emit_signal("give_points", points)
	queue_free()

func _on_area_entered(area)->void:
	die()

func _on_body_entered(body)->void:
	body.take_damage()
	die()
