extends Area2D

@export var speed:int = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta)->void:
	global_position.x += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited()->void:
	queue_free()


func _on_area_entered(area)->void:
	queue_free()
