extends Node2D

signal pressed(unit)
var target
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = $CharacterBody2D.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func goto():
	target = $CharacterBody2D.get_global_mouse_position()
	#print ("move to pos ", target)
	
func _physics_process(_delta):
	$CharacterBody2D.velocity = $CharacterBody2D.position.direction_to(target) * 10
	if $CharacterBody2D.velocity.x < 0:
		$CharacterBody2D/AnimatedSprite2D.flip_h = true
	else:
		$CharacterBody2D/AnimatedSprite2D.flip_h = false

	# look_at(target)
	if $CharacterBody2D.position.distance_to(target) > 10:
		$CharacterBody2D/AnimatedSprite2D.play("walk")
		#print ("moving w velocity, ", $CharacterBody2D.velocity)
		$CharacterBody2D.move_and_slide()
	else:
		$CharacterBody2D/AnimatedSprite2D.play("idle")


func _on_character_body_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:

		if event.button_index == 1 and event.pressed:
			#print("pressed")
			pressed.emit(self)
			
		if event.double_click:
			print("double clicked")
		
func add():
	$CharacterBody2D/Line2D.visible = true
	
func remove():
	$CharacterBody2D/Line2D.visible = false
