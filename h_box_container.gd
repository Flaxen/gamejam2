extends HBoxContainer


func _on_buildings_update_ui_resources(resources: Array) -> void:
	$food.text = str(resources[0])
	$wood.text = str(resources[1])
	$stone.text = str(resources[2])
	$iron.text = str(resources[3])
	$gold.text = str(resources[4])
	
	pass # Replace with function body.
