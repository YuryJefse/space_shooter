extends Area2D


@export var speed:int = 300

func _process(delta):
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func die() -> void:
	print("morreu")
	queue_free()


func _on_area_entered(area):
	print(area)
	die()
