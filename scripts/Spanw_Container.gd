extends Node2D

signal spawn_enemy(enemy)
@onready var spawn_position:Node2D = $Spawn_Position
var enemy_scene:PackedScene = preload("res://scenes/enemy.tscn")


func _on_timer_timeout()->void:
	var random_sapnw:Node2D = spawn_position.get_children().pick_random()
	var enemy:Node2D = enemy_scene.instantiate()
	enemy.global_position = random_sapnw.global_position
	emit_signal("spawn_enemy", enemy)
