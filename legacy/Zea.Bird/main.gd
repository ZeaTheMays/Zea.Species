extends Node

const ID = "Zea.Bird" 
onready var Lure = get_node("/root/SulayreLure")

var Cosmetics = [
	{"Cosmetic": "hat_cowboyhat", "Colors": ["_black", "_brown", "_pink"]},
	{"Cosmetic": "hat_beanie", "Colors": ["_black", "_blue", "_green", "_maroon", "_teal", "_white", "_yellow"]},
	{"Cosmetic": "hat_crown", "Colors": [""]},
	{"Cosmetic": "accessory_bandaid", "Colors": [""]},
	{"Cosmetic": "accessory_cig", "Colors": [""]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]}
	]

func assign_cosmetic_meshes():
	for cosmetic in Cosmetics:
		for color in cosmetic["Colors"]:
			var mod_id_species = ID + ".species_bird"
			var model_path = "res://mods/Zea.Bird/Assets/Models/" + "bird_" + cosmetic["Cosmetic"] + color + ".tres"
			var cosmetic_with_color = cosmetic["Cosmetic"] + color
			Lure.assign_cosmetic_mesh(ID, cosmetic_with_color, mod_id_species, model_path)
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_bird",		"mod://Assets/Textures/bird_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_bird",		"mod://Assets/Textures/bird_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_bird",		"mod://Assets/Textures/bird_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_bird",		"mod://Assets/Textures/bird_tux.png")
	
	assign_cosmetic_meshes()
	
	Lure.assign_face_animation(ID,ID+".species_bird","mod://Assets/bird_face.tres")
	Lure.assign_species_voice(ID,ID+".species_bird","mod://Assets/Audio/bird_bark.ogg", "mod://Assets/Audio/bird_growl.ogg", "mod://Assets/Audio/bird_whine.ogg" )
	
	Lure.add_content(ID,"species_bird","mod://Resources/species_bird.tres")
