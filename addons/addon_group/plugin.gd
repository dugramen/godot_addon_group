@tool
extends EditorPlugin

var button := MenuButton.new()
var path := "res://addons/addon_group/addons/"

func _enter_tree():
	var menu := button.get_popup()
	menu.hide_on_checkable_item_selection = false
	menu.about_to_popup.connect(
		func():
			menu.clear(true)
			var fs := DirAccess.open(path)
			var i := -1
			for d in fs.get_directories():
				var dir := path + d
				var file := dir + '/plugin.cfg'
				if FileAccess.file_exists(file):
					i += 1
					menu.add_check_item(d)
					menu.set_item_checked(i, EditorInterface.is_plugin_enabled(file))
					menu.set_item_metadata(i, file)
	)
	menu.index_pressed.connect(func(index):
		var plug = menu.get_item_metadata(index)
		EditorInterface.set_plugin_enabled(plug, !EditorInterface.is_plugin_enabled(plug))
		menu.about_to_popup.emit()
	)
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, button)
	button.icon = button.get_theme_icon("EditorPlugin", "EditorIcons")

func _exit_tree():
	remove_control_from_container(CONTAINER_TOOLBAR, button)

