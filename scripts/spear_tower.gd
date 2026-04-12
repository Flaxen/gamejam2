extends "res://scripts/farm.gd"

func _ready() -> void:
	var troops = get_parent().get_parent().find_child("troops2d")
	troops.build_spearman.connect(self._on_troops_build_spearman.bind())
	spawning_done.connect(troops._on_farm_spawning_done.bind())
	input_event.connect(troops._on_spear_tower_input_event.bind())


func _on_troops_build_spearman(troops: Node) -> void:
	_on_troops_build_worker(troops)
