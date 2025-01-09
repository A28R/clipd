extends CharacterBody2D

var direction : float
var spawnPos: Vector2
var spawnRot : float
var speed : int
var ricochet = false
var collisionCount = 0

func _ready():
	
	global_position = spawnPos
	global_rotation = spawnRot
	velocity = Vector2(0, -speed).rotated(direction)
	

func _physics_process(delta):
	
	var collision = move_and_collide(velocity*delta)
	
	if collision:
#		$ClipSprite.texture = "res://assets/Objects/clip1.png"
		if collisionCount ==1:
			queue_free()
		collisionCount+=1
		velocity = velocity.bounce(collision.get_normal())
		rotation = velocity.angle() + (2*PI)
#	velocity = Vector2(0, -speed).rotated(direction)
#	move_and_slide()

