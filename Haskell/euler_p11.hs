int_to_list number
	| number == 0			= []
	| otherwise 			= int_to_list (quot number 10) ++ [number `mod` 10]

find_product list cur_index travel steps_left
	| steps_left == 0		= 1
	| otherwise 			= (list !! cur_index) * (find_product list (cur_index + travel) travel (steps_left - 1))

-- this uses the fact that there are only natural num_stepss
top list edge_size cur_index num_steps
	| quot cur_index edge_size < 4 		= -1
	| otherwise 						= find_product list cur_index (-edge_size) num_steps

bottom list edge_size cur_index num_steps
	| edge_size - (quot cur_index edge_size) < 4 		= -1
	| otherwise 										= find_product list cur_index edge_size num_steps

right list edge_size cur_index num_steps
	| edge_size - (cur_index `mod` edge_size) < 4 		= -1
	| otherwise 										= find_product list cur_index 1 num_steps

left list edge_size cur_index num_steps
	| cur_index `mod` edge_size < 4 		= -1
	| otherwise 							= find_product list cur_index -1 num_steps

top_left list edge_size cur_index num_steps
	| cur_index `mod` edge_size < 2 || quot cur_index edge_size < 2 		= -1
	| otherwise 															= find_product list cur_index (-edge_size -1) num_steps

top_right list edge_size cur_index num_steps
	| edge_size - (cur_index `mod` edge_size) < 2 || quot cur_index edge_size < 2 	= -1
	| otherwise 																					= find_product list cur_index (-edge_size -1) num_steps


bottom_left list edge_size cur_index num_steps
	| cur_index `mod` edge_size < 2 || edge_size - (quot cur_index edge_size) < 2 		= -1
	| otherwise 																		= find_product list cur_index (-edge_size -1) num_steps

bottom_right list edge_size cur_index num_steps
	| edge_size - (cur_index `mod` edge_size) < 2 || edge_size - (quot cur_index edge_size) < 2 	= -1
	| otherwise 																					= find_product list cur_index (-edge_size -1) num_steps

max_top list edge_size cur_index num_steps = max (max (top_right edge_size cur_index num_steps) (top_left edge_size cur_index num_steps)) (top edge_size cur_index num_steps)

max_bottom list edge_size cur_index num_steps = max (max (bottom_right edge_size cur_index num_steps) (bottom_left edge_size cur_index num_steps)) (bottom edge_size cur_index num_steps)

max_product list edge_size cur_index num_steps
	| list == [] 		= -1
	| otherwise			= max (max_top list edge_size cur_index num_steps) (max_bottom list edge_size cur_index num_steps)
