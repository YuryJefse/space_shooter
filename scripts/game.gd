extends Node2D


func _on_spanw_container_spawn_enemy(enemy):
	$Spanw_Container.add_child(enemy)
