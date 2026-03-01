extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_player_1_increase_food(n: int) -> void:
	text = str(n)
