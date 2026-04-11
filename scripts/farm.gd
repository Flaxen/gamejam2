extends Area2D

var worker_scene
func _ready() -> void:
	worker_scene = preload("res://scenes/worker.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

signal spawning_done
func _on_troops_build_worker(troops:Node) -> void:
	var worker_instance = worker_scene.instantiate()
	worker_instance.position = $CollisionPolygon2D.global_position
	worker_instance.add_to_group("workers")
	troops.add_child(worker_instance)
	spawning_done.emit(worker_instance)
