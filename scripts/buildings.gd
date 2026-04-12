extends Node2D

@export var building_scenes: Array[PackedScene]

@export var barrack_price = [0,10,0,0]
@export var spear_tower_price = [0,10,5,0]
@export var archer_range_price = [0,20,2,0]
@export var stable_price = [10,10,0,0]
@export var castle_price = [10,10,10,0]
@export var tavern_price = [10,10,2,2]
@export var farm_price = [10,0,0,0]

var building_prices = [barrack_price, spear_tower_price, archer_range_price, stable_price, tavern_price, farm_price, castle_price]

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
	var resources = get_parent().resources
	if resources > building_prices[0]:
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
