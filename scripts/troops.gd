extends Node

var marked_troops = []
var something_else_entered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func add_unit(unit:Node2D):
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
			for t in marked_troops:
				t.goto()
			
			
func _on_unit_pressed(unit:Node2D) -> void:
	#unit pressed once. only add this one
	#remove_all_units()
	add_unit(unit)

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
		if rect1.has_point(c.get_child(0).position):
			print("marked")
			c.add()
			marked_troops.append(c)
		
		
