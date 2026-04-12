extends Node2D

@export var building_scenes: Array[PackedScene]

var scene_to_build = null

func _on_button_pressed() -> void:
	scene_to_build = building_scenes[0]
	$ghost.region_rect = Rect2(3*64, -2, 64, 44)
	$ghost.visible = true

func _process(_delta: float) -> void:
	
	if scene_to_build != null:
		$ghost.global_position = get_global_mouse_position() 

func _on_map_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed:
			var instance = scene_to_build.instantiate()
			add_child(instance)
			instance.global_position = get_global_mouse_position()
			scene_to_build = null
			$ghost.visible = false
