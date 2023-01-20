extends Node2D


@onready var tilemap = $TileMap
@onready var deathMenu = $DeathMenu
@onready var scoreGame = $ScoreGame
@onready var scoreDeath = $DeathMenu/Panel/ScoreDeath


const MAP_LAYER = 0
const OBJECT_LAYER = 1

const SNAKE_ID= 2
const APPLE_ID= 4

const TILE_SIZE = 64
const MAP_WIDTH = 16
const MAP_HEIGHT = 8
var score = 0
var apple_pos
var snake_body = [Vector2i(MAP_WIDTH/2,MAP_HEIGHT/2),Vector2i(MAP_WIDTH/2-1,MAP_HEIGHT/2), Vector2i(MAP_WIDTH/2-2,MAP_HEIGHT/2)]
var snake_dir_history = [Vector2i.RIGHT,Vector2i.RIGHT,Vector2i.RIGHT]
var snake_direction = Vector2i.RIGHT
var grow = false

var inputs = {"go_down": Vector2i.DOWN,
			"go_up": Vector2i.UP,
			"go_right": Vector2i.RIGHT,
			"go_left": Vector2i.LEFT}

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreGame.text = "Score: %d " % score
	scoreDeath.text = "Score: %d " % score
	deathMenu.visible = false
	draw_apple()
	

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed("restart") && deathMenu.visible == true:
			restart()
			
		if event.is_action_pressed(dir):
			if snake_direction * -1 == inputs[dir]: # prevent going back on yourself
				continue
			
			snake_direction = inputs[dir]

func randomized_placement():
	randomize()
	var x = randi_range(1,MAP_WIDTH)
	var y = randi_range(1,MAP_HEIGHT)
	#print(x, ",", y)
	return Vector2i(x,y)
	
func place_apple():
	var random_apple_pos
	var isColliding = true
	while isColliding:
		random_apple_pos = randomized_placement()
		isColliding = check_object_collision(random_apple_pos) or check_map_collision(random_apple_pos)	
		
		
	apple_pos = random_apple_pos
	return apple_pos
	
func draw_apple():
	tilemap.set_cell(OBJECT_LAYER, place_apple(),APPLE_ID,Vector2i(0,0))
	
func draw_snake():
	for block_index in snake_body.size():
		var block = snake_body[block_index]
		var snake_graphic = Vector2i.ZERO
		var alt_tile = 0
		
		if block_index == 0: # if it is the head
			match(snake_direction):
				Vector2i.RIGHT:
					snake_graphic = Vector2i(2,0)
				Vector2i.LEFT:
					snake_graphic = Vector2i(3,1)
				Vector2i.UP:
					snake_graphic = Vector2i(2,1)
				Vector2i.DOWN:
					snake_graphic = Vector2i(3,0)
			# Set the snake head tile graphic
			tilemap.set_cell(OBJECT_LAYER, Vector2i(block.x, block.y), SNAKE_ID, snake_graphic)
		elif block_index == snake_body.size() - 1: #The tail
			var tail = Vector2(snake_body[snake_body.size()-1].x,snake_body[snake_body.size()-1].y)
			var aheadBlock = Vector2(snake_body[snake_body.size()-2].x,snake_body[snake_body.size()-2].y)
			
			var direction_to = tail.direction_to(aheadBlock)
			
			#print("Tail Direction: ", direction_to)
			match(direction_to):
				Vector2.RIGHT:					
					snake_graphic = Vector2i(0,1)
				Vector2.LEFT:
					snake_graphic = Vector2i(0,0)
				Vector2.UP:
					snake_graphic = Vector2i(1,1)				
				Vector2.DOWN:					
					snake_graphic = Vector2i(1,0)
					
			# Set the snake head tile graphic
			tilemap.set_cell(OBJECT_LAYER, Vector2i(block.x, block.y), SNAKE_ID, snake_graphic)
		else:
			var previousBlock = Vector2(snake_body[block_index-1].x,snake_body[block_index-1].y)
			var aheadBlock = Vector2(snake_body[block_index+1].x,snake_body[block_index+1].y)
			var currentBlock = Vector2(snake_body[block_index].x,snake_body[block_index].y)
			
			var direction_to_previous = currentBlock.direction_to(previousBlock)
			var direction_to_ahead = aheadBlock.direction_to(currentBlock)
			if direction_to_ahead == direction_to_previous:
				match(direction_to_previous):
					Vector2(-1,0):
						snake_graphic = Vector2i(4,0)						
					Vector2(1,0):
						snake_graphic = Vector2i(4,0)
					Vector2(0,-1):
						snake_graphic = Vector2i(4,1)
					Vector2(0,1):
						snake_graphic = Vector2i(4,1)
				tilemap.set_cell(OBJECT_LAYER,Vector2i(block.x,block.y),SNAKE_ID,snake_graphic)		
			else:			 
				
				if direction_to_ahead == Vector2.RIGHT && direction_to_previous == Vector2.DOWN: # (1,0) + (0,1) Right + Down
					snake_graphic = Vector2i(5,0)
				elif direction_to_ahead == Vector2.LEFT && direction_to_previous == Vector2.DOWN: # (-1,0) + (0,1) Left + Down
					snake_graphic = Vector2i(5,1)
				elif direction_to_ahead == Vector2.DOWN && direction_to_previous  == Vector2.LEFT: # (0,1) + (-1,0) Down + Left
					snake_graphic = Vector2i(6,0)
				elif direction_to_ahead == Vector2.UP && direction_to_previous  == Vector2.RIGHT: # (0,1) + (-1,0) Down + Left
					snake_graphic = Vector2i(6,1)
					alt_tile = 1
				elif direction_to_ahead  == Vector2.DOWN && direction_to_previous == Vector2.RIGHT: # (1,0) + (0,1) Down + Right
					snake_graphic = Vector2i(6,1)
				elif direction_to_ahead  == Vector2.UP && direction_to_previous == Vector2.LEFT: # (1,0) + (0,1) Down + Right
					snake_graphic = Vector2i(6,0)
					alt_tile = 1					
				elif direction_to_ahead  == Vector2.LEFT && direction_to_previous == Vector2.UP: # (1,0) + (0,1) Down + Right
					snake_graphic = Vector2i(6,1)
				elif direction_to_ahead == Vector2.RIGHT && direction_to_previous == Vector2.UP: # (1,0) + (0,1) Right + Down
					snake_graphic = Vector2i(7,1)

				tilemap.set_cell(OBJECT_LAYER,Vector2i(block.x,block.y),SNAKE_ID,snake_graphic,alt_tile)

func move_snake():
	delete_tiles(SNAKE_ID)
	
	# Do we grow the snake or just move it
	var snakeSlice = Vector2i.ZERO
	if grow:
		snakeSlice = Vector2i(0,snake_body.size())
	else:
		snakeSlice = Vector2i(0,snake_body.size()-1)
		
	var body_copy = snake_body.slice(snakeSlice.x,snakeSlice.y)
	var dir_copy = snake_dir_history.slice(snakeSlice.x,snakeSlice.y)
	var new_head = body_copy[0] + snake_direction
	var new_snake_dir = snake_direction
	body_copy.insert(0, new_head)
	dir_copy.insert(0, new_snake_dir)
	snake_body = body_copy
	snake_dir_history = dir_copy
	#print("Snake history: ", snake_dir_history)

func delete_tiles(id: int):
	var cells = tilemap.get_used_cells(OBJECT_LAYER)
	for cell in cells:
		var used_cell_source_id = tilemap.get_cell_source_id(OBJECT_LAYER,Vector2i(cell.x, cell.y))
		if used_cell_source_id != id:
			continue
		else:
			tilemap.set_cell(OBJECT_LAYER, Vector2i(cell.x, cell.y), id, Vector2i(-1,-1))

func check_apple_eaten():
	if apple_pos == snake_body[0]:
		score += 5
		scoreGame.text = "Score: %d " % score
		grow = true
		draw_apple()
	else:
		grow = false
 

func check_snake_collision() -> bool:
	for snake_block in snake_body.slice(1,snake_body.size()):
		if snake_body[0] == Vector2i(snake_block.x,snake_block.y):
			return true
	
	return false

func check_map_collision(pos) -> bool:
	var tile_map_pos = pos
	var map_id = tilemap.get_cell_source_id(MAP_LAYER, tile_map_pos)
	
	if map_id != 0:
		return true
	else:
		return false
		
		
# Ensure the apple doesn't spawn on the snake after being eaten
func check_object_collision(pos) -> bool:
	var object_map_pos = pos
	var object_id = tilemap.get_cell_source_id(OBJECT_LAYER, object_map_pos)
	
	if object_id != -1:
		return true
	else:
		return false
	
func lose_life():
	delete_tiles(SNAKE_ID)
	$Timer.stop()
	scoreDeath.text = "Score: %d " % score
	deathMenu.visible = true
	
func restart():
	snake_body = [Vector2i(MAP_WIDTH/2,MAP_HEIGHT/2),Vector2i(MAP_WIDTH/2-1,MAP_HEIGHT/2), Vector2i(MAP_WIDTH/2-2,MAP_HEIGHT/2)]
	snake_direction = Vector2i.RIGHT
	delete_tiles(APPLE_ID)
	draw_apple()
	deathMenu.visible = false
	
	score = 0
	scoreGame.text = "Score: %d " % score
	scoreDeath.text = "Score: %d " % score
	$Timer.start()
	
func _on_timer_timeout():
	move_snake()	
	draw_snake()	
	if check_map_collision(snake_body[0]) or check_snake_collision():
		lose_life()
	
	check_apple_eaten()
