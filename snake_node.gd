extends CharacterBody2D
class_name SnakeNode

 

@export var previousNode: SnakeNode = null
@export var nextNode: SnakeNode = null
 

func _physics_process(delta):
	
	pass


func update_position(new_position: Vector2):
	pass
	
# Update the next Node if an event has occured for us to change
func update_nextNode():
	pass
