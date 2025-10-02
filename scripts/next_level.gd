extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var current_level = get_tree().current_scene.scene_file_path
	var file_name = current_level.get_file()                  # "level_03.tscn"
	var num_str = file_name.trim_suffix(".tscn").split("_")[1] # "03"
	var level_num = int(num_str)

	# Increment to get the next level
	var next_level_num = level_num + 1
	# Format as two digits (e.g. 04, 12, 99)
	var next_num_str = str(next_level_num).pad_zeros(2)

	# Build the new path (same folder as current level)
	var dir_path = current_level.get_base_dir()               # "res://scenes"
	var next_scene_path = dir_path + "/level_" + next_num_str + ".tscn"

	# Check if the file exists before loading (to avoid crashes)
	if ResourceLoader.exists(next_scene_path):
		get_tree().change_scene_to_file(next_scene_path)
	else:
		print("Next level not found:", next_scene_path)
	
