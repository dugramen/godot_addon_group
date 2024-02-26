@tool
extends EditorPlugin


func _enter_tree():
	add_tool_menu_item("Just sampling", func(): push_warning("wooooooooooooo"))


func _exit_tree():
	remove_tool_menu_item("Just sampling")
	# Clean-up of the plugin goes here.
	pass
