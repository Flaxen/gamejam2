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
			food += 1
			print("food: ", food)
			increase_food.emit(food)

func _on_wood_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			wood += 1
			print("wood: ", wood)
			increase_wood.emit(wood)


func _on_stone_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			stone += 1
			print("stone: ", stone)
			increase_stone.emit(stone)


func _on_iron_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			iron += 1
			print("iron: ", iron)
			increase_iron.emit(iron)


func _on_gold_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			gold += 1
			print("gold: ", gold)
			increase_gold.emit(gold)


func _on_troops_update_food(food_new: int) -> void:
	food = food_new
	increase_food.emit(food)
