@tool
extends EditorPlugin

var control := Button.new()

func _enter_tree():
	control.text = "PICK ME!!"
	add_control_to_container(EditorPlugin.CONTAINER_INSPECTOR_BOTTOM, control)
	pass


func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_INSPECTOR_BOTTOM, control)
	# Clean-up of the plugin goes here.
	pass
