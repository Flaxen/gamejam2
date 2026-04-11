extends Area2D

var worker_scene
func _ready() -> void:
	worker_scene = preload("res://scenes/worker.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_troops_build_worker(troops:Node) -> void:
	var worker_instance = worker_scene.instantiate()
	worker_instance.position = $CollisionPolygon2D.global_position
	print(worker_instance.position)
	troops.add_child(worker_instance)
	print("spawned worker at ", worker_instance.position)
	print("CollisionPos ", $CollisionPolygon2D.global_position)
