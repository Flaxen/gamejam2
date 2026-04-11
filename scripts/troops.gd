extends Node2D

var marked_troops = []
var something_else_entered = false

var food = 0
var wood = 0
var stone = 0
var iron = 0
var gold = 0

@export var worker_price = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass
	
func get_troop_coordinates(n:int, coordinate:Vector2, _troop_diameter:int=5) -> Array:
	var square_size = sqrt(n)+1
	var coords = []
	
	for i in range(square_size):
		for j in range(square_size):
			var coord = coordinate + Vector2(_troop_diameter*i, _troop_diameter*j)
			coords.append(coord)
	return coords

func add_unit(unit:CharacterBody2D):
	marked_troops = [unit]
	#print("added unit")
	unit.add()


func remove_all_units():
	for t in marked_troops:
		t.remove()
		marked_troops = []

func _on_map_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed and something_else_entered == false:
			#print("map pressed")
			remove_all_units()
			
		if event.button_index == 2 and event.pressed:
			#print("map right clicked")
			var coordinate = get_global_mouse_position()
			print(coordinate)
			var coords = get_troop_coordinates(len(marked_troops), coordinate)
			 
			for t in range(len(marked_troops)):
				marked_troops[t].goto(coords[t])
	

func _on_character_body_2d_mouse_entered() -> void:
	something_else_entered = true

func _on_character_body_2d_mouse_exited() -> void:
	something_else_entered = false

func find_top_left(points: Array) -> Vector2:
	var min_x = points[0].x
	var min_y = points[0].y

	for point in points:
		min_x = min(min_x, point.x)
		min_y = min(min_y, point.y)
		
	return Vector2(min_x, min_y)


func _on_ui_mark_troops(points) -> void:
	#mark all troops in rect
	#remove_all_units()

	var rect1 = Rect2(find_top_left(points),
					Vector2(abs(points[0].x-points[2].x), abs(points[0].y-points[2].y)))

	for c in get_children():
		if rect1.has_point(c.position):
			#print("marked")
			c.add()
			marked_troops.append(c)


func _on_character_body_2d_pressed(unit: CharacterBody2D) -> void:
	#unit pressed once. only add this one
	add_unit(unit)

signal update_food(food:int)
signal build_worker(troops:Node)
func _on_farm_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed and something_else_entered == false:
			#create worker if afford
			if food >= worker_price:
				print("worker!")
				update_food.emit(food-worker_price)
				build_worker.emit(self)
			




func _on_player_1_increase_food(n: int) -> void:
	food = n


func _on_player_1_increase_gold(n: int) -> void:
	gold = n

func _on_player_1_increase_iron(n: int) -> void:
	iron = n

func _on_player_1_increase_stone(n: int) -> void:
	stone = n

func _on_player_1_increase_wood(n: int) -> void:
	wood = n
