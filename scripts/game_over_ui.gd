extends Control

func set_points(points:int)->void:
	$Panel/ScoreLabel.text = "Score: " + str(points)

func _on_button_pressed()->void:
	get_tree().reload_current_scene()
