extends Label

func _process(delta: float) -> void:
	self.text = str(level_manager.cash_amount)
