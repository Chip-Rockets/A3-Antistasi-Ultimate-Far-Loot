//////////////////////////
//   Side Information   //
//////////////////////////

["name", "Allies"] call _fnc_saveToTemplate;
["spawnMarkerName", "Allied Reinforcements"] call _fnc_saveToTemplate;

["flag", "Flag_US_F"] call _fnc_saveToTemplate;
["flagTexture", "a3\data_f\flags\flag_us_co.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_USA"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["attributeLowAir", true] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "LIB_AmmoCrate_Arty_SU"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["LIB_US_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["LIB_US_Willys_MB","LIB_US_Willys_MB_Hood"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["LIB_US_Willys_MB_M1919"]] call _fnc_saveToTemplate;
private _vehiclesLightArmed = ["LIB_US_Willys_MB_M1919"]; 
["vehiclesTrucks", ["LIB_US_GMC_Tent","LIB_US_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks", ["LIB_US_GMC_Tent","LIB_US_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", ["LIB_US_GMC_Ammo"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks", ["LIB_US_GMC_Parm"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks", ["LIB_US_GMC_Fuel"]] call _fnc_saveToTemplate;
["vehiclesMedical", ["LIB_US_GMC_Ambulance", "LIB_US_Willys_MB_Ambulance"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["LIB_US_Scout_M3"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["LIB_US_M3_Halftrack","LIB_US_Scout_M3_FFV"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["LIB_M8_Greyhound", "LIB_M3A3_Stuart", "LIB_M5A1_Stuart", "LIB_Churchill_Mk7_Howitzer", "LIB_Churchill_Mk7_AVRE"]] call _fnc_saveToTemplate;
private _vehiclesTanks = ["LIB_M4A3_76","LIB_M4A3_76_HVSS","LIB_M4A3_75","LIB_M4A3_75", "LIB_Churchill_Mk7", "LIB_Cromwell_Mk4", "LIB_Churchill_Mk7_Crocodile", "LIB_M4A4_FIREFLY"];
["vehiclesAA", ["LIB_Zis5v_61K"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["LIB_US_Scout_M3"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["LIB_M3A3_Stuart", "LIB_M5A1_Stuart"]] call _fnc_saveToTemplate;
private _vehiclesLightTanks = ["LIB_M3A3_Stuart", "LIB_M5A1_Stuart"];

if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Armored_Cars")) then {
    _vehiclesLightArmed append ["FA_DaimlerMk2"]; 
};
if (isClass (configFile >> "CfgPatches" >> "FA_WW2_Tanks")) then {
    _vehiclesLightTanks append ["FA_ValentineMk3"];
	_vehiclesTanks append ["FA_M26"];
};
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesLightTanks", _vehiclesLightTanks] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate; 

["vehiclesTransportBoats", ["LIB_LCVP"]] call _fnc_saveToTemplate;
["vehiclesGunBoats", ["LIB_LCM3_Armed", "LIB_LCI"]] call _fnc_saveToTemplate;
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

private _vehiclesPlanesCAS = ["LIB_P47"];
private _vehiclesPlanesLargeCAS = [];
private _vehiclesPlanesAA = ["LIB_US_P39","LIB_RAF_P39"];
["vehiclesPlanesTransport", ["LIB_C47_Skytrain","LIB_C47_RAF"]] call _fnc_saveToTemplate;

if (isClass (configFile >> "CfgPatches" >> "sab_flyinglegends")) then {
    _vehiclesPlanesCAS = ["sab_fl_hurricane_2","sab_fl_tempest","sab_fl_dh98","sab_fl_p51d","sab_fl_p51b","sab_fl_f4f","sab_fl_sbd","sab_fl_f4u","sab_fl_f4u"];
	_vehiclesPlanesAA = ["sab_fl_hurricane","sab_fl_spitfire_mk1","sab_fl_spitfire_mk5","sab_fl_spitfire_mkxiv","sab_fl_p51d","sab_fl_p51b"];
};

if (isClass (configFile >> "CfgPatches" >> "sab_sw_i16")) then {
    _vehiclesPlanesCAS append ["sab_sw_tbf","sab_sw_p40"];
	_vehiclesPlanesLargeCAS append ["sab_sw_a26","sab_sw_halifax"];
	_vehiclesPlanesAA append ["sab_sw_p40","sab_sw_p38"];
};

["vehiclesPlanesCAS", _vehiclesPlanesCAS] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", _vehiclesPlanesLargeCAS] call _fnc_saveToTemplate;
["vehiclesPlanesAA", _vehiclesPlanesAA] call _fnc_saveToTemplate;

["vehiclesHelisLight", []] call _fnc_saveToTemplate;
["vehiclesHelisTransport", []] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", []] call _fnc_saveToTemplate;
["vehiclesHelisAttack", []] call _fnc_saveToTemplate;

["vehiclesArtillery", ["LIB_US6_BM13"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["LIB_US6_BM13", ["LIB_16Rnd_BM13"]]
]] call _fnc_saveToTemplate;

["uavsAttack", []] call _fnc_saveToTemplate;
["uavsPortable", []] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["LIB_UK_Willys_MB_M1919"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["LIB_US_GMC_Open"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["LIB_UK_Willys_MB"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["LIB_UniversalCarrier"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["LIB_GazM1_SOV"]] call _fnc_saveToTemplate;

["staticMGs", ["I_G_HMG_02_high_F"]] call _fnc_saveToTemplate;
["staticAT", ["LIB_Zis3"]] call _fnc_saveToTemplate;
["staticAA", ["LIB_61k"]] call _fnc_saveToTemplate;
["staticMortars", ["LIB_M2_60"]] call _fnc_saveToTemplate;
["staticHowitzers", ["LIB_leFH18"]] call _fnc_saveToTemplate;

["vehicleRadar", "LIB_FlaK_36_AA"] call _fnc_saveToTemplate;
["vehicleSam", "LIB_FlaK_36_AA"] call _fnc_saveToTemplate;

["howitzerMagazineHE", "LIB_20x_Shell_105L28_Gr38_HE"] call _fnc_saveToTemplate;

["mortarMagazineHE", "LIB_8Rnd_60mmHE_M2"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "LIB_60mm_M2_SmokeShell"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["LIB_US_M1A1_ATMINE"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["LIB_M3_MINE"]] call _fnc_saveToTemplate;

#include "IFA_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", [
["LIB_M1A1_Bazooka", "", "", "",["LIB_1Rnd_60mm_M6"], [], ""],
["LIB_PIAT", "", "", "",["LIB_1Rnd_89m_PIAT"], [], ""]]];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["LIB_US_M1A1_ATMINE_mag"]];
_loadoutData set ["APMines", ["LIB_M3_MINE_mag"]];
_loadoutData set ["lightExplosives", ["LIB_Ladung_Small_MINE_mag"]];
_loadoutData set ["heavyExplosives", ["LIB_Ladung_Big_MINE_mag"]];

_loadoutData set ["antiInfantryGrenades", ["LIB_US_Mk_2"]];
_loadoutData set ["antiTankGrenades", ["LIB_No82"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["LIB_GER_ItemWatch"]];
_loadoutData set ["compasses", ["LIB_GER_ItemCompass_deg"]];
_loadoutData set ["radios", ["TFAR_SCR536"]];
_loadoutData set ["gpses", []];
_loadoutData set ["NVGs", []];
_loadoutData set ["binoculars", ["LIB_Binocular_US"]];
_loadoutData set ["rangefinders", ["LIB_Binocular_US"]];

_loadoutData set ["traitorUniforms", ["U_LIB_US_Rangers_Uniform"]];
_loadoutData set ["traitorVests", ["V_LIB_US_AB_Vest_Padded_Carbine"]];
_loadoutData set ["traitorHats", ["H_LIB_US_Rangers_Helmet"]];

_loadoutData set ["officerUniforms", ["U_LIB_UK_P37_Sergeant"]];
_loadoutData set ["officerVests", ["V_LIB_UK_P37_Holster_Blanco"]];
_loadoutData set ["officerHats", ["H_LIB_UK_Helmet_Mk2"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", ["B_LIB_US_Radio"]];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];
_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = [];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["U_LIB_UK_DenisonSmock"]];
_sfLoadoutData set ["vests", ["V_LIB_UK_P37_Rifleman_Blanco","V_LIB_UK_P37_Heavy_Blanco","V_LIB_UK_P37_Holster_Blanco","V_LIB_UK_P37_Officer_Blanco","V_LIB_UK_P37_Sten_Blanco","V_LIB_UK_P37_Gasmask_Blanco"]];
_sfLoadoutData set ["glVests", ["V_LIB_UK_P37_Heavy_Blanco"]];
_sfLoadoutData set ["Hvests", ["V_LIB_UK_P37_Heavy_Blanco"]];
_sfLoadoutData set ["backpacks", ["B_LIB_UK_HSack_Blanco","B_LIB_UK_HSack_Blanco_Cape","B_LIB_UK_HSack_Blanco_Tea"]];
_sfLoadoutData set ["helmets", ["H_LIB_UK_Para_Helmet_Mk2","H_LIB_UK_Para_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk3"]];
_sfLoadoutData set ["sniHats", ["H_LIB_UK_Para_Helmet_Mk2","H_LIB_UK_Para_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk3"]];
_sfLoadoutData set ["slHat", ["H_LIB_UK_Para_Helmet_Mk2"]];
_sfLoadoutData set ["binoculars", ["LIB_Binocular_UK"]];

//SF Weapons
_sfLoadoutData set ["rifles", [["LIB_LeeEnfield_No4", "", "", "", ["LIB_10Rnd_770x56"], [], ""]]];
_sfLoadoutData set ["carbines", [["LIB_DELISLE", "", "", "", ["LIB_7Rnd_45ACP_DeLisle"], [], ""]]];
_sfLoadoutData set ["grenadeLaunchers", [["LIB_LeeEnfield_No1", "lib_acc_gl_enfield_cup_empty", "", "", ["LIB_10Rnd_770x56"], ["LIB_1Rnd_G_MillsBomb"], ""]]];
_sfLoadoutData set ["SMGs", [["LIB_M1928_Thompson", "", "", "", ["LIB_50Rnd_45ACP"], [], ""],
	["LIB_Sten_Mk5", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""]]];
_sfLoadoutData set ["machineGuns", [["LIB_Bren_Mk2", "", "", "", ["LIB_30Rnd_770x56"], [], ""]]];
_sfLoadoutData set ["marksmanRifles", [["LIB_DELISLE", "", "", "", ["LIB_7Rnd_45ACP_DeLisle"], [], ""]]];
_sfLoadoutData set ["sniperRifles", [["LIB_LeeEnfield_No4_Scoped", "", "", "", ["LIB_10Rnd_770x56","LIB_10Rnd_770x56_MkVIII"], [], ""]]];
_sfLoadoutData set ["sidearms", [["LIB_Welrod_mk1", "", "", "", ["LIB_6Rnd_9x19_Welrod"], [], ""],
	["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""]]];

/////////////////////////////////
//    Elite Loadout Data    //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_eliteLoadoutData set ["uniforms", ["U_LIB_US_Rangers_Uniform", "U_LIB_US_Rangers_Corp", "U_LIB_US_Rangers_Private_1st"]];
_eliteLoadoutData set ["slUniforms", ["U_LIB_US_Rangers_Sergeant"]];
_eliteLoadoutData set ["vests", ["V_LIB_US_AB_Vest_Padded_Garand","V_LIB_US_AB_Vest_Padded_Carbine","V_LIB_US_AB_Vest_Padded_Bar","V_LIB_US_AB_Vest_Padded_Thompson"]];
_eliteLoadoutData set ["glVests", ["V_LIB_US_AB_Vest_Padded_Grenadier"]];
_eliteLoadoutData set ["Hvests", ["V_LIB_US_AB_Vest_Padded_M1919"]];
_eliteLoadoutData set ["backpacks", ["B_LIB_US_M36","B_LIB_US_M36_Bandoleer","B_LIB_US_M36_Rocketbag_Empty","B_LIB_US_M36_Rope","B_LIB_US_Backpack","B_LIB_US_Backpack_Bandoleer","B_LIB_US_Backpack_dday","B_LIB_US_Backpack_RocketBag_Empty","B_LIB_US_Backpack_Mk2"]];
_eliteLoadoutData set ["helmets", ["H_LIB_US_Rangers_Helmet","H_LIB_US_Rangers_Helmet_os","H_LIB_US_Rangers_Helmet_ns"]];
_eliteLoadoutData set ["sniHats", ["H_LIB_US_Rangers_Helmet","H_LIB_US_Rangers_Helmet_os","H_LIB_US_Rangers_Helmet_ns"]];
_eliteLoadoutData set ["slHat", ["H_LIB_US_Rangers_Helmet"]];
_eliteLoadoutData set ["binoculars", ["LIB_Binocular_US"]];

_eliteLoadoutData set ["rifles", [["LIB_M1_Garand", "", "", "", ["LIB_8Rnd_762x63"], [], ""]]];
_eliteLoadoutData set ["carbines", [["LIB_M1_Carbine", "", "", "", ["LIB_15Rnd_762x33"], [], ""]]];
_eliteLoadoutData set ["grenadeLaunchers", [["LIB_M1_Garand", "lib_acc_gl_m7", "", "", ["LIB_8Rnd_762x63"], ["LIB_1Rnd_G_M9A1","LIB_1Rnd_G_Mk2"], ""]]];
_eliteLoadoutData set ["SMGs", [["LIB_M1A1_Thompson", "", "", "", ["LIB_30Rnd_45ACP"], [], ""],
	["LIB_M3_GreaseGun", "", "", "", ["LIB_30Rnd_M3_GreaseGun_45ACP"], [], ""]]];
_eliteLoadoutData set ["machineGuns", [["LIB_M1918A2_BAR", "", "", "", ["LIB_20Rnd_762x63"], [], ""],
        ["LIB_M1919A6", "", "", "", ["LIB_50Rnd_762x63"], [], ""]]];
_eliteLoadoutData set ["marksmanRifles", [["LIB_M1903A3_Springfield", "", "", "", ["LIB_5Rnd_762x63"], [], ""],
        ["LIB_M1_Garand", "", "", "", ["LIB_8Rnd_762x63"], [], ""]]];
_eliteLoadoutData set ["sniperRifles", [["LIB_M1903A4_Springfield", "", "", "", ["LIB_5Rnd_762x63"], [], ""]]];
_eliteLoadoutData set ["sidearms", [["LIB_Colt_M1911", "", "", "", ["LIB_7Rnd_45ACP"], [], ""]]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["U_LIB_US_Rangers_Uniform", "U_LIB_US_Rangers_Corp", "U_LIB_US_Rangers_Private_1st"]];
_militaryLoadoutData set ["slUniforms", ["U_LIB_US_Rangers_Sergeant"]];
_militaryLoadoutData set ["vests", ["V_LIB_US_AB_Vest_Padded_Garand","V_LIB_US_AB_Vest_Padded_Carbine","V_LIB_US_AB_Vest_Padded_Bar","V_LIB_US_AB_Vest_Padded_Thompson"]];
_militaryLoadoutData set ["glVests", ["V_LIB_US_AB_Vest_Padded_Grenadier"]];
_militaryLoadoutData set ["Hvests", ["V_LIB_US_AB_Vest_Padded_M1919"]];
_militaryLoadoutData set ["backpacks", ["B_LIB_US_M36","B_LIB_US_M36_Bandoleer","B_LIB_US_M36_Rocketbag_Empty","B_LIB_US_M36_Rope","B_LIB_US_Backpack","B_LIB_US_Backpack_Bandoleer","B_LIB_US_Backpack_dday","B_LIB_US_Backpack_RocketBag_Empty","B_LIB_US_Backpack_Mk2"]];
_militaryLoadoutData set ["helmets", ["H_LIB_US_Rangers_Helmet","H_LIB_US_Rangers_Helmet_os","H_LIB_US_Rangers_Helmet_ns"]];
_militaryLoadoutData set ["sniHats", ["H_LIB_US_Rangers_Helmet","H_LIB_US_Rangers_Helmet_os","H_LIB_US_Rangers_Helmet_ns"]];
_militaryLoadoutData set ["slHat", ["H_LIB_US_Rangers_Helmet"]];
_militaryLoadoutData set ["binoculars", ["LIB_Binocular_US"]];

_militaryLoadoutData set ["rifles", [["LIB_M1_Garand", "", "", "", ["LIB_8Rnd_762x63"], [], ""]]];
_militaryLoadoutData set ["carbines", [["LIB_M1_Carbine", "", "", "", ["LIB_15Rnd_762x33"], [], ""]]];
_militaryLoadoutData set ["grenadeLaunchers", [["LIB_M1_Garand", "lib_acc_gl_m7", "", "", ["LIB_8Rnd_762x63"], ["LIB_1Rnd_G_M9A1","LIB_1Rnd_G_Mk2"], ""]]];
_militaryLoadoutData set ["SMGs", [["LIB_M1A1_Thompson", "", "", "", ["LIB_30Rnd_45ACP"], [], ""],
	["LIB_M3_GreaseGun", "", "", "", ["LIB_30Rnd_M3_GreaseGun_45ACP"], [], ""]]];
_militaryLoadoutData set ["machineGuns", [["LIB_M1918A2_BAR", "", "", "", ["LIB_20Rnd_762x63"], [], ""],
        ["LIB_M1919A6", "", "", "", ["LIB_50Rnd_762x63"], [], ""]]];
_militaryLoadoutData set ["marksmanRifles", [["LIB_M1903A3_Springfield", "", "", "", ["LIB_5Rnd_762x63"], [], ""],
        ["LIB_M1_Garand", "", "", "", ["LIB_8Rnd_762x63"], [], ""]]];
_militaryLoadoutData set ["sniperRifles", [["LIB_M1903A4_Springfield", "", "", "", ["LIB_5Rnd_762x63"], [], ""]]];
_militaryLoadoutData set ["sidearms", [["LIB_Colt_M1911", "", "", "", ["LIB_7Rnd_45ACP"], [], ""]]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["U_LIB_US_Private"]];
_policeLoadoutData set ["vests", ["V_LIB_US_Vest_Carbine_nco"]];
_policeLoadoutData set ["helmets", ["H_LIB_US_Pilot_Cap"]];
_policeLoadoutData set ["SMGs", [["LIB_M1A1_Thompson", "", "", "", ["LIB_30Rnd_45ACP"], [], ""],
	["LIB_M3_GreaseGun", "", "", "", ["LIB_30Rnd_M3_GreaseGun_45ACP"], [], ""]]];
_policeLoadoutData set ["sidearms", [["LIB_Colt_M1911", "", "", "", ["LIB_7Rnd_45ACP"], [], ""]]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["U_LIB_UK_P37"]];
_militiaLoadoutData set ["slUniforms", ["U_LIB_UK_P37_Sergeant"]];
_militiaLoadoutData set ["vests", ["V_LIB_UK_P37_Rifleman","V_LIB_UK_P37_Holster","V_LIB_UK_P37_Sten"]];
_militiaLoadoutData set ["glVests", ["V_LIB_UK_P37_Heavy"]];
_militiaLoadoutData set ["Hvests", ["V_LIB_UK_P37_Heavy"]];
_militiaLoadoutData set ["backpacks", ["B_LIB_UK_HSack","B_LIB_UK_HSack_Cape","B_LIB_UK_HSack_Tea"]];
_militiaLoadoutData set ["helmets", ["H_LIB_UK_Helmet_Mk2","H_LIB_UK_Helmet_Mk2_Bowed","H_LIB_UK_Helmet_Mk2_Camo","H_LIB_UK_Helmet_Mk2_FAK","H_LIB_UK_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk2_FAK_Camo"]];
_militiaLoadoutData set ["sniHats", ["H_LIB_UK_Helmet_Mk2","H_LIB_UK_Helmet_Mk2_Bowed","H_LIB_UK_Helmet_Mk2_Camo","H_LIB_UK_Helmet_Mk2_FAK","H_LIB_UK_Helmet_Mk2_Net","H_LIB_UK_Helmet_Mk2_FAK_Camo"]];
_militiaLoadoutData set ["slHat", ["H_LIB_UK_Helmet_Mk2"]];

_militiaLoadoutData set ["rifles", [["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""]]];
_militiaLoadoutData set ["carbines", [["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""]]];
_militiaLoadoutData set ["grenadeLaunchers", [["LIB_LeeEnfield_No1", "lib_acc_gl_enfield_cup_empty", "", "", ["LIB_10Rnd_770x56"], ["LIB_1Rnd_G_MillsBomb"], ""]]];
_militiaLoadoutData set ["SMGs", [["LIB_Sten_Mk2", "", "", "", ["LIB_32Rnd_9x19_Sten"], [], ""]]];
_militiaLoadoutData set ["machineGuns", [["LIB_Bren_Mk2", "", "", "", ["LIB_30Rnd_770x56"], [], ""]]];
_militiaLoadoutData set ["marksmanRifles", [["LIB_LeeEnfield_No1", "", "", "", ["LIB_10Rnd_770x56"], [], ""]]];
_militiaLoadoutData set ["sniperRifles", [["LIB_LeeEnfield_No4_Scoped", "", "", "", ["LIB_10Rnd_770x56","LIB_10Rnd_770x56_MkVIII"], [], ""],
	["LIB_LeeEnfield_No4", "", "", "", ["LIB_10Rnd_770x56"], [], ""]]];
_militiaLoadoutData set ["sidearms", [["LIB_Webley_mk6", "", "", "", ["LIB_6Rnd_455"], [], ""]]];
//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["U_LIB_US_Tank_Crew","U_LIB_US_Tank_Crew2"]];
_crewLoadoutData set ["vests", ["V_LIB_US_Vest_Carbine"]];
_crewLoadoutData set ["helmets", ["H_LIB_US_Helmet_Tank"]];
_crewLoadoutData set ["carbines", [
    ["LIB_M3_GreaseGun", "", "", "", ["LIB_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];	

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_LIB_US_Pilot","U_LIB_US_Bomber_Pilot"]];
_pilotLoadoutData set ["vests", ["V_LIB_US_LifeVest"]];
_pilotLoadoutData set ["helmets", ["H_LIB_US_Helmet_Pilot","H_LIB_US_Pilot_Glasses_Down","H_LIB_US_Helmet_Glasses_Up","H_LIB_US_Helmet_Pilot_Respirator_Glasses_Down","H_LIB_US_Helmet_Pilot_Respirator_Glasses_Up","H_LIB_US_Helmet_Pilot_Respirator"]];
_pilotLoadoutData set ["carbines", [
    ["LIB_M3_GreaseGun", "", "", "", ["LIB_30Rnd_M3_GreaseGun_45ACP"], [], ""]
]];	




/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;
    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 2] call _fnc_addAdditionalMuzzleMagazines;
    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    // ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
