extends "res://scripts/farm.gd"

func _ready() -> void:
	var troops = get_parent().get_parent().find_child("troops2d")
	troops.build_archer.connect(self._on_troops_build_archer.bind())
	spawning_done.connect(troops._on_farm_spawning_done.bind())
	input_event.connect(troops._on_archer_range_input_event.bind())


func _on_troops_build_archer(troops: Node) -> void:
	_on_troops_build_worker(troops)
