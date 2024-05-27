extends KinematicBody2D

export (int) var speed = 400

var velocity = Vector2()
var rotation_speed = 1
var sword_offset = Vector2(100, 0)

var health = 100
var cheat_active = false
var cheat_code = "QWERTY"
var input_buffer = ""

func toggle_cheat():
	cheat_active = !cheat_active
	print("Cheat Active:", cheat_active)
	rotation_speed = 5 if cheat_active else 1

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

# warning-ignore:unused_argument
func _physics_process(delta):
	get_input()

	velocity = move_and_slide(velocity)
	
func _process(delta):
	rotate_sword(delta)
	
func _input(event):
	check_cheat_code(event)

func _on_RigidBody2D_body_entered(body):
	if (body.name == "Enemy"):
		health -= 10
		$HealthText.text = "Health: " + health
		
func check_cheat_code(event: InputEvent):
	var keys = ["Q", "W", "E", "R", "T", "Y"]
	var pressed = event.as_text()
	
	if !(pressed in keys):
		return
		
	if (input_buffer.length() > 0 && input_buffer[input_buffer.length() - 1] == pressed):
		return
		
	input_buffer += pressed
	if len(input_buffer) > len(cheat_code):
		input_buffer = input_buffer.substr(1, len(cheat_code))
	
	if input_buffer == cheat_code:
		toggle_cheat()
		input_buffer = ""
