#include maps\_utility;
#include maps\_anim;
#include common_scripts\utility;
#include maps\_vehicle;
#include maps\_stealth_logic;
#include maps\icbm_code;
#include maps\icbm_dialog;
#include maps\_debug;
#include scripts\customcode;
#using_animtree( "generic_human" );
main()
{
setsaveddvar( "sm_sunShadowScale", "0.5" ); // optimization - night shadows can be lower resolution
level.friendlies = [];
level.tango_down_dialog = false;
default_start( ::landed_start );
add_start( "landed", ::landed_start, &"STARTS_LANDED" );
add_start( "basement", ::basement_start, &"STARTS_BASEMENT" );
add_start( "house2", ::house2_start, &"STARTS_HOUSE2" );
add_start( "rescued", ::rescued_start, &"STARTS_RESCUED" );
add_start( "tower", ::tower_start, &"STARTS_TOWER" );;
add_start( "fense", ::fense_start, &"STARTS_FENSE" );
add_start( "base", ::base_start, &"STARTS_BASE" );
add_start( "base2", ::base2_start, &"STARTS_BASE2" );
add_start( "launch", ::launch_start, &"STARTS_LAUNCH" );
precacheItem( "m4m203_silencer_reflex" );
precacheItem( "m4m203_silencer" );
precacheItem( "usp_silencer" );
precacheModel( "com_powerline_tower_destroyed" );
precacheModel( "com_flashlight_on" );
precacheModel( "weapon_parabolic_knife" );
precacheModel( "com_spray_can01" );
precacheModel( "prop_flex_cuff" );
precacheModel( "prop_flex_cuff_obj" );
precacheModel( "com_folding_chair" );
precachestring( &"ICBM_GRIGGSUSETRIGGER" );
precachestring( &"ICBM_LOCATE_SSGTGRIGGS" );
precachestring( &"ICBM_DESTROY_THE_POWER_TRANSMISSION" );
precachestring( &"ICBM_REGROUP_WITH_SECOND_SQUAD" );
precachestring( &"ICBM_PLANT_C4_ON_TOWER_LEGS" );
precachestring( &"ICBM_GET_TO_A_SAFE_DISTANCE" );
maps\_uaz::main( "vehicle_uaz_hardtop_destructible" );
build_aianims( maps\icbm_anim::uaz_overrides, maps\_uaz::set_vehicle_anims );
maps\_mi17::main( "vehicle_mi17_woodland_fly_cheap" );
maps\_bm21_troops::main( "vehicle_bm21_mobile_cover_no_bench" );
maps\icbm_fx::main();
maps\createfx\icbm_audio::main();
animscripts\dog_init::initDogAnimations();
level.weaponClipModels = [];
level.weaponClipModels[0] = "weapon_ak47_clip";
level.weaponClipModels[1] = "weapon_ak74u_clip";
level.weaponClipModels[2] = "weapon_saw_clip";
level.weaponClipModels[3] = "weapon_m16_clip";
level.weaponClipModels[4] = "weapon_mp5_clip";
level.weaponClipModels[5] = "weapon_m14_clip";
level.weaponClipModels[6] = "weapon_g36_clip";
level.towerBlastRadius = 384;
level.cosine = [];
level.cosine[ "180" ] = cos( 180 );
level.minBMPexplosionDmg = 50;
level.maxBMPexplosionDmg = 100;
level.bmpCannonRange = 2048;
level.bmpMGrange = 850;
level.bmpMGrangeSquared = level.bmpMGrange * level.bmpMGrange;
level.playerVehicleDamageRange = 256;
level.playerVehicleDamageRangeSquared = level.playerVehicleDamageRange * level.playerVehicleDamageRange;
level.playerIsInside = false;
maps\createart\icbm_art::main();
thread maps\_pipes::main();
maps\_load::main();
maps\_nightvision::main();
maps\icbm_anim::anim_main();
maps\_breach_explosive_left::main();
maps\_breach::main();
maps\_c4::main();
level.default_goalheight = 512;
maps\_stealth_logic::stealth_init();
maps\_stealth_behavior::main();
dist = 1024;
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "alert" ] 	= dist;
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] 	= dist;
setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] );
level thread maps\icbm_amb::main();
maps\_compass::setupMiniMap( "compass_map_icbm" );
createthreatbiasgroup( "dogs" );
createthreatbiasgroup( "icbm_friendlies" );
level.player thread stealth_ai();
setignoremegroup( "icbm_friendlies", "dogs" ); //dogs will ignore friendlies
setignoremegroup( "dogs", "icbm_friendlies" ); //friendlies will ignore dogs
flag_init ( "first_obj" );
flag_init ( "price_ready" );
flag_init( "intro_dialog_done" );
flag_init( "regroup01_done" );
flag_init( "landed" );
flag_init ( "truck_spotted" );
flag_init( "add_driveway" );
flag_init( "driveway_done" );
flag_init( "bldg1_grigs_todo" );
flag_init( "sound alarm" );
flag_init( "truck arived" );
flag_init( "stop_snow" );
flag_init ( "contacts_in_the_woods" );
flag_init( "enter_basement" );
flag_init( "price_basement_door_anim_complete" );
flag_init( "knife_sequence_starting" );
flag_init( "knife_sequence_done" );
flag_init ( "beehive1_active" );
flag_init( "house1_cleared" );
flag_init( "clear_bldg1_done" );
flag_init ( "beehive2_active" );
flag_init ( "outside_cleared" );
flag_init ( "start_interogation" );
flag_init ( "breach_ready_flag" );
flag_init ( "breach_started" );
flag_init ( "griggs_is_good" );
flag_init( "grigs_todo" );
flag_init( "attack_house2" );
flag_init( "grigs_guys_dead" );
flag_init( "breach_house02_done" );
flag_init( "ready_for_breach" );
flag_init( "courtyard_badguy01_dead" );
flag_init( "hq_entered" );
flag_init( "griggs_loose" );
flag_init( "house02_clear" );
flag_init( "chopper_gone" );
flag_init( "lights_on" );
flag_init( "lights_off" );
flag_init ( "c4_planted" );
flag_init( "tower_destroyed" );
flag_init( "tower_blown" );
flag_init( "cut_fence1" );
flag_init( "cut_fence2" );
flag_init( "area1_started" );
flag_init( "area2_started" );
flag_init( "unblock_path" );
flag_init( "add_kill_bmp" );
flag_init( "flankers2_dead" );
flag_init( "bmp_fire" );
flag_init( "bmp_dead" );
flag_init( "in_last_bldg" );
flag_init( "kill_area01_spawners" );
flag_init( "kill_area02_spawners" );
flag_init( "spawn_second_sqaud" );
flag_init( "fire_missile" );
flag_init( "launch_01" );
flag_init( "launch_02" );
flag_init( "start_launch_scene" );
flag_init( "lift_off_scene_done" );
flag_init( "meetup_todo" );
flag_init( "level_done" );
flag_init( "move_to_house02_breach" );
flag_init( "music_endon_start_rescue" );
flag_init( "music_endon_tower_approach" );
flag_init( "music_endon_tower_collapse" );
flag_init( "music_endon_oldbase_entered" );
flag_init( "gm5_reached_end_anim" );
flag_init( "price_reached_end_anim" );
flag_init ( "second_fight_started" );
flag_init ( "third_fight_started" );
flag_init ( "dialog_holdfire_done" );
flag_init ( "soap_take_look" );
flag_init ( "run_to_gate" );
flag_init ( "aa_base_fight" );
flag_init ( "get_yer_ass" );
price_spawners = getentarray( "price", "script_noteworthy" );
array_thread( price_spawners, ::add_spawn_function, maps\_stealth_logic::friendly_init );
array_thread( price_spawners, ::add_spawn_function, ::price_think );
array_thread( price_spawners, ::add_spawn_function, ::set_threatbias_group, "icbm_friendlies" );
griggs_spawners = getentarray( "mark", "script_noteworthy" );
array_thread( griggs_spawners, ::add_spawn_function, ::griggs_think );
array_thread( griggs_spawners, ::add_spawn_function, ::set_threatbias_group, "icbm_friendlies" );
gaz_spawners = getentarray( "gaz", "script_noteworthy" );
array_thread( gaz_spawners, ::add_spawn_function, maps\_stealth_logic::friendly_init );
array_thread( gaz_spawners, ::add_spawn_function, ::gaz_think );
array_thread( gaz_spawners, ::add_spawn_function, ::set_threatbias_group, "icbm_friendlies" );
friendly_spawners = getentarray( "friendly", "script_noteworthy" );
array_thread( friendly_spawners, ::add_spawn_function, maps\_stealth_logic::friendly_init );
array_thread( friendly_spawners, ::add_spawn_function, ::friendly_think );
array_thread( friendly_spawners, ::add_spawn_function, ::set_threatbias_group, "icbm_friendlies" );
respawned_friendly_spawners = getentarray( "respawned_friendly", "script_noteworthy" );
array_thread( respawned_friendly_spawners, ::add_spawn_function, maps\_stealth_logic::friendly_init );
array_thread( respawned_friendly_spawners, ::add_spawn_function, ::respawned_friendly_think );
array_thread( respawned_friendly_spawners, ::add_spawn_function, ::set_threatbias_group, "icbm_friendlies" );
truck_guy_spawners = getentarray( "truck_guys", "script_noteworthy" );
array_thread( truck_guy_spawners, ::add_spawn_function, ::truck_guys_think );
level thread SunRise();
level thread objectives();
thread set_interior_vision();
level thread missile_launch01();
level thread missile_launch02();
level thread tower_collapse();
patrollers = getentarray( "patroller", "script_noteworthy" );
array_thread( patrollers, ::add_spawn_function, ::stealth_ai );
array_thread( patrollers, ::add_spawn_function, ::attach_flashlight, true, true );
array_thread( patrollers, ::add_spawn_function, ::detach_flashlight_onspotted );
array_thread( patrollers, ::add_spawn_function, ::ignoreme_till_close );
array_thread( patrollers, ::add_spawn_function, ::dialog_contacts_in_the_woods );
array_thread( patrollers, ::add_spawn_function, ::dialog_tango_down );
array_thread( patrollers, ::add_spawn_function, ::woods_patroller_think );
stealth_idles = getentarray( "stealth_idles", "script_noteworthy" );
array_thread( stealth_idles, ::add_spawn_function, ::stealth_ai );
array_thread( stealth_idles, ::add_spawn_function, ::idle_anim_think );
array_thread( stealth_idles, ::add_spawn_function, ::ignoreme_till_stealth_broken );
second_squad_talker = getentarray( "second_squad_talker", "script_noteworthy" );
array_thread( second_squad_talker, ::add_spawn_function, ::second_squad_talker_think );
base_fight_dogs = getentarray( "base_fight_dogs", "script_noteworthy" );
array_thread( base_fight_dogs, ::add_spawn_function, ::set_threatbias_group, "dogs" );
no_sight_brush = getentarray( "no_sight_brush", "targetname" );
array_thread( no_sight_brush, ::clip_nosight_logic );
first_fight_guys = getentarray( "first_fight_guys", "script_noteworthy" );
array_thread( first_fight_guys, ::add_spawn_function, ::first_fight_counter );
third_fight_counter = getentarray( "third_fight_counter", "script_noteworthy" );
array_thread( third_fight_counter, ::add_spawn_function, ::third_fight_counter );
getent( "delete_choppers1", "targetname" ) delete();
getent( "delete_choopers2", "targetname" ) delete();
getent( "delete_choopers3", "targetname" ) delete();
sound_fade_then_delete_nodes = getentarray( "sound_fade_then_delete" , "script_noteworthy" );
array_thread( sound_fade_then_delete_nodes, ::sound_fade_then_delete );
wait .05;
hidden = [];
hidden[ "prone" ]       = 512;
hidden[ "crouch" ]      = 600;
hidden[ "stand" ]       = 1024;
alert = [];
alert[ "prone" ]        = 512;
alert[ "crouch" ]       = 900;
alert[ "stand" ]        = 1500;
thread maps\_stealth_logic::stealth_detect_ranges_set( hidden, alert, undefined );
}
objectives()
{
flag_wait ( "first_obj" );
obj = getent( "obj_grigsby", "targetname" );
objective_add( 2, "active", &"ICBM_LOCATE_SSGTGRIGGS", obj.origin );
objective_current( 2 );
flag_wait( "griggs_loose" );
objective_state( 2, "done" );
obj = getent( "obj_tower", "targetname" );
objective_add( 3, "active", &"ICBM_DESTROY_THE_POWER_TRANSMISSION", obj.origin );
objective_current( 3 );
flag_wait( "tower_blown" );
objective_state( 3, "done" );
obj = getent( "second_squad", "targetname" );
objective_add( 4, "active", &"ICBM_REGROUP_WITH_SECOND_SQUAD", obj.origin );
objective_current( 4 );
flag_wait ( "run_to_gate" );
obj = getent( "gate_obj", "targetname" );
objective_position ( 4, ( -5448, -7048, -664 ) );
flag_wait( "level_done" );
objective_state( 4, "done" );
}
landed_start()
{
level thread maps\icbm_fx::cloudCover();
chute_start_spawners = getentarray( "chute_start_spawners", "targetname" );
array_thread( chute_start_spawners, ::spawn_ai );
landed_start = getent( "landed_start", "targetname" );
level.player setOrigin( landed_start.origin );
level.player setPlayerAngles( landed_start.angles );
thread sectionUpdatePBLastLevel();
thread overalltimer();
thread segmenttimer1( 45 );
SetMissionDvar( "lastplayedlevel", 16 );
flag_set( "landed" );
wait .5; //for spawning
landed_to_basement_handler();
}
landed_to_basement_handler()
{
level.truckguys = [];
truck_trigger = getent( "truck_spawn", "targetname" );
activate_trigger_with_targetname( "start_colors" );
disable_trigger_with_targetname ( "start_colors" );
if( getdvar( "consoleGame" ) != "true" && getdvarint("drew_notes") < 3 )
{
thread min_spec_kill_fx();
}
else
{
level thread maps\icbm_fx::playerEffect();
}
battlechatter_off( "allies" );
truck_trigger thread truck_setup();
truck_trigger thread dialog_enemy_vehicle();
thread make_friendies_cqb();
thread make_friendies_deadly();
thread make_friendies_ignored();
thread disable_ignoreme_on_stealth_spotted();
array_thread( level.friendlies, ::friendlies_stop_on_truck_spotted );
thread do_in_order( ::flag_wait, "_stealth_spotted", ::stop_make_friendies_ignored );
dialog_intro();
flag_set ( "first_obj" );
autosave_by_name( "moveout02" );
if ( !flag ( "truckguys dead" ) && !flag( "spawned_woods_patrol" ) )
activate_trigger_with_targetname( "friendlies_moves_up_the_hill" );
flag_wait( "truckguys dead" );
dialog_ambush_finished();
thread friendlies_start_paths();
flag_wait( "spawned_woods_patrol" );
array_thread( level.friendlies, ::friendlies_stop_paths_to_fight );
flag_wait( "patrollers_dead" );
disable_friendly_deadlyness();
wait 4;
level.gaz anim_single_queue( level.gaz, "allclear" );
flag_wait( "close_to_basement" );
thread dialog_check_houses();
thread basement_to_house1_handler();
}
basement_start()
{
basement_start_spawners = getentarray( "basement_start_spawners", "targetname" );
array_thread( basement_start_spawners, ::spawn_ai );
basement_start = getent( "basement_start", "targetname" );
level.player setOrigin( basement_start.origin );
level.player setPlayerAngles( basement_start.angles );
flag_set( "first_obj" );
flag_set( "landed" );
activate_trigger_with_targetname( "basement_door_nodes" );
thread skip_to_sunrise2();
wait 1;
basement_to_house1_handler();
}
basement_to_house1_handler()
{
battlechatter_off( "allies" );
thread beehive_wait();
anim_ent = getnode( "price_basement_stack", "script_noteworthy" );
door = getent( "house01_basement_door", "targetname" );
thread price_gets_ready_to_open_door( anim_ent );
flag_wait( "open_basement" );
while ( ( distance ( level.gaz.origin, level.price.origin ) ) > 500 )
wait 1;
price_opens_door( anim_ent, door, "price_basement_door_anim_complete" );
thread segmenttimer2( 46 );
level.price enable_ai_color();
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "alert" ] 	= 256;
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] 	= 256;
setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] );
make_friendies_cqb();
activate_trigger_with_targetname( "price_basement_node" );
flag_wait( "price_basement_door_anim_complete" );
Delaythread( 1, ::activate_trigger_with_targetname, "move_buddies_into_basement" );
trigger = getent ( "spawn_house1_upstairs_guys", "targetname" );
activate_trigger_with_targetname( "spawn_house1_upstairs_guys" );
trigger trigger_off();
thread knife_kill_setup();
flag_wait( "knife_sequence_done" );
dialog_enemy_kills( level.price );
activate_trigger_with_targetname( "post_knife_kill_nodes" );
thread dialog_post_knife_kill();
thread friendlies_help_upstairs();
}
friendlies_help_upstairs()
{
flag_wait_either( "_stealth_spotted", "house1_upstairs_dead" );
wait 4;
activate_trigger_with_targetname ( "friendlies_help_upstairs" );
if ( flag ( "beehive1_active" ) )
{
flag_wait ( "beehive1_dead" );
wait 1;
}
activate_trigger_with_targetname ( "gaz_check_rooms" );
wait 1;
flag_set ( "house1_cleared" );
thread house1_to_house2_handler();
}
house1_to_house2_handler()
{
trigger_wait( "gaz_checks_upstairs", "targetname" );
level.gaz anim_single_queue( level.gaz, "griggsnothere" );
level.price anim_single_queue( level.price, "regroupdownstairs" );
dist = 1024;
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "alert" ] 	= dist;
level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] 	= dist;
setsaveddvar( "ai_eventDistDeath", level._stealth.logic.ai_event[ "ai_eventDistDeath" ][ "hidden" ] );
activate_trigger_with_targetname( "house01_clear_regroup" );
level.gaz anim_single_queue( level.gaz, "copythat" );
anim_ent = getnode( "price_open_door01_node", "script_noteworthy" );
thread price_gets_ready_to_open_door( anim_ent );
trigger_wait( "price_open_door01_trigger", "targetname" )
autosave_by_name( "leaving_house1" );
thread beehive2_wait();
thread make_friendies_ignored();
thread disable_ignoreme_on_stealth_spotted();
outside_spawners = getentarray( "outside_spawners", "targetname" );
thread friendlies_fighting_nodes();
array_thread( outside_spawners, ::spawn_ai );
level.price anim_single_queue( level.price, "keepquiet" );
door = getent( "house01_front_door", "targetname" );
price_opens_door( anim_ent, door );
flag_set ( "soap_take_look" );
level.price enable_ai_color();
activate_trigger_with_targetname( "price_front_door_node" );
level.price anim_single_queue( level.price, "takealook" );
flag_wait ( "outside_dead" );
if ( flag( "beehive2_active" ) )
{
flag_wait ( "beehive2_dead" );
wait 2;
}
flag_set ( "outside_cleared" );
thread house2_to_griggs_handler();
}
house2_start()
{
house2_start_spawners = getentarray( "house2_start_spawners", "targetname" );
array_thread( house2_start_spawners, ::spawn_ai );
house2_start = getent( "house2_start", "targetname" );
level.player setOrigin( house2_start.origin );
level.player setPlayerAngles( house2_start.angles );
flag_set( "first_obj" );
flag_set( "landed" );
flag_set ( "house1_cleared" );
flag_set ( "outside_cleared" );
thread skip_to_sunrise2();
wait 1;
house2_to_griggs_handler();
}
house2_to_griggs_handler()
{
activate_trigger_with_targetname( "house2_door_nodes" );
anim_ent2 = getnode( "price_open_door02_node", "script_noteworthy" );
door2 = getent( "house02_front_door", "targetname" );
thread price_gets_ready_to_open_door( anim_ent2 );
wait 3;
level.price thread anim_single_queue( level.price, "sunsup" );
trigger_wait( "price_open_house2_trigger", "targetname" )
price_opens_door( anim_ent2, door2 );
level.price enable_ai_color();
activate_trigger_with_targetname( "house2_inside_nodes" );
thread do_in_order( ::trigger_wait_targetname, "gaz_h2_floor_clear", ::dialog_proceed_upstairs);
thread start_interogation();
thread do_in_order( ::flag_wait, "player_shooting_interogators", ::flag_set, "get_yer_ass" );
captured_griggs = getentarray( "captured_griggs", "targetname" );
array_thread( captured_griggs, ::add_spawn_function, ::captured_griggs_think );
array_thread( captured_griggs, ::spawn_ai );
thread rescue_breach_setup();
thread rescue_sequence();
thread griggs_to_flyover_handler();
}
rescue_breach_setup()
{
execute_trigger = getent( "trigger_volume_room01", "targetname" );
execute_trigger trigger_off();
trigger = getent( "start_breach", "targetname" );
trigger waittill( "trigger" );
trigger trigger_off();
doorknob = getent( "doorknob4", "targetname" );
door = getent( doorknob.target, "targetname" );
doorknob linkto( door );
eVolume = getent( "volume_room01", "targetname" );
aBreachers = [];
aBreachers = add_to_array( aBreachers, level.price );
aBreachers = add_to_array( aBreachers, level.gaz );
sBreachType = "explosive_breach_left";
eVolume thread maps\_breach::breach_think( aBreachers, sBreachType );
eVolume waittill ( "ready_to_breach" );
dialog_rescue_breach();
flag_wait ( "get_yer_ass" );
execute_trigger trigger_on();
eVolume waittill( "detpack_detonated" );
flag_set( "breach_started" );
level.griggs thread fail_on_damage();
level.gaz enable_ai_color();
level.price enable_ai_color();
activate_trigger_with_targetname( "post_breach_nodes" );
level.player playsound( "icbm_pri_gogogo" );
}
fail_on_damage()
{
level endon ( "griggs_loose" );
while ( 1 )
{
self waittill ( "damage", damage, attacker, parm1, parm2, damageType );
if ( attacker == level.player )
maps\_friendlyfire::missionfail();
}
}
rescue_sequence()
{
flag_wait ( "breach_started" );
flag_wait ( "interogators_dead" );
autosave_by_name( "house02_clear" );
thread disable_friendly_deadlyness();
thread dialog_rescue();
trigger_wait ( "player_is_behind_griggs", "targetname" );
trigger = getent( "grigs_use_trigger", "targetname" );
trigger thread player_cut_grigs_loose();
flag_wait( "griggs_loose" );
flag_wait( "griggs_is_good" );
all_friendlies_turn_blue();
activate_trigger_with_targetname( "griggs_loose_nodes" );//player also touches
}
player_cut_grigs_loose()
{
self usetriggerrequirelookat();
self setHintString( &"ICBM_GRIGGSUSETRIGGER" );
self waittill( "trigger" );
self trigger_off();
flag_set( "griggs_loose" );
level.griggs playsound ( "scn_icbm_rescue_griggs" );
level.griggs_node thread anim_single_solo( level.griggs, "grigsby_rescue" );
level.griggs waittillmatch( "single anim", "end" );
level.griggs stopanimscripted();
level.griggs setFlashBanged( false );
flag_set( "griggs_is_good" );
}
rescued_start()
{
rescue_start_spawners = getentarray( "rescue_start_spawners", "targetname" );
array_thread( rescue_start_spawners, ::spawn_ai );
rescue_start = getent( "rescue_start", "targetname" );
level.player setOrigin( rescue_start.origin );
level.player setPlayerAngles( rescue_start.angles );
thread skip_to_sunrise2();
flag_set( "first_obj" );
flag_set ( "griggs_loose" );
flag_set( "landed" );
flag_set ( "house1_cleared" );
flag_set ( "outside_cleared" );
flag_set( "headed_for_tower" );
wait 1;
activate_trigger_with_targetname( "friendlies_at_tower" );
thread griggs_to_flyover_handler();
}
griggs_to_flyover_handler()
{
flag_wait( "headed_for_tower" );
set_vision_set( "icbm_sunrise2", 2 );
thread dialog_blow_up_tower();
flag_wait( "player_in_chopper_area" );
activate_trigger_with_targetname( "choppers" );
autosave_by_name( "chopper_flyover" );
thread first_chopper_fly_over();
flag_wait( "chopper_gone" );
thread flyover_to_tower_handler();
}
tower_start()
{
tower_start = getent( "tower_start", "targetname" );
level.player setOrigin( tower_start.origin );
level.player setPlayerAngles( tower_start.angles );
tower_start_spawners = getentarray( "tower_start_spawners", "targetname" );
array_thread( tower_start_spawners, ::spawn_ai );
thread skip_to_sunrise2();
flag_set( "first_obj" );
flag_set ( "house1_cleared" );
flag_set ( "griggs_loose" );
wait 1;
activate_trigger_with_targetname( "friendlies_at_tower" );
thread flyover_to_tower_handler();
}
dialog_plant_at_tower()
{
wait 5;
level.price anim_single_queue( level.price, "Charlie_status" );
wait 0.2;
level.price anim_single_queue( level.price, "killthepower" );
if ( !flag ( "c4_planted" ) )
{
level.price anim_single_queue( level.price, "jackgriggsplant" );
}
}
flyover_to_tower_handler()
{
tower_c4 = getent( "tower_c4", "targetname" );
tower_c4_2 = getent( "tower_c4_2", "targetname" );
tower = getent( "tower", "targetname" );
tower.multiple_c4 = true;
ent2 = tower maps\_c4::c4_location( "tag_origin", ( - 185.75, -178, 57.87 ), ( 288, 270, 0 ) );
ent1 = tower maps\_c4::c4_location( "tag_origin", ( 184.3, -178.1, 57.9 ), ( 288, 270, 0 ) );
objective_string( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 2 );// optional
objective_position( 3, tower_c4.origin );
level thread base_lights();
level thread base_fx_on();
thread dialog_plant_at_tower();
level waittill( "c4_in_place", planted_ent );
if ( ent1 == planted_ent )
objective_position( 3, tower_c4_2.origin );
objective_string( 3, &"ICBM_PLANT_C4_ON_TOWER_LEGS", 1 );// optional
level waittill( "c4_in_place", planted_ent );
flag_set ( "c4_planted" );
obj_get_clear = getent( "obj_get_clear", "targetname" );
objective_position( 3, obj_get_clear.origin );
objective_string( 3, &"ICBM_GET_TO_A_SAFE_DISTANCE" ); // optional
level thread c4_set();
tower waittill( "c4_detonation" );
flag_set( "music_endon_tower_collapse" );
flag_set( "tower_destroyed" );
tower playsound( "scn_icbm_tower_crash" );
wait 2;
flag_set( "lights_off" );
flag_clear( "lights_on" );
}
c4_set()
{
activate_trigger_with_targetname( "c4_planted" );
level.griggs anim_single_queue( level.griggs, "chargesset" );
thread dialog_jackson_do_it();
flag_wait( "tower_destroyed" );
thread tower_earthquakes();
wait 5;
activate_trigger_with_targetname( "move_to_watch" );
wait 6;
level.price anim_single_queue( level.price, "charlie_towersdown" );
power_alarm = getent( "emt_alarm_power_on", "targetname" );
power_alarm thread play_sound_in_space( "emt_alarm_power_on", power_alarm.origin );
wait 0.5;
level.price anim_single_queue( level.price, "breachingperimeter" );
wait 0.5;
level.griggs anim_single_queue( level.griggs, "backuppower" );
wait 0.4;
level.price anim_single_queue( level.price, "standby" );
wait 1;
level.griggs anim_single_queue( level.griggs, "fiveseconds" );
wait 0.5;
level.price anim_single_queue( level.price, "rallypoint" );
activate_trigger_with_targetname( "move_to_fence01" );
level.price anim_single_queue( level.price, "onourway" );
flag_set( "tower_blown" );
autosave_by_name( "tower_destroyed" );
thread fense_to_base_handler();
wait 0.5;
flag_set( "lights_on" );
flag_clear( "lights_off" );
}
fense_start()
{
fense_start = getent( "fense_start", "targetname" );
level.player setOrigin( fense_start.origin );
level.player setPlayerAngles( fense_start.angles );
fense_start_spawners = getentarray( "fense_start_spawners", "targetname" );
array_thread( fense_start_spawners, ::spawn_ai );
thread skip_to_sunrise2();
flag_set( "first_obj" );
flag_set ( "house1_cleared" );
flag_set ( "griggs_loose" );
wait 1;
activate_trigger_with_targetname( "move_to_fence01" );
thread fense_to_base_handler();
}
fense_to_base_handler()
{
thread dialog_enemy_helicopters();
thread time_to_split_up();
fence = getent( "fence_cut", "targetname" );
fence assign_animtree( "fence" );
thread dialog_get_fence_open();
level.fence_cut_node = getnode( "fence_cut_node", "targetname" );
guys = [];
guys[ guys.size ] = level.griggs;
guys[ guys.size ] = level.gaz;
level.fence_cut_node anim_reach( guys, "icbm_fence_cutting_guys", undefined, level.fence_cut_node );
thread segmenttimer3( 47 );
SetMissionDvar( "lastplayedsection", 47 );
level.fence_cut_node thread anim_single_solo( fence, "model_cut" );
level.fence_cut_node anim_single( guys, "icbm_fence_cutting_guys" );
level.griggs enable_ai_color();
level.gaz enable_ai_color();
fence01_clip = getent( "fence01_clip", "targetname" );
fence01_clip connectpaths();
fence01_clip delete();
flag_set( "cut_fence1" );
activate_trigger_with_targetname( "fence01_moveout" );
level.price anim_single_queue( level.price, "move" );
thread base_handler();
}
time_to_split_up()
{
trigger_wait( "time_to_split_up", "targetname" );
level.price set_force_color( "p" );
level.griggs set_force_color( "p" );
flag_set( "music_endon_oldbase_entered" );
musicStop( 10 );
level.price anim_single_queue( level.price, "scoutthrough" );
level.price anim_single_queue( level.price, "alternateroute" );
}
base_start()
{
thread skip_to_sunrise3();
base_start = getent( "base_start", "targetname" );
level.player setOrigin( base_start.origin );
level.player setPlayerAngles( base_start.angles );
base_start_spawners = getentarray( "base_start_spawners", "targetname" );
array_thread( base_start_spawners, ::spawn_ai );
flag_set( "first_obj" );
flag_set( "griggs_loose" );
flag_set( "tower_blown" );
thread base_handler();
}
base2_start()
{
thread skip_to_sunrise3();
base2_start = getent( "base2_start", "targetname" );
level.player setOrigin( base2_start.origin );
level.player setPlayerAngles( base2_start.angles );
base2_start_spawners = getentarray( "base2_start_spawners", "targetname" );
array_thread( base2_start_spawners, ::spawn_ai );
flag_set( "first_obj" );
flag_set( "griggs_loose" );
flag_set( "tower_blown" );
thread base_handler();
wait .1;
activate_trigger_with_targetname( "fence02_moveout" );
}
base_handler()
{
battlechatter_on( "allies" );
battlechatter_on( "axis" );
level.first_fight_counter = 0;
level.third_fight_counter = 0;
flag_set ( "aa_base_fight" );
trigger_wait ( "fence02_moveout" , "targetname" );
thread dialog_rpgs_on_rooftops();
thread dialog_rpgs_on_rooftops2();
thread dialog_choppers_dropping();
thread dialog_first_fight_clear_and_move();
thread dialog_second_fight_clear_and_move();
thread trucks_incoming();
trigger_wait ( "fastrope_spawn2" , "targetname" );
flag_set ( "second_fight_started" );
trigger_wait ( "second_fight_friendly_nodes" , "targetname" );
flag_set ( "third_fight_started" );
flag_wait ( "price_and_griggs_return" );
price = getent( "price_returns", "targetname" );
level.price teleport ( price.origin, price.angles );
griggs = getent( "griggs_returns", "targetname" );
level.griggs teleport ( griggs.origin, griggs.angles );
level.price set_force_color( "b" );
level.griggs set_force_color( "b" );
thread base_to_second_squad_handler();
}
first_fight_counter()
{
self waittill ( "death" );
level.first_fight_counter++;
if ( level.first_fight_counter == 6 )
{
trigger = getent ( "roortop_guys_spawner", "targetname" );
trigger notify ( "trigger" );
trigger trigger_off();
}
if ( level.first_fight_counter == 10 )
{
trigger = getent ( "fastrope_spawn", "targetname" );
trigger notify ( "trigger" );
trigger trigger_off();
}
if ( level.first_fight_counter == 15 )
{
trigger = getent ( "first_first_end_spawner", "targetname" );
trigger notify ( "trigger" );
trigger trigger_off();
}
}
third_fight_counter()
{
self waittill ( "death" );
level.third_fight_counter++;
if ( level.third_fight_counter == 10 )
{
trigger = getent ( "dog_spawner", "targetname" );
trigger notify ( "trigger" );
trigger trigger_off();
}
if ( level.third_fight_counter == 12 )
{
trigger = getent ( "second_fight_end_group", "targetname" );
trigger notify ( "trigger" );
trigger trigger_off();
}
}
trucks_incoming()
{
trigger_wait ( "incoming_oldbase" , "targetname" );
autosave_by_name( "trucks_incoming" );
level.player playsound ( "icbm_gm5_3trucks" );
}
base_to_second_squad_handler()
{
flag_wait( "play_leaving_base" );
flag_clear ( "aa_base_fight" );
autosave_by_name( "leave_base" );
make_friendies_not_cqb();
launch_alarm = getent( "emt_alarm_missile_launch", "targetname" );
launch_alarm thread play_sound_in_space( "emt_alarm_missile_launch", launch_alarm.origin );
flag_wait( "on_road" );
thread meet_second_squad_handler();
}
launch_start()
{
thread skip_to_sunrise3();
launch_start = getent( "launch_start", "targetname" );
level.player setOrigin( launch_start.origin );
level.player setPlayerAngles( launch_start.angles );
launch_start_spawners = getentarray( "launch_start_spawners", "targetname" );
array_thread( launch_start_spawners, ::spawn_ai );
flag_set( "first_obj" );
flag_set( "griggs_loose" );
flag_set( "tower_blown" );
flag_set( "lift_off" );
wait 1;
thread meet_second_squad_handler();
}
meet_second_squad_handler()
{
end_scene_node = getnode( "end_scene_node", "targetname" );
activate_trigger_with_targetname( "base_clear_moveout" );
end_scene_node thread anim_reach_and_approach_solo_set_flag( level.price, "icbm_end_price", "price_reached_end_anim" );
level thread missile_launch();
squad_02 = getentarray( "second_squad_spawner", "targetname" );
array_thread( squad_02, ::add_spawn_function, ::magic_bullet_shield );
array_thread( squad_02, ::spawn_ai );
trigger_wait( "buddies_at_launch", "targetname" );
flag_wait( "lift_off" ); //player in position
musicstop( 0.5 );
thread dialog_treeline_hold_fire();
wait 1;
MusicPlayWrapper ( "icbm_launch_music" );
activate_trigger_with_targetname( "second_squad_trigger" );
end_scene_node thread anim_reach_and_approach_solo_set_flag( level.gm5, "icbm_end_sniper", "gm5_reached_end_anim" );
flag_wait ( "dialog_holdfire_done" );
flag_wait( "gm5_reached_end_anim" );
flag_wait( "price_reached_end_anim" );
thread final_anim_then_run_off( end_scene_node );
flag_set( "start_launch_scene" );
level notify( "segment3_stop" );
thread sectionUpdatePBLastLevelSeg();
level.gm5 anim_single_queue( level.gm5, "goodtosee" );
level.price enable_ai_color();
level.gm5 enable_ai_color();
activate_trigger_with_targetname( "turn_us_around" );
}
final_anim_then_run_off( end_scene_node )
{
end_scene_node thread anim_custom_animmode_solo( level.gm5, "gravity", "icbm_end_sniper" );
end_scene_node anim_custom_animmode_solo( level.price, "gravity", "icbm_end_price" );
activate_trigger_with_targetname( "run_to_gate_uk" );
activate_trigger_with_targetname( "run_to_gate_us" );
flag_set ( "run_to_gate" );
}
dialog_treeline_hold_fire()
{
level.gm5 anim_single_queue( level.gm5, "treeline" );
wait 1;
level.price anim_single_queue( level.price, "americanteams" );
flag_set ( "dialog_holdfire_done" );
}
missile_sounds()
{
level.player playsound ( "scn_icbm_missile_launch" );
wait 4;
icbm_missile02 = getent( "icbm_missile02", "targetname" );
icbm_missile02 thread play_loop_sound_on_entity( "scn_icbm_missile1_loop" );
wait 10;
icbm_missile01 = getent( "icbm_missile01", "targetname" );
icbm_missile01 thread play_loop_sound_on_entity( "scn_icbm_missile2_loop" );
}
missile_launch()
{
flag_wait( "start_launch_scene" );
thread missile_sounds();
wait 2;
flag_set( "launch_02" );
thread LaunchVision();
wait 4;
level.griggs anim_single_queue( level.griggs, "problemhere" );
flag_set( "launch_01" );
level.price anim_single_queue( level.price, "onemissile" );
wait 1;
level.griggs anim_single_queue( level.griggs, "anotherone" );
wait 1;
level.price anim_single_queue( level.price, "twomissiles" );
wait 0.5;
level thread run_to_gate();
level.price anim_single_queue( level.price, "gettingabortcodes" );
level.price anim_single_queue( level.price, "rogerthat" );
}
run_to_gate()
{
wait 3;
wait 4;
flag_set( "lift_off_scene_done" );
wait 5;
level.griggs anim_single_queue( level.griggs, "itsonnow" );
wait 1;
flag_set( "level_done" );
wait 1; //wait for music
wait 0.5;
maps\_loadout::SavePlayerWeaponStatePersistent( "icbm" );
nextmission();
}
