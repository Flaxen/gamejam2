extends Node

@export var food = 0
var wood = 0
var stone = 0
var iron = 0
var gold = 0
# Called when the node enters the scene tree for the first time.
var resources = [food,wood,stone,iron,gold]


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

signal increase_food(n:int)
signal increase_stone(n:int)
signal increase_wood(n:int)
signal increase_iron(n:int)
signal increase_gold(n:int)

func _on_berries_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			resources[0] += 1
			#print("food: ", food)
			increase_food.emit(resources[0])

func _on_wood_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			resources[1] += 1
			#print("wood: ", wood)
			increase_wood.emit(resources[1])


func _on_stone_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			resources[2] += 1
			#print("stone: ", stone)
			increase_stone.emit(resources[2])


func _on_iron_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			resources[3] += 1
			#print("iron: ", iron)
			increase_iron.emit(resources[3])


func _on_gold_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			resources[4] += 1
			#print("gold: ", gold)
			increase_gold.emit(resources[4])


func _on_troops_update_food(food_new: int) -> void:
	resources[0] = food_new
	increase_food.emit(resources[0])
