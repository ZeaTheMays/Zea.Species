extends Node

const ID = "Zea.Fox" 
onready var Lure = get_node("/root/SulayreLure")

#
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_fox",		"mod://Assets/Textures/fox_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_fox",		"mod://Assets/Textures/fox_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_fox",		"mod://Assets/Textures/fox_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_fox",		"mod://Assets/Textures/fox_tux.png")
	
	
	Lure.assign_face_animation(ID,ID+".species_fox","mod://Assets/fox_face.tres")
	Lure.assign_species_voice(ID,ID+".species_fox","mod://Assets/Audio/fox_bark.ogg", "mod://Assets/Audio/fox_growl.ogg", "mod://Assets/Audio/fox_whine.ogg" )
	
	Lure.add_content(ID,"species_fox","mod://Resources/species_fox.tres")
