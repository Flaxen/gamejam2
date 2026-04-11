extends "res://scripts/farm.gd"

func _ready() -> void:
	pass

func _on_troops_build_swordsman(troops: Node) -> void:
	_on_troops_build_worker(troops)
