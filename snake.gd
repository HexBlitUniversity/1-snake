extends CharacterBody2D

@export var bodysize = 2
@export var SPEED = 180
@export var snakeNodeBodyScene: PackedScene = null
@export var snakeHeadScene: PackedScene = null 

const BODY_WIDTH = 64
var snakeDataObject = [] 

func _ready():
	if snakeHeadScene == null:
		return
		
	var snakeHeadInstance = snakeHeadScene.instantiate()
	add_child(snakeHeadInstance)
	snakeHeadInstance.position = position
	snakeHeadInstance.connect("collided",_on_collided)
	
	if snakeNodeBodyScene == null:
		return
		
	while snakeDataObject.size() < bodysize:
		var lastSnakeNode = null
		if snakeDataObject.size() > 0:
			lastSnakeNode = snakeDataObject.back()
			
		var newSnakeBodyPosition = snakeHeadInstance.position
		newSnakeBodyPosition.x = newSnakeBodyPosition.x-BODY_WIDTH*(snakeDataObject.size())
		_grow_snake_node(newSnakeBodyPosition)
		
		if lastSnakeNode != null:
			lastSnakeNode.next_node = snakeDataObject.back()
			print(lastSnakeNode == lastSnakeNode.next_node)
		
	
	snakeHeadInstance.next_node = snakeDataObject[0]
	

# MOVEMENT 
# SNAKE_HEAD [NODE 1(position), NODE 3(position), NODE 3(position)] 
# When we grow we add, a node, we will use same position as previous last node   
# SNAKE_HEAD [NODE 1(position1), NODE 3(position2), NODE 3(position3), NODE4(position3)] 
# Update SNakeHead, (1,0), (2,0), (3,0), (3,0)
# Moved  (0,0) Original (1,0) Push down the stack to next node, (1,0)  -> (2.0) -> 
# (0,0) (1,0) (2,0) (3,0)
# Move again
#  (-1,0) (0,0) (1,0) (2,0)
func _movement():
	pass
	
# SNAKE_HEAD [NODE 1(position), NODE 3(position), NODE 3(position)] 
# When we grow we add, a node, we will use same position as previous last node   
# SNAKE_HEAD [NODE 1(position1), NODE 3(position2), NODE 3(position3), NODE4(position3)] 

func _grow_snake_node(new_node_position):
	var snakeNodeBodyInstance = snakeNodeBodyScene.instantiate()
	add_child(snakeNodeBodyInstance)
	snakeNodeBodyInstance.position = new_node_position
	snakeDataObject.append(snakeNodeBodyInstance)

func _eat_fruit():
	_grow_snake_node(snakeDataObject.back())
	
	
func _on_collided():
	# Do death animation here
	queue_free()
	
	
