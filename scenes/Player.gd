extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()
var rotation_speed = 1
var sword_offset = Vector2(100, 0)

var health = 100

func get_input():
	velocity.x = 0
	velocity.y = 0

	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
		
func rotate_sword(delta):
	var angle = get_global_position().angle_to_point($Sword.get_global_position())
	angle += rotation_speed * delta
	var new_position = sword_offset.rotated(angle) + get_global_position()
	$Sword.set_global_position(new_position)

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
func _process(delta):
	rotate_sword(delta)
	



func _on_RigidBody2D_body_entered(body):
	if (body.name == "Enemy"):
		health -= 10
		$HealthText.text = "Health: " + health
