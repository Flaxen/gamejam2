extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var pressed = false
var start_pos
var end_pos
signal mark_troops(start)
func _process(_delta: float) -> void:

	if pressed == true:
		var mousepos = get_global_mouse_position()

		$Line2D.points[0] = start_pos
		$Line2D.points[1] = Vector2(start_pos.x, mousepos.y)
		$Line2D.points[2] = mousepos
		$Line2D.points[3] = Vector2(mousepos.x, start_pos.y)
		
func _on_map_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		
		if event.button_index == 1 and event.is_pressed():
			#print("constant press")
			$Line2D.visible = true
			pressed = true
			start_pos = get_global_mouse_position()
			
		if event.button_index == 1 and event.is_released() and pressed == true:
			#print("stop press")
			$Line2D.visible = false
			pressed = false
			mark_troops.emit($Line2D.points)
			
			
			
