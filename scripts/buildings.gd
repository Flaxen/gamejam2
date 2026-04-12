extends Node2D

@export var building_scenes: Array[PackedScene]

var scene_to_build = null

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	
	if scene_to_build != null:
		$ghost.global_position = get_global_mouse_position() 

func _on_map_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed and scene_to_build != null:
			var instance = scene_to_build.instantiate()
			add_child(instance)
			instance.global_position = get_global_mouse_position()
					
		scene_to_build = null
		$ghost.visible = false

func _on_button_pressed() -> void:
	scene_to_build = building_scenes[0]
	$ghost.region_rect = Rect2(3*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_2_pressed() -> void:
	scene_to_build = building_scenes[1]
	$ghost.region_rect = Rect2(6*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_3_pressed() -> void:
	scene_to_build = building_scenes[2]
	$ghost.region_rect = Rect2(0*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_4_pressed() -> void:
	scene_to_build = building_scenes[3]
	$ghost.region_rect = Rect2(2*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_5_pressed() -> void:
	scene_to_build = building_scenes[4]
	$ghost.region_rect = Rect2(1*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_6_pressed() -> void:
	scene_to_build = building_scenes[5]
	$ghost.region_rect = Rect2(4*64, 0, 64, 44)
	$ghost.visible = true

func _on_button_7_pressed() -> void:
	scene_to_build = building_scenes[6]
	$ghost.region_rect = Rect2(5*64, 0, 64, 44)
	$ghost.visible = true
