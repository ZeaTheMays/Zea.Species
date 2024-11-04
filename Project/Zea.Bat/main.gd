extends Node

const ID = "Zea.Bat" 
onready var Lure = get_node("/root/SulayreLure")

var Cosmetics = [
	{"Cosmetic": "hat_cowboyhat", "Colors": ["_pink", "_brown", "_black"]},
	{"Cosmetic": "hat_beanie", "Colors": ["_black", "_blue", "_green", "_maroon", "_teal", "_white", "_yellow"]},
	{"Cosmetic": "hat_baseball_cap", "Colors": ["_big", "_green", "_mcd", "_missing", "_orange", "_pee", "_size", "_sports"]},
	{"Cosmetic": "hat_tophat", "Colors": [""]},
	{"Cosmetic": "accessory_bandaid", "Colors": [""]},
	{"Cosmetic": "accessory_antlers", "Colors": [""]},
	{"Cosmetic": "accessory_cig", "Colors": [""]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]}
	]

func assign_cosmetic_meshes():
	for cosmetic in Cosmetics:
		for color in cosmetic["Colors"]:
			var mod_id_species = ID + ".species_bat"
			var model_path = "res://mods/Zea.Bat/Assets/Models/" + "bat_" + cosmetic["Cosmetic"] + color + ".tres"
			var cosmetic_with_color = cosmetic["Cosmetic"] + color
			Lure.assign_cosmetic_mesh(ID, cosmetic_with_color, mod_id_species, model_path)
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_bat",		"mod://Assets/Textures/bat_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_bat",		"mod://Assets/Textures/bat_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_bat",		"mod://Assets/Textures/bat_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_bat",		"mod://Assets/Textures/bat_tux.png")
	
	assign_cosmetic_meshes()
	
	Lure.assign_face_animation(ID,ID+".species_bat","mod://Assets/bat_face.tres")
	Lure.assign_species_voice(ID,ID+".species_bat","mod://Assets/Audio/bat_bark.ogg", "mod://Assets/Audio/bat_growl.ogg", "mod://Assets/Audio/bat_whine.ogg" )
	
	Lure.add_content(ID,"species_bat","mod://Resources/species_bat.tres")
