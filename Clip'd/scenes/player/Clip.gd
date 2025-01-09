extends CharacterBody2D

var direction : float
var spawnPos: Vector2
var spawnRot : float
var speed : int
var ricochet = false
var collisionCount = 0
var scaleNum = 1
var deactivated = false
var closedclip = load("res://assets/Objects/clip1.png")
var openclip = load("res://assets/Objects/clip2.png")

func _ready():
	scale.x = scaleNum
	scale.y= scaleNum
	global_position = spawnPos
	global_rotation = spawnRot
	velocity = Vector2(0, -speed).rotated(direction)


func _physics_process(delta):
	if velocity == Vector2.ZERO:
		$ClipSprite.texture = closedclip
	else:
		$ClipSprite.texture = openclip
	if deactivated == false:
		var collision = move_and_collide(velocity*delta)
		
		if collision:
			if collisionCount ==1:
				rotation = velocity.angle() + (2*PI)
				velocity = Vector2.ZERO
				deactivated= true
			if deactivated == false:
				collisionCount+=1
				velocity = velocity.bounce(collision.get_normal())
				rotation = velocity.angle() + (2*PI)
#	velocity = Vector2(0, -speed).rotated(direction)
#	move_and_slide()




func _on_clip_area_area_entered(area):
	if deactivated == true:
		if area.name.to_lower() == "player1area":
			queue_free()
			Global.p1inventory +=1
		elif area.name.to_lower() == "player2area":
			queue_free()
			Global.p2inventory +=1
