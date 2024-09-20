extends HSlider

#BG music

#exports whatever bus the music is stored in
@export var bus_name: String

var bus_index: int #set's the index to only accept integers

func _ready() -> void:
	#crazy
	bus_index = AudioServer.get_bus_index(bus_name)
	value_changed.connect(_on_value_changed)
	
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index),
	)
	
func _on_value_changed(value: float) -> void:
	#plays
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	
	
