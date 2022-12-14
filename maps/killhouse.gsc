#include common_scripts\utility;
#include maps\_utility;
#include maps\_hud_util;
#include maps\_anim;
#include maps\killhouse_code;
#include scripts\customcode;
main()
{
level.short_training = true;
level.hip_fire_required = false;
level.firing_range_door_open = false;
if ( level.console )
level.hint_text_size = 1.6;
else
level.hint_text_size = 1.2;
level.targets_hit = 0;
set_console_status();
if ( level.short_training )
default_start( ::inside_start );
else
default_start( ::look_training );
add_start( "inside", ::inside_start, &"STARTS_INSIDE" );
add_start( "shoot", ::rifle_start, &"STARTS_SHOOT" );
add_start( "timed", ::rifle_timed_start, &"STARTS_TIMED" );
add_start( "sidearm", ::sidearm_start, &"STARTS_SIDEARM" );
add_start( "ship", ::reveal_start, &"STARTS_SHIP" );
add_start( "mp5", ::cargoship_start, &"STARTS_MP5" );
add_start( "debrief", ::debrief_start, &"STARTS_DEBRIEF" );
precacheShader( "objective" );
precacheShader( "hud_icon_c4" );
precacheShader( "hud_dpad" );
precacheShader( "hud_arrow_right" );
precacheShader( "hud_arrow_down" );
precacheShader( "hud_icon_40mm_grenade" );
precacheshader( "popmenu_bg" );
precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
precachestring( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_PAUSED" );
precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_SCORES" );
precachestring( &"KILLHOUSE_HINT_CHECK_OBJECTIVES_SCORES_PS3" );
precachestring( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER" );
precachestring( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER2" );
precachestring( &"KILLHOUSE_HINT_ATTACK_PC" );
precachestring( &"KILLHOUSE_HINT_ATTACK" );
precachestring( &"KILLHOUSE_HINT_HIP_ATTACK_PC" );
precachestring( &"KILLHOUSE_HINT_HIP_ATTACK" );
precachestring( &"KILLHOUSE_HINT_ADS_360" );
precachestring( &"KILLHOUSE_HINT_ADS" );
precachestring( &"KILLHOUSE_HINT_ADS_TOGGLE" );
precachestring( &"KILLHOUSE_HINT_ADS_THROW_360" );
precachestring( &"KILLHOUSE_HINT_ADS_THROW" );
precachestring( &"KILLHOUSE_HINT_ADS_TOGGLE_THROW" );
precachestring( &"KILLHOUSE_HINT_STOP_ADS" );
precachestring( &"KILLHOUSE_HINT_STOP_ADS_TOGGLE" );
precachestring( &"KILLHOUSE_HINT_STOP_ADS_THROW" );
precachestring( &"KILLHOUSE_HINT_STOP_ADS_TOGGLE_THROW" );
precachestring( &"KILLHOUSE_HINT_BREATH_MELEE" );
precachestring( &"KILLHOUSE_HINT_BREATH_SPRINT" );
precachestring( &"KILLHOUSE_HINT_BREATH_BINOCULARS" );
precachestring( &"KILLHOUSE_HINT_MELEE_BREATH" );
precachestring( &"KILLHOUSE_HINT_MELEE" );
precachestring( &"KILLHOUSE_HINT_MELEE_BREATH_CLICK" );
precachestring( &"KILLHOUSE_HINT_MELEE_CLICK" );
precachestring( &"KILLHOUSE_HINT_PRONE" );
precachestring( &"KILLHOUSE_HINT_PRONE_HOLD" );
precachestring( &"KILLHOUSE_HINT_PRONE_TOGGLE" );
precachestring( &"KILLHOUSE_HINT_PRONE_STANCE" );
precachestring( &"KILLHOUSE_HINT_PRONE_DOUBLE" );
precachestring( &"KILLHOUSE_HINT_CROUCH_STANCE" );
precachestring( &"KILLHOUSE_HINT_CROUCH" );
precachestring( &"KILLHOUSE_HINT_CROUCH_TOGGLE" );
precachestring( &"KILLHOUSE_HINT_STAND" );
precachestring( &"KILLHOUSE_HINT_STAND_STANCE" );
precachestring( &"KILLHOUSE_HINT_JUMP_STAND" );
precachestring( &"KILLHOUSE_HINT_JUMP" );
precachestring( &"KILLHOUSE_HINT_SPRINT_PC" );
precachestring( &"KILLHOUSE_HINT_SPRINT" );
precachestring( &"KILLHOUSE_HINT_SPRINT_BREATH_PC" );
precachestring( &"KILLHOUSE_HINT_SPRINT_BREATH" );
precachestring( &"KILLHOUSE_HINT_HOLDING_SPRINT" );
precachestring( &"KILLHOUSE_HINT_HOLDING_SPRINT_BREATH" );
precachestring( &"KILLHOUSE_HINT_RELOAD_USE" );
precachestring( &"KILLHOUSE_HINT_RELOAD" );
precachestring( &"KILLHOUSE_HINT_MANTLE" );
precachestring( &"KILLHOUSE_HINT_ADS_SWITCH" );
precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_SHOULDER" );
precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_THROW" );
precachestring( &"KILLHOUSE_HINT_ADS_SWITCH_THROW_SHOULDER" );
precachestring( &"KILLHOUSE_HINT_SIDEARM_SWAP" );
precachestring( &"KILLHOUSE_HINT_PRIMARY_SWAP" );
precachestring( &"KILLHOUSE_HINT_SIDEARM" );
precachestring( &"KILLHOUSE_HINT_SIDEARM_RELOAD" );
precachestring( &"KILLHOUSE_HINT_SIDEARM_RELOAD_USE" );
precachestring( &"KILLHOUSE_HINT_LADDER" );
precachestring( &"KILLHOUSE_HINT_FRAG" );
precachestring( &"KILLHOUSE_HINT_SWAP" );
precachestring( &"KILLHOUSE_HINT_SWAP_RELOAD" );
precachestring( &"KILLHOUSE_HINT_FIREMODE" );
precachestring( &"KILLHOUSE_HINT_LAUNCHER_ATTACK" );
precachestring( &"KILLHOUSE_HINT_EXPLOSIVES" );
precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_RELOAD" );
precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_PLANT" );
precachestring( &"KILLHOUSE_HINT_EXPLOSIVES_PLANT_RELOAD" );
precachestring( &"KILLHOUSE_MARINE3_USE_SIDEARM" );
precachestring( &"KILLHOUSE_C4_PICKUP" );
precachestring( &"KILLHOUSE_HINT_C4_ICON" );
precachestring( &"KILLHOUSE_HINT_EQUIP_C4" );
precachestring( &"KILLHOUSE_HINT_THROW_C4" );
precachestring( &"KILLHOUSE_HINT_THROW_C4_TOGGLE" );
precachestring( &"KILLHOUSE_HINT_THROW_C4_SPEED" );
precachestring( &"KILLHOUSE_HINT_APPROACH_MELEE" );
precachestring( &"KILLHOUSE_HINT_APPROACH_C4_THROW" );
precachestring( &"KILLHOUSE_HINT_HUD_CHANGES" );
precachestring( &"KILLHOUSE_DETONATE_C4" );
precachestring( &"KILLHOUSE_HINT_CROSSHAIR_CHANGES" );
precachestring( &"KILLHOUSE_HINT_ADS_ACCURACY" );
precachestring( &"KILLHOUSE_USE_ROPE" );
precachestring( &"KILLHOUSE_SHIP_TOO_SLOW" );
precachestring( &"KILLHOUSE_YOUR_TIME" );
precachestring( &"KILLHOUSE_YOUR_FINAL_TIME" );
precachestring( &"KILLHOUSE_IW_BEST_TIME" );
precachestring( &"KILLHOUSE_YOUR_DECK_TIME" );
precachestring( &"KILLHOUSE_IW_DECK_TIME" );
precachestring( &"KILLHOUSE_SHIP_OUT_OF_FLASH" );
precachestring( &"KILLHOUSE_SHIP_JUMPED_TOO_EARLY" );
precachestring( &"KILLHOUSE_HIT_FRIENDLY" );
precachestring( &"KILLHOUSE_HINT_FLASH" );
precachestring( &"KILLHOUSE_ACCURACY_BONUS" );
precachestring( &"KILLHOUSE_SHIP_LABEL" );
precachestring( &"KILLHOUSE_DECK_LABEL" );
precachestring( &"KILLHOUSE_ACCURACY_BONUS_ZERO" );
precachestring( &"KILLHOUSE_C4_OBJECTIVE" );
precachestring( &"KILLHOUSE_HINT_GRENADE_TOO_LOW" );
precachestring( &"KILLHOUSE_HINT_GL_TOO_LOW" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1B" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2B" );
precachestring( &"KILLHOUSE_AXIS_OPTION_YES" );
precachestring( &"KILLHOUSE_AXIS_OPTION_NO" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
precachestring( &"KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
precachestring( &"KILLHOUSE_LOOK_UP" );
precachestring( &"KILLHOUSE_LOOK_DOWN" );
precachestring( &"KILLHOUSE_HINT_LAUNCHER_ICON" );
precachestring( &"KILLHOUSE_FIRED_NEAR_FRIENDLY" );
precachestring( &"KILLHOUSE_USE_YOUR_OBJECTIVE_INDICATOR" );
precachestring( &"KILLHOUSE_PICK_UP_A_RIFLE_FROM" );
precachestring( &"KILLHOUSE_GET_A_PISTOL_FROM_THE" );
precachestring( &"KILLHOUSE_MELEE_THE_WATERMELON" );
precachestring( &"KILLHOUSE_GO_OUTSIDE_AND_REPORT" );
precachestring( &"KILLHOUSE_PICK_UP_THE_RIFLE_WITH" );
precachestring( &"KILLHOUSE_PICK_UP_THE_C4_EXPLOSIVE" );
precachestring( &"KILLHOUSE_RUN_THE_OBSTACLE_COURSE" );
precachestring( &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE" );
precachestring( &"KILLHOUSE_CLIMB_THE_LADDER" );
precachestring( &"KILLHOUSE_DEBRIEF_WITH_CPT_PRICE" );
precachestring( &"KILLHOUSE_ENTER_STATION_NUMBER" );
precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE1" );
precachestring( &"KILLHOUSE_SHOOT_EACH_TARGET_AS" );
precachestring( &"KILLHOUSE_EQUIP_THE_MP5_AND_PICK" );
precachestring( &"KILLHOUSE_CLEAR_THE_CARGOSHIP_BRIDGE" );
precachestring( &"KILLHOUSE_SWITCH_TO_YOUR_RIFLE" );
precachestring( &"KILLHOUSE_PICK_UP_THE_FRAG_GRENADES" );
precachestring( &"KILLHOUSE_ENTER_THE_SAFETY_PIT" );
precachestring( &"KILLHOUSE_THROW_A_GRENADE_INTO" );
precachestring( &"KILLHOUSE_RETURN_TO_THE_SAFETY" );
precachestring( &"KILLHOUSE_FIRE_AT_THE_WALL_WITH" );
precachestring( &"KILLHOUSE_PLANT_THE_C4_EXPLOSIVE" );
precachestring( &"KILLHOUSE_FIRE_YOUR_GRENADE_LAUNCHER" );
precachestring( &"KILLHOUSE_CLIMB_THE_LADDER1" );
precachestring( &"KILLHOUSE_SHOOT_A_TARGET_THROUGH" );
precachestring( &"KILLHOUSE_SLIDE_DOWN_THE_ROPE" );
precachestring( &"KILLHOUSE_COMPLETE_THE_DECK_MOCKUP" );
precachestring( &"KILLHOUSE_RECOMMENDED_LABEL" );
precachestring( &"KILLHOUSE_RECOMMENDED_LABEL2" );
precachestring( &"KILLHOUSE_RECOMMENDED_EASY" );
precachestring( &"KILLHOUSE_RECOMMENDED_NORMAL" );
precachestring( &"KILLHOUSE_RECOMMENDED_HARD" );
precachestring( &"KILLHOUSE_RECOMMENDED_VETERAN" );
level.weaponClipModels = [];
level.weaponClipModels[0] = "weapon_mp5_clip";
level.weaponClipModels[1] = "weapon_m16_clip";
level.weaponClipModels[2] = "weapon_saw_clip";
maps\_blackhawk::main( "vehicle_blackhawk" );
maps\_80s_hatch1::main( "vehicle_80s_hatch1_red" );
maps\_80s_sedan1::main( "vehicle_80s_sedan1_green" );
maps\_bus::main( "vehicle_bus_destructable" );
maps\_bm21_troops::main( "vehicle_bm21_mobile_cover" );
maps\_humvee::main( "vehicle_humvee_camo" );
maps\_small_wagon::main( "vehicle_small_wagon_turq" );
maps\_80s_sedan1::main( "vehicle_80s_sedan1_brn" );
maps\_bm21_troops::main( "vehicle_bm21_mobile_bed" );
maps\killhouse_fx::main();
maps\_load::main();
maps\killhouse_anim::anim_main();
level thread maps\killhouse_amb::main();
maps\_compass::setupMiniMap("compass_map_killhouse");
maps\_c4::main(); // Add in you main() function.
maps\createart\killhouse_art::main();
battlechatter_off( "allies" );
battlechatter_off( "axis" );
level.curObjective = 1;
level.objectives = [];
registerActions();
flag_init ( "in_pit_with_frags" );
flag_init( "ADS_targets_shot" );
flag_init( "hip_targets_shot" );
flag_init( "crosshair_dialog" );
flag_init( "ADS_shoot_dialog" );
flag_init ( "melee_run_dialog" );
flag_init( "melee_complete" );
flag_init ( "picked_up_launcher_dialog" );
flag_init ( "plant_c4_dialog" );
flag_init ( "c4_thrown" );
flag_init ( "C4_planted" );
flag_init ( "car_destroyed" );
flag_init ( "reveal_dialog_starting" );
flag_init ( "reveal_dialog_done" );
flag_init ( "price_reveal_done" );
flag_init ( "reveal_done" );
flag_init ( "player_sprinted" );
flag_init ( "fragTraining_end" );
flag_init ( "got_flashes" );
flag_init ( "got_frags" );
flag_init ( "sprinted" );
flag_init ( "finish" );
flag_init ( "activate_rope" );
flag_init ( "aa_look_training" );
flag_init ( "aa_obj_training" );
flag_init ( "aa_rifle_training" );
flag_init ( "aa_timed_shooting_training" );
flag_init ( "aa_sidearm_melee" );
flag_init ( "aa_frag" );
flag_init ( "aa_launcher" );
flag_init ( "aa_c4" );
flag_init ( "aa_obstacle" );
flag_init ( "aa_cargoship" );
flag_init( "gaz_in_idle_position" );
precacheString( &"KILLHOUSE_OBJ_GET_RIFLE_AMMO" );
precacheString( &"KILLHOUSE_OBJ_ENTER_STALL" );
precacheString( &"KILLHOUSE_HINT_SIDEARM" );
precacheString( &"KILLHOUSE_HINT_OBJECTIVE_MARKER" );
precacheString( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER" );
precacheString( &"KILLHOUSE_HINT_OBJECTIVE_REMINDER2" );
precacheString( &"KILLHOUSE_HINT_LADDER" );
precacheString( &"KILLHOUSE_HINT_HOLDING_SPRINT" );
precacheString( &"KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
precacheString( &"KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
precacheMenu("invert_axis");
precacheMenu("invert_axis_pc");
precacheMenu("select_difficulty");
flag_init ( "spawn_sidearms" );
flag_init ( "spawn_frags" );
flag_init ( "spawn_launcher" );
flashes = getEntArray( "pickup_flash", "targetname" );
frags = getEntArray( "frag_ammoitem", "targetname" );
launcher_ammoitem = getEntArray( "launcher_ammoitem", "targetname" );
array_thread( flashes, ::Ammorespawnthink , undefined, "flash_grenade", "got_flashes" );
array_thread( getEntArray( "pickup_mp5", "targetname" ), ::ammoRespawnThink , undefined, "mp5" );
array_thread( getEntArray( "pickup_rifle", "targetname" ), ::ammoRespawnThink , undefined, "g36c" );
array_thread( getEntArray( "pickup_sidearm", "targetname" ), ::ammoRespawnThink , "spawn_sidearms", "usp" );
array_thread( frags, ::ammoRespawnThink , "spawn_frags", "fraggrenade", "got_frags" );
array_thread( launcher_ammoitem, ::ammoRespawnThink , "spawn_launcher", "m203_m4" );
array_thread( getEntArray( "pickup_pistol", "targetname" ), ::ammoRespawnThink , undefined, "usp" );
level.gunPrimary = "g36c";
level.gunPrimaryClipAmmo = 30;
level.gunSidearm = "usp";
silently_lowerPlywoodWalls();
thread training_targetDummies( "rifle" );
thread melon_think();
thread turn_off_frag_lights();
thread waters_think();
thread mac_think();
thread newcastle_think();
thread price_think();
thread music_control();
pickupTrigger = getEnt( "c4_pickup", "targetname" );
pickupTrigger trigger_off();
C4_models = getEntArray( pickupTrigger.target, "targetname" );
for ( i = 0; i < C4_models.size; i++ )
C4_models[ i ] hide();
flag_init ( "start_deck" );
thread deck_training();
thread ambient_trucks();
helis = maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 8 );
array_thread(getentarray("level_scripted_unloadnode","script_noteworthy"),::level_scripted_unloadnode );
thread setup_player_action_notifies();
aa = getEntArray( "launcher_aim_assist", "script_noteworthy" );
for ( i = 0; i < aa.size; i++ )
{
aa[ i ] hide();
aa[ i ] notsolid();
}
thread new_look_training_setup();
ai = getaispeciesarray( "allies", "all" );
array_thread ( ai, ::magic_bullet_shield );
array_thread ( ai, ::fail_on_damage );
thread glowing_rope();
thread chair_guy_setup();
thread clear_hints_on_mission_fail();
}
clear_hints_on_mission_fail()
{
level waittill ( "mission failed" );
clear_hints();
}
killhouse_introscreen()
{
level.player freezeControls( true );
lines = [];
lines[ lines.size ] = &"KILLHOUSE_INTROSCREEN_LINE_1";
lines[ lines.size ] = &"KILLHOUSE_INTROSCREEN_LINE_3";
lines[ lines.size ] = &"KILLHOUSE_INTROSCREEN_LINE_4";
lines[ lines.size ] = &"KILLHOUSE_INTROSCREEN_LINE_5";
thread maps\_introscreen::introscreen_feed_lines( lines );
thread maps\_introscreen::introscreen_generic_black_fade_in( 5 );
wait 5;
level.player freezeControls( false );
}
look_training()
{
flag_set ( "aa_look_training" );
thread hint( &"KILLHOUSE_LOOK_UP", 9999 );
while ( 1 )
{
angles = level.player getPlayerAngles();
if ( angles[ 0 ] <  -40 )
break;
wait .1;
}
clear_hints();
wait .5;
thread hint( &"KILLHOUSE_LOOK_DOWN", 9999 );
while ( 1 )
{
angles = level.player getPlayerAngles();
if ( angles[ 0 ] >  0 )
break;
wait .1;
}
clear_hints();
setDvar( "ui_start_inverted", 0 );
if ( level.Console )
{
if(isdefined( getdvar("input_invertPitch") ) && getdvar("input_invertPitch") == "1" )
setDvar( "ui_start_inverted", 1 );
}
else // PC
{
if(isdefined( getdvar("ui_mousepitch") ) && getdvar("ui_mousepitch") == "1" )
setDvar( "ui_start_inverted", 1 );
}
wait .1;//make sure dvar is set
setDvar( "ui_invert_string", "@KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
if ( level.console )
level.player openMenu("invert_axis");
else
level.player openMenu("invert_axis_pc");
level.player freezecontrols(true);
setblur(2, .1);
level.player waittill("menuresponse", menu, response);
setblur(0, .2);
level.player freezecontrols(false);
if(response == "try_invert")
{
thread hint( &"KILLHOUSE_LOOK_UP", 9999 );
while ( 1 )
{
angles = level.player getPlayerAngles();
if ( angles[ 0 ] <  -40 )
break;
wait .1;
}
clear_hints();
wait .5;
thread hint( &"KILLHOUSE_LOOK_DOWN", 9999 );
while ( 1 )
{
angles = level.player getPlayerAngles();
if ( angles[ 0 ] >  0 )
break;
wait .1;
}
clear_hints();
setDvar( "ui_invert_string", "@KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
if ( level.console )
level.player openMenu("invert_axis");
else
level.player openMenu("invert_axis_pc");
level.player freezecontrols(true);
setblur(2, .1);
level.player waittill("menuresponse", menu, response);
setblur(0, .2);
level.player freezecontrols(false);
}
flag_clear ( "aa_look_training" );
thread navigationTraining();
}
navigationTraining()
{
flag_set ( "aa_obj_training" );
level notify ( "navigationTraining_start" );
level.waters thread execDialog( "illletyouin" );
registerObjective( "obj_enter_range", &"KILLHOUSE_USE_YOUR_OBJECTIVE_INDICATOR", getEnt( "rifle_range_obj", "targetname" ) );
setObjectiveState( "obj_enter_range", "current" );
wait 3;
thread objective_hints( "at_rifle_range" );
flag_wait( "at_rifle_range" );
thread open_firing_range_door();
thread door_to_rifle_handler();
flag_wait ( "inside_firing_range" );
setObjectiveState( "obj_enter_range", "done" );
}
inside_start()
{
SetMissionDvar( "lastplayedlevel", 1 );
thread overalltimer();
thread segmenttimer1( 1 );
inside_start = getent( "inside_start", "targetname" );
level.player setOrigin( inside_start.origin );
level.player setPlayerAngles( inside_start.angles );
flag_set ( "inside_firing_range" );
wait 2.5;
saveGame( "levelstart", &"AUTOSAVE_LEVELSTART", "whatever", true );
thread maps\_introscreen::introscreen_generic_white_fade_in( .1, 0.30 );
thread door_to_rifle_handler();
}
door_to_rifle_handler()
{
node =  getnode ( "gaz_intro", "targetname" );
node thread anim_first_frame_solo ( level.waters, "intro" );
flag_wait ("introscreen_complete");
node thread anim_single_solo ( level.waters, "intro" );
level notify ( "navigationTraining_end" );
clear_hints();
wait ( 0.5 );
flag_clear ( "aa_obj_training" );
thread rifleTraining();
}
rifle_start()
{
shooting_start = getent( "shooting_start", "targetname" );
level.player setOrigin( shooting_start.origin );
level.player setPlayerAngles( shooting_start.angles );
flag_set ( "inside_firing_range" );
thread rifleTraining();
}
rifleTraining()
{
flag_set ( "aa_rifle_training" );
level notify ( "rifleTraining_start" );
flag_trigger_init( "player_at_rifle_stall", getEnt( "rifleTraining_stall", "targetname" ), true );
flag_wait ( "inside_firing_range" );
thread delay_objective_after_intro();
thread move_gaz_once_player_past();
while ( !(level.player GetWeaponAmmoStock( level.gunPrimary ) ) )
wait ( 0.05 );
close_firing_range_door();
autosave_by_name( "rifle_training" );
setObjectiveString( "obj_rifle", &"KILLHOUSE_ENTER_STATION_NUMBER" );
setObjectiveLocation( "obj_rifle", getEnt( "obj_rifle_stall", "targetname" )  );
thread gaz_animation( "killhouse_gaz_idleA", 1.5 );
level.waters execDialog( "youknowdrill" );
if ( !flag( "player_at_rifle_stall" ) )
{
level.waters thread execDialog( "priceevaluation" );
}
while( !flag( "player_at_rifle_stall" ) )
wait ( 0.05 );
if ( !isADS() )
{
if ( level.Xenon )
thread keyHint( "ads_360" );
else
thread keyHint( "ads" );//PC and PS3 are both press
thread gaz_animation( "killhouse_gaz_idleA" );
level.waters execDialog( "rifledownrange" );
}
while( !isADS() )
wait ( 0.05 );
if ( level.short_training )
thread new_look_training_handler();
else
thread shoot_ADS_handler();
}
new_look_training_handler()
{
aim_down_target = getEnt( "aim_down_target", "targetname" );
aim_up_target = getEnt( "aim_up_target", "targetname" );
if( level.Xenon )
thread keyHint( "attack" );
else
thread keyHint( "pc_attack" );//PC and PS3 are both press
level.waters thread execDialog( "shooteachtarget" );
aim_up_target new_look_wait_for_target( -90, 90 );
aim_down_target new_look_wait_for_target( 90, -90 );
setDvar( "ui_start_inverted", 0 );
if ( level.Console )
{
if(isdefined( getdvar("input_invertPitch") ) && getdvar("input_invertPitch") == "1" )
setDvar( "ui_start_inverted", 1 );
}
else // PC
{
if(isdefined( getdvar("ui_mousepitch") ) && getdvar("ui_mousepitch") == "1" )
setDvar( "ui_start_inverted", 1 );
}
wait .1;//make sure dvar is set
setDvar( "ui_invert_string", "@KILLHOUSE_AXIS_OPTION_MENU1_ALL" );
if ( level.console )
level.player openMenu("invert_axis");
else
level.player openMenu("invert_axis_pc");
level.player freezecontrols(true);
setblur(2, .1);
level.player waittill("menuresponse", menu, response);
setblur(0, .2);
level.player freezecontrols(false);
if(response == "try_invert")
{
level.waters thread execDialog( "onemoretime" );
aim_up_target new_look_wait_for_target( -90, 90 );
aim_down_target new_look_wait_for_target( 90, -90 );
setDvar( "ui_invert_string", "@KILLHOUSE_AXIS_OPTION_MENU2_ALL" );
if ( level.console )
level.player openMenu("invert_axis");
else
level.player openMenu("invert_axis_pc");
level.player freezecontrols(true);
setblur(2, .1);
level.player waittill("menuresponse", menu, response);
setblur(0, .2);
level.player freezecontrols(false);
}
level.waters execDialog( "lovely" );
thread rifle_hip_shooting();
}
shoot_ADS_handler()
{
thread ADS_shoot_dialog();
wait ( 0.1 );
raiseTargetDummies( "rifle", undefined, undefined );
thread setObjectiveString( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE" );
thread flag_when_lowered( "ADS_targets_shot" );
flag_wait( "ADS_targets_shot" );
flag_wait( "ADS_shoot_dialog" );
thread rifle_hip_shooting();
}
rifle_hip_shooting()
{
wait .5;
double_line = true;
thread hint ( &"KILLHOUSE_HINT_ADS_ACCURACY", 10, double_line );
level.waters execDialog( "firingfromhip" );
setObjectiveString( "obj_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_WHILE1" );
wait 1;
double_line = true;
if ( isADS() )
thread keyHint( "stop_ads", undefined, double_line );
while( isADS() )
wait ( 0.05 );
level.hip_fire_required = true;
raiseTargetDummies( "rifle", undefined, undefined );
thread flag_when_lowered( "hip_targets_shot" );
if( level.xenon )
keyHint( "hip_attack" );
else
keyHint( "pc_hip_attack" );//PC and ps3 are both "press"
while ( level.targets_hit == 0 )
wait .1;
double_line = true;
thread hint ( &"KILLHOUSE_HINT_CROSSHAIR_CHANGES", 6, double_line );
flag_wait( "hip_targets_shot" );
level.hip_fire_required = false;
thread rifle_penetration_shooting();
}
crosshair_dialog()
{
wait 1;
level.waters execDialog( "changessize" );
level.waters execDialog( "stupidtest" );
wait 1;
flag_set( "crosshair_dialog" );
}
rifle_penetration_shooting()
{
wait .5;
level.waters execDialog( "blocktargets" );
raiseTargetDummies( "rifle", undefined, undefined );
raisePlywoodWalls();
setObjectiveString( "obj_rifle", &"KILLHOUSE_SHOOT_A_TARGET_THROUGH" );
level.targets_hit = 0;
wait .5;
level.waters execDialog( "shoottargets" );
wait .2;
level.waters thread execDialog( "bulletspenetrate" );
targetDummies = getTargetDummies( "rifle" );
numRaised = targetDummies.size;
while ( level.targets_hit == 0 )
wait .1;
level.waters execDialog( "good" );
setObjectiveState( "obj_rifle", "done" );
lowerPlywoodWalls();
lowerTargetDummies( "rifle", undefined, undefined );
wait .5;
flag_clear ( "aa_rifle_training" );
thread rifle_timed_shooting();
}
rifle_timed_start()
{
shooting_start = getent( "shooting_start", "targetname" );
level.player setOrigin( shooting_start.origin );
level.player setPlayerAngles( shooting_start.angles );
level.player giveWeapon("g36c");
level.player switchtoWeapon("g36c");
thread rifle_timed_shooting();
}
rifle_timed_shooting()
{
flag_set ( "aa_timed_shooting_training" );
level.waters execDialog( "targetspop" );
level.waters execDialog( "hitall" );
registerObjective( "obj_timed_rifle", &"KILLHOUSE_SHOOT_EACH_TARGET_AS", getEnt("obj_rifle_stall", "targetname" ) );
setObjectiveState( "obj_timed_rifle", "current" );
if ( auto_aim() )
{
if ( level.xenon )
actionBind = getActionBind( "ads_switch" );
else
actionBind = getActionBind( "ads_switch_shoulder" );
double_line = true;
thread hint( actionBind.hint, 6, double_line );
level.waters execDialog( "snaponto" );
}
if ( (level.player GetWeaponAmmoClip( level.gunPrimary ) ) < level.gunPrimaryClipAmmo )
{
keyHint( "reload" );
wait ( 2.0 );
}
tooslow_dialog = [];
tooslow_dialog[ 0 ] = "stilltooslow"; //You're still too slow…
tooslow_dialog[ 1 ] = "again"; //Again.
tooslow_dialog[ 2 ] = "again2"; //Again.
tooslow_dialog[ 3 ] = "walkinpark"; //Too slow. Come on. This should be a walk in the park for you.
numRepeats = 0;
while ( 1 )
{
lowerTargetDummies( "rifle" );
if ( auto_aim() && numRepeats != 0 )
{
if ( level.xenon )
actionBind = getActionBind( "ads_switch" );
else
actionBind = getActionBind( "ads_switch_shoulder" );
double_line = true;
thread hint( actionBind.hint, 10, double_line );
wait 4;
}
level.num_hit = 0;
thread timedTargets();
wait 10;
level notify ("times_up");
if ( level.num_hit > 6 )
break;
wait 1;
numRepeats++;
lowerTargetDummies( "rifle" );
if ( numRepeats == 1 )
level.waters execDialog( "tryagain" );//Too slow mate! Try again!
else
level.waters execDialog( tooslow_dialog[ randomint ( tooslow_dialog.size ) ] );
wait 2;
if ( (level.player GetWeaponAmmoClip( level.gunPrimary ) ) < level.gunPrimaryClipAmmo )
{
thread keyHint( "reload" );
while ( (level.player GetWeaponAmmoClip( level.gunPrimary ) ) < level.gunPrimaryClipAmmo )
wait .1;
clear_hints();
wait 1;
}
}
flag_set ( "spawn_sidearms" );
wait 1;
setObjectiveState( "obj_timed_rifle", "done" );
level.waters execDialog( "propergood" );
level notify ( "rifleTraining_end" );
wait 0.5;
flag_clear ( "aa_timed_shooting_training" );
thread sidearm_Training();
}
timedTargets()
{
level endon ("times_up");
targets = getentarray ( "rifle_target_dummy", "script_noteworthy" );
last_selection = -1;
while (1)
{
while (1)
{
selected_target = randomint(targets.size);
if ( selected_target != last_selection )
break;
}
last_selection = selected_target;
targets[ selected_target ] thread moveTargetDummy( "raise" );
targets[ selected_target ] waittill ( "hit" );
level.num_hit++;
wait .1;
}
}
sidearm_start()
{
delaythread( .1, ::move_gaz_fake );
shooting_start = getent( "shooting_start", "targetname" );
level.player setOrigin( shooting_start.origin );
level.player setPlayerAngles( shooting_start.angles );
level.player giveWeapon("g36c");
level.player switchtoWeapon("g36c");
wait .5;
thread sideArm_Training();
}
sideArm_Training()
{
flag_set ( "aa_sidearm_melee" );
level notify ( "sideArmTraining_begin" );
autosave_by_name( "sidearm_training" );
flag_set( "spawn_sidearms" );
thread gaz_animation( "killhouse_gaz_point_side" );
level.waters execDialog( "getasidearm" );//armory
registerObjective( "obj_sidearm", &"KILLHOUSE_GET_A_PISTOL_FROM_THE", getEnt( "obj_rifle_ammo", "targetname" ) );
setObjectiveState( "obj_sidearm", "current" );
while ( ! level.player HasWeapon( "usp" ) )
{
wait .05;
}
level notify ( "show_melon" );
setObjectiveString( "obj_sidearm", &"KILLHOUSE_SWITCH_TO_YOUR_RIFLE" );
level.waters execDialog( "switchtorifle" );
if ( level.player getCurrentWeapon() != level.gunPrimary )
thread keyHint( "primary" );
while ( level.player getCurrentWeapon() != level.gunPrimary )
wait .05;
clear_hints();
thread gaz_animation( "killhouse_gaz_point_side" );
level.waters execDialog( "pulloutsidearm" );
if ( level.player getCurrentWeapon() != level.gunSidearm )
{
thread keyHint( "sidearm" );
}
while ( level.player getCurrentWeapon() != level.gunSidearm )
wait .05;
clear_hints();
level.waters execDialog( "switchingfaster" );
setObjectiveState( "obj_sidearm", "done" );
flag_set ( "sidearm_complete" );
level notify ( "sideArmTraining_end" );
wait ( 0.5 );
thread melee_training();
}
melee_training()
{
level notify ( "melee_training" );
registerObjective( "obj_melee", &"KILLHOUSE_MELEE_THE_WATERMELON", getEnt( "scr_watermelon", "targetname" ) );
setObjectiveState( "obj_melee", "current" );
if ( !flag ( "melee_complete" ) )
thread generic_compass_hint_reminder( "melee_complete", 12 );
if ( !flag ( "near_melee" ) && !flag ( "melee_complete" ) )
{
thread hint( &"KILLHOUSE_HINT_APPROACH_MELEE", 9999 );
level.waters execDialog( "comethisway" );
}
thread melee_run_dialog();
if ( !flag ( "melee_complete" ) )
flag_wait ( "near_melee" );
while ( !flag ( "melee_complete" ) )
keyHint( "melee" );
flag_wait ( "melee_complete" );
clear_hints();
thread open_firing_range_door();
flag_wait ( "melee_run_dialog" );
wait .5;
thread gaz_animation( "killhouse_gaz_talk_side" );
level.waters  execDialog( "fruitkilling" );
setObjectiveState( "obj_melee", "done" );
level notify ( "meleeTraining_end" );
flag_clear ( "aa_sidearm_melee" );
autosave_by_name( "melee_complete" );
if ( level.short_training )
{
level.waters  execDialog( "wantstosee" );
thread report_to_price();
}
else
{
level.waters  execDialog( "allgoodhere" );
thread frag_Training();
}
}
open_firing_range_door()
{
if ( level.firing_range_door_open )
return;
door = getEnt( "rifle_range_door", "targetname" );
door playsound ( "door_metal_slow_open" );
door rotateto( door.angles + (0,88,0), 1, .5, 0 );
door connectpaths();
level.firing_range_door_open = true;
thread segmenttimer2( 2 );
}
close_firing_range_door()
{
if ( !level.firing_range_door_open )
return;
door = getEnt( "rifle_range_door", "targetname" );
door rotateto( door.angles + (0,-88,0), 1, .5, 0 );
door connectpaths();
level.firing_range_door_open = false;
}
melee_run_dialog()
{
if ( !flag ( "melee_complete" ) )
{
level.waters execDialog( "evenfaster" );
}
if ( !flag ( "melee_complete" ) )
{
level.waters execDialog( "knifewatermelon" );
}
flag_set ( "melee_run_dialog" );
}
frag_start()
{
frag_start = getent( "frag_start", "targetname" );
level.player setOrigin( frag_start.origin );
level.player setPlayerAngles( frag_start.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("usp");
level.player switchtoWeapon("g36c");
flag_set ( "spawn_frags" );
thread frag_Training();
}
frag_Training()
{
flag_set ( "aa_frag" );
level notify ( "fragTraining_begin" );
autosave_by_name( "frag_training" );
flag_set ( "start_frag_training" );
thread generic_compass_hint_reminder( "got_frags", 7 );
registerObjective( "obj_frags", &"KILLHOUSE_GO_OUTSIDE_AND_REPORT", getEnt( "obj_frag_ammo", "targetname" ) );
setObjectiveState( "obj_frags", "current" );
flag_wait ( "near_grenade_area" );
setObjectiveString( "obj_frags", &"KILLHOUSE_PICK_UP_THE_FRAG_GRENADES" );
level.newcastle execDialog( "timeforfun" );
if ( !( level.player GetWeaponAmmoStock( "fraggrenade" ) ) &&  (!( in_pit() ) ) )
{
level.newcastle execDialog( "pickupfrag" );
}
while ( level.player GetWeaponAmmoStock( "fraggrenade" ) < 3 )
wait ( 0.05 );
flag_set ( "got_frags" );
getEnt( "grenade_too_low", "targetname" ) thread frag_too_low_hint();
thread frag_trigger_think( "frag_target_1", getEnt( "grenade_damage_trigger1", "targetname" ) );
thread frag_trigger_think( "frag_target_2", getEnt( "grenade_damage_trigger2", "targetname" ) );
thread frag_trigger_think( "frag_target_3", getEnt( "grenade_damage_trigger3", "targetname" ) );
setObjectiveLocation( "obj_frags", getEnt( "safety_pit", "targetname" ) );
setObjectiveString( "obj_frags", &"KILLHOUSE_ENTER_THE_SAFETY_PIT" );
thread dialog_nag_till_in_pit();
getEnt( "safety_pit", "targetname" ) waittill ( "trigger" );
flag_set ( "in_pit_with_frags" );
level.newcastle setgoalnode ( getnode ( "watch_pit_node", "script_noteworthy" ) );
level.newcastle thread execDialog( "throwgrenade" );
thread keyHint( "frag" );
setObjectiveString( "obj_frags", &"KILLHOUSE_THROW_A_GRENADE_INTO" );
setObjectiveLocation( "obj_frags", getEnt( "safety_pit", "targetname" )  );
wait ( 0.1 );
numRemaining = 0;
for ( index = 1; index < 4; index++ )
{
if ( flag( "frag_target_" + index ) )
continue;
numRemaining++;
}
while( numRemaining )
{
curRemaining = 0;
nextTarget = "";
if ( !flag( "frag_target_1" ) )
{
curRemaining++;
nextTarget = "firstwindow";
}
if ( !flag( "frag_target_2" ) )
{
curRemaining++;
if ( nextTarget == "" )
nextTarget = "secondwindow";
}
if ( !flag( "frag_target_3" ) )
{
curRemaining++;
if ( nextTarget == "" )
nextTarget = "dumpster";
}
if ( !curRemaining )
break;
if ( curRemaining != numRemaining )
{
}
else
{
}
numRemaining = curRemaining;
wait ( 0.05 );
}
setObjectiveState( "obj_frags", "done" );
wait ( 1.0 );
flag_set ( "fragTraining_end" );
thread launcherTraining();
flag_clear ( "aa_frag" );
}
launcher_trigger_think( flag, trigger, continuous )
{
flag_init( flag );
trigger.aim_assist = getEnt( trigger.script_noteworthy, "targetname" );
trigger.light = getEnt( trigger.target, "targetname" );
trigger.aim_assist enableAimAssist();
trigger.light thread flicker_on();
if( !isDefined( continuous ) )
continuous = false;
trigger _flag_wait_trigger( flag, continuous );
level.player playSound( "killhouse_buzzer" );
trigger.light thread flicker_off();
trigger.aim_assist disableAimAssist();
return trigger;
}
gl_too_low_hint()
{
level endon ( "launcherTraining_end" );
while( 1 )
{
self waittill ( "trigger" );
clear_hints();
hint( &"KILLHOUSE_HINT_GL_TOO_LOW", 6 );
}
}
launcher_start()
{
frag_start = getent( "frag_start", "targetname" );
level.player setOrigin( frag_start.origin );
level.player setPlayerAngles( frag_start.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("usp");
level.player switchtoWeapon("g36c");
flag_set ( "spawn_frags" );
wait .1;
thread launcherTraining();
}
launcherTraining()
{
flag_set ( "aa_launcher" );
level notify ( "launcherTraining_begin" );
autosave_by_name( "launcher_training" );
flag_set ( "spawn_launcher" );
level.newcastle setgoalnode ( getnode ( "watch_table_node", "script_noteworthy" ) );
if ( !level.player hasWeapon( "m203_m4" ) )
{
level.newcastle execDialog( "pickuplauncher" );
}
flag_trigger_init( "launcher_wall_target", getEnt( "launcher_wall_trigger", "script_noteworthy" ) );
registerObjective( "obj_launcher", &"KILLHOUSE_PICK_UP_THE_RIFLE_WITH", getEnt( "obj_frag_ammo", "targetname" ) );
setObjectiveState( "obj_launcher", "current" );
thread keyHint( "swap_launcher" );
while ( !level.player hasWeapon( "m203_m4" ) )
wait ( 0.05 );
clear_hints();
thread M203_icon_hint();
RefreshHudAmmoCounter();
level.player giveMaxAmmo( "m203_m4" );
setObjectiveString( "obj_launcher", &"KILLHOUSE_RETURN_TO_THE_SAFETY" );
setObjectiveLocation( "obj_launcher", getEnt( "safety_pit", "targetname" )  );
if ( !( level.player istouching( getEnt( "safety_pit", "targetname" ) ) ) )
{
level.newcastle execDialog( "nowbacktopit" );
}
getEnt( "safety_pit", "targetname" ) waittill ( "trigger" );
level.newcastle setgoalnode ( getnode ( "watch_pit_node", "script_noteworthy" ) );
if ( !(level.player getCurrentWeapon() == "m203_m4") )
{
level.newcastle execDialog( "equiplauncher" );
thread keyHint( "firemode" );
RefreshHudAmmoCounter();
}
while ( !(level.player getCurrentWeapon() == "m203_m4") )
{
thread keyHint( "firemode" );
wait ( 1.0 );
}
clear_hints();
setObjectiveString( "obj_launcher", &"KILLHOUSE_FIRE_AT_THE_WALL_WITH" );
setObjectiveLocation( "obj_launcher", getEnt( "safety_pit", "targetname" )  );
wait ( 0.1 );
level.newcastle execDialog( "firewall1" );
if( level.Xenon )
thread keyHint( "attack" );
else
thread keyHint( "pc_attack" );//PC and PS3 are both press
while ( !flag( "launcher_wall_target" ) )
{
wait ( 0.05 );
}
clear_hints();
wait ( 0.1 );
level.newcastle execDialog( "didntexplode" );
level.newcastle execDialog( "safearming" );
level.newcastle thread execDialog( "56and7" );
array_thread ( getEntArray( "gl_too_low", "targetname" ), ::gl_too_low_hint );
thread launcher_trigger_think( "launcher_target_1", getEnt( "launcher_damage_trigger1", "targetname" ) );
thread launcher_trigger_think( "launcher_target_2", getEnt( "launcher_damage_trigger2", "targetname" ) );
thread launcher_trigger_think( "launcher_target_3", getEnt( "launcher_damage_trigger3", "targetname" ) );
setObjectiveString( "obj_launcher", &"KILLHOUSE_FIRE_YOUR_GRENADE_LAUNCHER" );
numRemaining = 0;
for ( index = 1; index < 4; index++ )
{
if ( flag( "launcher_target_" + index ) )
continue;
numRemaining++;
}
while( numRemaining )
{
curRemaining = 0;
nextTarget = "";
if ( !flag( "launcher_target_1" ) )
{
curRemaining++;
nextTarget = "hittwo";
}
if ( !flag( "launcher_target_2" ) )
{
curRemaining++;
if ( nextTarget == "" )
nextTarget = "hitthree";
}
if ( !flag( "launcher_target_3" ) )
{
curRemaining++;
if ( nextTarget == "" )
nextTarget = "hitfour";
}
if ( !curRemaining )
break;
if ( curRemaining != numRemaining )
{
}
else
{
}
numRemaining = curRemaining;
wait ( 0.05 );
}
level notify ( "launcherTraining_end" );
setObjectiveState( "obj_launcher", "done" );
wait ( 1.0 );
wait ( 1.0 );
flag_clear ( "aa_launcher" );
thread c4_Training();
}
explosives_start()
{
c4_start = getent( "c4_start", "targetname" );
level.player setOrigin( c4_start.origin );
level.player setPlayerAngles( c4_start.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("m4_grenadier");
level.player switchtoWeapon("m4_grenadier");
flag_set ( "spawn_frags" );
wait .1;
thread c4_Training();
}
c4_Training()
{
flag_set ( "aa_c4" );
level notify ( "explosivesTraining_begin" );
autosave_by_name( "c4_training" );
pickupTrigger = flag_trigger_init( "explosives_pickup", getEnt( "c4_pickup", "targetname" ) );
C4_models = getEntArray( pickupTrigger.target, "targetname" );
pickupTrigger setHintString (&"KILLHOUSE_C4_PICKUP");
pickupTrigger trigger_on();
for ( i = 0; i < C4_models.size; i++ )
C4_models[ i ] show();
registerObjective( "obj_c4", &"KILLHOUSE_PICK_UP_THE_C4_EXPLOSIVE", pickupTrigger );
setObjectiveState( "obj_c4", "current" );
level.newcastle thread execDialog( "c4offtable" );
level.newcastle setgoalnode ( getnode ( "watch_c4_node", "script_noteworthy" ) );
thread keyHint( "swap_explosives" );
while ( !flag( "explosives_pickup" ) )
wait ( 0.05 );
level.player playsound ( "detpack_pickup" );
for ( i = 0; i < C4_models.size; i++ )
C4_models[ i ] hide();
pickupTrigger trigger_off();
old_weapon = level.player GetCurrentWeapon ();
level.player giveWeapon("c4");
level.player SetWeaponAmmoClip( "c4", 1 );
level.player SetActionSlot( 2, "weapon" , "c4" );
thread C4_icon_hint();
RefreshHudAmmoCounter();
thread flag_when_c4_thrown();
wait .5;
if ( !(level.player getCurrentWeapon() == "c4") )
{
level.newcastle execDialog( "equipc4" );	//Equip the C4, Soap.
level notify ( "c4_equiped" );
level.hintElem setText( &"KILLHOUSE_HINT_EQUIP_C4" );
RefreshHudAmmoCounter();
}
while ( !(level.player getCurrentWeapon() == "c4") )
{
wait ( 1.0 );
}
flag_set ( "c4_equiped" );
level.hintbackground destroy();
double_line = true;
add_hint_background( double_line );
level.hintElem setText( &"KILLHOUSE_HINT_HUD_CHANGES" );
RefreshHudAmmoCounter();
level.newcastle execDialog( "exwifecar" );
setObjectiveLocation( "obj_c4", getEnt( "c4_target", "targetname" )  );
level notify ( "C4_the_car" );
if ( !flag ( "c4_thrown" ) )
level.newcastle execDialog( "throwc4car" );	//Throw some C4 on the car.
if ( ( !flag ( "near_car" ) ) && ( !flag ( "c4_thrown" ) ) )
{
level.hintbackground destroy();
add_hint_background();
level.hintElem setText( &"KILLHOUSE_HINT_APPROACH_C4_THROW" );
flag_wait ( "near_car" );
}
if ( !flag ( "c4_thrown" ) )
keyHint( "throw_C4" );
flag_wait ( "c4_thrown" );
wait .5;
double_line = true;
thread hint( &"KILLHOUSE_C4_OBJECTIVE", 9999, double_line );
wait 4;
level.newcastle thread execDialog( "placec4" );
c4_target = getent( "c4_target", "targetname" );
c4_target maps\_c4::c4_location( undefined, undefined, undefined, c4_target.origin );
level thread do_in_order( ::waittill_msg, "c4_in_place", ::flag_set, "C4_planted" );
wait ( 1.0 );
setObjectiveString( "obj_c4", &"KILLHOUSE_PLANT_THE_C4_EXPLOSIVE" );
setObjectiveLocation( "obj_c4", c4_target  );
flag_wait ( "C4_planted" );
c4_target thread force_detonation();
clear_hints();
setObjectiveState( "obj_c4", "done" );
if( !flag( "car_destroyed" ) )
level.newcastle execDialog( "safedistance" );	//Now get to a safe distance from the explosives.
while ( ( distance( c4_target.origin, level.player.origin ) <= 256 ) && !flag( "car_destroyed" ) )
wait 0.05;
if( !flag( "car_destroyed" ) )
{
level.newcastle execDialog( "fireinhole" );	//Fire in the hole!
thread keyHint( "detonate_C4", 9999 );
}
flag_wait ( "car_destroyed" );
thread switch_in_two( old_weapon );
clear_hints();
setObjectiveState( "obj_c4", "done" );
thread C4_complete_dialog();
level notify ( "explosivesTraining_end" );
thread obstacle_Training();
flag_clear ( "aa_c4" );
}
switch_in_two( old_weapon )
{
wait 2;
level.player SwitchToWeapon ( old_weapon );
}
force_detonation()
{
self waittill ( "c4_detonation" );
wait .05; //destructable cars can only take damage from one source per frame
car = getent ( "destructible", "targetname" );
car destructible_force_explosion();
}
flag_when_c4_thrown()
{
while (1)
{
level.player waittill ( "grenade_fire", grenade );
if (level.player getCurrentWeapon() == "c4")
{
flag_set ( "c4_thrown" );
return;
}
}
}
C4_complete_dialog()
{
level.newcastle execDialog( "chuckle" );	//< satisfied chuckling >
level.newcastle execDialog( "muchimproved" );	//Much improved.
if ( ! flag ( "start_obstacle" ) )
level.newcastle execDialog( "passedeval" ); //All right Soap, you passed the weapons evaluation.
if ( ! flag ( "start_obstacle" ) )
level.newcastle execDialog( "reporttomac" ); //Now report to Mac on the obstacle course.
if ( ! flag ( "start_obstacle" ) )
level.newcastle execDialog( "thrilledtosee" ); //I’m sure he'll be thrilled to see you.
}
obstacle_start()
{
start_obstacle_course = getent( "start_obstacle_course", "targetname" );
level.player setOrigin( start_obstacle_course.origin );
level.player setPlayerAngles( start_obstacle_course.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("m4_grenadier");
level.player switchtoWeapon("m4_grenadier");
flag_set ( "spawn_frags" );
thread obstacle_Training();
}
obstacle_Training()
{
flag_set ( "aa_obstacle" );
level notify ( "obstacleTraining_start" );
registerObjective( "obj_obstacle", &"KILLHOUSE_RUN_THE_OBSTACLE_COURSE", getEnt( "obstacleTraining_objective", "targetname" ) );
setObjectiveState( "obj_obstacle", "current" );
thread generic_compass_hint_reminder( "start_obstacle", 7 );
getEnt( "obstacle_course_start", "targetname" ) waittill ( "trigger" );
flag_set ( "start_obstacle" );
flag_trigger_init( "prone_entered", getEnt( "obstacleTraining_prone", "targetname" ) );
thread obstacleTraining_buddies();
thread obstacleTraining_dialog();
flag_wait( "start_course" );
setObjectiveLocation( "obj_obstacle", getEnt( "obj_course_end", "targetname" )  );
move_mac_triggers = getentarray( "move_mac", "targetname" );
array_thread( move_mac_triggers, ::move_mac );
getEnt( "obstacleTraining_mantle", "targetname" ) waittill ( "trigger" );
thread keyHint( "mantle", 5.0 );
flag_wait( "obstacleTraining_crouch" );
thread keyHint( "crouch" );
flag_wait( "obstacleTraining_mantle2" );
thread keyHint( "mantle", 5.0 );
flag_wait( "prone_entered" );
thread keyHint( "prone" );
getEnt( "obstacleTraining_Standup", "targetname" ) waittill ( "trigger" );
thread keyHint( "stand", 5.0 );
clear_hints_on_stand();
wait .1;
if ( level.xenon )// ghetto but PS3 requires "Press X" and 360 requires "Click X"
keyHint( "sprint" );
else
keyHint( "sprint_pc" );
flag_set ( "player_sprinted" );
if( !flag( "obstacle_course_end" ) )
thread second_sprint_hint();
flag_wait( "obstacle_course_end" );
level notify ( "kill_sprint_hint" );
clear_hints();
setObjectiveState( "obj_obstacle", "done" );
thread report_to_price();
flag_clear ( "aa_obstacle" );
}
obstacleTraining_dialog()
{
level endon( "obstacleTraining_end" );
level.mac execDialog( "misssoap" );
if( !flag( "start_course" ) )
{
level.mac execDialog( "lineup" );
flag_set( "start_course" );
}
level.mac playsound( "killhouse_mcm_go" );
flag_set( "start_course" );
level.mac execDialog( "isntcharitywalk" );
flag_wait( "obstacleTraining_mantle2" );
level.mac execDialog( "jumpobstacles" );
flag_wait( "crawl_dialog" );
level.mac execDialog( "youcrawllike" );
if( !flag( "obstacle_course_end" ) )
{
level.mac execDialog( "commandos" );
}
if( !flag( "obstacle_course_end" ) )
{
level.mac execDialog( "bertud" );
}
flag_wait ( "player_sprinted" );
flag_wait( "obstacle_course_end" );
level.mac execDialog( "passedtest" );
level.mac execDialog( "runitagain" );
thread loop_obstacle();
}
reveal_start()
{
start_reveal = getent( "start_reveal", "targetname" );
level.player setOrigin( start_reveal.origin );
level.player setPlayerAngles( start_reveal.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("m4_grenadier");
level.player switchtoWeapon("m4_grenadier");
thread report_to_price();
}
report_to_price()
{
flag_set ( "aa_cargoship" );
wait .1;
registerObjective( "obj_price", &"KILLHOUSE_REPORT_TO_CAPTAIN_PRICE", getEnt( "obj_price", "targetname" ) );
setObjectiveState( "obj_price", "current" );
hangerdoor = getent ( "ship_hanger_door" , "targetname" );
hangerdoor moveX( 40, .1, 0, 0 );
level.price	gun_remove();
sas1 = getent ( "sas1" , "script_noteworthy" );
sas2 = getent ( "sas2" , "script_noteworthy" );
sas3 = getent ( "sas3" , "script_noteworthy" );
sas1.animname = "sas1";
sas2.animname = "sas2";
sas3.animname = "sas3";
SAS_blackkits = [];
SAS_blackkits [ SAS_blackkits.size ] = sas1;
SAS_blackkits [ SAS_blackkits.size ] = sas2;
SAS_blackkits [ SAS_blackkits.size ] = sas3;
node = getent ( "reveal_node", "targetname" );
node thread reveal_anims ( SAS_blackkits, sas2 );
delaythread ( 4, ::objective_hints, "reveal_dialog_starting" );
flag_set ( "obstacle_complete" );
flag_wait ( "open_ship_hanger" );
thread do_in_order( ::flag_wait, "at_ladder", ::hint, &"KILLHOUSE_HINT_LADDER" );
hangerdoor moveX( 110, 8, .3, 0 );
hangerdoor playsound ( "door_hanger_metal_open" );
flag_wait ( "on_ladder" );
node notify ( "end_idle" );
level.price animscripts\shared::placeWeaponOn( level.price.weapon, "right" );
thread cargoship_training();
}
reveal_anims( SAS_blackkits, sas2 )
{
looking_at_price = getent ( "looking_at_price", "targetname" );
self add_wait( ::anim_single, SAS_blackkits, "reveal" );
level add_func( ::flag_set, "reveal_done" );
thread do_wait();
self add_wait( ::anim_single_solo, level.price, "reveal" );
level add_func( ::flag_set, "price_reveal_done" );
thread do_wait();
wait 2; //make anims start faster
array_thread ( SAS_blackkits, ::pause_anim );
level.price pause_anim();
flag_wait ( "open_ship_hanger" );
while ( ! level.player istouching ( looking_at_price ) )
wait .1;
array_thread ( SAS_blackkits, ::unpause_anim );
level.price unpause_anim();
wait 3;
clear_hints();
flag_set ( "reveal_dialog_starting" );
clip = getent ( "ship_hanger_clip", "targetname" );
clip delete();
flag_wait ( "reveal_done" );
if ( !flag ( "on_ladder" ) )
self thread anim_loop( SAS_blackkits, "reveal_idle", undefined, "end_idle");
flag_wait ( "price_reveal_done" );
if ( !flag ( "on_ladder" ) )
self thread anim_loop_solo( level.price, "reveal_idle", undefined, "end_idle");
}
reveal_dialog_ladder( param1 )
{
if ( !flag ( "at_ladder" ) )
{
level.price playsound( "killhouse_pri_ladderthere" );	//Climb the ladder over there.
}
setObjectiveString( "obj_price", &"KILLHOUSE_CLIMB_THE_LADDER1" );
setObjectiveLocation( "obj_price", getent( "top_of_ladder_trigger", "targetname" ) );
flag_set ( "reveal_dialog_done" );
}
reveal_dialog( sas2 )
{
wait 1;
}
cargoship_start()
{
start_pre_rope = getent( "start_pre_rope", "targetname" );
level.player setOrigin( start_pre_rope.origin );
level.player setPlayerAngles( start_pre_rope.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("m4_grenadier");
level.player switchtoWeapon("m4_grenadier");
registerObjective( "obj_price", &"KILLHOUSE_CLIMB_THE_LADDER", getEnt( "top_of_rope_trigger", "targetname" ) );
setObjectiveState( "obj_price", "current" );
flag_set ( "reveal_dialog_done" );
thread cargoship_training();
}
cargoship_training()
{
level endon ( "clear_course" );
level endon ( "mission failed" );
cargoship_targets = getentarray( "cargoship_target", "script_noteworthy" );
array_thread( cargoship_targets, ::cargoship_targets );
thread rope();
top_of_rope_trigger = getent( "top_of_rope_trigger", "targetname" );
near_rope = getent( "near_rope", "targetname" );
top_of_rope = getent( "top_of_rope", "targetname" );
top_of_ladder_trigger = getent( "top_of_ladder_trigger", "targetname" );
position_one = getent( "position_one", "targetname" );
two = getent( "position_two", "targetname" );
three = getent( "position_three", "targetname" );
four = getent( "position_four", "targetname" );
five = getent( "position_five", "targetname" );
six = getent( "position_six", "targetname" );
sprint = getent ( "sprint", "targetname" );
final_obj = getent( "final_obj", "targetname" );
setdvar( "killhouse_too_slow", "0" );
volume = getent( three.script_noteworthy, "targetname" );
volume2 = getent( six.script_noteworthy, "targetname" );
first_time = true;
previous_time = 0;
previous_selection = "none";
flash_volumes = getentarray ( "flash_volume", "script_noteworthy" );
jump_off_trigger = getent ( "jump_off_trigger", "targetname" );
flag_wait( "at_top_of_ladder" );
clear_hints(); //remove ladder hint
thread autosave_by_name( "ladder_top" );
jump_off_trigger thread jumpoff_monitor();
flag_wait ( "reveal_dialog_done" );
while ( 1 )
{
if ( first_time )
{
if ( ( !( level.player getCurrentWeapon() == "mp5" ) ) || ( level.player GetWeaponAmmoStock( "flash_grenade" ) < 4 ) )
{
level.price thread execDialog( "pickupmp5" );
setObjectiveString( "obj_price", &"KILLHOUSE_EQUIP_THE_MP5_AND_PICK" );
setObjectiveLocation( "obj_price", getent( "obj_flashes", "targetname" ) );
}
}
else
{
jump_off_trigger thread jumpoff_monitor();
level.price execDialog( "replaceflash" );
if ( !(level.player getCurrentWeapon() == "mp5") )
{
level.price execDialog( "equipmp5" );
}
}
nag_time = 0;
while ( !(level.player getCurrentWeapon() == "mp5") )
{
if ( (level.player istouching ( near_rope ) ) && ( nag_time > 4 ) )
{
level.price thread execDialog( "soapequipmp5" );
nag_time = 0;
}
wait ( 1.0 );
nag_time++;
}
nag_time = 0;
while ( level.player GetWeaponAmmoStock( "flash_grenade" ) < 4 )
{
if ( (level.player istouching ( near_rope ) ) && ( nag_time > 4 ) )
{
level.price thread execDialog( "soap4flash" );
nag_time = 0;
}
wait ( 1.0 );
nag_time++;
}
if ( first_time )
flag_set ( "got_flashes" );
thread flashbang_ammo_monitor ( flash_volumes );
if ( first_time )
{
level.price execDialog( "ropedeck" );	//On my go, I want you to rope down to the deck and rush to position 1.
level.price execDialog( "stormstairs" );	//After that you will storm down the stairs to position 2.
level.price execDialog( "hit3and4" );	//Then hit position 3 and 4 following my precise instructions at each position.
}
level.price thread execDialog( "grabrope" );
delaythread ( 1.5, ::rope_obj );
flag_set ( "activate_rope" );
level notify ( "show_glowing_rope" );
thread autosave_by_name( "starting_bridge_attack" );
level waittill ( "starting_rope" );
level notify ( "hide_glowing_rope" );
flag_clear ( "activate_rope" );
level notify ( "okay_if_friendlies_in_line_of_fire" );
level notify ( "starting_cargoship_obj" );
setObjectiveString( "obj_price", &"KILLHOUSE_CLEAR_THE_CARGOSHIP_BRIDGE" );
setObjectiveLocation( "obj_price", position_one );
level.price thread execDialog( "gogogo" );	//Go go go!
if ( getdvarint( "killhouse_too_slow" ) >= 1 )
thread startTimer( 120 );
else
thread startTimer( 60 );
thread accuracy_bonus();
if ( isdefined ( level.IW_deck ) )
level.IW_deck destroy();
position_one wait_till_pos_cleared();
setObjectiveLocation( "obj_price", two );
level.price thread execDialog( "position2" );	//Position 2 go!
two wait_till_pos_cleared();
setObjectiveLocation( "obj_price", three );
three thread flash_dialog_three( volume );
three wait_till_flashed( volume );
clear_hints();
level.price thread execDialog( "position4" );	//Position 4!
setObjectiveLocation( "obj_price", four );
four wait_till_pos_cleared();
setObjectiveLocation( "obj_price", five );
level.price thread execDialog( "5go" );
five wait_till_pos_cleared();
setObjectiveLocation( "obj_price", six );
level.price thread execDialog( "6go" );
six thread flash_dialog_six( volume2 );
six wait_till_flashed( volume2 );
clear_hints();
six wait_till_pos_cleared( "skip_trigger" );
setObjectiveLocation( "obj_price", final_obj );
level.price thread execDialog( "finalgo" );
notify_on_sprint();
thread flag_on_notify( "sprinted" );
flag_wait ( "sprint" );
flag_set ( "ready_to_finish" );
level.price thread execDialog( "sprint" );
thread dialog_sprint_reminders();
if ( level.xenon )// ghetto but PS3 requires "Press X" and 360 requires "Click X"
thread keyHint( "sprint" );
else
thread keyHint( "sprint_pc" );
flag_wait ( "sprinted" );
if( !flag( "at_finish" ) )
thread second_sprint_hint();
flag_wait( "at_finish" );
level notify ( "kill_sprint_hint" );
clear_hints();
flag_clear ( "ready_to_finish" );
flag_clear ( "at_finish" );
flag_clear( "at_top_of_ladder" );
flag_clear ( "sprinted" );
flag_clear ( "sprint" );
level notify ( "test_cleared" );
if ( first_time )
thread debrief();
final_time = killTimer( 15.1, false );
if( !( maps\_cheat::is_cheating() ) && ! ( flag("has_cheated") ) )
level.player UploadTime( 19, final_time );//19 is the leaderboard code for this level
selection = dialog_end_of_course( first_time, final_time, previous_time, previous_selection );
level.price execDialog( selection );
previous_selection = selection;
previous_time = final_time;
first_time = false;
level.price execDialog( "anothergo" );
level.price execDialog( "debrief" );
clear_hints();
setObjectiveState( "obj_price", "done" );
flag_wait( "at_top_of_ladder" );
}
}
dialog_end_of_course( first_time, final_time, previous_time, previous_selection )
{
if ( ! first_time )
{
if ( ( previous_time + 2 ) < final_time )
{
if ( ( randomint ( 2 ) ) > 0 )
{
selection = ( "lesstime" );
return selection;
}
else
{
selection = ( "letyouskip" );
return selection;
}
}
if ( previous_time > ( final_time + 3 ) )
{
if ( ( randomint ( 2 ) ) > 0 )
{
selection = ( "tryitagain" );
return selection;
}
else
{
selection = ( "notgreat" );
return selection;
}
}
if ( ( level.bonus_time < 1.8 ) && ( previous_selection != "sloppy" ) )
{
selection = ( "sloppy" );
return selection;
}
}
num = randomint ( 2 );
if ( num == 0 )
{
selection = ( "youlldo" );
return selection;
}
else
{
selection = "seenbetter";
return selection;
}
}
flag_on_notify( msg )
{
level.player waittill ( msg );
flag_set ( msg );
}
notify_on_sprint()
{
level.player NotifyOnCommand ( "sprinted", "+breath_sprint" );
level.player NotifyOnCommand ( "sprinted", "+sprint" );
}
movies_on_tvs()
{
wait 2;
setsaveddvar( "cg_cinematicFullScreen", "0" );
for ( ;; )
{
if ( getdvar("ps3Game") == "true" )
CinematicInGameLoopFromFastfile( "Killhouse_monitor1" );
else
CinematicInGameLoopResident( "Killhouse_monitor1" );
wait 6;
}
}
debrief_start()
{
start_pre_rope = getent( "start_pre_rope", "targetname" );
level.player setOrigin( start_pre_rope.origin );
level.player setPlayerAngles( start_pre_rope.angles );
level.player giveWeapon("g36c");
level.player giveWeapon("m4_grenadier");
level.player switchtoWeapon("m4_grenadier");
flag_set ( "reveal_dialog_done" );
thread debrief();
}
debrief()
{
thread movies_on_tvs();
debrief_trigger = getent( "debrief_trigger", "targetname" );
registerObjective( "obj_debrief", &"KILLHOUSE_DEBRIEF_WITH_CPT_PRICE", debrief_trigger );
setObjectiveState( "obj_debrief", "current" );
debrief_trigger waittill ( "trigger" );
level notify( "segment2_stop" );
SetMissionDvar( "lastplayedsection", 2 );
thread fail_if_friendlies_in_line_of_fire();
clear_timer_elems();
clear_hints();
level notify ( "kill_timer" );
level notify ( "clear_course" );
flag_clear ( "aa_cargoship" );
setObjectiveState( "obj_debrief", "done" );
level.price execDialog( "wheelsup" );
level.player openMenu("select_difficulty");
level.player freezecontrols(true);
setblur(2, .1);
while( true )
{
level.player waittill("menuresponse", menu, response);
if( response == "continue" || response == "tryagain" )
break;
level.player openMenu("select_difficulty");
}
assertex( response == "continue" || response == "tryagain", "Menu response from Killhouse difficulty selection is incorrect!" );
setblur(0, .2);
level.player freezecontrols(false);
level notify ( "okay_if_friendlies_in_line_of_fire" );
if( response == "tryagain" )
{
setDvar("ui_deadquote", &"KILLHOUSE_SHIP_TRY_AGAIN");
maps\_utility::missionFailedWrapper();
}
wait 1;
nextmission();
}
music_control()
{
flag_wait ( "open_ship_hanger" );
thread music_killhouse_price();
flag_wait ( "activate_rope" );
musicstop( 3 );
}
music_killhouse_price()
{
MusicPlayWrapper( "killhouse_price" );
}