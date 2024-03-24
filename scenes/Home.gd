extends Sprite


func get_input():

	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://scenes/Level.tscn")

		

func _physics_process(delta):
	get_input()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
