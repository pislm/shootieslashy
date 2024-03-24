extends Node2D

export (PackedScene) var enemy

func _ready():
	start_spawning()

func start_spawning():
	yield(get_tree().create_timer(1), "timeout")
	spawn()  
	start_spawning()

func spawn():
	var spawned = enemy.instance()
	get_parent().add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x = spawn_pos.x + rand_range(-1000, 1000)
	spawn_pos.y = spawn_pos.y + rand_range(-1000, 1000)
	spawned.global_position = spawn_pos

	
