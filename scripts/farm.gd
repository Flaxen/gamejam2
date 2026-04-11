extends Area2D

@export var worker_scene: PackedScene
@export var unit_grouping: String

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

signal spawning_done
func _on_troops_build_worker(troops:Node) -> void:
	var worker_instance = worker_scene.instantiate()
	worker_instance.position = $CollisionPolygon2D.global_position
	worker_instance.add_to_group(unit_grouping)
	troops.add_child(worker_instance)
	spawning_done.emit(worker_instance)
