extends Node

@export var screen_to_animation_options: UIAnimationOptions
@export var shrink_animation_options: UIAnimationOptions
@export var pop_animation_options: UIAnimationOptions


#region Animations
func screen_top_to_position(node: CanvasItem, position: Vector2 = Vector2.ZERO, options: UIAnimationOptions = screen_to_animation_options):
	node.position.y = -node.size.y
	
	if position.is_zero_approx():
		## Target position to center by default
		position = _node_viewport_center_position(node)
		
	var tween: Tween = create_tween()
	tween.tween_property(node, 'position', position, options.time)\
		.set_trans(options.transition).set_ease(options.easing)
	
	return tween.finished


func screen_bottom_to_position(node: CanvasItem, position: Vector2 = Vector2.ZERO):
	node.position.y = get_viewport().get_visible_rect().size.y + node.size.y
	
	if position.is_zero_approx():
		## Target position to center by default
		position = _node_viewport_center_position(node)
		
	var tween: Tween = create_tween()
	tween.tween_property(node, 'position', position, 0.3)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	return tween.finished


func screen_left_to_position(node: CanvasItem, position: Vector2 = Vector2.ZERO):
	node.position.x = -node.size.x
	
	if position.is_zero_approx():
		## Target position to center by default
		position = _node_viewport_center_position(node)
		
	var tween: Tween = create_tween()
	tween.tween_property(node, 'position', position, 0.3)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	return tween.finished


func screen_right_to_position(node: CanvasItem, position: Vector2 = Vector2.ZERO):
	node.position.x = get_viewport().get_visible_rect().size.x + node.size.x
	
	if position.is_zero_approx():
		## Target position to center by default
		position = _node_viewport_center_position(node)
		
	var tween: Tween = create_tween()
	tween.tween_property(node, 'position', position, 0.3)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	return tween.finished
	
## Pop the node to the target scale, which defaults to Vector2.ONE.
func pop(node: CanvasItem, options: UIAnimationOptions = pop_animation_options):
	adjust_pivot_offset(node, options)
	
	var tween: Tween = create_tween()
	tween.tween_property(node, 'scale', options.target_scale, options.time).from(options.origin_scale)\
		.set_trans(options.transition).set_ease(options.easing)
	
	return tween.finished

## Shrink the node to the target scale, which defaults to Vector2.ZERO.
func shrink(node: CanvasItem, options: UIAnimationOptions = shrink_animation_options):
	adjust_pivot_offset(node, options)
	
	var tween: Tween = create_tween()
	tween.tween_property(node, 'scale', options.target_scale, options.time).from(node.scale)\
		.set_trans(options.transition).set_ease(options.easing)
	
	return tween.finished

#endregion

#region Helpers
func adjust_pivot_offset(node: CanvasItem, options: UIAnimationOptions) -> void:
	match options.pivot_offset:
		UIAnimationOptions.PivotOffset.Center:
			node.pivot_offset = (node.get_size() / 2).ceil()
		UIAnimationOptions.PivotOffset.TopLeft:
			node.pivot_offset = Vector2.ZERO
		UIAnimationOptions.PivotOffset.TopRight:
			node.pivot_offset = Vector2(node.size.x, 0)
		UIAnimationOptions.PivotOffset.BottomLeft:
			node.pivot_offset = Vector2(0, node.size.y)
		UIAnimationOptions.PivotOffset.BottomRight:
			node.pivot_offset = Vector2(node.size.x, node.size.y)


func _node_viewport_center_position(node: CanvasItem) -> Vector2:
	return (get_viewport().get_visible_rect().size / 2) - node.size / 2
#endregion
