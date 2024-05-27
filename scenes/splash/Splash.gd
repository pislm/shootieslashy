extends Control

export(String) var next_scene : String

func _ready():
	var timer = Timer.new()
	timer.wait_time = 3.0
	timer.one_shot = true
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)
	timer.start()

func _on_Timer_timeout():
	var new_scene = load(next_scene)
	get_tree().change_scene_to(new_scene)


