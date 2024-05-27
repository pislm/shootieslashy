extends KinematicBody2D

var velocity = Vector2()
var health = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var random_direction = Vector2.UP.rotated(rand_range(0, 2 * PI))
	var speed = 200  # Or your desired speed

	# Calculate velocity and apply to enemy
	velocity = random_direction * speed 

func _physics_process(delta):
	velocity = move_and_slide(velocity)



func _on_RigidBody2D_body_entered(body):
	print(body.name)
	if ("Sword" in body.name):
		health -= 100
		print("enemy killed")
		queue_free()
