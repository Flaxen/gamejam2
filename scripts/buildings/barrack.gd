extends "res://scripts/buildings/farm.gd"

func _ready() -> void:
	var troops = get_parent().get_parent().find_child("troops2d")
	troops.build_swordsman.connect(self._on_troops_build_swordsman.bind())
	spawning_done.connect(troops._on_farm_spawning_done.bind())
	input_event.connect(troops._on_barrack_input_event.bind())


func _on_troops_build_swordsman(troops: Node) -> void:
	_on_troops_build_worker(troops)
