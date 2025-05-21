extends Node


## Pop the node to the target scale, which defaults to Vector2.ONE.
func pop(node: CanvasItem, speed: float = 0.3, to_scale: Vector2 = Vector2.ONE):
	node.pivot_offset = (node.get_size() / 2).ceil()
	
	var tween: Tween = create_tween()
	tween.tween_property(node, 'scale', to_scale, speed)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	
	return tween.finished

## Shrink the node to the target scale, which defaults to Vector2.ZERO.
func shrink(node: CanvasItem, speed: float = 0.3,  to_scale: Vector2 = Vector2.ZERO):
	node.pivot_offset = (node.get_size() / 2).ceil()
	
	var tween: Tween = create_tween()
	tween.tween_property(node, 'scale', to_scale, speed)\
		.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
	
	return tween.finished
