extends Node

const ID = "Zea.Raccoon" 
onready var Lure = get_node("/root/SulayreLure")

var Cosmetics = [
	{"Cosmetic": "hat_cowboyhat", "Colors": ["_pink", "_brown", "_black"]},
	{"Cosmetic": "hat_tophat", "Colors": [""]},
	{"Cosmetic": "accessory_bandaid", "Colors": [""]},
	{"Cosmetic": "accessory_antlers", "Colors": [""]},
	{"Cosmetic": "accessory_cig", "Colors": [""]},
	{"Cosmetic": "accessory_eyepatch", "Colors": [""]}
	]

func assign_cosmetic_meshes():
	for cosmetic in Cosmetics:
		for color in cosmetic["Colors"]:
			var mod_id_species = ID + ".species_bird"
			var model_path = "res://mods/Zea.Raccoon/Assets/Models/" + "raccoon_" + cosmetic["Cosmetic"] + color + ".tres"
			var cosmetic_with_color = cosmetic["Cosmetic"] + color
			Lure.assign_cosmetic_mesh(ID, cosmetic_with_color, mod_id_species, model_path)
func _ready():#
	
	Lure.assign_pattern_texture(ID,"pattern_calico",		ID+".species_raccoon",		"mod://Assets/Textures/raccoon_calico.png")
	Lure.assign_pattern_texture(ID,"pattern_collie",		ID+".species_raccoon",		"mod://Assets/Textures/raccoon_collie.png")
	Lure.assign_pattern_texture(ID,"pattern_spotted",		ID+".species_raccoon",		"mod://Assets/Textures/raccoon_spotted.png")
	Lure.assign_pattern_texture(ID,"pattern_tux",		ID+".species_raccoon",		"mod://Assets/Textures/raccoon_tux.png")
	
	assign_cosmetic_meshes()
	
	Lure.assign_face_animation(ID,ID+".species_raccoon","mod://Assets/raccoon_face.tres")
	Lure.assign_species_voice(ID,ID+".species_raccoon","mod://Assets/Audio/raccoon_bark.ogg", "mod://Assets/Audio/raccoon_growl.ogg", "mod://Assets/Audio/raccoon_whine.ogg" )
	
	Lure.add_content(ID,"species_raccoon","mod://Resources/species_raccoon.tres")
