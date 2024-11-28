extends CharacterBody2D

#Movement Variables (The constant ones, which are used for reverting back to original)
const init_max_speed := 610.0
const init_acceleration := 500.0
const init_deceleration := 200.0
const init_rotation_speed := 5.0 # degrees per second

# Movement variables (the ones that actually get used)
var max_speed := 600.0
var acceleration := 500.0
var deceleration := 200.0
var rotation_speed := 5.0 # degrees per second
var friction := 0.1

var current_speed := 0.0
var stopped = true

# Powerup Variables
var smaller_amount = 0.75
var larger_amount = 1.5
var faster_amount = 1.5
var slower_amount = 0.75
var clipshadow_amount = 0.5
var clipfaster_amount = 2
var clipsize_amount = 1.5
var falseclip_mod_dif = 0.3

# Clip movement
var clip_speed := 1000

@export var Clip : PackedScene = preload('res://scenes/player/clip.tscn')
@export var FakeClip : PackedScene = preload('res://scenes/player/fake_clip.tscn')

@onready var clipSpawn = $"ClipSpawn"
@onready var falseClipSpawn1 = $"FalseClipSpawn1"
@onready var falseClipSpawn2 = $"FalseClipSpawn2"

@onready var accslider = $"../CanvasLayer/Control/VBoxContainer/Movement/acceleration/VBoxContainer/HSlider"
@onready var decslider = $"../CanvasLayer/Control/VBoxContainer/Movement/deceleration/VBoxContainer/HSlider"
@onready var rotslider = $"../CanvasLayer/Control/VBoxContainer/Movement/rotation_speed/VBoxContainer/HSlider"
@onready var frislider = $"../CanvasLayer/Control/VBoxContainer/Movement/friction/VBoxContainer/HSlider"
@onready var maxslider = $"../CanvasLayer/Control/VBoxContainer/Movement/max_speed/VBoxContainer/HSlider"
@onready var clsslider = $"../CanvasLayer/Control/VBoxContainer/Movement/clip_speed/VBoxContainer/HSlider"
@onready var invbox = $"../CanvasLayer/Control/VBoxContainer/Movement/invert_controls/VBoxContainer/CheckBox"

@onready var acclabel = $"../CanvasLayer/Control/VBoxContainer/Movement/acceleration/VBoxContainer/Label"
@onready var declabel = $"../CanvasLayer/Control/VBoxContainer/Movement/deceleration/VBoxContainer/Label"
@onready var rotlabel = $"../CanvasLayer/Control/VBoxContainer/Movement/rotation_speed/VBoxContainer/Label"
@onready var frilabel = $"../CanvasLayer/Control/VBoxContainer/Movement/friction/VBoxContainer/Label"
@onready var maxlabel = $"../CanvasLayer/Control/VBoxContainer/Movement/max_speed/VBoxContainer/Label"
@onready var clipSpeedlabel = $"../CanvasLayer/Control/VBoxContainer/Movement/clip_speed/VBoxContainer/Label"

@onready var smallerbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/smaller/VBoxContainer/CheckBox"
@onready var fasterbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/faster/VBoxContainer/CheckBox"
@onready var clipshadowbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/clipshadow/VBoxContainer/CheckBox"
@onready var clipsizebox = $"../CanvasLayer/Control/VBoxContainer/Powerups/clipsize/VBoxContainer/CheckBox"
@onready var clipfasterbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/clipfaster/VBoxContainer/CheckBox"
@onready var largerbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/larger/VBoxContainer/CheckBox"
@onready var slowerbox = $"../CanvasLayer/Control/VBoxContainer/Powerups/slower/VBoxContainer/CheckBox"
@onready var nonstop = $"../CanvasLayer/Control/VBoxContainer/Powerups/nonstop/VBoxContainer/CheckBox"
@onready var ricochet = $"../CanvasLayer/Control/VBoxContainer/Powerups/ricochet/VBoxContainer/CheckBox"
@onready var falseclips = $"../CanvasLayer/Control/VBoxContainer/Powerups/falseclips/VBoxContainer/CheckBox"

# State variables
var is_moving := true
var is_rotating := false
var rotation_direction := 0

func _ready():
	accslider.value = acceleration
	acclabel.text = "Acceleration: "+str(acceleration)
	
	decslider.value = deceleration
	declabel.text = "Deceleration: "+str(deceleration)
	rotslider.value = rotation_speed
	rotlabel.text = "Rotation Speed: "+str(rotation_speed)
	
	frislider.value = friction
	frilabel.text = "Friction: "+str(friction)
	
	maxslider.value = max_speed
	maxlabel.text = "Max Speed: "+str(max_speed)
	
	clsslider.value = clip_speed
	clipSpeedlabel.text = "Clip Speed: "+str(clip_speed)


func _physics_process(delta):
	
	acceleration = accslider.value
	deceleration = decslider.value
	rotation_speed = rotslider.value
	friction = frislider.value
	max_speed = maxslider.value
	clip_speed = clsslider.value

	acclabel.text = "Acceleration: "+str(acceleration)
	declabel.text = "Deceleration: "+str(deceleration)
	rotlabel.text = "Rotation Speed: "+str(rotation_speed)
	frilabel.text = "Friction: "+str(friction)
	maxlabel.text = "Max Speed: "+str(max_speed)
	clipSpeedlabel.text = "Clip Speed: "+str(clip_speed)
	
	
	#POWERUP CONDITIONALS
	
	if smallerbox.is_pressed() == true:
		scale.x = smaller_amount
		scale.y = smaller_amount
	elif largerbox.is_pressed() == true:
		scale.x = larger_amount
		scale.y = larger_amount
	else:
		scale.x = 1
		scale.y = 1
		
	if fasterbox.is_pressed():
		max_speed = init_max_speed *faster_amount
		acceleration = init_acceleration *faster_amount
		deceleration = init_deceleration *faster_amount
		rotation_speed = init_rotation_speed *faster_amount
	elif slowerbox.is_pressed():
		max_speed = init_max_speed *slower_amount
		acceleration = init_acceleration *slower_amount
		deceleration = init_deceleration *slower_amount
		rotation_speed = init_rotation_speed *slower_amount
	else:
		max_speed = init_max_speed 
		acceleration = init_acceleration 
		deceleration = init_deceleration 
		rotation_speed = init_rotation_speed 
		
		
	# Get input
	var input_vector = Vector2.ZERO
	
	if stopped:
		is_moving = false
	
	# Handle rotation input
	if Input.is_action_pressed("move_right"):
		if invbox.is_pressed() == true:
			rotation_direction = -1
		else:
			rotation_direction = 1
		is_rotating = true
	elif Input.is_action_pressed("move_left"):
		if invbox.is_pressed() == true:
			rotation_direction = 1
		else:
			rotation_direction = -1
		is_rotating = true
	else:
		rotation_direction = 0
		is_rotating = false
		
	if Input.is_action_just_released("move_stop"):
		if nonstop.is_pressed() == false and stopped == true:
			if is_rotating:
				is_rotating = false
			stopped = !stopped
		elif nonstop.is_pressed() == true and stopped == true:
			stopped = false
			if is_rotating:
				is_rotating = false
		elif nonstop.is_pressed() == false and stopped == false:
			if is_rotating:
				is_rotating = false
			stopped = !stopped
				
	if Input.is_action_just_released("shoot"):
		shoot(clip_speed)
	
	# Rotate
	if is_rotating:
		rotate(rotation_speed * rotation_direction * delta)
		input_vector = transform.x.normalized()

			
	else:
		if not stopped:
			is_moving = true
			input_vector = transform.x.normalized()
	
	# Move with acceleration and deceleration
	if is_moving:
		# Accelerate
		current_speed = move_toward(current_speed, max_speed, acceleration * delta)
		velocity = input_vector * current_speed
	else:
		# Decelerate
		current_speed = move_toward(current_speed, 0, deceleration * delta)
		velocity = velocity.lerp(Vector2.ZERO, friction)
		
		# If speed is very low, stop completely
		if current_speed < 1.0:
			current_speed = 0.0
			velocity = Vector2.ZERO
	
	move_and_slide()

func shoot(speed):
	var c = Clip.instantiate()
	get_node("/root").add_child(c)
	
	var fc1 = FakeClip.instantiate()
	var fc2 = FakeClip.instantiate()
	get_node("/root").add_child(fc1)
	get_node("/root").add_child(fc2)
	
	
	#clip powerups
	if clipshadowbox.is_pressed():
		c.modulate = Color(1,1,1,clipshadow_amount)
		fc1.modulate = Color(1,1,1,clipshadow_amount - falseclip_mod_dif)
		fc2.modulate = Color(1,1,1,clipshadow_amount - falseclip_mod_dif)
	else:
		c.modulate = Color(1,1,1,1)
		fc1.modulate = Color(1,1,1, 1 - falseclip_mod_dif)
		fc2.modulate = Color(1,1,1, 1 - falseclip_mod_dif)
	if clipfasterbox.is_pressed():
		c.velocity = Vector2(0, -speed*clipfaster_amount).rotated(clipSpawn.global_rotation+deg_to_rad(90))
		fc1.velocity = Vector2(0, -speed*clipfaster_amount).rotated(falseClipSpawn1.global_rotation+deg_to_rad(90))
		fc2.velocity = Vector2(0, -speed*clipfaster_amount).rotated(falseClipSpawn2.global_rotation+deg_to_rad(90))
	else:
		c.velocity = Vector2(0, -speed).rotated(clipSpawn.global_rotation+deg_to_rad(90))
		fc1.velocity = Vector2(0, -speed).rotated(falseClipSpawn1.global_rotation+deg_to_rad(90))
		fc2.velocity = Vector2(0, -speed).rotated(falseClipSpawn2.global_rotation+deg_to_rad(90))
		
	if clipsizebox.is_pressed():
		
		#adjusts the clip spawns so they don't collide if the clips are enlarged
		clipSpawn.position.x = 180
		falseClipSpawn1.position.x = 180
		falseClipSpawn1.position.y = 80
		falseClipSpawn2.position.x = 180
		falseClipSpawn2.position.y = -80
		
		
		#scales the actual clip
		c.get_node("ClipSprite").scale.x = (c.get_node("ClipSprite").scale.x) * clipsize_amount
		c.get_node("ClipSprite").scale.y = (c.get_node("ClipSprite").scale.y) * clipsize_amount
		c.get_node("ClipShape").scale = Vector2(clipsize_amount,clipsize_amount)
		c.get_node("Area2D").scale = Vector2(clipsize_amount,clipsize_amount)
		
		#scales the first false clip
		fc1.get_node("ClipSprite").scale.x = (fc1.get_node("ClipSprite").scale.x) * clipsize_amount
		fc1.get_node("ClipSprite").scale.y = (fc1.get_node("ClipSprite").scale.y) * clipsize_amount
		fc1.get_node("ClipShape").scale = Vector2(clipsize_amount,clipsize_amount)
		fc1.get_node("Area2D").scale = Vector2(clipsize_amount,clipsize_amount)
		
		#scales the second false clip
		fc2.get_node("ClipSprite").scale.x = (fc2.get_node("ClipSprite").scale.x) * clipsize_amount
		fc2.get_node("ClipSprite").scale.y = (fc2.get_node("ClipSprite").scale.y) * clipsize_amount
		fc2.get_node("ClipShape").scale = Vector2(clipsize_amount,clipsize_amount)
		fc2.get_node("Area2D").scale = Vector2(clipsize_amount,clipsize_amount)
	else:
		#default values
		clipSpawn.position.x = 150
		falseClipSpawn1.position.x = 150
		falseClipSpawn1.position.y = 60
		falseClipSpawn2.position.x = 150
		falseClipSpawn2.position.y = -60
		
	
	
	if ricochet.is_pressed():
		c.collisionCount =0
		fc1.collisionCount =0
		fc2.collisionCount =0
	else:
		c.collisionCount =1
		fc1.collisionCount =1
		fc2.collisionCount =1

	c.global_transform = clipSpawn.get_global_transform()
	c.spawnRot = global_rotation
	c.spawnPos = clipSpawn.global_position
	
	
	if falseclips.is_pressed():
		fc1.global_transform = falseClipSpawn1.get_global_transform() 
		fc1.spawnRot = falseClipSpawn1.global_rotation
		fc1.spawnPos = falseClipSpawn1.global_position
		
		fc2.global_transform = falseClipSpawn2.get_global_transform() 
		fc2.spawnRot = falseClipSpawn2.global_rotation
		fc2.spawnPos = falseClipSpawn2.global_position
	else:
		fc1.queue_free()
		fc2.queue_free()
	
