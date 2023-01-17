extends CharacterBody2D
class_name SnakeHead

@onready var ray = $RayCast2D
@onready var snakeHeadSprite = $snakeHeadSprite
@onready var castPoint = $castPoint
@export var SPEED = 180
@export var should_move_debug = 0

var animation_speed = 2
var last_dir = ""
var tile_size = 64
var inputs = {"go_down": Vector2.DOWN,
			"go_up": Vector2.UP,
			"go_right": Vector2.RIGHT,
			"go_left": Vector2.LEFT}

var next_node = null
 
signal collided
	
# Initialize the starting body size. 
func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

	
	# Have the snake go at start
	#velocity.x = should_move_debug * SPEED 


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
 

func move(dir):

	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
 
	var next_pos = position + (inputs[dir] * tile_size)
	snakeHeadSprite.look_at(next_pos)
	position += inputs[dir] * tile_size
	#var tween = get_tree().create_tween()
	#tween.tween_property(self,"position",position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
	
	if dir == "go_left":
		snakeHeadSprite.flip_v = true
	else:
		snakeHeadSprite.flip_v = false
		
		

func _physics_process(delta):
	pass
	#var previousPosition = position
#	var previousRotation = rotation
	#print("Previous position %s" % position)
	#print("Previous rotation %s" % rotation)
	
	#if rad_to_deg(rotation) == 0: 
	#	velocity.x = 1 * SPEED * should_move_debug
	#	velocity.y = 0
#			
	#elif int(rad_to_deg(rotation)) == -179:
#		velocity.x = -1 * SPEED * should_move_debug
#		velocity.y = 0
		
	#elif int(rad_to_deg(rotation)) == -90:
	#	velocity.x = 0
	#	velocity.y = -1 * SPEED * should_move_debug
	
#	elif int(rad_to_deg(rotation)) == 90:
#		velocity.x = 0
#		velocity.y = 1 * SPEED * should_move_debug 
 
	#move_and_slide()
#print("Post position %s" % position)
	#print("Previous rotation %s" % rotation)
	#next_node.position = previousPosition
	#next_node.position.x = next_node.position.x-61
	#next_node.rotation = previousRotation



func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name.contains("SnakeHead"):
		return
	else:
		emit_signal("collided")
