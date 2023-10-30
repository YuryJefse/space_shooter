extends Node2D

signal spawn_enemy(enemy)
@onready var spawn_position = $Spawn_Position
var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_timer_timeout():
	var random_sapnw: Node2D = spawn_position.get_children().pick_random()
	var enemy = enemy_scene.instantiate()
	enemy.global_position = random_sapnw.global_position
	emit_signal("spawn_enemy", enemy)
