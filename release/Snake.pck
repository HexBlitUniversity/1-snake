GDPC                                                                                         ,   P   res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scn0t      �D      ���P�˱�V���.S�#    X   res://.godot/exported/133200997/export-64e8b35ec701b5ab61828c37582a2731-snake_body.scn  @~           R��=�]�˼#��5    T   res://.godot/exported/133200997/export-cce30dd689d5e44431a5ddc6b0f1b807-snake.scn   �     I      7���Xk�7PL��    X   res://.godot/exported/133200997/export-e0f7bfadc5b3cfd40788f15a4ddf7521-snake_head.scn   �     �      s,j� �X��.����H    ,   res://.godot/global_script_class_cache.cfg                wW@gKu�(\���3X�;    P   res://.godot/imported/Grisly Beast.otf-dd443def2083bc2efd2eecdd3b35cf38.fontdata �      �N      >k
��:����T�@�Z    P   res://.godot/imported/Grisly Beast.ttf-5abaaf3475e5e481ecd19ea70972a0ea.fontdata�
     ��      ����yz�����r�&    L   res://.godot/imported/SnakeBody.png-6da1a0156e9d48229e299519e07e3964.ctex   �     �      �19���t8\��t�    H   res://.godot/imported/apple.png-53a5ba701c353857fc5b432b6c413138.ctex   PA      N      0�P`T�Jt�l��鴲�    P   res://.godot/imported/dungeon-tileset.png-d5a7cfbe9c6909dd3e070994f1c49862.ctex �E      r
      TZ*%����F�gX�w��    H   res://.godot/imported/floor.png-d43f03cb7a8f42941311ed90ed2021b9.ctex    S      p       G�I���cS�ba/X�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�     ^      2��r3��MgB�[79    D   res://.godot/imported/icon.svg-9fba9993f668165ad5eeff95050e88a8.ctexp      ^      2��r3��MgB�[79    H   res://.godot/imported/obstacle.png-dfb3e99d3af573251007cdf5e1c252b9.ctex��     t      +q�U��ʶ��+�    L   res://.godot/imported/snakeHead.png-1fca60233cf2c37c2b2abd3f67400f01.ctex   �     B      ��$��i�C�0��� �    L   res://.godot/imported/snakeSheet.png-df1c62c1f5edd23fe1ab2aa522848f36.ctex  �     B[      KE��va+��Z{>    D   res://.godot/imported/wall.png-e3261c66ad83b71f524576fb4f3c7b5b.ctex�            fLo�-��
�R,;       res://.godot/uid_cache.bin  �     �      a���,��JK�X����        res://Grisly Beast.otf.import        �      '���4n6���wc���        res://Grisly Beast.ttf.import   p�     �      iaX���%U�i�p       res://SnakeBody.png.import  �     �      �o4p�j�dƙ`#�4       res://apple.png.import  �B      �      ����v��ϟ�2����        res://dungeon-tileset.png.importP            i�(aK����p�M`       res://floor.png.import  �S      �      QL�*삦2��������       res://game.gd   �V      �      `��WS��N��#��H       res://game.tscn.remap   ��     a       �?��� �ު��y�       res://icon.svg  ��     N      ]��s�9^w/�����       res://icon.svg.import   p�     C      ��ZA��pP�?��	�52       res://obstacle.png.import   @�     �      �$݋�M�h��4�]�       res://project.binary�     d      Kd�/c�=��        res://release/SnakeGame/game.gd        M      ��qe��f��b���    (   res://release/SnakeGame/icon.svg.import �+      U      ��LK8D�x�/�        res://release/SnakeGame/snake.gd0/      I      ~VgrL��hL�<��:d�    (   res://release/SnakeGame/snake_head.gd   �7      �      �]u	��M���bV�~�    (   res://release/SnakeGame/snake_node.gd   P@             J6��)�j�и�y�;       res://snake.gd  0�     I      ~VgrL��hL�<��:d�       res://snake.tscn.remap  P�     b       �5���s���}��=�<       res://snakeHead.png.import  �     �       �'��Hj@�n       res://snakeSheet.png.import @{     �      ��I(�B�VU���5��       res://snake_body.tscn.remap ��     g       ���͙H�u�~�\ǻ8`       res://snake_head.gd P�     �      �]u	��M���bV�~�       res://snake_head.tscn.remap 0�     g       ���.Ӈȗ��5RWOI       res://snake_node.gd �            J6��)�j�и�y�;       res://wall.png.import   �     �      �""���p��$ڃ��    ���b��(��C(list=[{
"base": "CharacterBody2D",
"class": &"SnakeHead",
"icon": "",
"language": &"GDScript",
"path": "res://release/SnakeGame/snake_head.gd"
}, {
"base": "CharacterBody2D",
"class": &"SnakeNode",
"icon": "",
"language": &"GDScript",
"path": "res://release/SnakeGame/snake_node.gd"
}]
��extends Node2D


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
	var random_apple_pos = randomized_placement()
	var isColliding = true
	while isColliding:
		isColliding = check_object_collision(random_apple_pos) && check_map_collision(random_apple_pos)	
		random_apple_pos = randomized_placement()
		
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
	$Timer.start()
	
func _on_timer_timeout():
	move_snake()	
	draw_snake()	
	if check_map_collision(snake_body[0]) or check_snake_collision():
		lose_life()
	
	check_apple_eaten()
�GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  h2[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cgpvq58k24odf"
path="res://.godot/imported/icon.svg-9fba9993f668165ad5eeff95050e88a8.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://release/SnakeGame/icon.svg"
dest_files=["res://.godot/imported/icon.svg-9fba9993f668165ad5eeff95050e88a8.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
�{�Xextends CharacterBody2D

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
		
	#while snakeDataObject.size() < bodysize:
	#	var lastSnakeNode = null
	#	if snakeDataObject.size() > 0:
	#		lastSnakeNode = snakeDataObject.back()
			
	#	var newSnakeBodyPosition = snakeHeadInstance.position
	#	newSnakeBodyPosition.x = newSnakeBodyPosition.x-BODY_WIDTH*(snakeDataObject.size())
	#	_grow_snake_node(newSnakeBodyPosition)
		
	#	if lastSnakeNode != null:
	#		lastSnakeNode.next_node = snakeDataObject.back()
	#		print(lastSnakeNode == lastSnakeNode.next_node)
		
	
	#snakeHeadInstance.next_node = snakeDataObject[0]
	

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
	
	
GS�i��extends CharacterBody2D
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
�,�e	��uafextends CharacterBody2D
class_name SnakeNode


var next_node = null

func _physics_process(delta):
	
	pass


func update_position(new_position: Vector2):
	pass
	
# Update the next Node if an event has occured for us to change
func update_nextNode():
	pass
GST2   @   @      ����               @ @          RIFF  WEBPVP8L  /?�G@&�O-���@$��H1$!ȶ)��q.0A�����e�7A�ٶ�]�* �)����BД�_G�o����I"�?������e��s�����r~�Ս��p<��r^8��O���t ��SJ�p ��1�t�����
�tw<M-,@P�݅tnt	��֙��Mx,�4um
&�4reSK�z�D�r��Y�Cgi�2��H,�b���FDbi=:#""
,@U��<���j>�U�g  ��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://2ct7f4tpdi07"
path="res://.godot/imported/apple.png-53a5ba701c353857fc5b432b6c413138.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://apple.png"
dest_files=["res://.godot/imported/apple.png-53a5ba701c353857fc5b432b6c413138.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
���5:�b,T�KGST2            ����                        :
  RIFF2
  WEBPVP8L&
  /��O�&�m'��P�_�a	ء���H�یrOiQ1�� [Q$I͒�
�L"(�c	��-�6�!( � ����p)��χ�BJ�%UNٓ���ˇ�׎�/����˾�ק�7A�)&�?���v4K,�v�FR�<�5y*�vy�;� 0�]>�0��?$�mI��j��*/PH~�\|����\g�Ekb}Z��_���d��9�70Y�����Ŕ�c|)�J0sO��0���ױ��1�qXx����Es�y�l��c��Y#�~ ψ��/����l�<�ͪ~�\���V���*�zn֧�q>�6��V<_�y��Ü�ŵ��6�N*�h�L�/�b�l���e��&��%�)}�%v6�UN\�%��s�[r���\!�}'��`3Ƹ|����[����Ncϝ򌞇<�¶ť��2ߥ�V�E�d����S�����oѫ����롫��SΗ�%�i1ל�g�-yO���ș�g�g���q�,��K����*o��m���6��cy�����i�S[f�#�c�C:��)=����nL�>O�%i1ל�g[�?���`@�b,9H'��xrs'��4ޖ~��>�yHG1�t�}'=�q�N�
��Llg�+�<���ob��,�z��ۯ�<۞=�� ns��-cu�?7��o�9@��.�i� �ݓ�L��v_����v)6O�����l�Y��Ɠ]3`s���=����
-˲�y�3���ˮ�fj/�~b,�{c�����έ>�m;��!���_r�~��VLʮ9��Y����kK�s�9�n��s�)�~�/X���VL����J�l�c�`�p̹S���?w�%_��X3�Q�IlύT�i����%eVv�����V�E�1���o��{K��b��s��}ΐ2���Ĕ͵Z
[9U���>���A�_S̀_���֝{��C�?�����#Ζ.�LNf̮��������-�¸[��f��n�q������G��_���^������Gm�=~�������*�����X;����
1��N�d���!{�\�8a���z��;���}�s'�������w�?w��Q�9�K��������a��:��N�����n_O�|�gd����+�_��gL���iΞ(����߻��7�b,mr_���]W�v�,ڞ[��k���.i����o�+X9�0�K~=���������8�x}�>�ϣϹ�
��t�U�\��F�'&�����w�{�1�D�e�[��๶;����?wzm������X�>�lsj�ɟ;�aK���,cm�X�ڜ[�i����lϢ^�ʵ-�Y���݇Y��5yb,���Lng�'�w����5im��y�s�N��K)�l���yb,�B\;�Ǔ�¥���
�����^uܾ�ܚ�g]�+��?��N��k��b��3c����9��4g��[�6���w�3c䪉ǜ;�-��5��Sݖ��NyWm�Fc��\ש_=sU�w�[�>�u�4��Ik{<m�7ҵ��N\z<my�����i��3��[����悙�g��a~�s�RJ��I<�����<���\�N�F��ԯ�����=?o�Կoԟ;��|���`]�sF[�ܒ��;�/��ƻ���J����]�o>����悙�g��a~�s�RJ��sx�+�~`1=&W_V���UJ)��Y�w�keQ&e g������������?��}*�}�~�B��gR1.{��Rri�u\*�{��w�o�i��w��/���?k?�}ɷ���O|��ߠ9I|7��we��p��f��2��@����!�}M��c�����ž?Ж�� _�ٯSϪ�켵��v��!-�y�KȜ�P�Hn�`��6K[�ra���8O�5�_��ߦ\�7K)%�9P�Uv�ls��nè�0玆���N�G�?��@���ar�}������[��;�!�}�wl�5l�
&���q���"^��%��"�ds0W1���6��+r�8�5�-yH��'v��e�/��o���c5NlKȱ�c�b~����9��s�yl6�1ov�s�#W�LNe.�����b�G�We���8`�P���ח�f#?k�k ���w��R�w�?������&��ݷ�����Ef2�w�C��_�W<�&[_�v|Z�"�ܶp���mIB2�F�<�،�|���<mj�����`�m�;�=t�|�|��ؽ�L�ۯ�47��Y�w�keQ&e g)�\~:_�:_�:O^�[����Y�;����������=泯�������w�%[�k���L�ڤ�������|�Զs�>��Wڽus���˒�d��jǗ��<Ĕ2K�9j�ޟ����D����d�5���/�k�a��gc[���bn�����2܊s�x�mEV��6_�9j#�3�� ֥�kʪ"�����yv��3��)y����3�$�̥ͨ��{u�n�͝�V�P��\��f,��(���2��g�w��8k�]�e����.�-u���/��V���v����j݋���Dƶ��2�W��D[�~�~��qK7'Tm��S1�u���� N��}'��r�n�7b�@��Y�9U��TI@�w�������k�_������v�������k�_yQ� �
�z������VF[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://d26yk16o0p3nh"
path="res://.godot/imported/dungeon-tileset.png-d5a7cfbe9c6909dd3e070994f1c49862.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://dungeon-tileset.png"
dest_files=["res://.godot/imported/dungeon-tileset.png-d5a7cfbe9c6909dd3e070994f1c49862.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
���u��]w��)GST2   @   @      ����               @ @        8   RIFF0   WEBPVP8L$   /?� 0j�6j�xPԶS�e>n�_D�' ����p[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cfexel3bk6pxc"
path="res://.godot/imported/floor.png-d43f03cb7a8f42941311ed90ed2021b9.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://floor.png"
dest_files=["res://.godot/imported/floor.png-d43f03cb7a8f42941311ed90ed2021b9.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�)!u4+O��extends Node2D


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
˛RSRC                     PackedScene            ��������                                            �      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity '   0:0/0/physics_layer_0/polygon_0/points    0:0/0/script    script    1:0/0 &   1:0/0/physics_layer_0/linear_velocity '   1:0/0/physics_layer_0/angular_velocity '   1:0/0/physics_layer_0/polygon_0/points    1:0/0/script    2:0/0 &   2:0/0/physics_layer_0/linear_velocity '   2:0/0/physics_layer_0/angular_velocity '   2:0/0/physics_layer_0/polygon_0/points    2:0/0/script    3:0/0 &   3:0/0/physics_layer_0/linear_velocity '   3:0/0/physics_layer_0/angular_velocity '   3:0/0/physics_layer_0/polygon_0/points    3:0/0/script    4:0/0 &   4:0/0/physics_layer_0/linear_velocity '   4:0/0/physics_layer_0/angular_velocity '   4:0/0/physics_layer_0/polygon_0/points    4:0/0/script    5:0/next_alternative_id    5:0/0 &   5:0/0/physics_layer_0/linear_velocity '   5:0/0/physics_layer_0/angular_velocity '   5:0/0/physics_layer_0/polygon_0/points    5:0/0/script    5:0/1    5:0/1/flip_v &   5:0/1/physics_layer_0/linear_velocity '   5:0/1/physics_layer_0/angular_velocity    5:0/1/script    6:0/next_alternative_id    6:0/0 &   6:0/0/physics_layer_0/linear_velocity '   6:0/0/physics_layer_0/angular_velocity '   6:0/0/physics_layer_0/polygon_0/points    6:0/0/script    6:0/1    6:0/1/flip_v &   6:0/1/physics_layer_0/linear_velocity '   6:0/1/physics_layer_0/angular_velocity    6:0/1/script    7:0/next_alternative_id    7:0/0 &   7:0/0/physics_layer_0/linear_velocity '   7:0/0/physics_layer_0/angular_velocity '   7:0/0/physics_layer_0/polygon_0/points    7:0/0/script    7:0/1    7:0/1/flip_v &   7:0/1/physics_layer_0/linear_velocity '   7:0/1/physics_layer_0/angular_velocity    7:0/1/script    0:1/0 &   0:1/0/physics_layer_0/linear_velocity '   0:1/0/physics_layer_0/angular_velocity '   0:1/0/physics_layer_0/polygon_0/points    0:1/0/script    1:1/0 &   1:1/0/physics_layer_0/linear_velocity '   1:1/0/physics_layer_0/angular_velocity '   1:1/0/physics_layer_0/polygon_0/points    1:1/0/script    2:1/0 &   2:1/0/physics_layer_0/linear_velocity '   2:1/0/physics_layer_0/angular_velocity '   2:1/0/physics_layer_0/polygon_0/points    2:1/0/script    3:1/0 &   3:1/0/physics_layer_0/linear_velocity '   3:1/0/physics_layer_0/angular_velocity '   3:1/0/physics_layer_0/polygon_0/points    3:1/0/script    4:1/0 &   4:1/0/physics_layer_0/linear_velocity '   4:1/0/physics_layer_0/angular_velocity '   4:1/0/physics_layer_0/polygon_0/points    4:1/0/script    5:1/next_alternative_id    5:1/0 &   5:1/0/physics_layer_0/linear_velocity '   5:1/0/physics_layer_0/angular_velocity '   5:1/0/physics_layer_0/polygon_0/points    5:1/0/script    5:1/1    5:1/1/flip_v &   5:1/1/physics_layer_0/linear_velocity '   5:1/1/physics_layer_0/angular_velocity    5:1/1/script    6:1/next_alternative_id    6:1/0 &   6:1/0/physics_layer_0/linear_velocity '   6:1/0/physics_layer_0/angular_velocity '   6:1/0/physics_layer_0/polygon_0/points    6:1/0/script    6:1/1    6:1/1/flip_v &   6:1/1/physics_layer_0/linear_velocity '   6:1/1/physics_layer_0/angular_velocity    6:1/1/script    7:1/next_alternative_id    7:1/0 &   7:1/0/physics_layer_0/linear_velocity '   7:1/0/physics_layer_0/angular_velocity '   7:1/0/physics_layer_0/polygon_0/points    7:1/0/script    7:1/1    7:1/1/flip_v &   7:1/1/physics_layer_0/linear_velocity '   7:1/1/physics_layer_0/angular_velocity    7:1/1/script    2:0/0/z_index    2:0/0/y_sort_origin    0:2/0 &   0:2/0/physics_layer_0/linear_velocity '   0:2/0/physics_layer_0/angular_velocity    0:2/0/script    1:2/0 &   1:2/0/physics_layer_0/linear_velocity '   1:2/0/physics_layer_0/angular_velocity    1:2/0/script    2:2/0 &   2:2/0/physics_layer_0/linear_velocity '   2:2/0/physics_layer_0/angular_velocity    2:2/0/script    3:2/0 &   3:2/0/physics_layer_0/linear_velocity '   3:2/0/physics_layer_0/angular_velocity    3:2/0/script    4:2/0 &   4:2/0/physics_layer_0/linear_velocity '   4:2/0/physics_layer_0/angular_velocity    4:2/0/script    5:2/0 &   5:2/0/physics_layer_0/linear_velocity '   5:2/0/physics_layer_0/angular_velocity    5:2/0/script    6:2/0 &   6:2/0/physics_layer_0/linear_velocity '   6:2/0/physics_layer_0/angular_velocity    6:2/0/script    0:3/0 &   0:3/0/physics_layer_0/linear_velocity '   0:3/0/physics_layer_0/angular_velocity    0:3/0/script    1:3/0 &   1:3/0/physics_layer_0/linear_velocity '   1:3/0/physics_layer_0/angular_velocity    1:3/0/script    2:3/0 &   2:3/0/physics_layer_0/linear_velocity '   2:3/0/physics_layer_0/angular_velocity    2:3/0/script    3:3/0 &   3:3/0/physics_layer_0/linear_velocity '   3:3/0/physics_layer_0/angular_velocity    3:3/0/script    4:3/0 &   4:3/0/physics_layer_0/linear_velocity '   4:3/0/physics_layer_0/angular_velocity    4:3/0/script    5:3/0 &   5:3/0/physics_layer_0/linear_velocity '   5:3/0/physics_layer_0/angular_velocity    5:3/0/script    0:4/0 &   0:4/0/physics_layer_0/linear_velocity '   0:4/0/physics_layer_0/angular_velocity    0:4/0/script    1:4/0 &   1:4/0/physics_layer_0/linear_velocity '   1:4/0/physics_layer_0/angular_velocity    1:4/0/script    2:4/0 &   2:4/0/physics_layer_0/linear_velocity '   2:4/0/physics_layer_0/angular_velocity    2:4/0/script    3:4/0 &   3:4/0/physics_layer_0/linear_velocity '   3:4/0/physics_layer_0/angular_velocity    3:4/0/script    4:4/0 &   4:4/0/physics_layer_0/linear_velocity '   4:4/0/physics_layer_0/angular_velocity    4:4/0/script    0:5/0 &   0:5/0/physics_layer_0/linear_velocity '   0:5/0/physics_layer_0/angular_velocity    0:5/0/script    1:5/0 &   1:5/0/physics_layer_0/linear_velocity '   1:5/0/physics_layer_0/angular_velocity    1:5/0/script    2:5/0 &   2:5/0/physics_layer_0/linear_velocity '   2:5/0/physics_layer_0/angular_velocity    2:5/0/script    3:6/0 &   3:6/0/physics_layer_0/linear_velocity '   3:6/0/physics_layer_0/angular_velocity    3:6/0/script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/3 
   sources/0 
   sources/2 
   sources/4 
   sources/5    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level 	   _bundled       Script    res://game.gd ��������
   Texture2D    res://obstacle.png �y{�
   Texture2D    res://floor.png ���+�=G
   Texture2D    res://snakeSheet.png l� 0hO
   Texture2D    res://apple.png :q}�ض_
   Texture2D    res://dungeon-tileset.png 9����'�~	   FontFile    res://Grisly Beast.otf YK����]   !   local://TileSetAtlasSource_8yecn �      !   local://TileSetAtlasSource_htn8t U      !   local://TileSetAtlasSource_8d620 �      !   local://TileSetAtlasSource_tr6m3 �$      !   local://TileSetAtlasSource_tawuk n%         local://TileSet_kqwtm �,         local://PackedScene_ugcak m-         TileSetAtlasSource                   -   @   @                
           	          
   %         �   �   �   B   B   B   B   �               TileSetAtlasSource                   -   @   @                
           	                         TileSetAtlasSource w                  -   @   @                
           	          
   %         �   �   B   �   B  `�   B  A   B   B  A   B   �   B                   
                        %         �   B   �   �  `�   �   B   �   B   �   B   B                   
                        %         �   �  ��   �  ��   �   B   �   B  ��   B   B  �A   B   A  B   @   B  @�   B   �   B   �  �A                   
                        %         �   �  �A   �   B  ��   B   B   �   B                   
                        %         �   �   B   �   B   B   �   B   �   B   �   �       !         "          #   
           $          %   %         �   �   B   �   B   B   �   B&      '         (         )   
           *          +      ,         -          .   
           /          0   %         �   �   B   �   B   B   �   B1      2         3         4   
           5          6      7         8          9   
           :          ;   %         �   �   B   �   B   B   �   B<      =         >         ?   
           @          A      B          C   
           D          E   %         �   B   �   �   B   �   B   BF      G          H   
           I          J   %         �   �   B   �   B   B   �   BK      L          M   
           N          O   %         �   �   B   �   B   B   �   BP      Q          R   
           S          T   %         �   �   B   �   B   B   �   BU      V          W   
           X          Y   %         �   �   B   �   B   B   �   BZ      [         \          ]   
           ^          _   %         �   �   B   �   B   B   �   B`      a         b         c   
           d          e      f         g          h   
           i          j   %         �   �   B   �   B   B   �   Bk      l         m         n   
           o          p      q         r          s   
           t          u   %         �   �   B   �   B   B   �   Bv      w         x         y   
           z          {               TileSetAtlasSource                   -   @   @                
           	                         TileSetAtlasSource �                  -   @   @                
           	                             
                                     |      ����}      ����   
                                        
                                        
                            "          #   
           $          &      -          .   
           /          1      8          9   
           :          <      B          C   
           D          F      G          H   
           I          K      L          M   
           N          P      Q          R   
           S          U      V          W   
           X          Z      \          ]   
           ^          `      g          h   
           i          k      r          s   
           t          v      ~             
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �      �          �   
           �          �               TileSet    �   -   @   @   �         �             �            �            �            �                     PackedScene    �      	         names "   .      game    script    Node2D    TileMap 	   position 	   tile_set    cell_quadrant_size    format    layer_0/name    layer_0/tile_data    layer_1/name    layer_1/enabled    layer_1/modulate    layer_1/y_sort_enabled    layer_1/y_sort_origin    layer_1/z_index    layer_1/tile_data 	   Camera2D    anchor_mode    current    Timer 
   wait_time 
   autostart 
   ScoreGame    offset_left    offset_top    offset_right    offset_bottom    theme_override_fonts/font $   theme_override_font_sizes/font_size    text    Label 
   DeathMenu    visible    layout_mode    anchors_preset    Control    Panel    horizontal_alignment    vertical_alignment    ScoreDeath    anchor_left    anchor_right    grow_horizontal    _on_timer_timeout    timeout    	   variants    +             
     �?                @               Map     �                                                                                                                	        
                                                                 	                                                                 	        	        	        	        	        	       
 	       	 	        	        	        	        	        	        	         	        	        	                                           ��       ��      ��      ��      ��      ��	      ��	      ��      ��      ��      ��      ��      ��      ��      ��       ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��
        
       
       
       
       
       
       
       
       
      	 
      
 
       
       
       
       
       
       
       
       
       
                                                                       	       	                                                                ��              ��      ��      ��      ��      ��      ��      ��      ��      ��     	 ��     
 ��      ��      ��      ��      ��      ��      ��      ��      ��      ��     ����     ����     	 ��     
 ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��      ��       ��     ����     ����     ����     ����       ��      ��      ��      ��      ��      ��      ��     	 ��     
 ��     ����     ����     ��       ��      ��      ��      ��	      ��
                                                                                      	          
                                                                                                                                
          	                                                                                                                                                                                
          	                                                                                                                                                    	          
                                                                                                                                                                
          	                                                                                                                                                                                                            	          	          
                                                                                                   	                                                                                                                                  
          
                                                               Objects            �?  �?  �?  �?                      )   �������?    ��C    �D    @D    �D                      Score:           ��C     �B    @oD     D     ��     ��    �XD    @D     ��      @    ��D    �!D   .      *   You Died

GAME OVER

PRESS "R" to Restart                   ?     ��     �B     �B     C      node_count    	         nodes     �   ��������       ����                            ����                                 	      
               	      
                                       ����                                 ����                                 ����                                                         $       ����   !   
   "      #                                         %   %   ����   "                                               ����
   "                            !            "      #   &   $   '   $                 (   ����   "   $   #   %   )   &   *   &      '      (      )      *   +                                  conn_count             conns               -   ,                node_paths              editable_instances              version             RSRC���0�Hx���D�RSCC      �c  �
    �  �  �  �  �  (�/�` �W ʵ�&K �2js����̚�����w�m#<���JO��ڞ9K9���bm�e�ط�~N ��S&S��ر����;BX��L<+�(��`o\�%�'�k�6�-v�{��x��"�вϒ��r�ԙo��N�R���:�b�C'Цy��]��C��E���d�I���~�#O��'�Я�����14旱��
�YrLl�~C*���������.d������Cp�JpAd�p������7���x�C��A����������8Τ¾�xqu�d_�����U�
r)�9���d��A���y�si�#����`� ZÔWW�N�M��B�������ꓩUb*D.�D��'¡XRj�8$U�b��%�+�+�,�ǎ�0d1=&�*��dL=S��à*L�j2-��F�0����֕*&L��o$R��,��aA�LJ���(0�lx��R�Q53�E�dq(fL��ư'	�����$R
2�H$�X�`�T��c09FT�aAUXL��!XL-6"�D�XLń�$�l�Q4�C��,HTφdLʚ&�cR��P���J��D�g�h��nR"�!1&��I���ǂj2=�E�ɟt�L�~��XZԭU!2hL���H��c����}���ġ�d�(�7��]y�x�\9�@��������ڀx�:&`�8�8�q�X_-�6�[M�p�TO-c�R�G��wo�y��i�a�4�K+��w�΍���FM�иo��;t�5�]u��M�m���z
�е��k5�kuj�fb��뽉���8����d}�K�1��w��]�;̵z�����cw��M�4k-�2.�:�b���c��YRAh�}Ɲ�����i�YBK=�������h��[�6s�����Ա�����&������;�s[�0&����Y�3p�Ƶ��Z��>�fj�f�^���w��Vܤ��{˅�1�뻍����&�F�\,�.��˻ˢ_a��aw����3����v���ɴ�K�֕���47�D�[�1�N�p�>�-M�e���y{-�k7w����6�u��s��L��DCq��Tg]�l�i����*��J.�c����N�j�n����e77�]����
�{�[�=��m�߃,p�՝�&�g�h��Z�R{�/�a*�B�d��k��׉�%X���:G.�U�B6
˄d��{,�ƞ�#X,��U�g�l�-�V��;�y���5���q�E�/�Q4��X6M���JC�p��(���K�,�h"���cY�>p�%S�QְXF慣
մ+��h�[�6I<�z;$^�p{�^\���Y�L�$���͜j�2�F�-�vuL�eMT$6��T�!���������@����|�!�=��:��x�\�u���ȏC�l��x`$���>�������v*#���#艋��Z���Ӱ|;K%�������@���.�tL?��b/�gv�Eb�Y���3�͌��J% PJ
- �B�P �Cy(J�<��p�X4{fS�e}�,�d��������o�o�^�v����gֳq>����,�0s���2����Y�൫����&b��ăV�$f�%��~8�y�������7l�^�2��-���?6�ю3
����A����O��N.N�eZl���}�1<g���م���mf�Ӭ�V�3�9�O��M��d.�Ax����5�ӗ��)X�,��d~`n௑|d��\d7�Ia�<iy򠄖|5L������4k^���7dҰq�GUº�������:�ڭp�VJ�rk�Ue�_�d���d�E'r8����&��K�]T��gxlc�p9��D%q=��T���H�)4�Q�&�\��9�:P�I�T2D-�p�O \���a��WW�/��.�6���e�)s�hJ��ggL-s~��pyb�I���a)��jXJ��Gl��`��K[sA�c�� -����d��Z�Z���|�>���d���ޔ!�78%kSl=��ՍE`��ǊŇ3��DLx����7����3 �ҩ�E��jF���a !9��`�-<S�V�����3��p��"k�>ء����V�V/�O+	,"q�؀[b���bgNl]�u5�8�U�'v劰	/L�ÃF-nbx�B6��cM�u�% �@Pjh:_��\���A��"*hhgT0�łjAθP`�B �h� ��L��S�˚�'g��vH���TZ�V?��%�U��]0(��ȦH`�ĠEuQcK�&��/M'�Ke
�=M��nm�9eMbղ�`O� ���آ�����%0eX���%�M�D���wc�j7c�����n;��
��#t|t8���������>�i���#�9�)����e�:%ݑn��"'(gD������XI�GnG�F�(WR$,HE�N$B�瘳x&p>q�vd<�a$Ǩ�Q�Q��#E{�ʈ�D�Zah7����Yp��5��a�&������B�dFFDDd4-h`�1DU6@:)����2k�kY���$@&=vQkm�!�jh�s3(��Jo@��g�r2��G����)��75��q��Ô�VRfb��U>��XB����"��v}Ï���E����%��a��
�F:�yO/D~[�?��Y��7،�o�?�O/��4uN���4l���QW	_�zE�vYCX�\�")DDo�����MHQ!IB�NH�SD�q�!"���i��Ts�@�y�A�o���A*2x���H<<O����bi:fL
�_B����HԌvK�_ٶ'�m��'ro@�}d�V�_�p����̍�-(�/�` �h J՘1B Q�����,�b�����h���yՍ�N~�	"��7��<�Fiݿ����^�^	7cbS��^4�j& �+�+�<��,)b�jlר=Cy��ա�'n�z5�ɨ?��

�\��@"z��PEŠ��j��!в qƼ*B��K�	�[�U�N#�AA���47`#�2{
�#���⧮'�H���R3���%�|�8�0b5%G�������_�]���,�w�Rz!{nbF%�1T�h���`shD���댗cd�,wfK4MBj��&�J�n$1��KfsS�S������s�#G�x�����ꚑW$o������!���2��+�O�+K����h2NS�����g��7�xMb�~�ʝ@��4S�8�\[�%� 4��p��|G53k��¯�tS���B~N_�x�����x�\���;|^��w�6} CJ�'f�΍�N������o^�.��畹�a<�K^�⇅�PW��j^��������O��<�U_p��<�y59�lm�@����O�����-;wUEչѼz���!8�f:|� mmlo���b�f�
"x9�.����'^�Wn���F�Q7%\�j�gWfA���x�Q�*#Ò�1�۳�0���)h�5ok�z5����P
��B�*�5�O~�Y�-c�v6��"�$�S��0���N|Qb�j^e�kҶ�R��4~�HKi�6*�W�9��P��N��ev}��fDj`b�)Y���,AꔲI�M�;˙��zjZ��媕0J�Dis��xe8m�0f�&�i[�r^�����n�L2ॶO��:���>>s#����fe�c+{�q�@�j�XBTo^g�z-D�XB�j�_�wP��?Bl���bs�h/��V�أ�����[��G���?�S�Da�@s��5M��.Y�\�^�yX�A��9�Wk��`��W���@4��ͭ�m��Rx�����l�P��Q�P�F�f5UX&bQL�Q��p��"�`�k:�vL�O]r��Q:]e�M�z�&��r��t��b(m��U�̷�PL��K؟KI#;��u�|���	%>�b���j��6�C�XO�b��H�Eb*e���;O!��9��47o3iØ!_�p,���+����!_�3�LίKz�Y��;��>2�l� �H�6���{��{j�A%��-��G����j�l�a-`�� �8O���*'��)��G�X00�/NY�b�nrrnn6�Dɔ�B�L|F��8���_�%6������?Izz�w�;��7��@d�=G���^N~�E�Z�-s�[�p��pL�EbK\�}�����W���o�ґ����S?9���ϻ{�n�|�}Y49�l%f��Êd�T���^�a�i��#�r�e��5
2��ʇs��6q\�d6����:`	��wrrּxKޙBk�Ͻ���7O���k{������(�Gz5�;z��6S�^큀M�k \9���*7R�f7'A"=b��i�)036w"Mo�^~��}r}}r�,zr@?BC#�V��8���L:���-�86�d7�Sr��U�,-������p�3@1��}�e+�g�����Z�uS���k�Bc�sԉ�1cOV�0�b䫻ܼʨ-�,�Jw�5�u��gn�}Rp�
�0i+�����`q[��y���'�
�j��R�hhW�,iZ�q=|P1L��;m[�iO��I�Vv�����B�j���__Y�d��VF�G��ʝŘ���b؎v�m[^�hYXŘWE��h� �f�*�!:Z���zc_�]����$c[}�����캪ڻVK�^ϵ0�Lz�6G��`?b�-\?[M�"��w7��k!_]��1�.Nhm8I��$s�w�E%��i޹&�v�
V�x�h�Ue�A�1.T,�6}�l��|�s�aC�!NL��%�е=z��M����/������% �E3D6k+[���F��V�+���h$�v�=�L����7����L �4�q�m[��;i�2X].���X��D��5Q
������B.IGL����Fm�N��J��t�}���Y�ӢDW8GHW(���kdRQRd����O��%Αww�"�L��EG��J��8v2k��8^K���t��~C���>+P�]i@�`����<�ve,hf��45�Z��̂���6�V&�������<�v�:�]���dA��m��ޏ����DغK
��U7�zu��'��6!3x-:v��
�_����Fk�k��6�/,6`. T r2� 9����vU%vs��W��T�R����"�zC�����FWh��uRY`Qq�2R�=K���	�x{޹�'������7�#uksk:�ȴb�;�nͯ/{7/�w�sO����$ޭ �%�{i	�Rw?�n��~,Kl7(v���l�z��E�����!kb�N�#M0�`����d)k���ri�,8#���|4�E���Y��*S '�Ʌ�Arr 9R�#C�VO����9YN���zt}G��st�F��kt��u�.���B��'t	��Gh'B�y>>���2O�瘧�������i���,|>�<�<�<���(O�'߳ēP<���`BJ�JYJ8���DN=�1g�@�	c5ǚy$ J(�`}�$5%Q#$#\�`��A�X��	\D�!��+�+��B��q��|\\=n��[ǝ��q߸m�5n��ut]@W���~aN�2�Ʉ�N��f�e"10��#�������H ]�(@J�t�� ��!E@l��w`耇  �e��b���G9��G_�S%T�B�T�102À����"�"¤�k9�x7���)�{�sI��dO���y��;�=���^�tg�Nu'�$�p�Hܧ�RO&q�s_s�r����z�ݭ�u�x�s�w��&������w>�K����3�I;�y��S�8�t���;w6�v�j�Ѹ����4�y�|�^��nƝν����O�q���ċ���-�\ܵ�˹��g�$wB�4w@�'�}�f�Uw&�o�c�F܏�[qt��ŝ�]н�;���+�n�@��ܷܻ|����?���GION�Iw����a��.�/o�o�X��� B��vj�^l��_R��6� #�n�π�$��%�'F�W�n��8 @B"b�k`!�Eg���c�4@�{I=:H�vL��Tn�A`u���d��N�� ,g	cx�3q��y	�YV�"�++j&�n����ш7G.�n+#{���K!a"�ʪń�уcWf� �PL��gx��q�,8���e�>D�*��0�'�D-+��(�/�` u j��9H ���a���'�K�^�7�����"��:KDQ�JDBFi0��)��@ �����G}�]�/����M)|�Z�����`.U��DOĉ��W���&��8�W�w��W/�t��DD���2�%Q��%_���M(7����'�É�p���,�$���h��i���.⇜oG����*a|�"#:)��|t$���#���1���'�[�e��b�u�G�_$YDÁ�c$��ƭE*F�9*��uEƙ$V$������Dĺ�Xyq%$D��h��P
4�b�FnRr���r�6;JT���`���/��ih_�$a�Vv.�&U�i���lr��Ͱ�r)��_e�k���F��#2���z��)ɳ��X�"��;�q��abT1���V���q?67z�I�BLz��!/I��u��:�M���>z%�g��Ber?�z�B����U��.�7z�M�e5B��"#�)Q��^�k���z�#��i���p��8�VBU2UREKHō��o<x\8G��@�����`۬�`�^�\��Ԁ+�Q�q�	,�Wl+5���~��caF1x?�re�H^�	Z���V����Le��"�xC��XO5�U�|{�l�Zx:s�n�,���}�Fݢ�H�$t�%~�v �ٲ�Q(��((�Vp.n��XA{93S��]"�dSE�Mq�dO�\H54̢]����xfX����ʰ�\ig����Z%[�)�|�:�<յ��r[4n��Q�u�~n��}����*���_Y1,���@�A�]MMY��4z[�~��py1,k��k\g�Ո�;ԋIv��Nq���^:;��3x�?x����|���>�ǌn��"[���D9��p��VI>`X����Nv��r��y�����HԌ�Qdb�\u���Jv�c�#�MG��<�8!3zf�ë:�/S�T��o^�J&>`�P��<��EtrJ�c��G��a������C.�dE�:��Q����D������ߠɔ�hi��)����V�i�뒖e6����P�@i��,%rbB�4�e%�νa����Yx�����G~�UN�Z�˳̨�ȫj�����<��1}Z&��=�!�d �]�G(��!�~D��*&�f(A��# P9�;SE��ڒ��P,o+ނ�r�r�"~�9{`Iq��)�m$!�P���m����a9JB�@79�o��L�������K8Y�;�����F��|~;e&�H���ըT5����bL�1��\B�\� ��8�Aό��:���YL}9>�g\ׂً�!J��9W)�xN޳�I�!l�-���A_y�
��Y�K��M�K�m��42�$n;ܲJ��7W���aX+t�YǬd/�Z��(G8��S��j��"��$R����W!��*�D�0aL#;l@e�o�*��ɜ�� �H��h?�/��a@J7���u.ĳ8!ܹm��
�y��)6;����Zo�~>�U$,��ω1���"��\�t�����&|���.}�����8<�n�|�(�?+�y�FF�=�믩���$Y���hz�Be�����	^��|?��q��(F�����H�}��l�3�s]�2��	ֱɡ�nnT)��,���������B��v|j�<}A�d!ת*�2�T6���>���1z�Ne�c�l_uѭ�x�؄�8;j��@�M1��jڨ7b�������	���������3�G����8�
y��"�ԅF�[�Qm���G��*N@E�=���/P�P�z@�̍ອ�{w�2��l��5�n�,��z��ˎ����@��$�i|dzϯ��ܕ��7Wu��S��Wv2y��)(�8�&�w<�3�D[(�m�e@6����4���Z��G�jh�-5�'�	�q ��&���L6gv�u����O+���X1��ߡ;»|�����!*a�b(���������m����
�@	B��G�=�E��x����陚(�W?}A�N��TڡC�����������_�.x��y��T�C�����}�8=W��P࣭�V��=?�{x��x ��qՐ�g��|��hjkedX�a��a_/�]S�!���"�z"X�D�K˳SsG|����!zTpۼ�Ի������V�KsFRH��XdcS�h-TZbXX���ϑ~Y�D���EJ:�������^r��>&Oa��s��	������+eۤ��f����?xo�򙶼3i�z�}�*t`
L�)�U����F�69��ێג�����D0���C��ᛯ�7���F2���ɉ0�Z�@.>̀Cl˸���V~�}L^岫i�Osz��D�y<����m�%ȉ��{��W�j�Џ7���UQ	z�Y��e�ߐ�@p�R�p��h��(�#�)C�hXg���G��4qBL"R�(3z��>�-As��o��<�s��2�^�����9�3�,KRb:�*�խ���XF͒@�ccncm.W�ߐpr��~z�b�E���mM�6nS���4�
�O3��į�0[h��n&��h���w�'��Wĕ��3�7�F!�0��}�����ucQ��D���uvrf��cuU�v�W�ҏ^�����y�����,T�pi�b��ģ��TIx�Gq5�ȭ�2p��������I�2��	�jF�+R�W(�Y(2�u�YԩL��ii�Qҵ�(�s���`�c�@���L`�l������n��["���F��xm��v�Y*�Gك&/p!��r4�][mI����5m��R��4J.nFG9W�X�#<�K�P <�����o�ҙA~H	����%���������Y_t)�%J��A�s��'���bW�2'�5ŎR�GU�����NN�y?�p漓#���T"��H~�yV窽�b\��ʡ������Iu,E�(�k����d�t���G�6+z�Q�A�Q�75�*m�j���lG:���@��5m�a<'z"o�/<�|��Cc�;���'�S�<J[�R�q���Y�n��ʕCQ���^�I���2�qB�"=W�<���)�fF��3=�u��� ���&��������C��w������9�d0�I�*Bb��535�3��bB�Q:N�Z����c��y��}�bְ����m�_y����"�?nR[�c�w59#�5)�,Bn��O�Y{[�v6:�����7��UF�40
�F���1��	��,@14BW���w]����1�qQ^���r��`}�C��9�OB`DJ9�Snh�?N�7�'u��������6���1�g�9�*l���AZ��c�k"�}R�<�������-F���}Օ	BR�c�F��Oj��e8���_�X�X-I4��+�Eͦ�剥��T3���t.��OKKKM�KKM��ƫ�^��c��PΞ�ݕQѳ�!��S|v6=��<����a���`�-���bv !�9���z���o!f�+���d܄ ?�AN�JR*�զ�4��&f�qb��n�N�Ӓa�r©o�m����O|�G�ᢏ:Z�bZZ�r���N�b��^����hBb<:�4��y�T4��m}<����6Xg�~�O��}��h����#�G,�Z`�7R�������
.�ǟl�ټ/Z&gǨ�R��k�>h��hE�)����^V
>?�Ç�U<' d��ɡ��i� `�3��%E]�)��I���KS���D��NvL\�ޟ�<�|;#jW��(�/�` u :��9J8���x�a��(4��̺�AA!sJ�+�X��iVoF�V��Ȥ�0	$a�5�q��H�c���V[�m(X��jx��|}�N�e�x����g����}�g3N�kk�\Ւ;��|W���Zٲ[[��O�~�B���X���e�E�MTFĘ�2cg�pO���^��!��1ZR��k��z�?La!��k,6&����@i��Sb
�.�}�3{���pʾ��lmi������6�a��uڶ+,6�	5V>�/��y�#�5_1">��x��9�SM�����,��+)4n1�#�%io�0���`��PGӌ�]1-9�UZ�,6�5��Q�L�퇒L��G�Q��'��=ٍ�L�2�*�$I�GH�F��݌\�����n�ySÂ{<������fè�(��*uZ��.�;C���.X�T��$Ç�q� "���k�[3㯯�eh�[n>���⤓���x�Q�I2�'X:[:`u���'�&�lx���y�C'S�Ǫֱ�̖�6gS��bMD���\8��6�f��l��Z>��8�W���[\<��S�l�Z6��W�yu�	G$��qB U�]�����7���C��E�1�9�=v�X?	Ӎ2�1��l�%�^�2w��esE���Ղ?Mv,�a	P��[�?<��U�
�t�P����~�DAOb�G���O�$:瑡��ȋ����v��h'8��)0v`1̗�V�F?��?�},:-�c�9�kK�)Nf;B��NI")%;r����ҟw�dN%c���u�)a���Ί˾<�(�X���Yv�u��C����	z g�|��
hǕH$WYmYq�R;�D;fA<�fl�e4]zB�1(w�����7�5�&3B�W��0��9�B}���qfxTU�)�Z��a �ϲe+5�q� ^	� ^w] `	s�.�[���I��P&��ʪb�D2�9�T67�F�)n�i��E�6I��j�e�_UlvNC���^�ڒ'���A(�a1����C_�e��%4_@���Wۏr�f�ǜ:�"�Qʂrq�Ax��gl~m��&c1�\�F�O�ɢ[?�J���D�_�*����W��e*�6f<��$�&�rq�(rrj���cnn�ǝ�����ZfQ2#�R��ʽ�[�-�
k������M��
T�V��<��^��ǯ��7��/��DG>�K�Q��#+���Z����f����f����ֶ��tk�{�Y�"q����*n��ox_��Ӽ��Q壥+����ε����E��d��m�V$C�u��f5/-Z,��y3oi{Kź|�t�t�SйVWW����N�sۮmaE8 Qo���<���ݬ�E�E�<o�-��7_&O��:{��X�a������~���	�e�ӻs�cpH���;���^]m{�,�H�}˾F]S*�P%�����6knNM;{{�����y
(��Щ�J��O�%T��|�+�ynyB��	3<�g�N���y��YM�����]�������@����Azm��7w�ݮ�]'�����Φ&*�����^5738�;�v#�n������S����B)�L�\���)�x��������x/�`*��=<��b���vzI�����s����?�������<�Ƿ[��c��	��<E�yW��-L��B��\ۡ'&y��R�S�2f�8;'x�Z[1xl���?���x
�@��ƣbgC����J��Yㅤ���HN ��R&�pa�^�L�P������hԹ�+�]�#�=�tD$$�(i�U���5<��A��G��O�χ�u��%�&ށ��\�
kS�]W�0���9&�	?��	T6G���E
IOLH�.���ELq�aO����p�+��ds�9���,�?>t�(qS��[����=ݔ�n%a�`�v��X� l���F -O�[/��Qfg���3Vس�[����Sn��g��d{��LjӺ��MIQݜt�"�x?����e����u+�M�I��8q��KW� D/�w_��������w����2 ߶��!���L�v7T֔��O+)x�j��j˔"r>�Ѳ�������gK�^��v�`2$����i��̘�S�i5�`A��n��K)"��-�J�`0�νO|V��ͷ��<��Ξw:�rʋ�����(��ܩvz\���������Ò��5P��
U�٭ΛZ�n؛_��9!9)��B$k�Ş&i�,2�M�����6��=�����O�qN��X9�S0����9�{�)�t�H�]k�dlj��4{ͪ��h���h)�af�+�~�;��l���"p�Xg����Uu�����'w�Sꮧ�h�n�����gZ4��0kը��^��k~Ȧ�lȩ�����8s�[8Y�=_�J��3G�����Y7��`�a	<c���la��\�K���JN��"E����S̆���1u�ʗ�ࡔxdG>�#��'��h�������A�ʧ��\����m��[ ��"������g�tf=2[�i�Ɂuqa��a�4��|/������ڂ��^S��W����=�!,$'S]�ZN�8��x��#i~�Ő(����#o��&�!SNk�C���,���o~𘘏8Cb�b��j'Z�<FKgѬ$���e�IoO�|������$��ߗ]�q���+��}�>+��n��@��HNJ�&UG�q�/���	x:��>����
<�o��s���q�gSLLDRT�'��\�.0vс�z!�%d�B��'��_Ը F�d`k\fsZ8�Y	� �ts&y�[V�pJ��k��v:�ى_��y$��r=!3)��C]��Ěa͹��@X���ߐ$$5t�{��
�9��K�%[[�Y��L˴�r� ����	Ԉ�]��!h%~X�����*.)
)�BJ힣�0��6���!��`�j�������C�v#�o��>?�Ӡ��X�X��Ac@c`l�؀q�q�Q��VA�a�;�?�,�~��ڤ��e�FLg��0�#�i��~ooW?8���;��g���p	%���岃<�#}|�y�V|<�G�eX�k,�*bq<{=���Ii�d���ʦK�Q���nphX,���E`M6[=�$6G�
�x�*%��d�D���ik�4���?��;��S�E��P1�C�-�B!��3>�ׄJ���+�����+�~��q����_~�?�<�G�G?ī��;�����:ma�S���OaNO��C=��N���l��'��	9�H�e�4��M"U.��B_qTz[6_���{�~(���%���К����JLv�l�ѭ~�Cu��"#x�o�i�A��7h4#
�Ǳ���}i��|r3�*��&\�	�<�M�׵J"%/�|UA�c��|�5&%�J5��f���#F�\NM=U�������������Z��y�u�|N��F�-�,�ZDq�$}��֡iO�5�0��y��=������E�9��!>j'TG��O�)��0�)�/ԅwI@�%����0� >nBRD�c���.��A~0b�W�F�P�z4A��m������@��-���?���H��<�ƣ��68|��#``Lm�WfR׽2�5�n���j�=)B"2T�kk��=z=��_L�\NșS�Br2�TѮ�T\���N)j���n>VD� ���0�?�d�3q(b	��òX�háME���6�w��p(�/�` �u j�`9J8��@�x���HF�Yi��t[��@��0���P1/-���,���T�m+���S8r�S=�����#�/�`;}��F�$���.���C���,U��[��3;?�l��N��G���~�?.����f��Av���vg��e�������ߌ�<��|2���̺*���/�R�az8��K�=�3�:�ہQ��`Sx=%�Yu��	��>w������q�RA^
����[}&�c�9�����6�F��%;���YU��X����m��3;ܞ�(��1l1h��2 ɦ>����sZ5N�|�5����ߘ����;��u^�����3�yq�UD2�%�qxD$ӦbѦS��3�)��/�aN�f!�-����V����V��&V�3L_��������d�LMP&�6��RJ���eP�Y�B��5��2����ftk�Mt_��y�h�I����{�0J8XGW��6y�0�e�9x	�7�������G����~��C�Ui�@���ـ~M�|�Z�M��������$	-���2ĳ�\� J*�V�4+V�ӽR�v��YM"��5��wk:ܶY2�)R��R�kI�w
sDGt���H&�!`����z�қGw�_3�.z!-�`��,`�\%��Y�`S1)����d�#]s��ooo�!v>�ՙ6�/�wI	���<		��q� ݘ�x8%s	{x*o
=P�k�ڙv��*Q�(�15�(2fO��hy�܄��Q��l6-m�=[�f�h�$2.[j�dDv��_�}��؃� ��ӑL��ˋ:�
k���u�d�n�A�(� .Bq����!�p���X�d]r�#���M$�6�CXX��ߘ���-"�w�G( ����3�	͢�����~��I�h��Y*��^Ա��֞�t����;����L��jد3ip�Sw�ZF�u�(8���ڽ�6FJ25\�͟���t&�3���vap|��y$��� p�n�v6q+��� MP%%�]��D�J���J�j��Დ��ʛ+~Ew�N�Eg�H�{P�՚fES�u����%B#�M�)f�ʠ���F�uK�E/�Q�-Q&}ս�]ê�&��F�TJ�����m~uxH�o�7���I�����_�$2���L����)F}�Aj?A[@~g�m`vzw�>:koA�b�e
��|�
��޲f1�6h�\�	� ș_ X�����%�CQ�5`�(���(z��ֆ��!�X?�#TGժ%��F��cٱ�1.-�k�p\^>K�Τg5ϳ�4���q/y�ˮbD��]��-
�՚䦚@���|
�I�5g�xI��6쬓]���G��[j�L���WN+GG�MQa�$�����ЃX@��+Q�*�J�(���	إ��x��,�7}���x�Y�Й��x0|W���K����L�L)}A*�����ª�G��{�r��rp��9��*Ih���e��t~�f�.)�T�@<��tO�+��T����Ĩm�1'��'E(5�98�+v���ԥ%�L D��ddb`T�\|s]���r��-b	W�F�,���[�OtL�^�����C��k"���� �����<�_��@w1#D���5$^K!y� 
���Z�Vo�1IGJ)H��'���`w���~I�:�m<�x�0��Q�+r�+D��=
K�,P��f��~<B�YL��}I���ϴ��Yp����M�4(��@��I>i��/�3�Ƭ�le���f���#Zb�x{�=�k��G�Z�#�c�EIFm:�/�vv�
k�/�'��+�4��yx�ww��~�>��bўP oLUߠ�|h}|hJ��N�w�qo�Q�ν�^�uz�������Л����>ų�7����L��/N�E�c����ný��uQ�^aalru�&u��l���G,d��[�����>	��1k�Z��p��W�ޞ"���\Vi��s�:WG�N�v�h��6�N03���Y�RkE����j͖�8���q�4]��8O�|���-�O�ЋPu[�2H�+��+����e/�� ��t�����]�շ�یR�P��z���2���t�u�nT.����ar���W��p���[_�Y�ե�m6�Q�5�ZLƐ�3�|�.�WI �L ���OD8!��,7m{���F!�������ר����B>�U�U4�J�q�#���Uw9Y~+C���.>�Z��8(/K��c��0TOL���T4����D.�=x����Q��fUt��w���4�5mk!4�M1�e��p�7����c"��J7
#]���4���>�t�>��S�3�$��k��vw�tu,:2�I�ݰo]4�����	]*�^�Yݙ�+��dX,YВh�c�#����ZSݱ�����`���$d����j�j��P)�#�������,|��}Z���k|��Ik�w
�.6�5^[U*��۱�E%���y�����P��vNw�^��E)�~�z���7��?�\:խ���������o��xG*����X�:M|�K���4u��4vi�4V0�-)�% 4E4=45h\М��i>���؄8�8K,%v�p17��Ӹ)���I�q쥃b&;8u(�@�+�	�P��19q�9�mxڀbÞ�G	EÎ�d4h�0�%C��B.� �DLƄL-���L�2�P���	� ��E�{�`�=�4">�yi�o[�.Z�]�ڦ,W� ��o���b�||��<2�R�ԟ���?�ҫ� �@_x�ԅ�-L�a�4���i��*�(�6��n_5A� 	9������Dp��o���gK�{l�^��A��jq/��FWA/��be��x�Wu/��W˴Ѵhڳ��5�݌���͍��[t��a4u�����	�a�C�eǪ7��r����<L̰�^18�wj�Y۬�y��j��`Q�_C��X�����pBoH�<?��,�����?�GRZ�t��8�}��ޖ]�$z���� /B�1�����$���¿ K$��H���H�l&V� ���U�4K�e_c�F,�\�Pl �����}�B�&�(7���̙�Ƶ���Y�Ar[�+���Y[�j���53� h��γ���_I�-�z�J�
��spn|JA4<��a�|�]��u�\ꓺ�����L���TfTP���O�!A�� ���(�ڗ��)��+J�zR��Ҋ���۲�����
r��T�[+T���_�����	��^�.�g^��N�@������/��7�x���3mo��0���7��G� [p�@�p^�&��plkq^���n�6�=��Iv���u��7l�Qa��LJx�(���j�Y3��M��K�v�+>��"��h�"3���3]�W�^��6a(
��}P�5�����,)����xS��D̸G�n~{s����_+1�.DV�8K�F�s��n��Xv��$�m�0U�,k>����z��O �l�$'��	q	֊�:�Z����-���́��CCP�و�����;W����!��'UL�~(�z�w����YA&k��h5�c���Θk��v�V���.w��^R�s�2���7�3�t��&�6W�c���%���#��&4U�v�������u����>�Q�q	�M4�� �� ���Oܠr�B�lq"sw�hW���Z�9Є��	F�@f#N�YU��q(�S6<"�٪�%��۩�^�����i���e|�T$&(�/�` �E ��:  Oc��Z0� ~��iڌ�0f�)J�eAe����Ü!(".�\4���n��8�e�N���;��e��2Hf��=<�+�����w�_$�F�gv�iA��I�lIhĨ�N��4�4��f*-5_�8[+�KIR��i-�$�1G
i�60s�0��a���r�Qc%b��X1�H�(��e�-��T�́�F���O�gK���X��C�+)���b�{�R �t�.����-�lԌѤ�2�'����M��|�mcjW�.˗�u��;'rG�0Vn.�U���opqpp�N/�w���7�G(�%Z1\�b��b�iV5�� �ʂ��R-�S3�Y��L����p� N�zV��R}hF��U�i��L[a��!l=h=�%8ʟ>(2c�*��K/ýOo��8�3�1�%��ݽ�Ma���6�G �kos��s��Z�����1�["՚��r3��F�wwzY"G,��e��
�fu]��4�{A�m�X�`�E"�RhFe$4@P�vB?͂����i����4��R��-U�긥2X������;�{}�S*]�P��C �`+v['�i]_ꔄרO�T��f��N��{��tV���z��~�A_�����bxf���7�"�Ej)�_�
}H��]����U���=������4�=g:R��@���~�c�D�qumi�aK<9в���Y��S��a���T(�f�d2e��V��W
��D9��8Iڌ��C�b��W�nA�i
ĜBi�;>I\�B��ұ�`"�j�+�S�������� ��G��L��o觾���#�n��4"d��2D�F� �AO� nJN�[��id#m���o��,��(p�$G��]'!�H�:ٸt_�K���&��M꺌R%��d7%`��:�3�5��.7��.�.�?���>���ۦ���:'�'��`�L���>@P2�Ո2�/V�H�_�z�.���{M�����E�Ցr�De�N� +�Kr��V���Ks���({=[��]|� ��\gmDp@��gG'��ট�UɊN���|��ؼʢNVUk:%��.vO"��5�~�'Otɏ�{17<�_x��<џ���;�݉^����{ѓN��	�/����c7�����A��[��*^�>�n�	��`�7X�%<�gG��׮��e\��a�~�l_�׫�c_������jo��G��e�:��>v�:տ��Qg���>v�c�v���+++�����Ԫ2�Լ��ª[lk^UQز�1����t���(p�C���Rn�E_:Qܟ�f������Wx� <���7��t��Jw������'-��_���e�t���}�Y|$�d�S���@�D��^��VZo~�F(P�]ۗ�I�.����&�V[� �i�As|��D�tU'���^�W��a�_?E^����Y��B�f;����c��\T�p��K�$� zS���N��	�>�t��.����}ѡ.|�?���.}ӣg:���/=���>�H?����'���i?�07;�{y�!�x�;�ʵ�x��x�������s��'x�77���;;�����8�#��=�1�(n�����4[���vS�ʭfk#w�-��{p��L,rk97��܀��fW����+�؎�z�rW�A����l���~[ͮܘ[��܋���ە��^�9�����ev徳7w�܋[���͸�5�[�#7��n�&����q?n�]�1����7�rgn��ܙp�ُ{qK�^ۚ{qن��N�7�vC}zFI�P����O:��9�����N���s��'��o�N߳�>�&�,{�Y��g������է�t������a�Bƙ��D$II2p��!�� �9�dRF`�� 2�###IAirUِT6L�[�6����V٠�_��MiVQzr�m/7<lC<4�ʋ����BXtHk�[�Q�dN����.�N��N�!̖${�L�Ĺ�T����B������r��PI@�nݰ�؈�+�L�s��������9[�U�Á���I�%������4��S��)��<�#����E��w��?�'A���@�f0W*F�&h���YzD��љ�n�X��[�Y�7�]���D�B��;���֘�7�R,��S�/��>��En7���J����}*��<���
FH6��u��`~�S��A�:��Ex; {~��q.M;ǒ��_Mǖ��uLe�u�x�j����(�/�`� ��J=0o���������E�x	Y������p��U��F.e͸�v�V�AsR1���V#{K�6 B 2 �O#���f^,WV������#�婡$�d����,6SS:'gff��5@Χ��[��w�S�_Z5�`�?7/κ�.Z��Q�Z��"ɇMD
(5�H�Ċ�m�����m����o��+ꚎH?>��r�k��|]�����2�c��DE;�W�o���LL<@P
��:�=��B����*A�L�ܲRi'LR*�m�5ܦ��&G^7_
]��W�F��X�X@��K�����1+��f*���r=�'�?��E%�����uN��$=�-k�Тb��=�H{��P�D�8���NeL5O����M��'���×O�K�qL���.LE�CЦ|b����1�:lї�9T	RSCCS[remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://c3rclk54o5rt6"
path="res://.godot/imported/Grisly Beast.otf-dd443def2083bc2efd2eecdd3b35cf38.fontdata"

[deps]

source_file="res://Grisly Beast.otf"
dest_files=["res://.godot/imported/Grisly Beast.otf-dd443def2083bc2efd2eecdd3b35cf38.fontdata"]

[params]

Rendering=null
antialiasing=1
generate_mipmaps=false
multichannel_signed_distance_field=false
msdf_pixel_range=8
msdf_size=48
allow_system_fallback=true
force_autohinter=false
hinting=1
subpixel_positioning=1
oversampling=0.0
Fallbacks=null
fallbacks=[]
Compress=null
compress=true
preload=[]
language_support={}
script_support={}
opentype_features={}
�/U�qI�i�P�IlRSCC      �N �	  �
  r
  �
    '  �
  �
  �	  �	  �  n	  �  O  �  	  �  1  8  Q
  �  (�/�` MN �t L Z�\@&�N��	es�V��)FA!T�r��@�Ҳ!��C�FXP�,\w�$ h��N 7͞�]�!�i��R���\��pӸ�1t�ƾ� �6'JZc~�}Ic�a���/@-4����/� =�4,){�ϛ]nj������F$
�����L�Ն`Ư�������3IH�|%��&`bD�@(�VQOVV<���g1�>r�Ud/#e>F���X��+�.#J~'B�dԘj\[ZFz~'�X#G���go�,����?��}H��B<���o�F�䙊�U�;�S�N�(Y4�� հd
�i�(v��$ʣ�aU=<��D��$�Aa1�0K�D��Qd�D�j�X,�zD��xi�L#�iP=�ңXM�~��J���?.���?B�ES*ſ�c�$�aŤZ��D����o�&�V��*E��4�����+�����K�D4�T��`JS�?aJ$�a@5)�:bQM�Ȣ�'L�Tc��À���S�*�S��$��I�_���*U���$����FthT��4�Sb
��&��O;�D�Sb
D��ɟ��x+"���ϗ�y*T���"����Q��khKo��a�n����LñLǱF��I�9�;}�G���ئ�.���_,m���Y{��bNW`��"40�fn�`�Y�ɭ��x���ܢ��c�,�\s';Ʋg�L�ӕ���e��Ә?�M�K�X���诋ی�����۴ӕz�=���;�[�`-f�W�m����Kǹ:�s�N/n/��Ev�;.�J���Y�m�w�7n��ŭ��c�.�
�<����}z6�1�y���s��4�h67�$��ܤ&�?�ט�-�˽mޥ���d�!Sh#i���{��=�홋5Є������s���}�N�{�@wao�Win��ͭ^�]���h(��u��ۦ�X�t>��Mϱ��6�%Zͺ�\��0��}e�U���!��\���]�0�h����<ߴ����]�;������t�f.� Cc�f��e�,�̷�	M�t�,J�C��1q�$�w�+ފ�P��/I1���HtH�6L�$�E#��{�%7���˜�q6^�x�&/���Z_�!B��9燜�r�ȹ������{Y~����b)�Ҿ\��t�΢����z`'�c�]b��*+d�\�*|n�A��sj�@N��t:�Τ������q=�W�E��-b��]��b���_���A�.;;�M��*3������8��L�#����������dc��L�e���p��9[qc�1������8���f">3[0��#X��?<�W�a~+O������_=yK��	�簃7>�=L�u�a�a�a�5L�3,f�a���
��
�p
�p{��[��?:�?����77y�������F�Vr��|d62�[k]�E&�	X�d�8k�}|u����j�<�Z��Q�X�9��O�v:�y�L/�4�����>�袉Z蠁���k�s�<צ=����P�\i����Y3�U3�/l�p��7w7�����_����I���-zr%Eu��s�H�;���,Z��=d�������xr6HA,�I('�fՌ���z`]���2s8UQ��^yG�?���&�ze"�U����n�m�A��1�~a�"l{˶�l�k�M�͵m�mCmi۵qDx�+�P�ug^�6��~;�o��F䉍o���÷�|�oW�6ط���og};�m�qD�n<����x>���_�X�ifەzy����,��ǜ¯;��y&��y��o�G�2߮�[wԴ��x�Yh���]f6����ɼ���r8���W)��)-_���r:\N�Ů9]��]�p���![3�>���2�##��Q��z^��j�R<7u���N�|9��e�ˌr���p>�!J�eO�^��<�H�^���|dR��\��l6{���8�e��d���V�<Y��-�1SѰ��$!;�N�������:��ש\�}���SP�RK�:O)�:����g��^�,����Zz]>�I�~=�p��7l^siVb$>�"F3D���R
32#"""I�tp��"��6)�!KʨQ�e^$I�Y&�	�I*��LG-�X���&%CI����I��})
�t�1=IeИ�+J�x;w�Om\U�ct����3'�|#���Y6�q�RhlD���'�l��(*������Un�����/H#00�r5�;�0�g�ЂZ�q#>Ƕ��1� bH�p�~y�ӟd}�@�_�Uw8/i�p� c�AW3�ߣk�_�(�(��3��4����RϹ���F�<�+lv�6^u�T�s+%c���$�,vP�&_Z�pB���K���@Kr�&�:O���^�E�Y�$mԐ��h �.�bf�8�J����{�Q��	}ٽ�oA�4?�C��� s� |�c�Zi��ۈ/�(T'Ā��F�DB:O��B,D6��"(�/�` �U z�l#U�T��
  f�[\0���F��hk�kjg0W#  �࿢���
�W�,kخ�nx�@s��NǫJC'{��t�1Tp��:h�
dBd
 -)�	��0��T��
x��P��_�ཋ�[�7*l��r� �����{��w�{�w̽u���{vo�ޜW*V�����r����پ#��z���|k`f������h�]W�����y������`�8��������x)������T�a����ǫ�6�1�XF8���;�=�X��*��e�nX�ꥎ>X��Bѐ-g��*M���t�Ҕ�J���!�\$IBt�\b��b)�j�~lH[��%̗�|��d'����*���B�9{�6#
��%�B4Y��V-�tHX�
�ĕ8�B�3��1�lj]:�̎������d���ξ�p��L�#N�Y�[a��`*6�u��o��ߌU��O�������[��;r}���]�����h|W��g�����R|k�)��{���\��BVk�+� �5��Z��0��绲|W����^�{�c0D�O�����%S١�R�ř��<`�A8�$jl����I�cI3E��bOh���F�]G�K��Ո�+�m)I�7��C�j�S��:~׿��]=22Y� �L��?���2�Xf��̺e�-�l��ej�k)kC�7��na�%�;�y_0��1o�>1o�y����=ļ}x��ffƾٌf8�U
; �8����:���*�4Er���H&1T)��J��V̺�����L��	Y'�O	$�D��$2E�)vh�̕h�N 1t�d �d4���M�	4�J�2Er6$Z/n���Z��. .d)$�#6�ѩ
�����)�Z"�G�
�����05���OB;���f�6�g&��B��3���"<3���g<s�gny�gN=����F����"��C^�:��?^��z��u��������ך��Ҿ?�w�w���|m-�
�W�F�,�o��1p��T�CHs���x�0�t�5�H=���Ɛ Lʖ�LX���x1!AZ�!�/��n�Q5�N���+�:[�a!,K��5#���@q����H�đcAI�~J#�U1�ks���)�ʄ��Z��Z5���� 	�%OI��҉UzNT������k�Þv�'+7��,qp'���8�,+L�mS���������X�@��S�=���®xbI����������΍����tY�{Ⱥ���f�?��c�=֭c�1�o랭�\��gs(1t\����+��ⓐ����m �8pa-i�`@����7j�ID�˪����TM���S����6⟉�Yȟ��ل?��g����3����-.�s��g#>����0�戺]<�n<���0T'�p� ���+U�T��J(l�Z��+8�c:�6�ˋ\��<��4������=.�qy���o��.7/7���z���-���MY M��x@�kǒ3񻆢9��E��U!�`��^j�IEK�'5�L$fQ��aKf���sd�
�Y���b���B0n6��(�y��hj�A��h�D!tuv`(Eω��CD+Q��1Kc�4A&��T�9"u��E����n�i�"�Ln�	R�^ �pQŔmw�"@���)�T�i�"�N'��4�K	g+,a΂c�;mڙ�p�HS�����Ȼ��ȻMx�����<�=��-����w���6�.� �̩֗_�l��\�-����:M7r�~W��:���[X���CX���w�.cu��X�duԪ���w�7��K�� �BɌ��<#�ȓ�x K$������|$A�Xc���I�"IXC��0Ks$e;�<�R���B� �^���U�`���*Q�����>���?�������7.=� ����A�E�[���Zk�:�Zc}�rX�v8&kC������M^��a]8R�4A�{�(�U��$EA�)R�u�ӫĔ�J�T����X�/�(>d� ��,�cq��X\��1���-n.����g�j2����GDֲ^X�d,�ڗ�p���K`���.֦��f!xy� ]^��:�L��a�ɒ��	�RTn��LQYa���DF2:��M]��1���3Fo1z��%��Fэ����'�|���l}�_�;zC�m���朗������n3�Vf�Ĺ)I"�d~Hf���!C�K4mr*��۔$�3���Q�uL��,�#�� ��V
?(�J�c]�x�W	BS��ZTe���z�@�ɨ�(�CȈ����H��p��@�-�!Q��gP����(������K�|.2 �T=>jn8���M�9(N(���}m�����U��I�M���{-ϒ~L����?��˟����[�'\�H���~�����&v~ː�%�8��i�l
�͊���'w�3&@0A�����7)����Ui4M�^z�>/�x4�S�jl=@��؇�b1�
0�VA���,_L0/P/ R�< �8�Y�6m�SP:���%�Ñ��n�ɂ¬G�<����,�+)9DJD��C�W����oI��,T�\�����>��N��	:����q�*�ǉ���������O��ς��^���{��ʝ	�4x|^�(�S��vѪ�"ˣ�d9B�Y��7O�%7W�V7�hQ��� �R��̕��o(�Y[L5�TL/ܐ����s}��}(�/�` ES ��"T�PU�q��8
�Y\`=���`��?%��yd���"!y�Z�q��@��!Z[��g��W�'I?�����k�$�����u��_w�",���[��pč�o�/
q����nct����.F_1z��mF��e�tt��#����4o| ?��.�BH��	��&��+��V(%�Z��B�e)C`(�y�?�ab��b+�`��9�%B�F���p�JrJY��Y*Gn*�f�u� *�`8R]�v�0�ka�L��}-�o�a2U��ӁN�9��t��wN�9=����gN�n;�u:�(�ӃNo��x��O������ou*W�q����U����F��ٵ~O�w��s�g��"T��U*[!!��Z`�"'g*HTk#�(�R'�Id<ɵ!D���;yB]J���)�B��"S�R)(�q��	{�ӃL���w�;���$�l���p��u������F�,��B�	��A	61,nx��EKq�r&f�e&��L���L�X������	ESu*+�O�/s}*+�.��&S%��0��9��U8E��56��y��_l�bs��l^�y��,��6_m.z��wG��߲�{#�"��@���uϯy~��k�_�����3���q.��s�8��s�8��s�8w�sۜ[��-�N��:��-E~w����{�����B�D�H�t�@D$ڗ�	X@�|�Fы}�t.�N:vf�^"gH�����r;�C�ɋ��I���$B�8
IXD4q�Z�)(;�7����9������<��/>o��q>��<�s��i��>���r�7��-Ir��}&g��u&ϙ�f��{��&wM�M�D�AэK�/n��4��ݍ��RϾA�I���`�W)��+תT��k%��i%rB
�"��,e/�4KTI����F4����HH#T��RbNT;�'@�H)�K��KK\%�H	$E�ND\JL��$br"s(9SJ���ń3��]넝�r2V�TR4������M卯;��>����3���:���~3����m��f'������.D^;���k]���=���εu��s�k�\�wm۵]�j]��(Bv?a�wwvawvg�����]�����[��2캿O���o�-¿9�7�?������ߵ�0��!�8��8�`=.O�M�.��Vɤ2i&:v(�(�+5�X�̖����x�l%g����luC��4�n�~w%��s��z1�[t��u*Ih+sV�j <�Q��������D��R�؋���Q�	�@��
J�H/f,�B�-�IU�)�� 0 �&�"��Ti�1M��%�XMV�����T$7� TB�J4���h��Q��7��/���u�k�>����x���*^�y�����Y^���z]���!ݡ�߲m������yn߹]����on���w��v�m{�m0�[����w���9fm�Ncv�Ø���+fO1���2��̞�Κ-�͛�ώ�d�|�]�a��uq��Z��<l6�x32�GI*��sR�c(F�R� ̘�(�D\	Z)Q�Cgm���Hm�T���<T'�B22b�H}�^+ Lh��� ('��1�0xx�`c���/|a��t|�>K�
w1�T�X+�7���~ˏߝ�oP��,��o����z��<�אַ�z��7�Ϭ�[ݶ�kU=h������7��[�����]�o�B*~����Y~ڿ��7�t�������/L�d�'3�RJ�:�>3v��A�pz���i�&��$���j��pe�R��e���V*�E��P�5n�q{��_���v���^s{��,��n_�.ju�ߠ����=�����9�߼>�z�u�����׵�:�`��
�m�ưeư]{ŰS�f�2�nv:lְG�߲������,�<�O�J%Dv�Nd+��5A�Su�ô"1��T$�u�V�IҠ�"b�j��H!���4������t?�TE��l" �ءƑ��eg�RA���7RJ�7�IM5J�f(�j>���$I��)�{"a�����e����\�@uÔ�c�>��Q����}7v�����}�n��g�c����]��8����;���W��z�{���Ͻ{��s�{��;��7���m���^�{!��9�1p�1pw1�O1p����e���Y���y��o��6��"|��o����>�m�^�]�v��m��z���0����(�4#""""E�9�	D�� I�R�J�~&b�~*A�����]*sd��{ndP.��;͎�3��h���� �BH3�ڝo���ў��qX����E1��F8. #�2��Gu=���03�b��=3`��I�wD;������MA~������Z	u�-�/fn�-a�>��7P2���ԑ .���͌a�I�����Ý�͒?L�{�poș ��/ki3�.��1�?�X����8vW���W�k�v���L!�N��q�Ie�N[zv��j�ب�uI!���øgX�TM:XH#	e��oM��pm���>^q��<�Q|(\�Ո���"��֐Ҽ.rq˧c��Sͅ��w�M������G��s9�V���el�|�y�V(y���J�z��x�Hv�n_�_9Qt�x�U('F<��1�߈�600�(�/�` uW 
��$SpXQg[�34��m ���-��>lqp�&ɐ�@bѽ�/���&"Iʰ��l]"�����*�}�-ִq�̱y�����������_�0:6�c6;w�T��"�v�ڸw��T��;�?����3̎���Nd���]f�����c6?�-ٓ�=@hH��[{� 0*��2
z]-��H��NBX��N1�
5Rb
oHF�.KEz��`��Ldj�4��~K�L���kXq4[�H;a~��=�	b�@Wđ��R��[sȉ"Q�-V�w�G�a C�(`f˵P�͈.<�̀NE���n���Ff�!�3��u�����nW�[�[r��Y�%���ݾ�n�n�+�lդ;E����mJF��+v��H!�d(
�"M#$�$��ӉJ�L�[LJ)e�P���Q'��N���82["�X�����j�kt��^���b �����k%cgj�"4�
��I��)
1t�RV�X54wI���ĝ�ۋO[��[�R�
t��vÉ*�U�-��~N�>ߒi����(�;9}��IN?r:��CN�9�t�t����c6/�_���/�E�����_��f�.\)��
�u��6FK7[�L�+wm��Bc�Z7���XR��xib�W���d�|>�[�t�cޒ������"����w�/���G��֍��u�.}]��r�2]H[����G4,�@��""P��hJ++!M�z�)�hL�`x �}����|�3bp�f��YKV�p��T�p?j\!Y���ujI���dK�(��R�#�7\ࠀ0�r$�e���D)sL��Zv-fK� �׃B�K���*�J+��Q`��7��\���u�F��W�k�n���Xsi`r$V����U�ु�f�X�jw�[���������<����g�C�3p������%{�Ǣ{~�ܒ<�R�e�M�d�H�md�E�d�9��~��Me^�[����+�v� �z����:�����G�:��X}f���]��ԭX�E6?�-�s+,W�/*2z��_@�j��ʕ:���5˱Pۉz"3����R��g��^�,e]v�V6"]�MC
��������T'Y�d��Z����Ws��T(�$�5C��L�/"���C4�HE�*��۹���&�Gy���/yx��y8�Ç<\��8g�{�����v����nI�?�۝԰�ʰ�[ɰ��Ȱ�Ȱs�-6oدaL�Jٜ4 �Q�g!9>B��Gb�Uo�KH%E6F��[e�>�[�V[ʵ�\�ɵ�\ɵ�\�ȵ�\;���k���V�ʵ�'�v��E �Y�'�u_�H��������Or�CY'����ݐɑL%m�b��n���av�c�j4�#=�3�ꆻ�^3~5�G�2�f��P��)��Qw���Ǔ<~�q�Ǉ<��8������ǖ�{̩�4Gb�'�3�|��Q�܃͉l�c���l��������7�����JkiE�Y˙�rtC6c\�*��lfj�x�Ann>]m���:V0g}�\N���!�-���Q�e��jz���Չ�H�AD�.�ϕbAG�ǎ��D���j�H��Uc� ���@4 Ќbm?�l]��P^o�ב�n��"�y=�u���_��T^W���)�C9���JNGr��Ӌ����Ӆ��N�R9M'�\n�y���i�{vW���A1F)�W,�U5�0&E�ZX`,�3�qf�Bg$�G+E6 h�6K$�":�|/16���I�nU)12�v깂�A*��^��;Y色dX��/w��\��+�k774LT���`������p�� �g󝾓<�����FN������@����ؘ���^nI]��PFo2��ё�nd�"�=gt���_��TF��zʩ�QN���KN���GN�s�!��95Ωu�>O=Jݮ3�>3����ޮ7�⪻�ѕSqY���O.gr���p������9.��|w9zYޒ@\�>hCıw��E��:p��<�(�cj��?ۨt�X����K��($*�LP�͎	*���D$�us�d$�������74b�l��F+U��v����	�Ko�|49�*5Z�p/���B���l�'H��p�L��Sէ�FY���KVO����yV����8����V?W{�����8xO�����ŝ�`T!w4����p1&������BWGO<:x�D��r���b��l'��f�D0��n�w[w踡��pp���IT�P�.'#�Ȍ�\o*��F��O����3��{{po"��q���������-	�][n}Zn���yK�r���F�����W�*��+��R�������m&g�lF,�C�OX���8����Ĩ�,È$������h��3;@��$I�+I�c��:�sI�.�W�p7��η�\e�
���&U��@A�*H����n������_�t��c2��b�R
��N�XY�+��?[�1��E���e�)���"��*�L�.�K�F5/�Չ�a�F�w���=1�;l6�)JC::�\�!�~����΅��6��3-q��&:��hD�������򸐪J�B^��=�k��^p+U��k ��Z����Ӛ45i�Tr�XTrBf�ԭ�� ���[ͺ��9������V�Vh��o�����w��_��{���ߩ�#���3�16��C��Bi���YO<��@D��.�?��E�T=.r�E�is�
&FAإ�(�KNl!�2L>����ˡ��/���ذ��K��A�g����
���(�/�` �W Z��$Rp�i�e�A|(7k�a)g��hu�O�Ȩ���{Jt
�)!#�5(`T�:�����Z*����@�om�BI2��<���R�E9*k�|����i_q��AA-^,��eD�V%�(�@�
SuSi���Nw�0�S,�f��0"���EFBA�|B|�5#�#��8.�-�¤+28�6���YR����Y���S�W��5��&I���G�R���G]��(�����v�����嚩�P�����NX@ �.`��d	X̥F3ORF(H{o6t
�	��vwuU%�6�F5Q;�v��ɦ{�j5r�v�;F��̍��*�g�f�X� ���uU�����O%�b�����9yM��<�c��|�;�c�l�Y@wۑ��,F�\ r��BV�L��eH��Y�U�LqY9i�x�W����p��[�ړQ�AOhI<�Z{c(��Q4�\.+gz���h�@�=m��V�|3?��G�r�z�������neI�j���ݏ��'}Ug^�+չ��=*�Շ��2_uR6_���͓lγ���H6/�y��7�7��yiYQ�n�ds'��է�A�����������=���=v���.�D��^qr������j�3gq5�d���/4ʉ'`Å�D9	�r=hn'�͵��X�T�*3�� �|��	��hb�\0�q-��S Ԁ��f��M�"�= t��)�GN�&GE�)܍�Y�{�r8bb����̠��!E,�� �j�e�]�O�{�Kk�w������}5�W/�ڈW�j^-ëQx���j����W��~�Z����:_B��<[ɳ�<���;�F��"��y�ͳ��~y6���&�f����}؜��U����l�������q��lN�b�&L�{9�3q���r��qy��py
�p9��\������Ѳ��t����5������Qh>�TM+$�<a�E�K�~5�$l�[�R�����}Q_�6r�%R5fZ�;�U]�Jcc��`2c��刲�KSU^}T^S2ٷ�۲{li�e�=,,,��U�ϙ\�A�3� aY^�����X��B�vf�Ur �F��`+ ��VLE���2�З��=0��|6�J����h�v/�� 5r8L��~�6N@�u�t��zu��*_VV^������p���G��w�����5Д聖m5��Nz �r���#[�A���@
�HE+Iշ#S���k�1��%��Z�q8�.m����qS���=?�-􆺦�B^S�d�e�
�P���:�n9;� �!q00+KLE�����,4Ju 	�@K��b����G�a$��~2v����U^���:��l�8d��V_rp%Orp������<��7��ః��Lǃ��j�է��G�b(��驰p�-�'%cI�D+�^-=3'@�m�$6 �#�z���\+�M��@��� 4)c��I&��R��q���dv6s�;L2�� "�Q�Ek�\&�%�*K5���1b��kk奵\e+Ot"t4����=��i��q:��p:
�{p���}��������_��O�W����zM�/����'�8��w&�d�E&�3�'�2q�D�M&��W5ǫ�����$>_?��s>W��#�K�9��6�?�}��9I�ϳ�˅�ű�)#oT!��j*� F�F�VV@�M�͏]ʆR,2��фR�lʦZ�PY�O芑��<��c��%I�Ag]7�{��iG�q�Z�E�z�;<G�t��tR>_�ϓ|�����H>/�y��7�?��y���<���C����WEºYg,UC� �,.)�� jh�����Ĕ�
��.}�p2��7�U��`-jtE�����ʗա�o'\�b랏��OqO�A�]��Ɔ�3@�z;�1�!��%��x����-�(��#-o���G{q6D�8=E�8�F�""��5���v?���ΒǕ<��q��wG�x��s�y\������&�$�չ�c1�~��B����3�����Nd��0:���ӳ�<�]`��fXtOR3��MfUg�!ʹ'����\0���*�j1؛���=C%���Q��P�E.�n�_\�D���Bݳ����^�ZL�"+o/��I�z968~�`���VJ2�LQi�Y�pk�5�T�x�b�4�13�l�&��j,�f�*����9��ډ%#K�4-],.�=�~23=ߥ�,o���������U}��JVO�:��;�#Y���9�߬.\�euتz�Ur&��FL��<L.��(L���C&�1���g&?'M��j��'���񪪯*�W��X9w��7�p��ܫ:�b`��k�PD& vF����b��Ԣ�T.�Z<lP+$oǌ�E
�ɨ�0�4DFFFD$��p��� I�p�:�\���.�`�A�R�Ռ�W����[�;���b),�1B�����
��j���آ9RO������%K�L��2�K) �h0��+Kp��Uv��9B�K���R�8`����D�ص(~�X���O�A����/` :�I�S��lP��Ű�*���o���]*|��  :"��{E6P�@Qf��u1�c'���\c��`�X��;B�R7=@Kջ#�`/LO ��1@T�H��}����J�i��w�ߩ3�ޛG#�b�� ��sҭ�����_i�s_p�!��Yc������R'�Z��SA�O!��쒣��c�a����9`E��F-qK��e.�;c�.���5����3�
��4j��WW=Jw ����^���[E��R�d�	1D��\�N��seũqz���ԅ^�`܋��yT(�/�` �X :�T%RpZQ���C�h��t&a��9��&�e����iJ�ͨ<E��I�e��&�D��UZ�/�h����������w�:��K�NA$-���"�L܌��v��*�e�ZB8>'��Ɉ��*U#k����Z�廝��z��n��J���{y�L=�N������Ƽż�^^oJT���=�ӡX���rz�Ӄ8���KNOr��Ӈ��������N?O�z9=hk�Tk#�ۊ+��m��:#��PA�k͖Q̌���&���[)a&*6怐��$g��R�q4s��C fF-�X��,���ȕVF�%�`��h���������wBv5��e����1S.)T���l���@�M���j�F���T���(���D�6��f^U�9�O�й���j���4�ш<A�,ij:���RG :P�-5S���� T�%$��!�7�JJ<��Ϧ*��f��::�u&B�P!�&���Wt�S�2���-i�9*�P��i"� �v5�^tw�`���f���$;�L��X ��MefB�MDm��23HScy8��]M��6�@6���ן�wKy7�w;y7�w+y7�wyw�w����ݹw�޽�k�羛ʻ�X�����s�D���` ��R������_e��Z\+B3�l���pFF׸Jˑ�ߑ0�| ��_+4$_/���+�Mst^"AU���ZP�*�X�B��%�^%R5�f)�V���"�VP��I�B��[(�=�D�00�Z��Qm씱��M�z��|UY`�]�Vag�0:;(1�����ІXP}�!!@��ͥ%�7d���j:��jq�������R2k�jּ)�F�{yz���J�����$�KY��Ng���ő,^d� ��,~�xnq֢8�E�vJ�z_����tP���0vv� W�:�H*�J��j��2��*e��9
*�Z���*�����-<-zʘ�U��"l��Y��P�k� !D�g�G&D�Pe	Y�NoGo��!;:@Z5��_���{[���hJ���Nx������j���؜��z����z����gc�lv�g��&�^��$�6��!����g��}{��L5����(|=�F�Z��
d{=�^��wPE��#�����hW��#�@j Ҳ��^�{I�N�XD���z�]j�]1n����x��)��xN�!"�h,��'���`���{M��X )<�כ���r�@������t0&|�xPͽ��Wud����+��O@���)S��7�@����*K��$y�Ƀ����K&O2��ɇL�c����&?'Ƀ��n���Q�#����u�|��S����D6�����m6�m�nNڵ3�|=�^��v����r#�\�B�(�6<e.f���N�+](kf��z��O�Z�&C�R�-U㣲X�
����Hs��%Q�d�� C�6~7ki39-\ bcu�x�8�#���C MVZ�i5���<\I���כ�R��:�՝��du%�#Y���AV�Y�f���Uu*��zڶz�e�R�e�N��d�J��d�E�d�>۾�vn۬m��l�}�y=�{ŉsΝ�ŕ��p2����E�j(d+46���z�UpH2��a�����J Tv�J�`QDb����R�3G'GM���p��k��BO4e���\X~�A��U]���]�ʍ�.}m8�XD&��兒��T*�F'��<㒣�Y+&Rk�N�B*o8��ˣ�|���j,^���� ^���K^���F^=��>^���߫o�>_�^�-�u��q���d.���ࡠ�,��l�<w$"�D3���Wt+���˟\���3\���G.'r���w\ns9�r��|=���������9�q���%r7֞��d��f�����Ee��R8�D%N��A���Z��c�8K�x	�x#�Q74J�f�,+��jv�'-W���xX=��8��P�˄��L֦��f��3�����i\|=��
�{=�xc1o(��;�y7���y'���y�wϼ�����2�Ue^�dp�9�:(݀a�Ǹ5nA'\,�oh�j4+�F�����B����-���$������~z#W����\8-�L2+�)�h,�����a���+�Mk2.6�;�u��X��u��֝º���Ⱥ�{Ǻm֍[7�N�z
_]^��^O+�c�p4r�p�.ny�:��ׁJ-%������RZ�
��DH�A��Y���
���"C��șC��O!ѽY��p6��e����lLH�ڰ��T�+L��eCY��e3Y��e#Yv�eY�ϲo��[6k�l*�d��+
¶Ͻ�O�߾��΁��$�`'ƫ9O��:S,_�^�c�BZ)�b�T��c�~i �A�h���V��,����Ǩ�$�4��Ј��	Ryp����H��$YcTpk�}iN� �VdΚ����ض6�N�#����]����,�2����h�)yD;Zd�9�E��`�l���w|ɞ�T��XX����E� �L�,��b|r�&"zi��G�SR�BDy�ד��lY[@"FQGD"}�ڋ%�j��0�*���鞆y��C#w������I8@?Q�=%���PV��)e#�SM��t#Ѯ�cئ,T�a�6��٭�~k$�o����'� 3)#U%V�M������!{��Q8�z�B���U�p���6&�w|��f!�p\Tl�z<��\fj�{�(e�!?˽P�Ԁ�J������%��}�A�w�!x;C>i^����~��ϣ���Kg;7�� �]�F�yR�ɤ31�o�gq@B
@xs����T���F�H9�$�ְ�6P(�/�` �V ڳ($R�U���Ơt�n��n>_K�D��S{�M;<F�Y�8�A�lo�PٮMOܥ$�%��@��Aw�m��']�����߯����R�(C$	��x�uY%�6�HVEQK�x�8ɧ}l�EZ�v7�Ő�.��,�g�fdqYP
L.vY�F��s�1���"y]�R���[&?�lC'�[p��Hۮ�BB0=h�L")df�%�B������L����\z�����r���Z�qԁohK<�Z;�8��q4�`+'g��$�h�@�z�p@4x����U�F�/���¼[�ss�}T�+��ue��l޳���y6��\g���l~��ps��M�#�j�
T��_�~]�^�q�s�t�um���I��W��*����*.׋���_gs���4��2`a i��� ow#G2ڝ
��E[�����N� 1N�,�Ƚkjf^8-4�[���|<D�
7����x&/Ƌ�N1���+��R8=�����v@\��w���"]�6�ʘ�|9o��w_.�����n��rÍ^��J_W�+���?��\>�r��w.׹���9��\>�\w��rӴ�#�+qOm��G,��:u�S95�rjN©}�:ǩk����c�M�	J���W ���U-��][v���k5[����>lN��,lds
6���fs���M6/Y�y�h�L*.Gb�qy��p�
��p����˃���i4A���2k��h�}e��.Xb���jJA��W*��Jh��ac�R�WƢ�N�o�xM�b����h�usj���V��l�7�#�*�M5y2y]�h�.q�����G����\�W�>7r��.�b1f��):�/!�l��R�x��ez@H��^ ��h�NX��TCc'���Q9`�(�f��{kP��՜:�A�iT`�@��vs��p�Pks�1K+�����r�|k�/��ww����1���׊�5��Hn�v2S� Wс֫aa��F@b�JR��ȕE��Tr��}]�l$��k�{�q����O�j6+K۞�.a��^��̇��D�Z&�H����Sa����P��
��&x��T�Z�D5�������.��㸀J��˒���d^Xɪ�f�QТ�~��
��=��������cY��X%�&�Q[�jɫz��� n����]��L�(�u� �n憁��2%9B6[A��$+ �7�8+B��BC���ĕCq)��j��"�Z�T|�n �7:6ั�i�V��W-f�� �� Ĥ���5�N��ɲBh��n��<P�A��� ��h��P��2c�&��ْbC�kQ���/$.#�"��J�yO7r�^�t"��p���U8��}�����Ü~�;5_�h���W ��X���=rq���\\��?.�s�/����b�#��J������O�����9���y��)��s�υ��>7��d��i�ak^95�F�J"R�E�ca!ѓ���V�h�b�����U
-wy1��Y󡺱Z.(M�7��J#0��-�3�Q�A���Հ������܌���HD��;G�\��x�|�����y>��\����|~���s����#��y,(U-��Ge��*v9�-.��
�,4���V�9�f|`�8'��9�D%ਪq��<er�خ�el9yya��l�1ď�8HP�G���qom��G�.rk"����Bn�­A���[�u�[����u�֣�+P�uu��j�\���C��s�k�\�ǵs�}s�a+���?��<>�q��w�y���9��<>|\���q��c�fy�ѩE'b� F�a�F_a�F�`t�0z%�����ӫ�<�a[�]І(#tIV��׍fY6w�1ʹ(��� �`,��eʡ�`q7�b.������R��`�ekq���Pi{J�dtO��fS�LXVl3Z
���Z*?�l�rljt e����NJ2E�LTXZ4\�ތ�o�á9k-CÖ��$F��P\�Ԃ%\`���ADA�hdɒ�%,v�� _`|�k�'�@'�+�5HU�Y�g�!�󬾳���?V�Y�f����e��GVɍL�����<L.dr&ar�瘼��0����&I�U�y�)��w� =c.��Ȑʽ,��E���^��dt�aa\x�^f�Y�:�l.֊)���	� ��*�^(NuM5����@J�%�R�/�*�vvl��B�XXZ���T%aC��������*�엛���N����Xbp$a\�Xy]F/��geF�+x]n���,|��y��p���Xx��o>\�nᲅ,Lǅ���*�+��H�D�ir��ʨ�(ÌC�����H$"���@�� E� i�����w��)�ئ9RF�C
|J/I�&�rX�֯��iq8e�$� �;b�S�W�J�∔�5~��.�� \��D�����QY��HSL�����%��A�;��b� ��@��V� V��-�[�����&�X+�C0���4r�~��Q{�5� ��� �1�iV�0��@�[D���|�0�P�7թo�LaI�J�����n�J����i@��eE|�&���p&�P��5a{gؖ��8�
6B��j,w <�n,wV���c����Y}S�.ߧ.>��C܎e��� .ܥ%�4�RP��` ��OC,�]�5i��5Y=\�iD
�WW֔~4;	����mX��/�����	�����/�h'��sE������p���MQ����]D��gPa�q�4��eI9|�j�(�/�` V *��#V�V�3�/�*���z��g0`b5�"�<j��F%�⹃���������]z��UY��^Yq�������������o�e����_��L?�q���+�j�H#�v�
��f����.�.h����f�:�x�<'^��75�Li��kO��M�e]��]j���E9���D����Z,���,9��Ӳ�ͬ�QVӬ�y�f.x�?��������7�]r��?��D.��E[o�p�4�W_l3)̘+X��V=E)�Lc#m@�VRx�6%�<:�Б��F���sB��e��e���_�$���ej:}<&U����r:{o�~�,%�=�N]��B�����+���ǒ����^�q�{L�{#wO���=	w���w�=���q�1w�r���/ݽ����{$w��A��w������y)�.���w�t�7��I:O#I59(`D踠�Z8TjM�j���I���]�Ct��))B���J��#���שùAp]n!�<��rΑVk�̒�,iVS�f�,7\����ծ m�bn���<,�"���?���]�A>#nd�?,S�(�S�$1)h3`Ȩ�hdܕegc�3Z,~���b�RE-�i3-���~���2Sӹ�����p��f�ٴz~#�f�o�O�Ҳ5Ǿ1�c��l7\{˴���d=�������� ��-�x�	7�Va��'4i7�yjS&r�N�]��PLT�'��y�8�kFJ��uºb�6Йس���<�����)�`�=���Jm��@gƖ)�T���Cg�f�k6T�g��s�	�Z�Ul0��@Y��ͫ�>����{�~�ۏK���4x#O���<	���w<���q�1�r�/����<���"w?���=���q�9���������o���{^�}�W�C�/7�!�p�um=Q�|3%̘P��*f:P��R�A ��f���U[4]�V�P\W��;���JI�*nxFk�ܴ�U�S��:�!�gN���~#
��K��^��Ǿ��9/������m�����ah���B�BQ;O�tg.)$ɸ�')T�B������F"�<�M$M��DkQN'�B���mI�Q3�e��P�#�[>�9*m���b����s���?r�9t�	]}��r�A������Wo��uWs��շW�^=����2{�yo��e{�=h#�:��hy�`5�g���dZ�v�E3u�9-�^ &0����P����
R�X��z[ZcJUC���YMG[fio9͂[�LrΑ��l��ޗǽ��{)���/���\�mZ���#'�9�!'�䁜����q�6N^w�0'�|{��I��K{ܣ=.[<~[<�������p����+nN2���p`�́��$2F$���ܙ-&CwXyņ[ɧN���P`�X��OT��D5m�3=.�����7~�\<��r�$\����q�8.����\|���.�tQ<��bz���Q�\�N�0n��L�n�i�!�DM�񄎭wLm��
B �p'R&72,Q�
K�Kc������t����)�/h�ǒ~��6�gzlb��or�y(;Y��{&�|:��5Q��)���z�R-҉���^�|�u�yyP����Z4��)��d���nY���8��������[��>����pp�O�Tk"���z��=�܏i���|������>����~�������0߇��~��+9�-=~�$9�WB^��&jjF_M�����=��n���Y�~��4��<� ��=����{�ǽ�������z�[��x�E��W&�y�}�(�%nROa8u�µWo�t:�Bz�f�#Ph%t�)*�Y��� P�	k����h:C��E��!h�N�8�H,{��T�|N�"�����m���ƴ�2�%��`�T+��'e�V�i�Ht:K��N�$�@��iIɨX����HdH���s�wI�@�n8W��6�d2�dUn�s����G�ӽ�ur݃\w ���u�q�m�s����^w�:����~\�v7�݉|w!ߝ�������8�;����S�;컗���w��=��ҁ������cg�<����{��c\m����u�١�|�Wu����j2J;�4���h܍��}&(l:A0�#@.8��4E��D�c��`x$ى'���b�#�,�F�;���#�:"�Q�lU"� ;�2bUh���y��7\k�ʅߘ�s��yW�u�4��6�x\����]��K�����1�y�k��M��)U2EEӋFBk12ع����3`�r���Z���j�D���^%k����'A���4��J������r�CFLD�i`�;; �Ap�i*�e��Bt��U�i?�4���FI�U��q��.F�w�G�<[Xי�{*�6�i�$ѕ&	K��9�|}���G$��h݂q��7^��c ���?��.���5J K�W�!3'Q�)F�7K�5�%���DQ�2�8*����ڃ��Z��Ne#���(%�9�h����([%8s�J���۔�b��:��p�E9ʒ$���ā1,&�1�eW�o�&��:o?πW�	_�.��%��>�e0�,I �]��ð�#�NJ �;ﾞo��s����r��KZk �L��.#(�c�<���Q���>��|�˓�X�?���
c\�G�, 0���	�I���7C��a��3R����.�s'	=��K*�F��� ��NN�It^�Bd��,���fϿE��*cjԇT(�/�` �M *�8 T�Qg� #�8�D sb��9�M:Z	0'hD�,r���F#4y�W&�h�
mhQ\c�-b��g~��x�ۣ�b{<���d����1�I��2��5了������*NdQ<��=��X���<��X\gq��m�->[<��k��y7�<�g��.G�̫��~1��7x���g��i��jjL�)!::�d��pĴ�PR>${B�}��8�oF;�}�'D]S���%*Q,+CT��It���P�=��8����x����Ⱥ��͚Ȭ����Q�u�Y���Ǭy̚g�9f�3k�Y��7�٬S��������ݛ������m��
y�#��o�JY�bQRO��+*=��J��ZKK��+S��^��|��H���J�T������FR`�iz��V2��R������L5ZKER⬝���)�c�J	��S*��	E���z�&k�]�yEPi~��;���T��7�sm,̙jq���������½��ln����[�L��*ٙ��J3�������C�H����l&�=�[z�Ko���F��$>����{|��s��|�����1��>W}.zU���H������0̮�� �^���.��-f?����}�١�S3��O���'ҏ8=��w8���S8���)8]��c��;�=�<=���[n ���˙	�93�d� �O�l�|5 �8�|����`+����R��+=�Au�(�+=�t;��ILd����|��:&ߙ<g��c&�M��$/2y�O�?�����y�<�_���m~�?�S?������y{CooO���L#>o�qS`���t���?��,�H+e*!Qgj��^LN���h/�fr��jK�b�}X/�l�c+��~�Bcc,jJ�YST������|L�4���[��)��#ж�RYM}�������-&w3�PP�BW�����5K�4@CǦ�\�J��J��T��
:SC�⺢s�Jeh8�:Y6rK6\��)KR>��~3-.���$��hc?���咘��]!�u~��M�gS��T^��ލ۱����y7�n����2�!.�G����Te; �x�D��#��U�ij�@��Z�;&�Ą�*m��F	���ZR*Ia)!Me���{�]��eYY	�8�s{���z��};\��vrITT�iI�}J%�^)��O�Gd�Ȓ��䉚2!�*RT;G��0������D�%����F��G�-_3RŚ ��jE�,(�d���kDݝ��f�ty�QA��4".��YU�z��>V�:��9V�Ygu��q��VO����.�����y7�vq�&� �pw�68~H��aKA�E,DC)��,Ma)W,2��i�107R�F#���r d�ʓv �x��� ��ȴ�İ3�a����S�!�"��`c�\���E�Y��'/Ҵ��d�LS!�t�N)'���a@�(���	p
|0��.@�2�	f����~���7��}&u���8�Á)����Md�� ��Y��u�X7Ϻs�[g�8�Y7nݳu��2'�id��}l�cs��sl��9��6��6�m��T���E~��̻��r�ZΚ'�-�p���ׅ�B�Н�nr0"�
@�E�[��C����e*�A$\�	�+LF��ͽȀH�����d�O�Ek����*Q�&V�Zq��RQ,+����N��@����=����:��s�c�;�شc���.r,6l޽��=�V����ގ&���n����<|G�G^��N��W4d�(�.�-S���4�b��� �W���#@�:K��Y�eE���n{�۱u;�;/�ykݦ��GĬM���;�M����luAW�1L\BnL��+|� ���R<0���&��&j"���DEC��h4�����2�L�I���$�$�j'�CYT#����(��X��,K*�DcI%��=ONqe�.���`_`pgP��zƐ� ��N��@����=޽��:޽��w߼;�ݴw���.��(��`^n3�F�G&����J�t��V�������V�5wiЙ�aa��r/(��[�m�D<�wk������$��3����Ȉ�:P"2����I�͌(H�U��B
�Ah��I[�~[?�����F��SRǞ(�5�ޥ��L�1E.�`�I�e��>��'�xD1�I����Px���/K������i'S�"op�8�_��Y `�Y���g���#�H�t��/ƥ�7� �f�c��5g�5��N�m�����_<mLF圷���@-�ʹ�;
��T�4����h�`��BVҐ"�#��\�P���&����F�<� �/^�뿸� �bB��l���k���٫)2��/�����Ĥ��N�8��-����0�"��t ��2A��Fѳ۱��<�?Y+�Ҙ���8ܴ��|ܽ�r~��'�`�u�R�и�X)`� SV߀Ӓ!���I�B�l1��)���+�.�>��ɿ�^��+�(�/�` �K ��DT�Tg�1^�X6����ч$Ɨ���#�Ł���6Nբ>1<=����%fh�
h�~@��/TQ�m_�������m�\��~���)�����%r�#((�"_,(  �酅����c�b��Rk�C;���X<2-.]�ti}����>�kEE�ʺ[���|d�W����z�����OG�(1DCO�>������L��DS�iu�a�z@�XzTt��������/�Q����w�:U(��"(���F��J��cr���0$:װ�"��3��BO*�2W�8C7S��H"��j�\}I|�d�������
��Ѓ�ĐV�lEC�ґ�ɔN�FЍ���\�;���^Y�'3c�T3��*7�VnwVnK��4�y!ξc��ߘ���3f�1;��7���3;l��,���}�Cq��.�sO�_~��nҬu>���k��]p�����#�	��乞���d�F!i2AǕ���dAJk�ZXe]KD�����	�ϗ��L+q偕V�y*�pJ�RL��x�q2�8�b[\^��K�i��9��풟�T3sE��������������j�W߼���0�������'/�W!�҈�9S�ՓH�N�� LDOR��Ԩ��ͬ���ҍ�����'��繎�q|n�s��|�s����������O筌��!oK�[�[���-�~Y˭Lv��'�m�Ӂpo����h�_g^�"�@S$�
J�{�0L����<�T�$
n��i���9oK�[�!ʾ۝���{�y����6���w��1���w��k�~ٛ�;�S�ֹ0�Ѹ���>�B��J�Ԩ��3�PׁF_"���$�4�)^��+���D��D�H�������n<O�s�錥�e�����+*<H<���u���u�]�u�Ǯm�Ʈsvc�0v�b�5�~�5��tW�k��C��-�;�d���6�DY��;W+DY�Y�2AtD=IV�����a������m�4��?��o��<�������:l�rC�sS�����x#Ռ����K�a$��9��X��-�Y�e1]���C��`�9�ŵY	��!(w_���>RH�H���%-\!�R�@�0�ˣi;$�����m����m����m��6ζo�m�m�mö]�f��6�,��۝��2E�����uR\�
;��������h)F��"�P���(nJ]�|&(���j����LE�.L�Rj�pAL�P�r������]�E�+�`+�sQ���rKF�x_��B��pA!�����C�V ���+�Ăz�%���-5W�-mne(nwPܖ���w\;ǵo\�Ƶg\[Ƶq�}S�ڰk����qmG涌����R�f$JK�v��'::C\ܽ�J�ӁX���D�0�L��J�>8$���%N��3�㷎8�(O���7��t�U����%?�]QQY�4*Mr����VVj=�jN��0s^
8?��.��B^��V���U4��1��S�1-͍KkF���\G�|H��;a�Ԉی3:l��(��Q�<	!�{�P�Q"kL�+,��L�S�	�T�����4��H`��}<���PD�d�	����/���� �,��tx�I���2A� fh�F>�I,�A9� X
��:�R�������^Yj��j�^Z\�Q�*�Sq��������x���3^��:��7�ۼ�:���뺏���\ne�[0���w�ZDD��Ă�RJV���E���Г�S���`2Ĥz b�^��JCSŚ*Wp/V��ƴ$�(��EdfE���s��31&% \�0W&���ʂ�&�%=Q�xc:'���=���qlǶql��9v�c�8v�c������c�[Y�v�t[Ґ�<��7&�1���eL�3���6��L��4I�c����|����l��S�֐� a�Ȱ������2nw0�-o�w|;Ƿo|�Ʒg|[Ʒq�}�m�o�|��ҷ�>��*�ݩග��[�Ǣ���q,ncq����$��3��)�`�1"c�@Db���&�r�)i�ό0줮v�Z�_b|V��X�nh���-2�l��I�����K����:���&=٧_�Ex��T�<��E���R��_����-/��$	G_ċ�4h�H�3�݂5��w��������� �=\�6k���Y8�L�Q�v�2�ȗ�Q���m�O�G�h�$�p8_Q��y$�E4�}�BP�?�u��44����B���g_������c��K8�=�����ϗg#9&H��U�щg�Č��΀�&F ۵'�R���)ރ�{p�
1�~9����R�?�]|p���0�8�v����ss����8�M���) fl���Ȩ�}oG:c� F��V�w*��u<n;�����3��]7}�ȓ�$,�(�/�` E< �v I�Vq�.��(���>�_�A��ߩ|�!+�Xf�Qc�s)�4�C���A��0&s;4������~��6!)w=d,'��:cckv�n4.��'k��j#/	�;g0�i$a�j5�VBk���^n\&�Ec��u��}��5}���7�Z�=W�)Y�q�v���w�Z�	��F)25�2�P(���-UK�4M��$� x�!
����DV��l�b�3fi�j%��nf r7Ut�N�	�h��7�����Y������;#>�Jk����}��z�C۞!	M��'TJd��,\bt`F�ڬfR�!���	H�vFc+WS�gO6�O"��Z�9�X(�I���N�e�2��0�f�Z��k� 4��. '�Lg�!�˕(y�P3�I�*�j5��
���B�khsSC�y�^(���^��B��3LqrĠ0��Gg'���7;���?>���]|n���s��gKD&UR�2��,c͵�@�T�f�5��kN�[F
�bujL�KM��M������LT�������J�������v#[{��:��ؾb;���k��`{�v����������7~���������1��>ϓ|�3�_���Jsr���M�������-u��R&��f Z�ҙ���b:�0����k���,�����|/_{�.����"�.�q���m\��r������.�]�sy���U�ʓ\^$���C6@j�=~?��O���k��E?ϟ�a�iZ����w�Z��Z~W�/���ȯ�U+����r�FO�DJK��`,�%$M�T+�Ew�+w��,�2�@�`Vf�r�ԛK�s�b�ɐ-iJ�\�qB(����)zRCW�����njh��֡�o�T�ke�K�K2���h����ɍL���\��4&_19��?L�a��M�3ynr�����J���׮�G6'b�c��kl�b����|��67ڼgs����i��]2}�ju����!Ue�N^yU�A�˩� (Shp�l��*F���E�Q�R�Xj9X���d5�hO+�����D�z�:o�iw���Zt-:��̄s'v��hn,��K��g��h��� 
��*��Ӟ����{+-�_�]2�k���}�������ײl��f�  � ��A[|�]cR%F��J���ov��r�	D
�}do�N�w�y��w�y����y;��Ѽ{歛7:�����J��#�@�% _��ݳ���9�#�a���}d�o�N�w�}��w�}����};طѾ{���7�Ϸ}G_K�$�����[G���W�\��
r��eã�$�����Ʉb��sl�PR<���=Y\jF	�+��8H׈ZY�T#i�h(�I�P/�N� ��LQ0EA]x�#�z��wҽkܛŽK�Ľ7�������soݽ�{��u��D�Q����i��⢪;2Np�b2��:�PP�AHD#�kL�dI�Z-;�bMXkT��\lt`V��/�Kvs`����T��M�B�8�������@d����<�"$"""""IRp"If�D5�"���'""��6),
	 C��[�]�+�*#A��1z]��vw��zAƆ�ݛd�`u�UT��*K�e�q��\�eH�եD}��_�B��Y��5�A��`���=�9�_��p����;<��˭�9X����� ���j��K�.nj�n�i�f�{�i�m��Mv2�C���H_;�H^�B��gm��~�ޓyQu@�dr$7o8��|Zf�%(X ��y�⊝�,*F'4�f��q�H�)��ا�,y�"N�c� �����A�\xܵ0��C"���̯�,��m�{��� ��=`�ߛ7�2�L�c�ǻ�~Ͱ�k#{�|��ZB%�#�_���m���*8��N����#��i@ӷ�6��k~h�@�ao�ᆘT'�~�ԃ(�4 �ot�x��k!�(�/�` %K ��tV��Qgc��-��=�r�j�g�L(�iT��9l��;g�kv���٪����'��||��=�ZT6�q��up��P��������#Pi��������?�-H����������g�/~?ο�i���13�z坙qЇ�<�o9~gB�X�6���e||��$~F Ӆr�H��T*E�|ƙ-��8���T�Q�b�X%�T�*V�z�R���c�v��Tq*��G�[�p��	���Q�fu�*����(<DS/�T���@��t!�T��
��a��P�I�"[0*�(�"J!G�2%�9���ˣ�|y>寓�����٠�AGЇ\��T#��iA#�TʼR>�hM���V�I�р�4"SD-��)�"W*�
�"SCMv��n�b�l��e�/S|٬b�Ӆ����a�QS֗��퉥*_�o�~g��a�3�OzG�%�mĕҾ,J�}�o�o�L�H�=DyY���� ��؂�r����mEs����8�@~Dےb/0����0�T1��B�t���K��k}l\ذbV�[�Jx"(��pN�p�#�q �e��j��W�,��\�֔�bdb)�Z����HP�EJ�+�u���b���GD�B<���Kґ�^�t ��8��4N�q���M��;�v�y:�KDOJ��X�8�I(�7��0��[���o��bi�a[�X[	�Q�B��"�a�t^XekVʜN��OI��Z*R̭�*K�JJ�r�A�#�LO^�iC���L��
O�-��],�h�X3�Z�5}F��������X`5��Ji�TF+�1t�a��3�md!C3�Q�_�߲D�Q,�%�	y>ߴ��i}��z�E��?�9q�憂�|ȸC�!�j�Q< �
����I@71�A�S_1��� É`Mj�Ъ���,�OhrA]�XX��N&�ps�X2AN)��[CZh
q�0�Nlmx&�R�/Τ�B����C�j�������mA���o���o����o����o�|;����o�|������G�5�te��]�A,"�QDCp�|K�o���|Y�I��Q+��Q��Q���Q��ΨsF͎�u˨C�P?	44��l�$�.[��(( � E�
X���5��Ɣ��� 7ց\�5fR�HL�4��>d
�e|�b�����ω|������|��/>W�9���i��>g.�6�Yו�n�u!��x]��6^����9��������?y�}yf��曮���w�{�{�w�{�w�{Ǹ7�{{��ͺ��ɽ޷4q7�ɸ��ȸy�Ǹi�ƸW��ĸy㮍����1MQ� ���u�B�j8��$�����X`��f��C2�WJXK0Ga[�n$hZ<�0B�(��JL��C~B-"Q��i���Ck$YR!K12�[�Wj$Gܺ�	k���LF����DF�1���o�>c���g����W��Зe��y����J�m��B����:�m��2έs�s��>��r.��s�7�}��� ͞d�;{��{̞c��ǘ�����{��fgͮ���I3�=2;��̾c��Ϙ���*fǙ}7;m�լ����}K p%72p!�1p�1p�x��ف�o��@ۗ��-Q|S�7E����%�Hn/r;��y܎�v�ø}��&n��^�ݼ�l��컾��]
�~�$�r��q��qpA��Y�;9���L�۩*�7�� �}{HHz��b&Q��Y!͒*E�P�B]0���N���,5�#�υ���D��BS]Cv6dX���������|y\ԙ�>���Չ��c���X}��/VW�:���i��V�ѣ~K՗�j�;=�o��d�F�-d�>��c�6�-c�:���7��s�-�|?�G���)	q�MֽD7�uY7�u�X7�u�X7�u�X��u��][��nR��][�;ɿￃ��ǿs��ƿc��ſ������oֿ�N���e�,�ب�<c4FfDFD$IR7���@UQ�� ���� �$@c �D�C�uz~ʃ�#�^��G���EᲛ~�`��;��a�~�W�#�N�e�ߕ��iʷ�8h���5��å������jڑYk/@V�Ġb(�� ��W�.s��mG@	�?��>y$���|��1G.I��4>l���c�VݘU.cF�iΥas�!����R|LB��Qw-O�"��!�7=4�|.x�8#��$+v4���U�G�	+q<{��p@\��Wn���؎�9�;X1D�Ȏ\AGu��pa�7�B0x~������	�h&b��\���R��Tv��0�ļɹ�B��M������ ��[6<`���_0����v�r�t�&�FHv������R�1�$��0-�g��Y���}��|[͒�q�G���T!� ﾾ�����}d	*�](�/�` �F J��T��-K����8��.��Ɩմ~�O�0c�< D�U�A��I�~���qw}�֚JP�uj�����AT�Q��
����ޒߋ�;���8�ߌ�bt��eF�7����C��<F���u�:<���O���W�4?����~ٿ�?�+'��"��?<!g�=gH�����a�w
���-�-��c��ro �M�w�ޠӕ���@ܛ�˕����j�q��+3��s�~���˸��,n��]����Un��κ�<]�iO��U��~��/���$O��Ce~�*��Z'�a���_��Mf-�)���k��ȬE;�=�=ȑ��H"$q���PĀ��>�f�JV�I5*K����R�HPJ�Z�E�'�+��V+����biR*�eS (\h$,`��vP!t"��+"2?�3���Ԝ��J&�X"YǛ�)��"ş)�f�M�JQ�n�����J��c)�"���*<w'�����=yض~yZ���zR�]z�~~y>�3�%�:��Jh0���i�j]�i�^���J"�v&h���JO���8��;��"K(�*E�@w7��V)bǻ��Ό��]v�ۘ���1f1���if���ev���W�X��T���ΐֽ�n�u�g�7�v�n�uˬ�eݽu��۵N7�u��U�y{�\��a�ɷeH�m�d���q�k���D��T
J0�	�N3�VH��'R-�اD�V1R���R+��f*Q�hR�#P���)�
�Z���i�JU$���R��U�n��D �M�7�U,�b+����j%�p�����~[U��-Fф���� Ĵ���!$05%����jJ�2p!�H`��
{����^�؋6�d�Rt<w'#Y?)1��!������9���~����mv���e���&��v�y���q�6�k۸6�kǸ��k��6͵a��rm޵e�^]C�]g���.^�y]����{����z]��N�"|�B�9~c�5.c�0�b�5W!\e᳅�
O�o���"��pD,��g�`��9A ч4�BH"����O��d�92�V�+�2�B.�ST:?Pd����~��n�3�M��㄄K 9R���Aa#���hp���6`�a��!����"���2�t~N�*b�f0T��$�p,@�$ő�R���B#�χ��<������ q�D�T,5W*��D��GT�'d�K�*E��d.j,�0�o$b��~y~�߳������������:�笎����.V�Y]f���{�Uu��:.�q\n�r�Ǹ���+.�����y��._]�� \��q���8����8����88���\���W9��ଃ�����{Bz(�3��t��!�@⌯�E"�s$�&PH Dt�v��B�N�SHm������^��;�c�����]�Z"�L4M/��5R��@DtDq_��yB�&y��;�7a�G)�*a�OF�d$���pm�����6�;���vζq�}�m۶ٶ̶_��۶ɶ]�l��f�Pd=l��ִb��B���Q� �H���Y�f#&�f��QRO��D.�d) ��
��lx��鵢Ҝl��b�k��x&T	Ĝ.�	�r��E ���fٺ����,�Y6�c�o���o�����^�o�}��e߼}����ǲ���◝���8��؋�� d�������=�o���:�眎s���.N�9]����{����:M�q��FO~>�w�c�7^c�2c�,^3p\eು�O���x�|#\��T�LV��0RH$$�J���,��� ?��� rk�Z'z:Y�֙�@>F�{��T��l��~ϕߞ�u}�u��s^�y�������,�$�����HI�`�B;�cQMd�12��č�(;*�g'w橰BL�[W�I�6�X�q`@ӹ�)�Ŋ�����] �जd���S4�X��_n#�p�}FfŖ�Ct��NSO&��qT�<�����fsI  ��Qq��(>��~Ӝl�C��r��赧
b/g����]E(��0���n��]��A���Ģ��ÕA&�r\�+�/"�4�b��z��<�:�bNE�lb�s-��?����@)���q�짎����C9ճn��:7.N�}d�m��W��E�AWfD�*�*�J�h\,���rXe4��|�vak�촭��.�á'C�+U���~N��WY.f�nv�ڥV]�}�:l��:?��Q�������.�e:�ţ�c\u��>���n�YE����*��(�/�` -B �� T������!e��������.�V�{�e	AG�p�E5�?w����ޑc%��u@�_@���b��o�{ii�M������6I��v��lN�4��i[��phY��MQ-�Yħ7�X�6w�VPN?6��Y $i����FehI���
��dM-�X����G�R!�
 ���E�R�/�G#82���uL��/$�P�|q��kd����iIP$`R�b�����pȰKQ�J^[I���rR���l%��Ku�H��	
���,��Il��ʄ��c�9�}c�6�Mc�2��b�+��6il�R�WG��a�dB��X=��7V��:��e��b����!��V�l���V��zo`D��E�4�m����F&4�	����k�>c���]��&Fg�5z9z�	f�Z�W��e�2j�K��0� �w��.f����oZ�Tj8&%,��'�\#� '-)Jʏ�} +��8�2��Z:�fG#Jvi�y� �������>��|��f�*+d��6[���4�D���7-}g����q�
����vY:��b���7�NWh�JhJ�<��(�]��@:�<�T 1u8P�4M�l9�֔�h6jR���j����G�$��|g#����_�y�,��MW�%�Y�b
���x�+O!o�6�n��`/؁���J���<����DVs�q��#����²��2�����x���4�����W<�>�>�8�q���hi�j!���A�2?��x���I���})�ڗ����A�8���F/t*?��u:�cєh�&�Ĩ�J��c�)�DL$�����s��8ҫ�L��'�:͇��>Qe���u!���W�<�uZJ�%Y��h.!���J-Uj-�$&�|��96�����il.c����|�\��ej)mNX��-�3�i,X!����:�N#�eY)����e3�׆|g�oz��N_����w~-H�H5ȃ�ҐΌ��/l0p1��y��p�D>�)���J�1EA�<��P�M!AN#����JQ9A!�Υ.�eY�~g����n�yl�:������l�`;��-�����������~S�;�v�w��v��|S���r��j��B�N����J�
��CU�A+U���R�%y��;��,e}g���|g@_��<��7�18��e�b�������N�1xo�ǿ���I�?�3�'�a�-~���'�;�|��7���W�|g��r\��f���ro4(܀2m	Ģ��ڈF���PkDd�+h��N�0\�q"�ŉM�)�B4M��{����:��Ax���3^���U�n�u��_����׮�)���ת�X��S��S�[9��!�D�\�D��	���x��B���DY�yM�*I!��,C2$����F�����^a�k���		X1[�}����|:[�R��evl)�l!����P�:["R��Jq�}�T�#W���ƒ�Rr���eK��&j�[�fKc������¾3 �3�oz�}�e2��<��u�M����������w��W�v�M��p��[�ͨ|m*�cQ܄�q,��5��x��],�bq��,�Z�\��c����k?�S���Ĝ'H#`���5��N��n��:�/UX�p�i�VZ�)�����E�L �I�m8�g:(AA���3�ʘL�cR1����0�2���$qp��;`T1�3�	$>�h	$��m����B����똡��;���[�;v�^��U�������"� �sG��#�A<�B���z�(�t���I~l�PѺe�x�l���ǆ~mj1�UOf�����]�m��#�4��jᾖ�3%Lv�C	:I�d�L$ J1$��`�k ���}�8僭�׀�A
D�.3�TU˾{��s�ł����X�.��T�r���bSR�T����nǔ���4��������4��ЭN>/��S�k{��j��اI���/��O;3J�2�H)wlE���L����P�L�B�E#���7<l��9h�O�8d��cp��Η}�xV���!g�7� ���[�P��a�m�iNq�՟�S�*�-(^+i��7>�s�
����e���O�D�V(�/�` F ��U�R�i*äQ��|%bI�}�@��/�D{d�?�Th��4Az�zj�Vj�H@\�]��4��m�㹀�E��V������=��)�����S�2�/�Ͽs
E���cm�{�׻ǽu�ǽi�[ƽaܻŽU��Ľs���������Z�,�5_�8��i�|���)���|�J�V�;3z�b	?��d��C�)Rj�J�I2�0Z�dC�R"�gu:�L��DM'3�		Kb*(�W���З��
C%ӹ�Y";%+�r-8��%�f��zuJ&�B�ՊU�ل���al@���o���o���o�n�o�>��ܿg�F�M����}��w��g�f�w�}��/����}M�w]��u5}���Y~Q�c&��x�߼^+x�w�Vٷ&��({L�'� �Br����		jĄІ!���y�:#�씥B��8��	���U��""eG�*Pi*�9vD�C8br�6['Œ2���R"P�J+'�9���X�Lґ��l �R��t&#���$Q'_���w=��@�=�c�8Nc�2c�-�b�'��l��@��t9���y
���<��'����5��|������s�S�9|N�#��5Y�]}�#�b���c\\�Y����9yȉ�`A��kƾ8��4�}�i�vxvb�䈋�p,;e(�� �,	N�k��ol�i��m�(�)6HN9��$*=%#!d2C@E����78�,/V���VZ� F��Y�3���4� *;����1c��a:�����pҸ0 
�d�H���NR�i}H��,Ech��XN�\!��-��X�J�b[O����ZE�A�������(��&�U� �6H���?�LX*׊�r�X(8A�j�V���B�B$�r�*������ڀ&�c�;&�¤mLZ�IS0�&�b�4��M�6�I{N��a�5��ex���?�����x���2^��z��U�~�������ɕ��:�D�A'ؗk� �D;�ċ��>�۬��npaUv&lG3�H����`I�B9yV��L̌�F��2�J�r��R�i���'U�]l��Z�%C&��-eG!maBTY0�
�ku ��J(X9�����dHh��Z$,�(b�'���m�ZINfW�8��$�E��m5��`������Q_�����q��#y�`�͂8#�s>�S�LZ�Q�r��P��J�����KA"%3 ��H��,1�W@�"�$T4*yB�!!u@�E��lH�'����r�`��+ڌ����ʪ&�����L�����xh+�g$2�'��+� ���L�J��r�BU��3�R��a���^V�k�[���)��
��\��^��!mhfU�b[C�`�k�l�}�ط�y�;Ǿo�{ƾc��žY�;že�ݲoپ�}w|_�D�%���9�˵�Xd�\����9�}��3���/����)�-s�kˮ}^�}M�j��7��>����*|�Ʒ5�6�^��+�M��ݷk�.�v[�o�o����u�u�����`���źk�=�����:�9��}MTȪz��u��cu��X��-VW����s��VGWՓ��i'H�)uDk&s[�b;�A  	�\�"�0X%z^�U��& �̅v�)��\�Z�� 		��Fr��������D�tF�!lr�B�"��z;��.C:��s�~����8���,NOq���-��N?O�_3frl������c�;ƭ¸m�[�qS0�ƽb�4�ލ�6�q�u�������Zл_x�}w
����=��]����3�ֽ���ӻ�9��}Mq��3��x]G�ƨ�@��3##"#�()������DM""��HД�I��Z!���.yBj�R�|�ń�g���I�!���(㝅O�%J")�E[6sj���;�1�Tg�Z�>�8"X@�z3,�3�"���F����y���̬�.�)��W�]�6oTFl�'�*G�D2�b~O���侷ߍцa�;%záa��
^�V� � �Dh� �wZ2���P���̨�����m+�����|ʁ<חʞ�O{�z��3��<��`�K��h�c�wwq.pi����bkO�4�Es�dZ��*�c��,�emg�kk�=�=@T:���g�7U�z�S�ެ�-Z�͟��W��<#oB�q�ǂd��k��!���Y�_|	�CP��zq���?�i�:�A��pĳ��)��!ݒA�*��S)�hh�(�/�` -H ��0V�Yg�  9�d��kb�OR j�� �\�L�P|���7MU�4w�a�H��4�1����"'V,�2�Ԧ�M�3l��%;���$kSl&2@0�*�*�Ji�,)"�)�k�W#SIc�T�1�B���{���&�[i0d��`��tIk�#ߡ��Mxz��yH�q:��}N�qz��U��s:��2��N���:}�HQ�-]��.�ӷ�}oN�Z7к�ݳn�u�[g�6�Y7�n�u��M�]�ncP�w��-{_T�E{_�&|]��8cnN��x���3^���W���z��}�ü^{�:�H��-˯� v��]�t����9���;�w����f���]��߻I����w,s�;�w��C���5�da��lZ�)��)�ѿ����FGY�xB�-���DZ0�ɨ3���>�Q�#��	!ňz@�AM
��҇i$�`#'��4����(�6�����c�����*0`����A��`����L�^�HI+e*�H#��C�	J؂[��Eg-V��ְ�e�r�32D�\��E۳��c�=��_��b�f���7;��m���1��ct�7F�1���c��b��猞bt��0��F��N������C�o)~W��Iٴ�2�H�	YXb�a�6�CO&�Drk((�1�Ȓ��2�\!���u:�)[�����j����8}���φ���D�^0R�Dz�e�i�2]R�������`���� ��А�P� t��瘝v�Ә�gv���]��8���.3{nv���G췴}ٕ����ߒ�[h�@���wϼy�3o�y��{f��U��ǻh��;d��|Q�-�]��8�o�^���Ǹ���+nϹ=����an����l�%�W%!�2�w��s���w�N��/�������7�����w�~�2EA��Ҕ���EI!!�x�5���4)���0F�vAHʅb�f:�1I�7��9>�m|N�s��a|��s��|N����i��>��/j~�`�D&u�ՁV�Y�gu��wV�Y�f�����UV����������q�-���E]$07�)���O�řj�P�y�du�A#Y�h3�G�$D�p  F�VJ�w��%�	�U+aQ�2Qq�QC+߲�2����4Х.�si�K�\Z��6���4{i�K�.�.�T�Z����6g�C(Xb�E�-(`�5�&$����9��	�k	9 ���p2��Pf2���-e&�� a��e�]қӸ��4�q���g�;���͸g�͎[eܱq���������o���Ϸa|�ŷU|��4ߖ�v�۴o���z5Ы^��j�W�Z��6��y5�j�W�^�.z�9�m�4~����W���4�̟�i��W�q������sA�M�o�|��w�}��w�}����}��;�o�}����C���i2}�� �,�5;�Q�1�D��[��"AR�)+q�L�XɃ4�J��"G-��´m	Ĺ��r�lѰcE����7'XNښg���E<&pv��h$AF��t��đ����EDH��f�Y
tIM�@QC�/'��&�&�����|02S(�Q��L�V��r�@H�Y��z@nWD	��׋�[i8V�g�Z�r��h�j�o9~�l$�!�oi�m����=��l�����6��lΚ�E��9�m<N�q��a<��q��<N����i��O���qo�oܻƽg�;ƽ]�{Žs��޾{�ܻvoؽ�޷d����i�YXT���,�=Ệ�JPv.'#z%F�$��zr���b�T2�9A��&�Q��X(��R��)6�RJ�d�
� �T�̔���"A� $���HÍ� �h�Ula"�{�İ݁(�F��r-*���Ũ�,��#�("2"#"�d��R�tM�;��`QA��,��9%���E����}��_����q�ׇ��n%q,P�Q/2Hb��l��?`�0�X��C9����n�r�9�����F���W�ۦ�>'�"��!Af�!�j��&���aG�/0i�f �`L�S��V엕P��c%sܞB�L�siW|Q�<��4h�\�b�4����Ԃ�c|fyۅ���i��d�`��k������X����T��X��/�=����[��2
?�0���� �>�fǍ &� �}�C+����I���n�)��/��Aw���6�Z\Vq���IW-�*Z�M��+�7E��٤$��G�j�)�����[��
r�Qq�>�;��Hɥ{�8!%�GБ��������[`��5�*�F �\�i(�/�` �< z�G�ZUk�b⵳�B�d�!�8㑽uL�W�]�9k��9�}�Ӽ�<��s��S�Mҵv�����������)wp��v:��c�8v�c3�x�c���Է��m1+n�*6��œ������kY����x��+�8����x����x��O����?��x��������f�O�[�u���E��"ss��
I纗�=�-��o/�6�p�o�<ʟm����ɌD@�0p �5!`�$
BUB�~(������Yq-�YKc�����dg���	1Y��-'���?����-uB(Q JPҙ�je
y0V1ؠ��Ĺ���1Z����&U��ln�4*o2sF�B�w�L�y]'h�9fq���t�J���d�{��7��������-TQ�����]o�Z�Oy}��E^����.^�z�י^/�>����S���u0�oY�Td��;Ydn\��|�f8;83�fsc�.h�PX�=M^.(4�r�v�\���V+�pf���u�dB?_�w�ԻEY�)�/����<fw����"f�0;���هfߙe3�~;y�̃�N�b��׊��Sn(e�\���Ӣ��N�,�b}�H��&�i��~W���69>���E%�V�^�5'��h���a��V�k`v���v:��(��Aa�S��%��7�\�f�ht��ׇ4*���˻��On��ȃN�����gy(�ȟ���A�������u�����g3�)�j�&4@=?<��'Uo?p>6��f#Zo�!f�4�ݢ�[�*����>�O9}��EN�q���.Nqz�әN/�>t��i:��^�s��dS��S����E��#\n�4Z���?�颐d)�r>���V�J&��a&��rj4`����E[�͓��b��<��4=_�̠��UCT���JY �)O�#�M�Ԡ�+�z��$��� $�T��C���)��`��p }p`H���&�[�.�./w��e�X;e�{ˡ��������n��n���)�^��"���n�w�x��wWx7ӻ��z�λ�`��.�z[��p^�g1���ˤy"�	�+���fe�j<��ٍ
�T��{���"��b'�kF;m>��k�&u޸ДPe��$�M"�}:p�._z�dS�q/�C�x���x��������ظ����p㸍�6.m|�d�b�y�qy[i-�J��RHh72�+* -��ln�
������~A_���,Q� ����ׇ��̻2H@ x[�H��8�<$�\�L���5@�dL��NU飛�|rl6@�[���5�R�X�xp4\��6 ���qF��#�ڈl��F��?8���Z(`������5_�o�
Ӟ\O.=����:*�f��� AC�=n�Rג����j�u�j+N]K!�Fޟ/y�ʑ�<�ȕ����u����Y�<��'���ȉ#ύ�6y��n��տ��E=��JV'����k��b��OX�����s��V?O���[��w�}��nQW����͏����0\�2K�Ƥ�]s誃L�3Sg���j��%jd���8�!�u�X96��$� "�P���j����j���jR������$�e�#��LN���K6��!q��an%$�|�Lv�gs�d���-�`�فNB�^�����X����]�x��(��BJ@��L ���ꐢ��@V-N���'A�m�r��S�3o-B����s�L�H��h���[`�#���Bj�����U �To����
^���DĠΫc�vÑi�f�MZž#�RSP 	0H� �7VJ�iy o캃4�4X1m0��ꍋ�hʖ�,b�r~�l	�0��J�6��kRm�~��X�̓L-�d@����26��W�|\�V�.e�w`��"|��@�`�W����?�E5D�(�$���Q� �̍���`���@]vøR߻T��^&����(�/�` =A z�TВ�!��}�{JoyB���b-FR�!`0xD9Y������%⋙I�
N0�i�?:�^������m\�%+��W�����n"w
����ɀ�8 U�"$w�EJO���p4�@(h��ݲ���^�u��`u�Tq5�첥(.G .�2�\�h�B�$�'e2�$�Q�X��j�!@�+�T��)J�T.D=B��qK�7��N#�Yd䞐�I�2]��j��DFl*2bOZ$#&G�YEV��lG�X+�+_�gџ���{�-�7��+��u\��m\��I�>��_p}�미���?�o^sT����`�}ǽ�p��Jw�9��ƽ׸w���_ܻ�{gq�(���ҽ�{�-��}��X�7n���n��߱�x��~��Y@�?9�V�[��>ȿ���qA�;z����@�* B&���#��&�q��H���,�Y�4����T���'H��h&`>O)��Kv���ŧ���S�!(R�+�!)� `�ЂVPJ@�W�h��Vh*���Y��[z~eI��՘+���j
I�TR�t'�V0ӄ&*����>V��r}>�EC���:����j�\�������ze'���j����7�|����W߱�w�8z�|�,��[��5�[��n���5�j��CWv��e4��R��g�G�ew��l��$�����x�> Ϛ��5-pO�y�(DY���d26RT�\#�Rp+�9y>�<���'J��d	�Mov��Ԝ����0��w��7v=�������|��_ gY�^���8x?��I8x������79���7������s�����c�����Q���������%@��s0�Y2=~��o���y���o΢E�p'�݄��jW�~4n�-��V1�(~>�NEAO�t��	�!d� ����.�:�,O��%JG�������i��<S�;�#�\����ҭ��ƚ�p��_���`G�Ө$2{�,�i/�zќ�*�U��xST�4N�DA4�6�(��P��S��M�NͅKɲ���c�Ou�X��:e�'/���q�xѫ�qS�������D�
]�F/�p��BщC�iK@!�qԨ8��ۮ+E�A�2����3Ŏu�#��˸07O�������6�mE��_*bbD�4I��h���9	�.�����q�t̜2�@#����}��CRj�ؓ�3��:�*�RҦ����*�1�{�w{��~��8�2{���ⰻ8尻{���b����;���;�}c,;K�B�761:h�	�E��u���u[Xz|��%����n�Ȋ�m7��SD:�Mf3\����*'��ǁ��;%�[k�u����;X6��*�$�����鸑�8s�!,�T3�7��s37���f8ޘ3�*z���.��/*F�+�����z�{��e!¢����a����3�\w���A19\z8wD2���8/����\,V�P�hL�����,d�Ƴ��Z��iߘ�m~�I?��YD��.\2 ,��x��m��x@�������j�xfT�aF��p4��G�Ers9?d�H3��=l*Bfi��'d(rq�]�qzh��u^g��3Eb��s��y�v<��;�!y��Jy�V�**e1S��q����7�_��2���/����,��r|��K�������r�u<��m<��Ix>��_�|��x���?�o>�����|��f�������A�0���� r�!###���H��`"�!���5�;S�D2ARZ�G�c�cO9�|���R��-+�@6��K���)T��&:]��O(-��9���:��ªH��4��)��g�|Cx���9�Q��O�܎���?��X\����&��~�e�ǰT��h7h>�x���|��1�^��?�4b��Cl��c��o�������'n�@�����yE���i� ��i�J� ��o�>���}��[8����!����|�2\r� V4�+:�z��@�ᅌN�t�<H�a�W��&^Z�7�����ۗ�j��QQ�%�������o��;3w���	�'���m���@	U(�/�` uA :�<Q����<�(4T?��V����QSL��&�l3 U��]>G���g&%��8)�X#�tȀ\���k�1��B��C���[��wr_�&��젣M�@�cU�H����D��ℨ�ژ���Dg!�H
�B�/�[)9NLfޥC���}��cӹY�d����:J��w^�e�4�9`$�O�(@�H�R�T��Y�� ^���(,"P��c�/���^�Fj���h�����b}�6<� T-��F�'A�E$��l��
JJ�<P%�%��D1O�E��$Dd�dbH�D]H��B+Kt%�yb�3����S�׎����%�#����oN�=�|H���scH���g��s��f��aw\ep��[��A���TT�������w��7��=�7��.��M�w���.���]��̼�3�ͼG�͏q*U�58.������%�tm�õ_�v��ڷk[p��>��&�-���ڢ],?��o.�Y��ޙ�)#T������H�^#�h����M����<��L�3���4��L�2y�����U��ȯ-�9��mq�������7�k��\���r]�:���5�Z�V�wڐo.Ē�9��b��8[�>Y�����#�e�����QVB�º@%+�k�Bm̙BG2ix��j8�a�D�Q�J�V�t��\繮s��u��2�_��\�]�����M�a�Ce$�*D1���*� ���F7G�H%�(5Bc#5����:��4�ԅ��U&he���2W8NLT*�^�4=��t��:�q��L��.3�ez�t�tq�jzhW���'�;�&퍳,~=���.fj��d�A�
��bz~�XCL��I}�P
��B���f.��4�ך|s&�~s����o.����'T� ���%_[�Z����i�|��#���1W%+��<b`Q�#a�H*4�Ggu�E#��@	�$������bj�rU�j�=0g�g	E�<Y�wbbg��,���oLw8�a���<���s���4���rx�����U��͡R���kC�\���}O0яB�J0+��qY��ږ��	1�8B��2(����A������<��x��7��<>�8��.��<N�x�q<�~s�{J�)�3G�{��@@1�dqD8���-i�TЁdiGQLQVN�]��\�s���8��\Ns���/��\N�\�\ui�o����{��Lϙ~3�f��t��.�U��LoM��4�|{��9߾�vͷg��m�o�|��ۭo�����v�m�l{g�9۾�vͶg��m�m�l�dۭm���������l�ٮ�g��v��2�_��l�m���(,�mn# ۆ\z0+�be�o@�7���la���U<{u�s��9"d�TPQ4�bI�� a����� CV)ًÇ�ĉ�ψ�����Xb�����?'L|�o��=}_�ͱ�>t�?��e"�4X$!	��"����1�IL����<�Ώ���4������_�U�1M�&�cT�1A&�vBבV�T�u
Ђ�����p�����AL���ژ,�L�g�����Z�z��0hii`Ŝ(��b�6@S�U�Z&�5���i�3$��&��Z����D�j��%fI�8mH���'�7G�=��W�Ѩ�4�2#3#2���T���!� �y7���"̤��TjcIf�5e�� �����}&&��G�fmZ��LL���y@3+������CA	����� ��D*28�j��Y �o�D�`^2%ʼ)c��_�
���l���9|E�0�l����ƍ�$�FI��I�ԈF�+�v�<壶
��K��a�k�̑�M7'�n„co-E ��磷'�Hx#��cmy<��4�X��|�P��t�۟�T��L<ҹ0z��Xu�-z����i1�d{w�>�sw��\��<��"��d�6���b���a��3sX�L��lp|�e�F��d��
w��Z|��}h?oy͙r2#>09)��){@�x��� n�Zx���1��M����`�z��%RB��E釡e�b&Q���mQ��&��N�ҩϱ�Z��-�:¦�@��z�qԭO�D�Pa�B8�ᓩI����n{eꖛV��(�/�` =R j��"XP���' a� 3�����swD� 	 ���!��Y�Z#�n�m���bK��W٦4�-K��So�j�M�A��+i��߬C�}�2� }d�w�'IKH��bG�
rK"����+�T�	���Fts�Z���% f�읎����۩ػ�}��%�Y27��i��ݳ5��[�?����R���C�o������������#ˬ!��WνtCWF{�:���5`��w:\p{_-^l���\nk��θ�}$��m�h�K8�|���?�:{�Ư��Ƿz�#���?�������s����Ǘ������_j4�������������HUln����r�7��i�I�r��%I��8�G�a�[����xt�3��(s�3��s��dpl��D�096�el�+�d�����W;7[]&l���y�3��^Y'�g�ݩ�j�٪�|?����q��<�Y1T��7W*��t�������b���������([�^l�.��S���ͮ�-�)[��vi.�)T��!ٟ������Q���y!�ǟG��3�<ϟ��*>��_���>ɟGr�fH���=-�ZÜ����3	ե�b�4qn�Q�x��IL��t�h��%����z_p�[ۦ;1��SY~��6{�x2��4��j�dQMap+����3OF��n��G��w��5�L�%�E�I�,���ȧ���˗���ˇ����?�|��Ϲ�����_�<����h2�����>¯��{ء�G��y�����t�={z�J��p=a�8ܲ.������4��m��{7���bu(+4 ���)60X��<�Gs�.����to!a-ƍ����݌F�MH�r��Ⓔ��6DY�;鹹�d��N�f���	.e��^�j���W�ݐl��o�\\ة�{A"0��6Y�l�Ķ��.����la�l_ӥ�d�[fI�0�%HD�ya�5��c����_��E�y���οp�M�����|�;o��Ǹ�:w��Σ��۝g���r�~[���x���>Ҽ�Ҽ~c^W_�,����Q�������8{���Q�u����}}_s^Gs^�7�Ob���͡F֕:c������2 B)P!
Dqg�D؁pIXFo�@%�?����l���{��{��`G�պ:&�rO9p�}�@�?lFb�
�S��b�9@�z%x�f3n2&����m�U��h�hW�
�v����ڣ��&XK� 6'�4(�j@<��X-��s\ɽ
pR�$�K��/�E,�w�[��w�'I!���XY3,vxT�:����=A��A�_j�w��V�x��.x8`����O�K���QJw�,����0ν$��b��[���X��R]<9�
B߈:W}}9�"
��L�SZ��],A� ��V��
����Ws_�O��@���(��!g��+[i�`..�l�n.iL��d�m79��hV�Π����Z���e�ou����N_���N���N���N?����O<}�4���N+_G��_f�3Un;��g�{�0�d  �[��K��O�O����/��-��q��ؙ<����� �[�K�
'�CVo�S����K�}��C�}���=���}��o/�M�������>�=�V�.�
������
8�n�<���������~�|��ï������=�����:���[g=���+��H/:�8ғ^�2'�<��<�0W^y䕇a�9�����tG:ӗnt�/���g:эn��>�t&��Ǘ��;�O��=Ǚ����W�O���qG��}����Y�H$���t 1-�KDI<l9w0��>����t�v��&~n�U'���:k��O����j���<�岫��bg�ƾ�/�eOQl@�M@3X����"�<Y@[����%�,'�a��%�� DJH�K	�D��P@��j�����~p��!�a���� Bď?�
 ��@��"�g�g�!�r��@ �����!���B�U8����X��Æ���E��%�( � (5T�(B 4���B��!(�b,�����I�%N'� v�I�^��",N�a��"E�<3�N�ΚC�gɍ�M6J6=!jT�yk���f�f��dh�"1@0;�����"����&�9��d�X.�B-M�N�&ɝ$����9J�EXj,�8�#�g��������,$$##""""#I�p�!�*��D
���Iai�� !ā�}Wza �,)� ԁ/쿘#�
9�g��8��v�H�	@ˉ��Ǉ��yH&�H|�pY{�U(��3��/���f�-^�h����#�
�v�$�<�Z��W���CTA5˕2��%zZ���F��YmJ ���*� ��	�(D4F�<#�ӣ�!g|�b̰��5:�y]��[Y�%��Lu��n�,��Ci=^jwԠK8�Ie��cA�t�V`E�d塹83�P�{+��H{���9�ߥ�T�/��c���8,#�1�2}&�t�n�3+��"������w�����X)`}����v�艊�ā�J��U���!FƐ�7��'ND�����L�a�/�
(�/�`�%. 
T�60�� 0�ԖC1��K����/Ϙ�P��|?φ��,�@����ٜ�n$B�L� � � �/�͗���+Mi:�9�����P���M?��Ln2��V�,7���i#��v>d"�}��m����|eNkȊN��^���r�Ј��tB�y�tځ���=�q����u�Zԣv3ݟ�4����P��Qn4����2g��Tƴ��<e)����u�c���5��ec���h���+Vq��F�M\b�X��Cl6�?\��;��k8����+L�	�-�#�;��^����_j�۷Ŵve٬�%�ҍ�`���JL��.క#7^\}�\]�a�����z�ȉ��r�~�h�_ڮ����x�7��o-L��'�0��.�X�Y��%�Mg��U�%��&���liN5�_��X���u�V����}�h6��y��j6�:�t�����S�����_���g����n�8�f�֚qTpL7g���rlll�G��ޝ�rQ���}���U�3������;�v�3Q�4�%M��_{��k��o`��0�ǯ6nu�TO]���b���?Y�>������<����(&�)�&+������J7p�[��e�e�;e��p��gw��Kh	7�Q6���\���[��[2{Gxg�6:�������>�n���k��Y������7�������\�j���-����C;]��Eh�[��}���mt���Ƒ��mt���=����w��B�������	�p�V�ޭ��m!�\� P�d@ٙ��+A���ǝ̶8�4��
ff@��m�I��R��d���6q ��Xq�:��O��M�\��� ��ɹ��,Y��%�$w��p%X��ƉS8�:\=��������^��U| ���&pr O�C�:Ǎ�߆Ľ��}���馅���jkmH���`: �qc�6&�ꪋ��6N5U�@K��q뭫�������j����Ǭ�_�5<�X�����ɵVG~�t�J�y�H쮳�hU|xQUv�ߨ19b��dI��J����*n@c2c
!DDC��	FDD&H
J�ߕ7Zϱ?�p�/�A�35�A�#�0�<.=OF�F�nAs�7��701�K��2r�Գ?��(z���s�Zz���8�_�$�(;��4���a���O��V2I@�(n9�07�$��@	g���}��^$ ��I�~Ç�;V�v��$ǃ�F��f�R��ebn����ُ�I���Pb���-�ol 選yVO�	����`�e#T��Ah�-����u~�p�Ve��o�q��������4Ö �Bؕ�
��m@r1�I:ii�'�ps�ǻG�L�r���/o����;8�Z��6:���I�������7�$օ��P��v��2Ȳ���(Tg��|�$M��љ�Z�]�D���O4�b��x���d������Ɉ�c�.o��?��zKM�� w��T���{�~3���~�����M��t�?��^xRSCC�l����[remap]

importer="font_data_dynamic"
type="FontFile"
uid="uid://7vaojfvgv205"
path="res://.godot/imported/Grisly Beast.ttf-5abaaf3475e5e481ecd19ea70972a0ea.fontdata"

[deps]

source_file="res://Grisly Beast.ttf"
dest_files=["res://.godot/imported/Grisly Beast.ttf-5abaaf3475e5e481ecd19ea70972a0ea.fontdata"]

[params]

Rendering=null
antialiasing=1
generate_mipmaps=false
multichannel_signed_distance_field=false
msdf_pixel_range=8
msdf_size=48
allow_system_fallback=true
force_autohinter=false
hinting=1
subpixel_positioning=1
oversampling=0.0
Fallbacks=null
fallbacks=[]
Compress=null
compress=true
preload=[]
language_support={}
script_support={}
opentype_features={}
GST2   �   �      ����               � �        &  RIFF  WEBPVP8L  /������!"2�H�l�m�l�H�Q/H^��޷������d��g�(9�$E�Z��ߓ���'3���ض�U�j��$�՜ʝI۶c��3� [���5v�ɶ�=�Ԯ�m���mG�����j�m�m�_�XV����r*snZ'eS�����]n�w�Z:G9�>B�m�It��R#�^�6��($Ɓm+q�h��6�4mb�h3O���$E�s����A*DV�:#�)��)�X/�x�>@\�0|�q��m֋�d�0ψ�t�!&����P2Z�z��QF+9ʿ�d0��VɬF�F� ���A�����j4BUHp�AI�r��ِ���27ݵ<�=g��9�1�e"e�{�(�(m�`Ec\]�%��nkFC��d���7<�
V�Lĩ>���Qo�<`�M�$x���jD�BfY3�37�W��%�ݠ�5�Au����WpeU+.v�mj��%' ��ħp�6S�� q��M�׌F�n��w�$$�VI��o�l��m)��Du!SZ��V@9ד]��b=�P3�D��bSU�9�B���zQmY�M~�M<��Er�8��F)�?@`�:7�=��1I]�������3�٭!'��Jn�GS���0&��;�bE�
�
5[I��=i�/��%�̘@�YYL���J�kKvX���S���	�ڊW_�溶�R���S��I��`��?֩�Z�T^]1��VsU#f���i��1�Ivh!9+�VZ�Mr�טP�~|"/���IK
g`��MK�����|CҴ�ZQs���fvƄ0e�NN�F-���FNG)��W�2�JN	��������ܕ����2
�~�y#cB���1�YϮ�h�9����m������v��`g����]1�)�F�^^]Rץ�f��Tk� s�SP�7L�_Y�x�ŤiC�X]��r�>e:	{Sm�ĒT��ubN����k�Yb�;��Eߝ�m�Us�q��1�(\�����Ӈ�b(�7�"�Yme�WY!-)�L���L�6ie��@�Z3D\?��\W�c"e���4��AǘH���L�`L�M��G$𩫅�W���FY�gL$NI�'������I]�r��ܜ��`W<ߛe6ߛ�I>v���W�!a��������M3���IV��]�yhBҴFlr�!8Մ�^Ҷ�㒸5����I#�I�ڦ���P2R���(�r�a߰z����G~����w�=C�2������C��{�hWl%��и���O������;0*��`��U��R��vw�� (7�T#�Ƨ�o7�
�xk͍\dq3a��	x p�ȥ�3>Wc�� �	��7�kI��9F}�ID
�B���
��v<�vjQ�:a�J�5L&�F�{l��Rh����I��F�鳁P�Nc�w:17��f}u}�Κu@��`� @�������8@`�
�1 ��j#`[�)�8`���vh�p� P���׷�>����"@<�����sv� ����"�Q@,�A��P8��dp{�B��r��X��3��n$�^ ��������^B9��n����0T�m�2�ka9!�2!���]
?p ZA$\S��~B�O ��;��-|��
{�V��:���o��D��D0\R��k����8��!�I�-���-<��/<JhN��W�1���(�#2:E(*�H���{��>��&!��$| �~�+\#��8�> �H??�	E#��VY���t7���> 6�"�&ZJ��p�C_j����	P:�~�G0 �J��$�M���@�Q��Yz��i��~q�1?�c��Bߝϟ�n�*������8j������p���ox���"w���r�yvz U\F8��<E��xz�i���qi����ȴ�ݷ-r`\�6����Y��q^�Lx�9���#���m����-F�F.-�a�;6��lE�Q��)�P�x�:-�_E�4~v��Z�����䷳�:�n��,㛵��m�=wz�Ξ;2-��[k~v��Ӹ_G�%*�i� ����{�%;����m��g�ez.3���{�����Kv���s �fZ!:� 4W��޵D��U��
(t}�]5�ݫ߉�~|z��أ�#%���ѝ܏x�D4�4^_�1�g���<��!����t�oV�lm�s(EK͕��K�����n���Ӌ���&�̝M�&rs�0��q��Z��GUo�]'G�X�E����;����=Ɲ�f��_0�ߝfw�!E����A[;���ڕ�^�W"���s5֚?�=�+9@��j������b���VZ^�ltp��f+����Z�6��j�`�L��Za�I��N�0W���Z����:g��WWjs�#�Y��"�k5m�_���sh\���F%p䬵�6������\h2lNs�V��#�t�� }�K���Kvzs�>9>�l�+�>��^�n����~Ěg���e~%�w6ɓ������y��h�DC���b�KG-�d��__'0�{�7����&��yFD�2j~�����ټ�_��0�#��y�9��P�?���������f�fj6͙��r�V�K�{[ͮ�;4)O/��az{�<><__����G����[�0���v��G?e��������:���١I���z�M�Wۋ�x���������u�/��]1=��s��E&�q�l�-P3�{�vI�}��f��}�~��r�r�k�8�{���υ����O�֌ӹ�/�>�}�t	��|���Úq&���ݟW����ᓟwk�9���c̊l��Ui�̸z��f��i���_�j�S-|��w�J�<LծT��-9�����I�®�6 *3��y�[�.Ԗ�K��J���<�ݿ��-t�J���E�63���1R��}Ғbꨝט�l?�#���ӴQ��.�S���U
v�&�3�&O���0�9-�O�kK��V_gn��k��U_k˂�4�9�v�I�:;�w&��Q�ҍ�
��fG��B��-����ÇpNk�sZM�s���*��g8��-���V`b����H���
3cU'0hR
�w�XŁ�K݊�MV]�} o�w�tJJ���$꜁x$��l$>�F�EF�޺�G�j�#�G�t�bjj�F�б��q:�`O�4�y�8`Av<�x`��&I[��'A�˚�5��KAn��jx ��=Kn@��t����)�9��=�ݷ�tI��d\�M�j�B�${��G����VX�V6��f�#��V�wk ��W�8�	����lCDZ���ϖ@���X��x�W�Utq�ii�D($�X��Z'8Ay@�s�<�x͡�PU"rB�Q�_�Q6  ��[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cgpvq58k24odf"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.svg"
dest_files=["res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
svg/scale=1.0
editor/scale_with_editor_scale=false
editor/convert_colors_with_editor_theme=false
&���FʭS�N�GST2   @   @      ����               @ @        <  RIFF4  WEBPVP8L(  /?���BD�#7� m���vGB����mZ�ƶ��]Ofe�$3S333�-8���ao�����&I��fff5�ưڲU�Ge���-I�jK���9�$s�H�S���36Tݬ������m�֖�m�~�_f;FIa�+�����Ü�1�Y��nA���1p۶�b_w{+�����w  �|S ��{ ��� ���?������  X���77����� ����|�[z�C�п3� q
"�� �>T�N  >P�A�t  T+A �6���;���>֠�#��&7nb���sp��Gߜ���6�C�����lEħ�se�>��O�u�O���Z����{�8}�)��E�Bԋ�tQ�U�ya��9n  $@MqJ���  �}�Na�DRo��MK�E�EetZ\�W\w�� +R�ȰwNu�� �a�s� x�e,� ̟�}e �w��  �پ%E%L (��R���B�W�쪆��U�ߕ"D&�`*�x�o�7��V�3O9y�� ��?��?xR �ni��0v�	���,L�ѱH�9x�#v��w  5z��X� ���^��)���OF:������M�
hĒ�[֏l8�%�u�-W;�s! t�W���[ϩYt��)0�=q�e����ua�ù�u ��ʭ����s���1w]���v)(�Ḛ~E  p���v5b��}8ql�9_�M�lE���C��bY�s����o�\Q�8����V���[̞il{�g
1t�5<�מ@��;OOdQ�,���{@�
40x��i�M�ϻ�z$���q�~ �>�q�\9x�ᗀ�oX|��~��3{� ��푬��s@�]"@�V��pU?�����P>ro?�ן  ������UfD��W�[  ��7Q]6{�� ��#.4ωǏ{���k ������'O�gn�Q��ж�����D$��8��s��?- ���/.�QD�"Y����B�@
	�ɇ3�� �n����������>r��.�ta�q@``0�1@�4�4��"?�P�5j_���'�� K��u=! ��F@��("@R^ ^��y`��/���? �-�SE�E5q�@�g_j�
 ����\��\�q��� ��*���m߈B����_@a��(�F=O�(S{�3 |�τ���e�߮���80������������X'>�˪�>�)*L����!R ��/\D��" E��Q@C
��#�= |ۗM��ܶ=�ɒ�]�90�;�F �'Os��궉b�\�>�����e�E�˷T/Lx�CV|����XQ�ʐniY4����`�So c�G��&r5}�І  ~����������V��*�U��2L|m""��B8*�(D�j赉"S#���`��"b�~
��O�C`���e�ql�f/ Px �E��;�����w��o ���+�f8��a�2(@�j��2R����Z���(��Yd���π�+�|f�-`��1U������� ~�e����Ǎ�c^h�v<�tll_������p���(@�l��D�[��*WRD Q�,RT�
 X�)��S�[������wU�'�t��qb�
j��W<�pK�XC ��u�y]lY1a���(�色�E�2dW�ʕ(�@!bE@U
�LY# E�U^����[~����~Q��Z�B���O �/�}Eb�UK��hj��3�o��r~�kĔ��C��	)��u�ZUޒ �h�
XC�h �@��XC���Rx���q���x�xG���2���� ���}���7�Ƭ���2 �=���\v����r��+��%�r��B�*���(E�QQx�
X +*�EO�0�u���[N�g�;�M������_�'?(�Vv� �l����ZU
QQ )��(b�*��.<�_׋U.�;�)Y�=��J�o?>�)v�%���rK�T��A�m;>�9΁�0{h��ߢ ^��T)@`�p�"B@�SQ�F�2�F>��F�ҲHАb��S`��5v�*�u{���ع��S�"`�(@��<+0��� �JJa�6�X�k�� f���-Ka�"E6��5LdJ՞9ӽ���8뎽o ��#��b�8����u�-/�Y �S  J�E�A
+�m<�BDxE� ������T�
K
��,R�EET�~�37� 0L��?c0`EL�k@��N�~aF����LI�J�!���^�9Ӳ�ȣeI!�� QȔ�@/".�9 ���O�y˖�w���l��ǹ���XC�}��M_x�����nV �"Yb�X#P
k8���-KˢE�4DY�ATQR�  �-�Y��3�7�iL�.Q���Te�~�5��7BH������(,.�p1o�E)�����h�U��(�
��2��5 E@

U�Q)��}�}7~�%k3�|n?��g���O�����&��^�=��%S)D	t!�

�oD�Q���@�1�k!�����|����r�lO�QX&�350ߪB��|��m���C��m��a�E* x�$R �@�A�0�C��E 
Q!"(�rmN�8Ѧ��-�\d ��E� ��س�-?���} L\p�0 ��L � C�8�`� ��!�L��w���4(V8j� � ���&c[&��>��M;��o���DDDX� p��5"��(hzmNژ贴�rG�2dJ
0�@�j�m���(@ ���2�:l���[_��A��/�LD�`����X�U J�`E� �(�NKˢ!HU�Li��Xȣ P@t������hb�(<�� ��W��|�����*0x8\
�� B
�D�kS�(42�V)ԂH!JC#�:U6��c��U�I�������oƷrX�:���'���[�x���.?��RI,l��X8���pt�5$�(��%�А) ����&2�k�w
����ǀ۷�t��I|�]A���6����n�T�=� c��0����K&, RH�<��"/ZE��E��(\T�
R� �� � ��� yTt(�U\���������aQ��&n޴�����"�B%<"\Q��P��Z��T$H�E� ��`"��*�� S�5*a 
 �8�z�V�z��@���� �8eh�xq߀���������h�� ��>E^��V��	���( ����l�ȃ�H�R�����a"�g�.��� �Y�8Q �Ɨ���mɅ�	u�؜��=g|�c��'��ۮ��)�D^�B!�B� ��
��D���B��6�U5N���i���e��;��L\q u	����% �;_ذ�.oE����/x��7"�ޖ���FV�`*�X0��E	
��� L�ڸ�" B +zF�v,���.PU P����o���b���0�������e�ɣ�J!� X�@9@
�""`�@�p!P%��j(�&W#v�b�Ⱥ"
p۷��
p���*	�`�`�
�;_��[�*�x�a��� l��}O� �=��ZC�:+�X� @�
/L�`�PEa�N��e��4��o��?�# @DR� �+s����m�!b�ඇt�]6��S�mY^(Dx��^��LY� �E�0�"+ږU��/t�"�@e���q�pi_�x����ā�f��.� =L���e���~�1p��lhx����G���pX8^x��Үڳˠ!b�jDQ��7�R��r���mj�h����Ӏ/ݼ|~ã^{����Szf߳ρ���!��a�����
QE�))�L�(B��5 �:� �>1{����ʵ���g���/�/�K7���J�a�x�؀m�^�;U�v<�X�����G��):E!�@E�+\x���L�@�H";��7����[��"Te�3n`�7�>�?~�.p�eY2�)^���گ�kٌ���}lڎ��X�D^� "�D,B��HJ� V��pq����=��������x���Q���:~��h�  ?q��/ڽ{��>o��*?-ӯ>�U���B 	Zd�"�X�� d���5���57��;���'ػ��}-�'��"�����6]x�N��H��n�bO�O?�إBXH�C��"���JxC�(/��  �x�����|-w��QDܻ����x�����U�K7�����8�`ٶ��(W�b� �~}Mq۟| p��������@��&"2�u��  �ֻ���˽� ��r��Q �;�3! ��6� �* ��}�A�^�Ơ��ԯ ������M?�Ħ��Q��B�^�C�U ��� ���M���.?P5�`I�U.���F}��P1pC�GW��G/O�ԋ� p��m������o�{�X<���Y�{��< ۾Cъ9�f�tS D  ,����Ƶ�x��X?�.�p�  ��˫�N'��G���5ߣ��X�כ���� �y{b�E��g�'����[f�& �h���5���FB���  �b���K��dǐ+A><�Ƌ9{����O)lH+b�'�t�
\�Ï������ �9���3z�DKtAh0L�q�Ʀ�w��%ˌ+>�K��SZq���> F���i�}~DC�.����������B1?�Vd��:�MD����!-�3�ߜ�wZ��BT)����N|�U/�m�k  Ak�9�8� hhA~��=ˎ���@�Tw� "ޞey��Q"�D�Cs��p�F
�!E�C.y�a�i��,�B�j�����?�c۟������_ $.ߖu�Lt� �)-�hU2kH�b�~
 P<�=% ����=�6�",PӠ���O~u�~��7wr鶜���p���N�z���+�q��x빠��)@#��3�1��_�/��6�tw�����/��8El����Й��'���?� �� ���* �Ԯ�����/�����<��s�i ���~�  ��ۘyJ�h�� ��֪"sN��w[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://tsau8obbc5hm"
path="res://.godot/imported/obstacle.png-dfb3e99d3af573251007cdf5e1c252b9.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://obstacle.png"
dest_files=["res://.godot/imported/obstacle.png-dfb3e99d3af573251007cdf5e1c252b9.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
��extends CharacterBody2D

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
		
	#while snakeDataObject.size() < bodysize:
	#	var lastSnakeNode = null
	#	if snakeDataObject.size() > 0:
	#		lastSnakeNode = snakeDataObject.back()
			
	#	var newSnakeBodyPosition = snakeHeadInstance.position
	#	newSnakeBodyPosition.x = newSnakeBodyPosition.x-BODY_WIDTH*(snakeDataObject.size())
	#	_grow_snake_node(newSnakeBodyPosition)
		
	#	if lastSnakeNode != null:
	#		lastSnakeNode.next_node = snakeDataObject.back()
	#		print(lastSnakeNode == lastSnakeNode.next_node)
		
	
	#snakeHeadInstance.next_node = snakeDataObject[0]
	

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
	
	
��n��RSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://snake.gd ��������   PackedScene    res://snake_body.tscn 2q���K    PackedScene    res://snake_head.tscn �tK� �Kz      local://PackedScene_lrc7l j         PackedScene          	         names "         Snake 	   position    script    snakeNodeBodyScene    snakeHeadScene    CharacterBody2D    	   variants       
     �A  �A                                  node_count             nodes        ��������       ����                                      conn_count              conns               node_paths              editable_instances              version             RSRC����
bGST2   @   @      ����               @ @        �  RIFF�  WEBPVP8L�  /?�/@�m���oq�l�T�r�f�7��;A�����-���I�%I�e�ٲƃA���;!�LfF?����	��߻��u}����ַ���$=�'!=�$=�^���
3�p�	ǘ�3�.�$m�$�m�l�P�m�sٮ���"l�?�vM���w�=��Q�r���k��$6�`�9�+�Do5HW��!�������]����`B:H�v�,�FJ fu�v��'���"Ћ�]�9m3�@(1�C	�8��	��v] l$�msHh�E\�!6h�0hO���u�S�SxW�x�@�~�] ����H����.RRҶAIhI�CHtRb�4��I�ʶ�pͶ��_��[D1P���G	h��k����^�/�u�9����
 [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bw6ksr13kn8h4"
path="res://.godot/imported/SnakeBody.png-6da1a0156e9d48229e299519e07e3964.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://SnakeBody.png"
dest_files=["res://.godot/imported/SnakeBody.png-6da1a0156e9d48229e299519e07e3964.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
�-&���b:uEyF�vGST2   @   @      ����               @ @        
  RIFF  WEBPVP8L�  /?�1i��w��c#$ �_*`�P �	F3i��������m3$���5]�������56�׶m��˶m�k۶wǶQHD�����	�6CҶmێ#"3���U�˶=�m�C���=���m۶N�jeWWuW""�ڶ�m$=?J2��������i�̳����0�nN`f�����<�
��J�-K?|�������m�Hr|���
   ��o�r�#_   \�u�?���~��%r�j���ܾ4�Q ���ͫ�b��y1�!o ����������O?x�w����S74m���:N����u{�8��i^ �QO~�:�p�P	�|ܨr n=5=�g�����4)sba'Ǯ�;�Z��j;�������  `��u<�F`͇�������:Q��0 �p%�C������.�,��g�xR�U��2C�#C�Qz�̬�C�0
���Q�S/  ȇ����ZnV�<���զ\����:Z2%�~&��6�hX*4��ѭ�����A�b0�9  Ȋ�+ "���`�eF�8O����Qs��&�h���C���S3[Ṋ=� ��˪G��|"�#K�:)�{2-4�����WC���f�8x��Ȭ�fA�y�y��ef �0w��ڭ�	�ҝ�d-	r��e ����(ԑ�`���h��=s�c�;�n�ͱUiPSU��-����@
x-,4E��hv���4(�(D�V�.k`�#ߠ�m��A�M��1���>9gl��׉�H�B�$Wf����޽|���N�`�,V�9��"�@���؍�;�_�h�H� dW�  L�[c�c�n:�qJ�舗���d���I�i���#�/\��䎲��gh_z�XV�rlX8��Ra+�K�	��F�O  �R ���
ol#���oV
� ���(ON��&";Jp�wX�; �>iff�L	�
��łIQ�gO�����G���,�3�S�;"�(�d;/Y�?t��*��{q3�i.��Oz�$��	 ��0:����( �H�<��/����x��a�E���S��*��)�)��;p���JG@ͅ�1  ��o� �։�ޔ���Ö�g�*Χn�-��۟i������n���I ���B�#$V����
f�hE�yq3 ��
�  8���7�����[	�&  V�P�*�������@�:slA�GA�ɦ��i��`��w?[�YA��s�;��qvt��C^��3g�b��<��U�Y�(j-^r(��T��'��0-���w3(�����Jsۓ��p#��+6{c[��Oǿ���i+W�&o��~n�>`��[Z�v,k�2Q�R�B+E��4�Od���} ���)�������Þr#��bQ|��i+����q���$<�y  �o�%�9��MGT��\F Ex���T�Ʒ���������8}(���k�:��P(ZD�*$���P؝�E�b-�p����j|����_SA٠�33G˖��a1x� ����J�R4��yo'Oљ��Z8fT�K�à�8^*�P��;횧P)�/{��U�C#5��b�  �Z�!?<��@uJ��������� ���Z���"Eh�rE3�����?RD)J%Y��3i��S�(klf��9u#{�:�.���1����'���(��Fm�@ Y� ��"Y���? A��dS���N���L�
a&��e -"%�P�IV�rDT�@%�M��9R��B��7S�l�pƼ��6���� Q�h�G�,���  �  �t���z�{�G� iʴı$	D[�1�`� Z�Ғ	- ї&ן�/|�__6�9 ��d!����2ˎa����_\�.>�ZH	A#���KI�Wd@�T ��2i��3!"�,t)B��J�t���8�c?>�U(-,���L��oT)hJ^1*g ����N�	�	$C%#i�+�� � ��a6�:
�L���	��x�
E��w� IT�|�+�
"iSPһe:t��}��up����q�cp�-�cTJN֒&PE��e�������5d�)xK5ZʋE�g G���� �4�cg�Ϳ{��u�Zό�t���3n���cuw�c�Ff�l+�HF���i�8�'�U�����L����I��VO�P�D � H�J�DN7h;�c?י��F?����2�f���z�S��G�*�C��/���\��0e����-OWr���5v��+�s��W�I�W�w2� @7$G�\I��c�q��|�3�ʃ��;����o����ϟ8��K�ɔ�>y�i���R�}��w:��Kg�N�?��ɾ8�[��K��0� U� 5�4D��+ ���?�3�z�qa���>+f P  4���m�eXb��ig8YV,���;`�P!s-�4HKŖp�ϼ���̹etp��w	E��k���Ģ��mjW  �U�T;�T
�n7J�X@�l]�h� #C���ܟ��V���	(�b�o�o�5�X:�*VP��]���LQK1B&�6�)R���a2�k	<ߋ5�ٙ ͔LKb�h9�27��f ;?nf�t����[r��G�О�n��[c�Q�$�y]DOOQ!�Jw���Љqж��3�@�M��[���Yˁ^�:z ����߅ޱ@�n��>�w�vΜ����+��7�_�s�%C@0�e0"����*����_��!�:������}cq����G:)�䃝��X�kOL  @�Z���3$�0V��r��D����D���
%

���գ�hX1RO��(Xeqn�c����<��V�2,-ƛ��k^p��Q�Vor�C~�2(ɤ�	�4�@A�¨��t�s��j,��v�����{�K�QSUX-lM|�$�cV0>Y;�ͼ�ٴ�js�v���k-;�n$%s�/	�>ShP'�t+󯪤F�� �!�+�x���F���e0���~a��)NW8vFc�Et�}.~�Ǵ�2���j1ǴA͜�d-�.��r��7j�ˍw+����=Ege�3�$rg^=�L �� �  ̲�cu��+�x�o�{�3Õ������$�Q+u���%n\@�Qn���o�@d)�Z�2A�i�hLN_�rm�ke�Vލ�.k�)j�^0<羖^]D ��@Ѣ�nE�
~�O]qp69�Cn9ِ�����#���{M�h'_/V4�,���^���֑"�SEPt9�9e��ѢA΍2��.=  c�n��ᴙ<@2ŕ��v��[@~��b���#+:*:	��   ������x$�P�N �8�Ï���y��(sv+��|��Kj��h�����'μN@*+����;�����*oF?��I;ѓ��� 0u����r���n2ZE{�X�I5�A����ژ;�{kl�=i  ��} � �ZЮ  av r�T�r�+���(����Bt����S�e�Ϗ\��di�.6~�O���|����W��� �:s뎽 h》�=W�|;�.:]�&�ɨ�������l�[�4�VO@�?�_Y0D�� �D˥��ϴ��;  ������W+�
b�qf8t{�*F �Q��T @.@����� �ν�  ��d�^�׭��ˑ���3/�R^��݅2m�?��������L'�w `�T��qp���m23T*m�^CӚ\�&=��|�4w�6wiie�27+�j�,'  ����g��6c���Wk�6ۈ5����2S���ZJ��H9����#������$����0Y�i[����;� �����@_:|�b�,���ʌ�2�I�K-.��sk��W��w:�T ̬�S��  ���H����������9 j�T�_���^�o�'G��xIs|��h���o��  �x�/ �Ղ�����?�tZ��g��;��[�F�u��}�^5��j��{�Tük]��w3qE �����O�ʻ^�T�Z�~��U�%7��V���9b��_v��槣6�7��?��O���׬kv��M|�^����_�L�~�c���I��%;��O���A ʒ�% ��  �lF\�~��2�IW�ѶB �����i��\�(v���-+����-��Zk��S�������g���b(�H�L    @?��� ���^�X� ��\fI�lXv��Z\  ���gh��vz�K�1���`�L   1�,p�hD���Z��L�d��  �f�r�j|�/�� ���pNc�Z;�ි �K�)�{L'  ��=Ca���{��A�ars�Y��ͩf��`�q��������k�e��S]\�� N �J� �	��B0��T`=�X[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cio1mflwewn8a"
path="res://.godot/imported/snakeHead.png-1fca60233cf2c37c2b2abd3f67400f01.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://snakeHead.png"
dest_files=["res://.godot/imported/snakeHead.png-1fca60233cf2c37c2b2abd3f67400f01.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
��x5��&��	��.GST2      �      ����                �        
[  RIFF[  WEBPVP8L�Z  /��Dm�H����CD�'`K�P������2�ٰm$IQ��Ú�8�CL$�vb?���_�A���O4RA�F�A�q�?BC��DDT��%���	 @D  �g�Dr�~],�Y�P.@D ��Pn�o�s D  GA�6L�w�� "& @��<�m��me������������Xƌ�R�U
\\ʠ���G`i����ǘ����Z۶�����LXCT5�"�e	��#\e�-�g�pAnmۮ��s���7��޾��ۉ:��@)�(�r����d�?�DIvö"V��� ���~6j�^9mu߷���A�(���`��\��;�S]N��{o��'���.;'�~�$�����#	Q���3�۷f�)�.j�ɑ�����=8Y�7��233333\�^��13��4�z{����V�!����t2�_���$W����UuUcvfޛ��:9>I���~��m۶m��m;��"��{f�U?}E��&�m#I��]9��Zed]]�/
���pE�����ͧ->c��~Ngʕ?�� �+'p��Z�i�nӄkI�4/SF/_T=���Th3  ��-_29�m��   ��� +ޗ|�'�'m�,˨�}���5_)?yX����ۚ���T�1�����[�jϖTܰ�@�̌�Q�,��sd�Á�:�ND����?n2K�ɸQ-h- Z�b':�V���NkS�2�XY����R��A��
_aFϗH:a�N�R�h%"�����iAN�\���Tܦ�q�o�I�4�p��Y��ֳ����P  ݅��'("9��8�j  �z0�u� �%jt�#�[��7����d���t��N��k.xb�wR��� ��;�/�
���X2'�Mgt������qJ|���Bm�;���⼥�Q�
D�a�j��$�cǾ�@�DDs�폛,�f��	-�N |�Z�+�  ��p�nմ �JK�&�~������ ���loJ �h]��@�om�� `fSa�Ka� ����r�7�>�\0�ض���_=��ׇ ��m�v��,����� ��fq:X陑�ԚK�c��V}gt�ɺ�ZA:n7��HѐZh��э�;C�{_S?t<� ȜM���]�6Q�=^6��[  ����D��#ϯ�+�c�Z ��UЋQ�Uz��SC`yf �s|��2 ����v��\ �?0׏��0m´	�I�T���������# ~�.Hי����3�F�;3l@��f��n\.WVg�.�?u���9�ޟz��w88��zf�L9���I�Đ@'������o9��wu<� (ڝN��l������	�*��::�BD�`~�M�̩ 07���X	
h3� �a���`U�>���p���H9��&�p;-����4 S �ٙT;����[n�N�V�޷����z�e��k6���u��w,������=H3���5��S 3D{�Q���&��:�q�!_@�Ra�(� �z�2�OQ�Y� 8nP�+��s���@�h! @��)�4p��x.�\�\ l�ě��T`�Ȳ�R������:��ԯ0�&�,Y8��ϛh��d�3�K�ֺ��xn�[�l���_8��Ї�^���*W��2U S:�S;���|�� /��Gh
G4#5�oS�Q[Mg��>n��>�2��  ��m� �u*Gg�ډ�����@L��@���AU��0 dW�ֺ���X_'�ݙ���e�����W�Z�ӝ�@�f����V_������o�l1�.}��v���5�@��>p�b�qԾ8��f�CYGGD#RA�6I͢�߹��;^����� ���5�+���B	%���Qi�����N�ܻ�X�u���;o~�ΛU�9��FML C�����UYX0�N	@6�*�e�;E���E�`��  Kv9�]�|�[Fm%�c����l @���g�l��^�����)<m#���{+��y�~�eK�j��T��v6�F��jm�*� &M͑��,�_nk��JTֺ�WL�ߙ�ί���^�i�4!qP#%�!B�DX!�-��E�,1�goYM��r�6��q��m��n���Z�]���51u�B���3�h�7[`h�%C+ ��E9koi$J�6�N����ۭZ� �5t����Sz�%I�"��_lb-@Ì��~�S�|�D�(�(���;E�]v�i;���m�-�q��qr&\��΂���zQ!��  ���f�)@� #�0r)�b+S'5�,���h�i$����U��������7��t� XY"�-Yl��/�� � ����]-�8䝅"��f�\F�:t��|�W�Ao���@v�S����(�.���%(�ڌ� p��YR�[X�S��5����`�prH�O��5��}@��N�k�\�p�ܬ��-�̟��S[�}��J)mDx���<��K`c��'\����O��yvS6���z <O ��� O=�qR��UN ������ߺ��p��%Ut�ܮy�h]��*����$^�:�S� ��|	�o�u��R�y!'�� jǏ�-O۠ǂר�z���u؇���} @�<8#hN5�"bʌ���:�k/볩i��ݏt/[�C�<K�v���MѢձ2����\�pn�͏�|�#�B�����0t�oo�ƃ� �Q ���Rq4��P�NeE��� �Î����������y�/��x��'=?�uYP�P(��:|�V��뭢�ּ�Ӷ�m5����ƋNXYw��py�vq���(������j�O_���ן���R�W;� �Wy�"$2�CJQ��292��һ�00p���@sj�9�ȍ�<r�9��'<��X��#�.6����P3�e�����'�QC���n�c�׏�������*��j`2;_�p������.#ǻ��b�wG��b��4ҝ<�EЖ_#�z�eO(������/��OI0(6  �y���"   a6�L��	cwsa��|uzSh!^Nzup�+� �?e��Z�[*��ҁWmg�iM� f���V��J�r���  �GQu��>�q�g��>/��m�=*���A��B*tp@��Ky<;L�Ba ;t��Y�j<m��-��o� ��(c��"3>��]ܠDܻ��h`֗^|YJ7%��|ʪ��E�^:g����[6��=E�:���ꔱU2H-ε�墼�f�Ɂ�eH�͗��~-�|���u��G*d����Y
�v�0^� ���V{�Պ2��9#e`���Z�� ���	 3j�AiOŭ�_
`����b�  s�"�;�ړ��g={U�;�B3��\.UB�+m�O�&Pm3T_hR��.�x����G���]���Q5NKJ]��D�Q
^ɍ��n�֓�����Eg�6����v��~�w��3����������j��NO�����c˪���������� ��H��U�9�@��p˿�qf<���2��h����-���?�+����vol9�+����m�����@K�Iv�t
p��N��1������"���v,�KD-��Ӟ�����g3M��n�������U���3��`d_�`��!�]�y�R��ە�R��AL�+3@�-�^�}�+/�Lxџ{  �P�u/��i��G�rc�i�N�g'��O[��E���(Q��B6���lr�ʏ{��8� j���%��`k���.�#?�?����>웟����g�$b1�~��g ~~���΁�Mu�z�}s0u�y)�� v�]����ʬ�ρ��R<m�����W�Y��a ^��@ ޚЫ�^:�򠡤-��������t?�d��L+�) � �F/H:�͘���W� 4^?'r���7f75@�4�N! Z��#��������F�W���/������=>����K[ϝv�:���; 's��Q50`��[����W���ׂ1��c�mV�u�wI]�殝��Mj��h-J�>g�E�q�?|�-ڲ����z��h�JG#��~��{�[��S�T�0�9;�[��  �~��6��  U_���ItFs. �	 }.I����DQ��A˾����F&��ĵZ�LG��S�T�5�����?���� ���c��u8�q�� \���~�o�������{��ɣ(�����kh��4�M].�u�3թhn7�lXR���ȅ�#B���&��9��.�A�\���@zi�f��*�F�]���r�#�J���X��+�&+�K�n��FV���FD�ďEr8 8��`i �qfz�|�o �%a_���5O��;�� A#X�d�5�p����x|_S��⺶�� ���%'�Qm�� ���ze���qt��5h-nwa)��ٌ�����!ky'u��ju���D�-RZ�X���h��y�|M|�\�g���>�E9��>�2����ɔ�\5����}���f���
B�.צ>���fy�Q�� v�Ҵ�m�R�h�ea��tx�(d�� Թ�/�P$�O-.�-�
��F�3
�������>��"88*��ĵK���L��V���x�.�!iP:����7s�A�ڿ	ց5�l����jhKR�!sZ~���0�(�%��_ ��q��7� B���w��@�I_�
��d @� ����O\�"�R=Y^x������@I��p� -���cq������А� v͎=�������{�_h�0�+T�� .��Қ < ��O�����w	OB }!b�%��4#�/r<js���u�����'ŊE�iJ
����U����U�v8��qvZTA��P��>���+-��r稪:����av`&�ZD!� ��o���W���5�;��[Ve ��'�T�� �0#��v��(���,@�ղ ̲�@P$��g���Kqɋ�CZ!%��_yY:3.d�R�����%р` |)�80z����D�E9�4w����o����dpѰ=�֘?$�ӴdB�hSD�ܭ����>�aSԊ	5󤨊��Zf�
d�Z����J�m���W�w� )�+$	�fɤ�_p�v�З^5�g�^M��9Q[ S@n��y�J��p^���N����"qTc�(�u��-1����w� ��gf��+�W  �ַt, ��7h3 �hZ"�� @K?�����.�Y{�Z�~$+SQ,KE�h���5���<e�E"!�+��Dx.jˋ����������3b�*$��Z������t#T�ek+S_=R�*�oѯ����B*���fM;8ֈ0�~���߭�v8�ࣿꔝ%�h�珅OX��u ڍ�yB4L$Q�2@�������{�>���g�9;�?��lo�V���� ���R�B
@�,�� Q�vP=W���)��i��:�5��7c轋�yH>=��f@�k]�m)M  ?�y�H���3�'��&T�  �L�%�j�	>2
 �o��� ��u��`3QDv4 ~���I3��3��4 jb!�8x�~ iZ
��&U�Yh��u���/ �
����XG�|-�|-I8&�y.�H|O7&-@+�͈��S�FM�Ѯ@N�Na�����h��P	K�uļ�X���m�>�'*��ى�Ƿ<�<����w��m>r�9F����	r�AFa�D�2 �����;Z���/~��7Q�+d��}�ÇzTΖs5� �/⌏� ��|1~����CO  m��r����H�e� >駾�{~��BXx _���/
@8�4�����z ���p��4��H�HB�p�Ρ+��b����GL]��(z�2�������N'ߠG{�
�'V1Чv�� �*~��> H����|��ͯ�y몁�C�;s-۵�_xɆ�7��KO�?�|%[�.�$;#e"�5j�7����? ��0�yRt?к[ݏZNq�+ٻ!��k3۬.5Z 8����@gί�q �j%䚢1� -�ɞ� k'��~��x6,�v���bЬ;��ϝ�>�?�e��) �� t�Nx�� ��v �u��7]x���2pGHC�٫�?�k��+��>]���D2A����O	��q, �������}͟��}���_�ۯ�������tn�nłr���H�3� "vw���v�ޔ
B��wv�݋����O��O�رS,[��3D  MCM�("��]�m� ���n �4#�T ��uO�tɣ#����	��k�֤�z�&�iL�J	���ߎ�m�vF9a� ���ݍ s+/��l�zI.���_�i�RU'�����G��=�G)�h�&ˉ�X
�kmP�B�YD��q���y|�_wܸ�/�Cw}�s�g��?]Ys~.Un%i�Ε�ə��S�Z�Kj�ԯn�[\3��x�V���͗=�A8}O�?�8�nd� ,���r, ?�� �.e�fMVv��C��R ��F�7>L��$L @�Lٛ�v�G� �9�����Se6F/6�o��#�:����	1i��d��N0�z�����s�����$������3�}�[����0�*�ڙ�ra"; � �"N���G /9���W �X�,@��Ti �r�v- �����6Dp5�0�8�l�MB3oG)�� ��Z�`���U��[��4b��5����[]I��5��*��ة}�4����lU������d�-T�e�	�Hj1����i�������[�J�'3g`|{ BW��fj�3�.��� ϴ�WK�K )�ԓ �5���\�x�   #?fQ\р�P �ƶr�TpS���z�ߤݪ}sc}l@�1�k�����W���,j~3��Ȗ�=�(lo ��$�.��U�O �U�t�V1�+ �� �Y���W���1�r ��� >����|w�R����Z�^S�5`B؞#(gjIg�����M'��,�(ӎ����>BO���pY��j������}3�v�-�8E :��Hk�rn�qt�
UdP�܆@���+�� ��Ӈ�?
����L�)�sF&���ːw+  �0��kC}  �"fa��G��K� ���M���H��nF���#�`���[*ô�jEA��W��N,�WL�Q�����pP�����gM�⒙Z�22-��2]��h<�)'^y�WÀ\�������_`zˌ#�
7՘z��֪���N��^|��1|�6O�͓ ��WIiȞ
�A��z0�Ҥ�d�����V7z���9t�"o�$���]��[�}�[� �)�g��{5H��Σ��r%\o֫%yDN{��ok>��;��Sɶ�
՜�@�����5�o�E���hV�V)�ߔ��$f��|� �"����ge�_��h��)� �5XMx���gfT� EF��!Rzzĝ�H�^�l�-�̗ex3��L�z*%E�g��E#�A���� |$�i��;�ASV����#�;�2'�L�Y��]Y!&ƨ�<?���18y>e@f	�Ԙ8��eRP1� `kP� �z� �ak#����PB�v-N��U�!{�C����߄`����f��A�!!�q���T�<JDV�͈������y(�ؙt� ��>��c,F��������쾧�%��CD\l_y`�m�2�z  8yT�����k-����4���; �N� �巈c�*�+ Pi�݁��(%W���4�rlN�6	d��~�$�% 'J���ĘU����r/Ԡ���&��"X��bk��O��:��.=;�  �ޒx��m��1 ��Zc�$��t��q�h��"���� ��v�:�t�������\�Kc�� Ŕ(d��J�LĨӜIosCr�����u��H]^�e��sD�v�P�i�@@W G�{Ǌ�^��93��U�tR0��{��o^_����n����	�{�MG�u�j�.q28� �R3P N� ��犼D� ��e��%r������F%���o%���Ѧ�攣���#�_4�,��r#s��Fs�h�U�;�R%L�:� Ѧ�I��K�,�_�X�����$B���EA� �S�\H ��p��  �p�[˻{��5�줙M�V:���L> ��80� Gket� ��=�0���b�9���jV�i-4H���FŒX�N��1V%���ת��:�
���_��q�ET( �{���>/�wpD��$U5�&�zz�e�\a������MtT 	ཛ��~� �s���X�Y�o�,�~ ��hF8$`�=�e[/��T��ލ���j�w�{2�Y�@f���Ehk�[�+X�6)3�E�r�����.��x�3��?���3�dgAw�IFN���L��B'M��(h�cL��ܻ���o���U X1}����\+ r:Jt�sP�^g �k\'  `�6��ҟ������1 )A?Xq<���(N��(��Z0�1������@Ҭ�����9��_��u#�(��UR��g��6�9���+k�E604s4Qh�9�(xs�-?��VzƖ��\3h��zu.P��e�N����h0A^lk��i��(.2   ��>��t���UU+��I��d,F��Y�Y �_,2��= ���?�+� - 1<k�H� �3�%�{�c�5/p����a��ؠ��3��܎#.0T;cƛo�#���,�_85�������h��0VS3^P��ߢA���Ļ�8�j�T1����JX�cf�*7j�2�5���xlg_0��к'�q���' ��I �c����� x�������J ��,��"���Y���W������S)1V��yҏ��!a샵0���;-`ֲ�T��~���54��MN�@`zF��5�&��*@}�vk �l*�?�:A� Ԕg��?�ժ>Y �=8��ƻ����xq	 �İ���[��ST�<cu8�=\�p��>6��M��kp�3Pl5Q�S�����$���qaw��X�6��,�:*��;��e���^�j0˴��UG�Њ�����Ժ�^����=�%(�����subQn�$�-TrM���)V�]P�D�Gm�*�5�i��s��L�2ɫQP/	qTދP @!� i
@џ ��8��� J� @�v#ii�	2�S�_���BU怍�z�ծ�� $�j>�#h?ytbL�wv�k�h�D;������][�)g��:q��PZ�����V������k��5�x�h㥳��Ϣ���Ob��@�8��93�q���5ɹQ&�5J �X0͋Ơ�M��H&��yl��9*�����	���9����u ���MҏHF�������X�2�#�}8 �n���2�k}����w�@�j�b�]���L8�~�y
��?9��y�������  `�I�`1� x�'� ��wʲ��7�
 �ٌ��j܉ ����8y�M烺����c~�?PAh���B�0�N���2�Ծ����PJ��t����t��B���7 V� ��S�
4⊆'@'�(z^��IK~6]��e�]p��Rwqb���4^�������P
����џ7}1��(�;j)*i'��ʊ� p�Л�;���U��l�S��ŲЯ�4�ا��F�WF��u#X�u �b�6~ ��[Uk���N2��.��{�Ez pL� ?��o��O LI���o @�(�&� �6�W��O���VItC�5�xf��4FV#����:
 ?|���xĀ ���� ^��|�-7>q~G@�y�����o�:�/̹ؐ���;��t�4�黭��Z��{�_�ӳ]d	2��j�U���k @�8��NX3��(�Xk�7�Sζ�8[���ƛ618�z7*�#���5��� �h ��p0��y��/ ̳^"��#'� @f����X ��ז0ŏNO4�nD���͓�� �-�h֣s�b`.�6�w��z��ydwM����hR��b��9L�� 
 ��K��ˏ4<)Pmo�� �M/��R����4� � ��{"�E
rr��Ym{� ,֍�"J�ӣ�=�r�)  㸾 ��� ������"��w�1��7�S�4uw�M��`�V�'��j������@�win"w�<ښ��I*��@ܘ�ƨ�ԛRQ��r�nkn3� ȥ���"V�5�?)�x��jt�?f͹�T�`慝%)�]���|Ӻ��n�<{h�}��[�S�q5 ��X��E��F_Y�����M�nU�+�ނb@!��:o�[�ǵ=�֞��,x�^��\
W坸���%/��e;���gk^)8���_��g �j� ��bv`�K��f<3_4 ��Q3��ܡ���7;�<1m 9dn���Ls���T��0�V@�	��Cʄˡw�&f�#h@�0�n�W��5�*��Q�@z-�Fnh|�W%�P�"1}1sW�9�%�3mhU������_  �,q4���{��/N���t0�x�-����L�K���B�u��Y�m����z%��+�� tJO\� ���h�ȯw2�^sf �^ 8��0� �եX�_��|a��2(��@�}eߔD�����GƎ�h�
�?��D����U)���&�Rh���_ k����A�� �3�ݿ��~���H�* �Ja�]��Ot�e猏#�>H����'ZD}_��+?�� ������9��Yz���7���!'t���^.�z��W�S�$;Y}[��8�"~O<A�I�	�|� ZN����}͉�"�����A��X�|hQ>��ٚ����4�Y����>VV���}4}��jI���7�X���n_k���s�9n.L@��N����w��?�I�*ZEy7�����޹� ��"S�Y�qz�b�\ ���ӿֻ���g���םU+gkN���0��[��� ��]U5z`l�H'��hrγ��O��O�xs�&74��CmwZ������������}z|Gh�c/Ħ���b�r�4t����I�����K���Y�  �%
~\ 1��.؎d�SN���F�>� �)N%� ��h���U���)'�}�6)I~g!���ѓ��~������f&��<\pF��5{Q����Ǜ�PZi�]& �?d̮�Y������_��;�.���B�.:G�a�k�uD?�Hdv�є�� �K���ө�}> �0�=��ic|�w"	  F.Z@�s�_���.o�* @����<��60t ��H�-����������D��4��� ���/�v�M=1(/d��0�HDc�ƹ�储�d+38 '���c��h��DY�0�s� ���s ��� X!qT  �/�L���QA��Zx|����z��T�x��������#Ɖ�=�]}&���P����o5� �F�b&�l� R���ˁ���&���m�k��ZC[�p���tN��x��*Wv�Z ������ �p�4�A�kW �|� ��Q�5 ��@� ��3�[ |��+5�	��o�&  �o�E���o7���m���T�E�G�+ƷDl�m( �|���  ~#�p`��������[+[�ե	C4��5�Ƣ���Z�� p�ko
m�� ���/ �D)+��	 �O�� v�`?�݀[D9�( �y&t� �@{���7��7 rs�h�]wW ��@�������c�_��[��N�����c�%� `윊ؽ  0�~(Σ������L	<�z&:�1 ��p��F�#��X|�R%���2  ��8�x��~ ���r~� u� ��bgcO��h��'в'I�����_>����q��8���Qxf+R����{ ��`C�=��5��Q}���G�������������h2  ��ͱ���k���6ԭ] 
Z����5UW���6@�^sæp�7��j��r��f��N
v��n�~�*񚬕�`>}��{�	�����	7�B7�0��Q,�W ٺ�,̼ `���7n"�J���+�5�*�j���	p�o�+f�d�udƖ�s�(N���S������ɉ���K��^���wj��k�&7|��">m��S��t~�E#(�-�Y� ���l̎�����ӯ�3���_�6�+E?�i��
��!2��0 ��8� �������B9�W� �(3���# ��'^����� ����ʪ�]�w 3��w�����f�QFt�(Dʬ8Pq��l��ֱ����U�����������M�?��~��LR�/���� }�M��X�Q  �[sQ �
���* ����ŝ�^m �&ݻ�m�%sb  �i� �� �<?P���& �ٿ����l���<��=o�։�@��[�
�n&�n_	��5
���]�`]3�9���c'l]7���P���-wN�d�D|��鞘��j  |n0z�����  'SN*� ��/�2���� :� h���wH�s�D�B�#̀H��
G��⼵�����j�~p��]�, ����!�R\���QP��yO+�a܍�i~z�����pj�#7~��& J��f�a��U�dB#� �� ֩w�L���C�(3N,�u���k����?�GlZ'l�
��� �~6�����ΠG�h�Ԃh����&�t/��MV�-��Z�͏�ܤ���`U7�/���ڰ=�:�G��;̯#�-��T�`��ڠ�[�� U��N�`���^���X�x곇 ��X)��Y6�fߔ�j���`���?���,^�h��ZeO�   <@���g|���oQ��{G'E�!���)zf�-3@���Г����3'[W������>8�>��r�v��LI3�7��y{��'W�5��u�!V"�qp�/;N�\UI;����7Ь ����P�;\�6|� z�� ���9k�s;����>�q��4���<0� �����3с�m4�{��"@�x*QC� �\Y�v���F�^�kH��Z���p|�m~J�e �#h*eK��`?=k�a"��Y��e2*�e ���%Y��� <x���k�������� p�*r���?��Yc5�c��T*����#���Mh�\���m�s>�)U����ʕ���W�����_X�T|<7pt  ��n �����%_#xJp_��׼O+��)��`M�����iOEr���7~?@C>hւ���)�WE��  '	G+�4_  ���'3KT�V��-����qb���8�Se�y�  ˶�x �O�0j��;�rO1*MDG�#P��������5C /�����ݲ}G~��F:h�MRA�FXGG>��{���ŉ�Ǒ�� �[?~5p�&�����1����M����2>а��`R�(�2+��$Ý��%�ސ�[$����*�����6o\��x��3�  ���K�Ŋ�+	j^��{��j=ؒVHe�T6�Ny��~�� ����m+���  S  ."����B����5$N1M��4�U�����ʙ�;SW��	��D��nk�u��^kj�\����֌�M�����%��C��}�ID���O������/�*�)��fS�6x�H?s�JM�?��#  �7W MC��u���@b&�H�x�[3�_/���K h���p�'�$��R,]�?�f��m������*��>����ED֋|�w ��{�pK��	��ޤ��ݎ|O���)a�
U�)[p*-�2���m���e3�BZ��8S��Z�+�R�a6��0MS�4�K���Wj 3 ��gd  �P�朗,h�39���x��x�V�}~P�5X#$�^1E�T��\D4��,Q���B�N�^x��w�����^894�wvD�D�P�XX�[R�;y�  �b���������⥧TLV/�b���Q	F�|��ԋ�G�׹�� �	�� >�� ��_��N��V  �;��Se�Yc�p�2X�_�燁��|�   }s	 �Ԩ�`/��e,$Ĩ{�<��q�\�M}���Vl�N�2#��E8����5� ���n]�/�T���n)X�U��x�v��D��|f̈���� �v�<��"Z�]�C$ۢ�����T	c�.N^G�Cj ��� -�S �p| �V��4So�p0�� dq�8q���@C�  �Z)�O��h-cn!�"(�(�!����j�~�*[i���O_���6����81lFf(j�.Ϭ;^r�
  h���<8�Ϡ�����t[���ӂ)Ct��I`m�z��!�Yw�ܬ�,I���`�(�t
�� @���4a�Ds�h�m��%��K�P뛋 �V6e�  �&K���/>�hT����10�����B�O�N�Ժ�X�{���� t����(ۮ��a��m RZ�t�P'���)�T���: ���p������ �A����ۮf'`�Y	�'�;ىB�Y�����bB�S4��ڳo� ���>�^:c�Y��{O>�MIJ�/��2��,�{�Dq����s2�#-� *��S� ���L{�6قy�u4�y���c�݇�8H�Oȃ���W��.hw�S�:i-������y�����:� �\,銹m  T_*�uc����<��g������+ �-��E�6%3�d�t
����zbϼӻj N�ݯ�����mL-:�����G�#q�Hn��2��hu��iI�EY�ĺ�e�@\���B@�M�TT:�$��_h�6�?�� "8 ��ߋ�y�E��A��  �C��+F�R�F\8� �O����L�M�Q��(�� "k���� �b���Vl�16;R��.��"��R��u�yF�r�P� ���^\y�e�'oXԽ&��xteF��w�:J�خ�x�Y�|jt�������/��]w����)�����>_>ò- �ӢʴTI�eD^� ���\:N����X�v�4 [%�`�X��l;��N��y��
@�: ���E�F7 �M�e����o�`���?&�����VAC!�m�l y�1�	9ly��8�{��[񥳇���"!�O�
����� �k��_d'�s�Ó9�}3�R 4��� $ \�+oGph�پزw �;�b#]O ����&��P@22��/ �hh����3�Y~Pڲ�|���E8��1�(F��4��&ʒ���[ge�ϊD���1�����|���6h���£W:�^�aQe����YW)%�� k��)�e� A�Ƚ�E  �΅H������ �`��D @c�$�����VFNo �{��R����@lعÕt3"h��dd���^�FN�  #�R3/����׸L����_x�9v�m��T"8b�B�4͒B�Fs�Q���񙄺���������l�<%9z�gk����Ѝٛ�|�Qgf?2�J�����Q�s`2e���\��X�E��dJ�9Y�  a�QO$�2@W*����s�y �G� ��OM� ��� �sdNv�-L�K�5�>|JdK��
���1��>�:�-�t�����*|�|M
f�>oj9Z�)-�B��%&u����&r�Zy|����uxJ�쩺�Z0JZЌ�B� D�$d��e%��_8���;��*��i���P�L}@EK��q�@N� �rk8� �1�{g��O*JZ��c4���) �K�<
���:Q�L�7Y��>�z:���M�� �i�uɆVQ$Wf'
(k�m8�v����s4��� Hz�K��-����.A@� K���Fp�0�V�$HH���$��0:�6O N�g�2}(�����`�O��P��O<Äo 	)D��r`ұ�7 T�J�	  �� �r�i((eJԈ������á��$f�*��Bh��h3͊����� �����˫�3�4!�g"��W�Sy��7����Y�$|?�ѵ) @5���2�B�Q���?� ^RL�� ���߈�O���}E&#1%�g�����SJ��&+y ��Hf�R��O��f1�)j����V>w�(m
(Zh�L��T��m- ��
>�����Ҽ'O�BǝW��*V; ;�j\�a��SL V�0(d
��1�� �԰�'�0( �W��<" �o=#L����F��A&���$�@P���y����3 �L}�U��{Ͽ�EKkE��*b���3֏�`vy	�-/<!��+���E�L8>J�����-k�:����G��z3b|��G�u*�$��y��\(y��e�1:��J|^0rzE�%�brJ�ҽ_ HJ�"̉�웰��#�'n�ix���z �4$�9ZEވ���*��"�q��/�[��w*s�g�_Ł]�WoF<x�ڴ0  �ct'D�y�j4@���(�ѣ��g �,@H N���C��'�䪖��I��~J���\}N���o������c|ˋ��ى
���Y�"i�S���#�|O�������6�A��S!�O���g�R\Vz⠩-�{�x('l'l�e��O3q.���\����i��y�	��z�}�K ��6�@�ԯy�����a�k�E�f�h5��yR��3��[]�'�ܹ�%�$$p�2�օ���M�6����^Ҳ]kߙ�zh]5�����|������ �����* *ow��+r�����M|E���d�l������D��=��  hr 5K���  @�Z���-�f ��r����Xw>���7�*����nگ��j�X!��J@��;ĵRᆭ��|���8g'M�D��� 5>�łr4݊��_�~���=���~u�k?�����7��k̶��;;����% �[���?w�^���kl��4���(+�"�V��� �h���"w�Ő���ӂ��"Za8��(DMf
@�U�WD� �^o���C @��?�3r��Q!�y�C�jy�����X
�Z��:�]U��HuN
�G:8ɦ�rk����?]����]���������uq��{��_f�.YD�H��� h�9�5��u&�?����b�-��_8Ő��!���E�VQ�)�����/��P :�n *����.��?|�{9 �f^v� �rT9��8�@э2� �+�0k �)� �U �ODG&��9���L���c�ɤ*/Z$�n��f`�!.!.�^ͽ~��֎����X���4�C�2ͣT.�@�$!pN e x(�Al�5�x  `@��یJ#ۉ ���z�P�t4�Kˬ& ��Y�T���˷�`��K ���)M�X��"l��u�0h�|����Y+�Rq�r��ʯ�Ŏ�-�G�de�	�k*Yڬ�'3��-Sɤ��xT��q��-U&��ۊ�4� ���7ߨ��`��:�6f.ꉕ�~��.���-HZ�lMK������hO*$W"Ct,��Q����� F(DtD�"�Vgϼ h��?;ЧS���6��U��� �ۣ �f�/\���X P�*�$�L)�����?�ɢQ�n���݂�y놼�s�3s��9��	æd���y�*s�$��G��g#��o8�)q�"� 2� ������[/x��\㲃�(TE,����s���H�[�T%"��~j o�`�٦ fw�B� ��p\*F}I%T�i�W�i�*�D�)�ђ.�(�ܹowp srl�Ъ�'O�bu�ơ\9?����C������$l1c��o��d��o�0ٹ�زi���v���5�W n}�kT� 4�@.P8��� ��= ����d��Ѣ �'�D�)���/nk�����-I� F;Z/�E�� H��/ v>� t����d���c�筂�2_F�.��)M8>&��ܶw�r�4S)*6#�h��z�d���L�nO����=|]����& �y�}P��wp0��P,F�Y�,u��>q�h��I�H{����3���Ad� �\���`߲q��~U����� P�5�U ��+��͟��)b�`o'Ң >v9�ε  )tSy����L�k�P>�_�G=♄��kL/o��鷂;����A>��� ޝ�1�e��l��ĳ2�-��P	$��O�]��#���( }rL7�N
@�yZ�$е�Qo���d�y��	/ mY���e~o_��\}�S�M����z� 
�"XN� ���u�E���
@����ډ�" �h ����Y���ʛ6�Y���W�����M�b:|51	E׷��es��(X�;�����d�C� �I� ���@�pJ�� ���>j�6���2�|�9�9Q��t�cp�]��$���a`�@�8e.`��ۿq�9u V[�N�}��S.[y�}�@11BܕE̦�,-�C6�c�6 ���|rM<�ʚUiL;� |�ceRʵA��*�'h,o�ޮD�l&�\�;���E��W�X߄&f[�mX���.Ȏ ��D�(u^������K�ޜ ��s�Z��2W$�{�~��	�{�L-:�'o h5�We������{��%@8�Jxۍ�t2�!�N�i�ѥ�ƚ� �?<��5ov�Y�l�2�{w�D�<�%�b]�x�Uo���B���7|�S*fLzF�MΜ�a�	�w��Z􏭛����^��W���\��_�ł���"μ��r4�$�Ԓ��ZWN���5K ��� �n��&zg��ݏ�A� Ƣ����E�k >�m,��/�d���;n\7�k"	�0���v�]0���L � �VDXm X�.�=<c�$X�sc�����"f`,F�Ij�Vee�V����lĂSٹ�y�Yn����ɺ���q���jxv�TJ4a�S��(�4�h�n��0d�g���}�in+-����z�#�bS�5�Ҳ]�����u��(�����
�����;0�j��T �D �B�W��Wje &��"���n������1��T��,�eY�Q�����T�l�i��]oU'��^��t�� DF��b 80_  ��{��Z�Ϧ�_�ޓO���ADhߙ��W�����D�) �5H��i�qU�^w :)V� �>�� k���dW�I�(�4��(8G�;w�s�o�\A���εH�\J�u�a�F�c6�	�$����t%��H<ݵ�Ҳ''�( ZQ�L9�g^ػ�_x@�O�ܵ�}��ܔD����?��^�ɿȸ�e�H- R��f�N Т5�1�/& {XEDg'x���h�Cv����u�_�v�H�w��JCOk�4�A&�V|fh���i��"e %p�I�l���m��K/�ί��prh�ց�6�Ԉ�&g��)j���3 ?8�~�����}��R" L����;h� T4v�	 U-����K �� �h���`�:D�  d�|�p�a�$��fz���7ʫz.���b��������`W�h	4#�ƻb�@y�&�rg�<m��'�ܷ�e�ޏ<���ǌҐ�P&����U�L�� 	ι�e:w � ���KV NA:���s>u���w� ���N�ׯ|�K/�,F_�~�쇭@.�m~�ϛz�5Q"�8�>��Ժz=��#��ȣ��P�o=��?z��s���}M{���:L_�%R@0Dj��sz�Ge0��=��h15�[���ys�;�L�4	"��9�f�ҙ�9���:��T��\�������B��>�d��� �=��C�V	"�}eb{��o}�m΀�k����J;���� &���o<�)��;���wv�2C� 0k$���>�v8D��./����|�.����D���ڋT >xI`����X �����5a�������kbm~j��Xj9�e炎6�'S��{E���Օgf�Is�-z�`��蔓����ԫW�?��Q�0�D�&p��I�8�l�wKyB z� ҥ&�~��C��p�n,������T$���u���'2��遴�o~�ڳ%@q�:�d}�3�*`�PY��3����)�E�Hn8 �4G���pq�|��}�EC_S"E�aгW���C� Rv���d��I!W��{ܵ�ܵ��80�
 P� �?�U���D�׋I>uܡ(��q��$͛.~s�0���4	"��@e)��6d��j�</iW���o�v��c�����h�����&�$�1�wK���� �9#���i�]T���H�.��������5 w��>m"��?s��'ߍ3A ����\w�*�^����pІ�1l�|��,�3Zx{3m��Z�m+4s����b4ʯ?�>��Bʸ{��F��t����9�Z�ϼ���w�i�h�:��]6��6��|��w�+�0��쥩nC��M�;�莴�������:ǐ�hH�%0�:-b������@��8`�;��[[��s�t�T��eT+bz<�����Q�SPxs϶^%t8�����.Щ*��!?8rb4�|_�n�V/3�%�4�0�3�@��Z �����h���;	{��7)�QӢ�.�R�3,λ��{�8�b��WhQ�L9�W���5^a�g���3���q��p���egX\�!������~�:]/���df�'�t��wR���'c$_E@ÒF����z�_}��2�O�|�M �Bm�s�9��r%���o4����4K ^�ۗ��g���)�2$\�S%N̦���T��J��pBxL���|���������NsU������=�ϯ�3��F709E:a��T:ؔ�C��2�I���`��(��Oԉ��Q��ߞ�������W���}~J4¯�	'@i����L� �y�uD@�������P�� o�	  ؾn7�<o�Z��Q/���x�V�s��˽��TOy�k� �Rn�o�BԊY^j�hZ��}4���]�P�3M����TҎ<�y����͓�W.�2�w�t��tt�  �ZtǑ��N��5���|�"����r��M�SI�ڻ|��V���@	i����n�������S��=���n=87�]�
��g��[o�	 * ��p�؛��\�>t�� @��.�|����O�bD4�7����y�j=�tm`�{QF��ގV/ヹ���<-�?�" ��Udfd��E�a'��?M��D�.��Q��Q�b�_Tv%O�30�I��ۖF�gx� y� @��(� @2�;���%>)�y�����< �
n|車�g��Z�C'R��Lj���$x�--w�c/$ԞA݅���q͘����?4��}'  8=3>8��::�!���� �F����QYmT Dt�N@wo���Q��,b��8�Z$��  ��8�� L󍨘e��	�6�	��0�&���' @�(P�&'��Jf�ίA)8�ae1�N��
H�y4�&D#����dd�R�31[� �(6�L3���("n��Hk�qh?���f��9P��"lFI�)<�>)��t  ����I CC�9�{#O�Pn"1ЬD��iz  �riegn^[ے�=~�g��`ްg�-���ިoԭ��¡�ζ2�:��b�K@  �T)M�󮮷���>��@�"�ư�崖H��� �@�rB̓'���j��ri4�k (@�Z��b�T�W����If���D��a��΋��NCsQ�͗@�&�:�75��}��ᖪ��r�X�T�'.�	`ayΩf( nPƲA�V)�@��g�@
 ��Q�[�7� olG�x �% `(���t,D�C�$�degn�D�B���y��({ӆ��pt�:�(��<ؾXsz���"vL��m x�#G_���[J�rYQ
�^Rt��i���77�E��6'�x�͸�N-IM��*�&�H���s$��Zp�o����	h�k�� Xu� ��8��`�q�| ����Z��@W%�� -�iZJ��B �Z� �x/U^}���� ���6�u�'0�v��m�h@+��d�V���U3��h�hsyn�	�v�J轞�� ��� p�W~ȝ����f'������s���s
7֬`���.҅%������$��;�s=X�|g�<γ� ��X'e�$��|��maTk��WN�<X�<XcN]����hK
� -��d^>*��e�* �����l�?��:�6S �� o����,�  �,J��w.���z~����
@�]���> P� #� jb ؝F�g���;�?��~�p���q�}�RQ�� =ٌ0��]�$������<  ��x	�9-)� �4���"��BK&��^2b��F �@W��TF�h��'@�����! �����,����Fr{K���@� E� E�� ���s���K���)�V�;�:�D�&V�Dܮ�Zۧ���-eV�T.�ġ��XX!�Hu#�n�=]O��[p:�	�(D>=�!}@q[| �%���8a�����خ �6in7Zbh3���� �{"Ȣ�^? �:��`c_ �z�f�	 ۊ=X�s@u��/��ӫ%�<o�k�0�}>
�.�U �GS���� �߽���LĬ.j  `�慮X�#�	��P�|)�:��r����Z0�B7�7w@��oVt�W7 �@$�Œ;� ��B��%թ�S`�B�"��m���yw�� �q:� �ѡ> �� �"�5 ��@�ze�ǧ�\3   ��Y�~�N93����NdK��1�� "1^�ʌ��j����@6�.�7��ʵ ��m׍���լ��"�8>��4S���r�** ᒪN ��1����<���Z�r��]���$��N���"�+m_��C>ۓ���>���ڴ�Ղ ��s�L$��F嗂��:v˫��A�SÀ�&��\��)�������D@|�����x�7��3)I�\0��^O�a:�āљ���7�`R��:6�a>� �tI�Q7@t)���[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cnrx7vrv2431q"
path="res://.godot/imported/snakeSheet.png-df1c62c1f5edd23fe1ab2aa522848f36.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://snakeSheet.png"
dest_files=["res://.godot/imported/snakeSheet.png-df1c62c1f5edd23fe1ab2aa522848f36.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
)��������jRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    height    script 	   _bundled       Script    res://snake_node.gd ��������
   Texture2D    res://SnakeBody.png ���k�q7      local://CapsuleShape2D_fexd6 �         local://PackedScene_0npdg �         CapsuleShape2D            �A        pB         PackedScene          	         names "   	   
   SnakeBody    script    CharacterBody2D    SnakeBodySprite    texture 	   Sprite2D    CollisionShape2D 	   position    shape    	   variants                          
     ��                    node_count             nodes        ��������       ����                            ����                           ����                         conn_count              conns               node_paths              editable_instances              version             RSRC�1�ɯ��I��Evnextends CharacterBody2D
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
5	���鳨��DRSRC                     PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    height    script 	   _bundled       Script    res://snake_head.gd ��������
   Texture2D    res://snakeHead.png ]�Y�sJ      local://CapsuleShape2D_ml8w3 �         local://CapsuleShape2D_as37n �         local://PackedScene_kykda &         CapsuleShape2D            pA        @B         CapsuleShape2D            �A        @B         PackedScene          	         names "      
   SnakeHead    script    should_move_debug    CharacterBody2D    snakeHeadSprite    texture 	   Sprite2D    CollisionShape2D 	   position    shape    Area2D 
   RayCast2D    target_position 
   castPoint    _on_area_2d_body_entered    body_entered    	   variants    	                            
     ��              
      �             
      B    
     @B          node_count             nodes     C   ��������       ����                                  ����                           ����         	                  
   
   ����                     ����         	                        ����                           ����                   conn_count             conns                                  node_paths              editable_instances              version             RSRC��"S�<extends CharacterBody2D
class_name SnakeNode


var next_node = null

func _physics_process(delta):
	
	pass


func update_position(new_position: Vector2):
	pass
	
# Update the next Node if an event has occured for us to change
func update_nextNode():
	pass
GST2   @   @      ����               @ @        �  RIFF�  WEBPVP8L�  /?� g��mɡt���>
�6�g9�+Ha+=��d@Ꮅ' ��@P 
P� R (aN�4���H ҳ9�vwq��ܦӳ1� [�lӶ�\�۶m۶�������=��y|#�?b�g;>��?�=�4�'������ `&!Nӛ� �]ͭ�)׸���o5)����r�d���(�o�&��J�S��3�t1��>�B�h���g�1�@'U�>팬cT��u�VWOM [T����"Rs�����J�]��b5ӊ2j@u�*�=�*�V�S[�Q�Gu����m�:�Ŗ͘�*5h+�I�-�) �+��r&�%ɴ�!��YF�jK��T2��:J.��b�a�i�7 %�e�� �xcLh9�. ,y���)�52����#�bC1���G3p�::�a ��G�aVSLp&^�qɜ;��`Q�,Ut�0��)��S�lpgI�L1�h\rv@�(�y���{Ġb��>waU��I�(֙�iE5&]�A�)n��V� �N�љP�1�T� 8P��V9�6� ��Y�ChK�>�i@5��r�iEu�m͂
?g���z��z1�
E��a	|C��Ӂf�Ī�׆�#�������5����8��@E%̥&UAd�����&�~*W����MaF@�CI[д�Q\Su>ܝ�=x�;>O�g��%�cg�6�� ��+[remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://5bieonbobym3"
path="res://.godot/imported/wall.png-e3261c66ad83b71f524576fb4f3c7b5b.ctex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://wall.png"
dest_files=["res://.godot/imported/wall.png-e3261c66ad83b71f524576fb4f3c7b5b.ctex"]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_compression=1
compress/bptc_ldr=0
compress/normal_map=0
compress/channel_pack=0
mipmaps/generate=false
mipmaps/limit=-1
roughness/mode=0
roughness/src_normal=""
process/fix_alpha_border=true
process/premult_alpha=false
process/normal_map_invert_y=false
process/hdr_as_srgb=false
process/hdr_clamp_exposure=false
process/size_limit=0
detect_3d/compress_to=1
����q�p�Y��$�[remap]

path="res://.godot/exported/133200997/export-609f762188a68253d349ec58c4f3a8d3-game.scn"
�W8Ō7�"�l��_[remap]

path="res://.godot/exported/133200997/export-cce30dd689d5e44431a5ddc6b0f1b807-snake.scn"
��8h"��,���[remap]

path="res://.godot/exported/133200997/export-64e8b35ec701b5ab61828c37582a2731-snake_body.scn"
�]IHg�j�[remap]

path="res://.godot/exported/133200997/export-e0f7bfadc5b3cfd40788f15a4ddf7521-snake_head.scn"
�-��y�k�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><g transform="translate(32 32)"><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z" fill="#363d52"/><path d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z" fill-opacity=".4"/></g><g stroke-width="9.92746" transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"><path d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"/><path d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"/><path d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z" fill="#478cbf" transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"/><path d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"/><path d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"/><path d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"/><path d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802" fill="#fff" transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"/><path d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479" fill="#414042" transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"/></g></svg>
;8   ���+�=G   res://floor.png�1G��k   res://game.tscn;|�AuZ�H   res://icon.svg�y{�   res://obstacle.pnglA���T<   res://snake.tscn���k�q7   res://SnakeBody.png]�Y�sJ   res://snakeHead.png2q���K    res://snake_body.tscn�tK� �Kz   res://snake_head.tscn�dc���A   res://wall.pngl� 0hO   res://snakeSheet.png:q}�ض_   res://apple.pngD����   res://Grisly Beast.ttfYK����]   res://Grisly Beast.otf9����'�~   res://dungeon-tileset.png;|�AuZ�H    res://release/SnakeGame/icon.svg[ÂԵ3:ECFG      application/config/name         Snake      application/run/main_scene         res://game.tscn    application/config/features$   "         4.0    Forward Plus       application/config/icon         res://icon.svg     display/window/stretch/mode         viewport.   editor/export/convert_text_resources_to_binary            input/go_down               deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @    unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S      unicode           echo          script         input/go_up               deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @    unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W      unicode           echo          script         input/go_left               deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @    unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A      unicode           echo          script         input/go_right               deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode    @    unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D      unicode           echo          script         input/restart�              events              InputEventKey         resource_local_to_scene           resource_name             device         	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   R      unicode           echo          script            deadzone      ?X�L�&0����X