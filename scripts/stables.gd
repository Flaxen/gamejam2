extends "res://scripts/farm.gd"

func _ready() -> void:
	var troops = get_parent().get_parent().find_child("troops2d")
	troops.build_horseman.connect(self._on_troops_build_horseman.bind())
	spawning_done.connect(troops._on_farm_spawning_done.bind())
	input_event.connect(troops._on_stables_input_event.bind())


func _on_troops_build_horseman(troops: Node) -> void:
	_on_troops_build_worker(troops)
