extends CharacterBody2D

var target = global_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = global_position
	print("character pos: ", global_position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func goto(coord):
	target = coord
	#print ("move to pos ", target)
	
func _physics_process(_delta):
	velocity = global_position.direction_to(target) * 10
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

	# look_at(target)
	
	if global_position.distance_to(target) > 10:
		$AnimatedSprite2D.play("walk")
		#print ("moving w velocity, ", $CharacterBody2D.velocity)
		move_and_slide()
		
	else:
		$AnimatedSprite2D.play("idle")



func add():
	$Line2D.visible = true
	
func remove():
	$Line2D.visible = false

signal pressed(unit:CharacterBody2D)
func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:

		if event.button_index == 1 and event.pressed:
			#unit pressed once. only add this one
			#print("pressed")
			#remove_all_units()
			pressed.emit(self)
			
		if event.double_click:
			#print("double clicked")
			pass
