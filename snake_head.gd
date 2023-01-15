extends CharacterBody2D
class_name SnakeHead

@export var SPEED = 180
@export var should_move_debug = 0

var next_node = null

signal collided
	
# Initialize the starting body size. 
func _ready():
	pass
	# Have the snake go at start
	velocity.x = should_move_debug * SPEED 


func _input(event):
	if event.is_action_pressed("go_down"):
		#velocity.y = -1 * SPEED
		rotation = deg_to_rad(90)
		
	elif event.is_action_pressed("go_up"):
		#velocity.y = 1 * SPEED
		rotation = deg_to_rad(270)
				
	elif event.is_action_pressed("go_left"):
		#velocity.x = -1 * SPEED
		
		rotation = deg_to_rad(180)
	elif event.is_action_pressed("go_right"):
		#velocity.x = 1 * SPEED
		rotation = deg_to_rad(0)


func _physics_process(delta):
	
	var previousPosition = position
	var previousRotation = rotation
	#print("Previous position %s" % position)
	#print("Previous rotation %s" % rotation)
	
	if rad_to_deg(rotation) == 0: 
		velocity.x = 1 * SPEED * should_move_debug
		velocity.y = 0
			
	elif int(rad_to_deg(rotation)) == -179:
		velocity.x = -1 * SPEED * should_move_debug
		velocity.y = 0
		
	elif int(rad_to_deg(rotation)) == -90:
		velocity.x = 0
		velocity.y = -1 * SPEED * should_move_debug
	
	elif int(rad_to_deg(rotation)) == 90:
		velocity.x = 0
		velocity.y = 1 * SPEED * should_move_debug 
 
	move_and_slide()
	print("Post position %s" % position)
	print("Previous rotation %s" % rotation)
	next_node.position = previousPosition
	next_node.position.x = next_node.position.x-64
	next_node.rotation = previousRotation



func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name.contains("SnakeHead"):
		return
	else:
		emit_signal("collided")
