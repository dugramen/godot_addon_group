This is an experiment showing that Godot plugins can be installed outside of `res://addons`.
This specifc addon can load addons from `res://addons/addon_group/addons`, but any local directory can be used.

One use case for this is global addons. With [Symlink](https://en.wikipedia.org/wiki/Symbolic_link), you can redirect any folder to a different directory in the system. So you can keep your standard `res://addons` folder for local addons, and use Symlink to link to a folder of global addons.

Unfortunately you can't directly load addons outside of the local `res://` directory (without Symlink). This is because addons are added via `EditorInterace.set_plugin_enabled()`, in which you provide a path, but it gets prefixed with `res://`
