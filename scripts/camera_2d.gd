extends Camera2D

@export var scroll_speed = 1.0
@export var pan_speed = 4
@export var mouse_detection_width = 0
@export var max_zoom = 3
@export var min_zoom = 1

var mousepos
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mousepos = get_viewport().get_mouse_position()
	
	if mousepos.x < mouse_detection_width:
		# move camera to left
		offset = offset + Vector2(-pan_speed*1.5*(max_zoom+1-zoom.x),0)
	if mousepos.x > screen_size.x - mouse_detection_width:
		#move camera to right
		offset = offset + Vector2(pan_speed*1.5*(max_zoom+1-zoom.x),0)
		
	if mousepos.y < mouse_detection_width:
		# move camera to up
		offset = offset + Vector2(0,-pan_speed*(max_zoom+1-zoom.x))

	if mousepos.y > screen_size.y - mouse_detection_width:
		#move camera to down
		offset = offset + Vector2(0,pan_speed*(max_zoom+1-zoom.x))

	if Input.is_action_just_released("zoom_in"):
		if zoom.x < max_zoom:
			zoom = zoom + Vector2(scroll_speed, scroll_speed)
	if Input.is_action_just_released("zoom_out"):
		if zoom.x > min_zoom:
			zoom = zoom - Vector2(scroll_speed, scroll_speed)

	pass

func get_rect() -> Rect2:
	var pos = position
	var half_size = get_viewport_rect().size * 0.5
	return Rect2(pos - half_size, pos + half_size)
