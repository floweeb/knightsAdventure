extends Area2D



func _on_body_entered(_body: Node2D) -> void:
	print("plus 1 coin")
	queue_free()
