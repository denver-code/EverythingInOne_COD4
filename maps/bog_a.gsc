#include maps\_utility;
#include maps\_vehicle;
#include common_scripts\utility;
#include maps\_anim;
#include maps\bog_a_code;
#include scripts\customcode;
main()
{
setSavedDvar( "r_specularColorScale", "2.42" );
realStart = getent( "real", "targetname" );
level.player setplayerangles( realStart.angles );
level.player setorigin( realStart.origin );
setsaveddvar( "compassMaxRange", 2500 );
precacheItem("rpg_straight");
precacheItem("cobra_FFAR_bog_a_lite");
precacheModel( "tag_laser" );
precacheModel( "weapon_javelin" );
precacheModel( "vehicle_zpu4_burn" );
precacheModel( "com_night_beacon_obj" );
precacheModel( "com_night_beacon" );
precachestring( &"BOG_A_INTRO_1" );
precachestring( &"BOG_A_INTRO_2" );
precachestring( &"BOG_A_SGT_PAUL_JACKSON" );
precachestring( &"BOG_A_1ST_FORCE_RECON_CO_USMC" );
precachestring( &"BOG_A_ELIMINATE_ENEMY_FORCES" );
precachestring( &"BOG_A_GET_THE_JAVELIN" );
precachestring( &"BOG_A_DESTROY_THE_ARMORED_VEHICLES" );
precachestring( &"BOG_A_SECURE_THE_M1A2_ABRAMS" );
precachestring( &"BOG_A_SECURE_THE_M1A1_ABRAMS" );
precachestring( &"BOG_A_INTERCEPT_THE_ENEMY_BEFORE" );
precachestring( &"BOG_A_DESTROY_THE_ZPU_ANTI" );
precachestring( &"BOG_A_SECURE_THE_SOUTHERN_SECTOR" );
precachestring( &"BOG_A_PLANT_THE_IR_BEACON_TO" );
precachestring( &"BOG_A_REGROUP_WITH_THE_SQUAD" );
precachestring( &"BOG_A_THE_TANK_WAS_OVERRUN" );
precachestring( &"SCRIPT_PLATFORM_HINT_PLANTBEACON" );
maps\bog_a_fx::main();
maps\_javelin::init();
add_start( "melee", maps\bog_a_code::start_melee, &"STARTS_MELEE" );
add_start( "breach", maps\bog_a_code::start_breach, &"STARTS_BREACH1" );
add_start( "alley", maps\bog_a_code::start_alley, &"STARTS_ALLEY" );
add_start( "shanty", maps\bog_a_code::start_alley, &"STARTS_SHANTY" );
add_start( "bog", maps\bog_a_code::start_bog, &"STARTS_BOG" );
add_start( "zpu", maps\bog_a_backhalf::start_zpu, &"STARTS_ZPU" );
add_start( "cobras", maps\bog_a_backhalf::start_cobras, &"STARTS_COBRAS" );
add_start( "end", maps\bog_a_backhalf::start_end, &"STARTS_END1" );
default_start( ::ambush );
maps\_flare::main( "tag_flash" );
maps\_seaknight::main( "vehicle_ch46e_low" );
maps\_cobra::main( "vehicle_cobra_helicopter_fly_low" );
maps\_m1a1::main( "vehicle_m1a1_abrams" );
maps\_t72::main( "vehicle_t72_tank" );
maps\_c4::main();
maps\createart\bog_a_art::main();
maps\createfx\bog_a_fx::main();
maps\createfx\bog_a_audio::main();
level.weaponClipModels = [];
level.weaponClipModels[0] = "weapon_ak47_clip";
level.weaponClipModels[1] = "weapon_dragunov_clip";
level.weaponClipModels[2] = "weapon_m16_clip";
level.weaponClipModels[3] = "weapon_saw_clip";
level.weaponClipModels[4] = "weapon_m14_clip";
level.weaponClipModels[5] = "weapon_g3_clip";
maps\_load::main();
maps\_nightvision::main();
maps\_zpu::main( "vehicle_zpu4" );
maps\bog_a_backhalf::bog_backhalf_init();
thread debug_player_damage();
battlechatter_off( "allies" );
add_hint_string( "nvg", &"SCRIPT_NIGHTVISION_USE", maps\_nightvision::ShouldBreakNVGHintPrint );
add_hint_string( "disable_nvg", &"SCRIPT_NIGHTVISION_STOP_USE", maps\_nightvision::should_break_disable_nvg_print );
add_hint_string( "c4_use", &"SCRIPT_C4_USE", maps\bog_a_backhalf::dont_show_C4_hint );
thread disable_nvg();
/#
array_thread( getaiarray(), ::debug_pain );
array_thread( getspawnerarray(), ::add_spawn_function, ::debug_pain );
#/
level.aim_targets = getentarray( "aim_target", "targetname" );
createThreatBiasGroup( "upstairs_unreachable_enemies" );
createThreatBiasGroup( "upstairs_window_enemies" );
createThreatBiasGroup( "pacifist_lower_level_enemies" );
createThreatBiasGroup( "melee_struggle_guy" );
createThreatBiasGroup( "friendlies_flanking_apartment" );
createThreatBiasGroup( "friendlies_under_unreachable_enemies" );
createThreatBiasGroup( "player_seeker" );
createThreatBiasGroup( "player" );
level.player setthreatbiasgroup( "player" );
setThreatBias( "player", "player_seeker", 15000 );
ignoreEachOther( "pacifist_lower_level_enemies", "friendlies_flanking_apartment" );
ignoreEachOther( "pacifist_lower_level_enemies", "allies" );
ignoreEachOther( "upstairs_window_enemies", "friendlies_flanking_apartment" );
ignoreEachOther( "upstairs_window_enemies", "friendlies_under_unreachable_enemies" );
ignoreEachOther( "friendlies_under_unreachable_enemies", "upstairs_window_enemies" );
ignoreEachOther( "upstairs_unreachable_enemies", "friendlies_under_unreachable_enemies" );
ignoreEachOther( "upstairs_unreachable_enemies", "friendlies_flanking_apartment" );
enable_pacifists_to_attack_me = getentarray( "enable_pacifists_to_attack_me", "targetname" );
array_thread( enable_pacifists_to_attack_me, ::enable_pacifists_to_attack_me );
flag_init( "friendlies_take_fire" );
flag_init( "move_up!" );
flag_init( "initial_contact" );
flag_init( "melee_sequence_complete" );
flag_init( "laundry_room_price_talks_to_hq" );
flag_init( "price_reaches_end_of_bridge" );
flag_init( "price_flanks_apartment" );
flag_init( "friendlies_move_up_the_bridge" );
flag_init( "second_floor_ready_for_storming" );
flag_init( "unreachable_enemies_under_attack" );
flag_init( "window_enemies_under_attack" );
flag_init( "lasers_have_moved" );
flag_init( "friendlies_lead_player" );
flag_init( "lasers_shift_fire" );
flag_init( "melee_sequence_begins" );
flag_init( "armada_passes_by" );
flag_init( "price_reaches_moveup_point" );
flag_init( "alley_enemies_spawn" );
flag_init( "javelin_guy_in_position" );
flag_init( "price_in_position_for_jav_seq" );
flag_init( "player_has_javelin" );
flag_init( "javelin_guy_died" );
flag_init( "pickup_javelin" );
flag_init( "overpass_baddies_flee" );
flag_init( "kill_bog_ambient_fighting" );
flag_init( "second_floor_door_breach_initiated" );
flag_init( "friendlies_storm_second_floor" );
flag_init( "price_in_alley_position" );
flag_init( "vas_stops_leading" );
flag_init( "bmp_got_killed" );
flag_init( "all_bmps_dead" );
flag_init( "contact_on_the_overpado!" );
flag_init( "jav_guy_ready_for_briefing" );
flag_init( "overpass_guy_attacks!" );
flag_init( "player_enters_the_fray" );
flag_init( "ambush_player" );
flag_init( "player_interupts_melee_struggle" );
thread do_in_order( ::flag_wait, "player_heads_towards_apartment", ::flag_set, "pacifist_guys_move_up" );
thread do_in_order( ::flag_wait, "alley_enemies_spawn", ::activate_trigger_with_noteworthy, "laundryroom_spawner" );
maps\bog_a_anim::main();
maps\bog_a_backhalf_anim::main();
maps\_compass::setupMiniMap("compass_map_bog_a");
level thread maps\bog_a_amb::main();
level._effect[ "vehicle_explosion" ]		= loadfx( "explosions/large_vehicle_explosion" );
upstairs_unreachable_enemies = getentarray( "upper_floor_enemies", "script_noteworthy" );
array_thread( upstairs_unreachable_enemies, ::upstairs_unreachable_enemies );
upstairs_window_enemies = getentarray( "window_enemies", "script_noteworthy" );
array_thread( upstairs_window_enemies, ::upstairs_window_enemies );
battlechatter_off( "allies" );
friendlies = getaiarray( "allies" );
level.friendly_startup_thread = ::bridge_friendly_spawns;
aim_triggers = getentarray( "aim_trigger", "targetname" );
array_thread( aim_triggers, ::aim_trigger_think );
delete_entities = getentarray( "delete", "targetname" );
array_thread( delete_entities, ::delete_me );
threatbias_lower_triggers = getentarray( "threatbias_lower", "targetname" );
array_thread( threatbias_lower_triggers, ::threatbias_lower_trigger );
threatbias_normal_triggers = getentarray( "threatbias_normal", "targetname" );
array_thread( threatbias_normal_triggers, ::threatbias_normal_trigger );
thread apartment_second_floor();
balcony_spawner = getent( "alley_balcony_guy", "script_noteworthy" );
balcony_spawner thread add_spawn_function( ::alley_balcony_guy );
alley_snipers = getentarray( "alley_longrange_guy", "script_noteworthy" );
array_thread( alley_snipers, ::add_spawn_function, ::alley_sniper_engagementdistance );
alley_close_smgGuys = getentarray( "alley_shortrange_guy", "script_noteworthy" );
array_thread( alley_close_smgGuys, ::add_spawn_function, ::alley_close_smg_engagementdistance );
alley_smgGuys = getentarray( "alley_mediumrange_guy", "script_noteworthy" );
array_thread( alley_smgGuys, ::add_spawn_function, ::alley_smg_engagementdistance );
alley_roof_guy = getentarray( "alley_roof_guy", "script_noteworthy" );
array_thread( alley_roof_guy, ::add_spawn_function, ::alley_roof_guy );
alley_playerseeker = getentarray( "alley_playerseeker", "script_noteworthy" );
array_thread( alley_playerseeker, ::add_spawn_function, ::alley_smg_playerseeker );
breach_guy_1 = getent( "breach_1", "script_noteworthy" );
breach_guy_1 thread add_spawn_function( ::die_after_spawn, 1.5 );
breach_guy_2 = getent( "breach_2", "script_noteworthy" );
breach_guy_2 thread add_spawn_function( ::die_after_spawn, 4.950 );
thread shanty_fence_cut_setup();
thread music();
}
ambush()
{
thread second_floor_door_breach_guys( false );
thread flank_guy();
thread street_laser_light_show();
ambush_enemies();
thread helicopters_fly_by();
thread apartment_rubble_helicopter();
ai = getaiarray();
array_thread( ai, ::set_ignoreme, true );
remove_corner_ai_blocker();
initial_friendlies = getentarray( "initial_friendly", "targetname" );
array_thread( initial_friendlies, ::initial_friendly_setup );
sectionUpdatePBLastLevel();
thread overalltimer();
SetMissionDvar( "lastplayedlevel", 5 );
thread segmenttimer1( 12 );
level.price = getent( "price", "targetname" );
spawn_failed( level.price );
level.price make_hero();
level.price thread run_down_street();
level.price.animName = "price";
level.price thread magic_bullet_shield();
level.price.animplaybackrate = 1;
level.mark = getent( "friendly3", "script_noteworthy" );
level.mark thread magic_bullet_shield();
level.mark make_hero();
thread friendlies_advance_up_the_bridge();
level.price thread anim_single_queue( level.price, "tank_is_stuck" );
friendly1 = getent( "friendly1", "script_noteworthy" );
friendly2 = getent( "friendly2", "script_noteworthy" );
friendly1.animName = "generic";
friendly2.animName = "generic";
friendly1 delayThread( 0, ::anim_single_solo, friendly1, "spin" );
friendly2 delayThread( 1.5, ::anim_single_solo, friendly2, "spin" );
delaythread( 5.5, ::price_blends_into_run );
flag_wait( "safe_for_objectives" );
objective_add( 1, "active", &"BOG_A_SECURE_THE_M1A2_ABRAMS", ( 4800, 1488, 32 ) );
objective_current( 1 );
}
price_blends_into_run()
{
level.price stopanimscripted();
level.price notify( "single anim", "end" );
}
ambush_enemies()
{
rooftop_spawners = getentarray( "rooftop_guy", "targetname" );
pacifist_rubble_guys = getentarray( "pacifist_rubble_guys", "targetname" );
array_thread( pacifist_rubble_guys, ::ignore_suppression_until_ambush );
array_thread( pacifist_rubble_guys, ::increase_goal_radius_when_friendlies_flank );
ambusher_spawners = getentarray( "ambusher_spawner", "targetname" );
array_thread( ambusher_spawners, maps\_spawner::flood_spawner_think );
window_mg_spawner = getent( "window_mg_spawner", "script_noteworthy" );
window_mg_spawner add_spawn_function( ::set_threatbias_group, "upstairs_window_enemies" );
waittillframeend;
}
friendlies_advance_up_the_bridge()
{
lose_goal_volume_trigger = getent( "lose_goal_volume_trigger", "targetname" );
lose_goal_volume_trigger thread lose_goal_volume();
clear_promotion_order();
set_promotion_order( "c", "y" );
set_promotion_order( "b", "y" );
level.respawn_spawner = getent( "respawn_spawner", "targetname" );
thread ambush_trigger();
friendly1 = getent( "friendly1", "script_noteworthy" );
friendly2 = getent( "friendly2", "script_noteworthy" );
friendly3 = getent( "friendly3", "script_noteworthy" );
friendly4 = getent( "friendly4", "script_noteworthy" );
friendly5 = getent( "friendly5", "script_noteworthy" );
friendly6 = getent( "friendly6", "script_noteworthy" );
friendly7 = getent( "friendly7", "script_noteworthy" );
friendly3 allowedstances( "crouch" );
friendly4 allowedstances( "crouch" );
friendly7 allowedstances( "crouch" );
friendly1 delayThread( 0, ::run_down_street );
wait( 3.5 );
thread additional_guys_chime_in();
friendlies = getentarray( "initial_friendly", "targetname" );
friendly2 delayThread( 0.0, ::run_down_street );
friendly3 delayThread( 0.4, ::run_down_street );
friendly4 delayThread( 0.0, ::run_down_street );
friendly5 delayThread( 0.0, ::run_down_street );
friendly6 delayThread( 0.0, ::run_down_street );
friendly7 delayThread( 0.1, ::run_down_street );
flag_wait( "friendlies_take_fire" );
ai = getaiarray();
array_thread( ai, ::set_ignoreme, false );
delayThread( 2, ::incoming_rpg );
set_team_pacifist( "axis", false );
wait( 2.5 );
thread maps\_flare::flare_from_targetname( "flare" );
exploder(1);
org = getent( "underground_obj_org", "targetname" );
run_thread_on_targetname( "update_underground_obj_trigger", ::update_apartment_objective_position );
objective_add( 2, "active", &"BOG_A_ELIMINATE_ENEMY_FORCES", org.origin );
objective_current( 2 );
if ( !flag( "friendlies_already_moved_up_bridge" ) )
{
activate_trigger_with_targetname( "friendlies_move_up_bridge" );
}
wait( 1.5 );
flag_set( "friendlies_move_up_the_bridge" );
thread price_moves_behind_concrete_barrier();
thread friendly_bridge_flank_grabber();
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
allies = array_add( allies, level.mark );
array_thread( allies, ::set_force_color, "y" );
yellow = get_force_color_guys( "allies", "y" );
for ( i = yellow.size; i < 8; i++ )
{
thread spawn_reinforcement( "m4grunt" );
}
thread price_tells_squad_to_flank_right();
flag_wait( "player_heads_towards_apartment" );
level.price thread anim_single_queue( level.price, "switch_to_night_vision" );
thread window_enemies_respond_to_attack();
thread upstairs_enemies_respond_to_attack();
level.flank_guy allowedstances( "stand" );
level.flank_guy thread maps\_spawner::go_to_node(); // makes a guy go through his node chain
cyan_guys = get_force_color_guys( "allies", "c" );
cyan_guys = remove_heroes_from_array( cyan_guys );
for ( i = cyan_guys.size; i < 2; i++ )
{
thread promote_nearest_friendly_with_classname( "y", "c", "m4grunt" );
}
activate_trigger_with_targetname( "friendlies_leave_bridge" );
player_flanks_right_or_goes_straight();
level.flank_guy stop_magic_bullet_shield();
level.flank_guy thread replace_on_death();
level.flank_guy unmake_hero();
level.flank_guy flanks_apartment();
flag_wait( "grenade_launcher_hint" ); // this is a more appropriate timing
thread melee_sequence();
thread player_enters_second_floor();
activate_trigger_with_targetname( "player_enters_apartment_rubble_area" );
cyan_guys = get_force_color_guys( "allies", "c" );
flag_set( "friendlies_lead_player" );
array_thread( cyan_guys, ::cyan_guys_lead_player_to_apartment );
level.friendly_promotion_thread = ::promoted_cyan_guy_leads_player_to_apartment;
flag_wait( "player_enters_apartment_rubble_area" );
thread price_directs_players_upstairs();
}
player_gets_ambushed()
{
level endon( "friendlies_take_fire" );
flag_wait( "ambush_player" );
mgs = getentarray( "apartment_manual_mg", "targetname" );
gun1 = mgs[ 0 ];
gun2 = mgs[ 1 ];
level.canSave = false;
level.player endon( "death" );
gun1 settargetentity( level.player );
gun2 settargetentity( level.player );
gun1 thread manual_mg_fire();
wait( 0.15 );
gun2 thread manual_mg_fire();
wait( 1.0 );
level.player enableHealthShield( false );
level.player dodamage( level.player.health + 500, (0,0,0) );
}
ambush_trigger()
{
thread player_gets_ambushed();
mgs = getentarray( "apartment_manual_mg", "targetname" );
array_thread( mgs, ::scr_setmode, "manual" );
gun1 = mgs[ 0 ];
gun2 = mgs[ 1 ];
trigger = getent( "ambush_trigger", "targetname" );
guys = [];
captured = [];
for ( ;; )
{
trigger waittill( "trigger", other );
other thread ignore_triggers();
if ( other is_hero() )
continue;
if ( isdefined( captured[ other.ai_number ] ) )
continue;
captured[ other.ai_number ] = true;
guys[ guys.size ] = other;
if ( guys.size >= 3 )
break;
}
if ( !flag( "player_enters_the_fray" ) )
{
array_thread( guys, ::stop_magic_bullet_shield );
}
ai = getaiarray( "allies" );
for ( i = 0; i < ai.size; i++ )
{
if ( !isdefined( captured[ ai[ i ].ai_number ] ) )
{
ai[ i ] thread do_in_order( ::waitSpread, 0.25, ::send_notify, "stop_running_to_node" );
}
}
battlechatter_on( "allies" );
flag_set( "friendlies_take_fire" );
gun1 settargetEntity( guys[ 0 ] );
gun2 settargetentity( guys[ 1 ] );
gun1 thread manual_mg_fire();
wait( 0.15 );
gun2 thread manual_mg_fire();
guys[ 0 ] thread die_soon( 0.2 );
wait_for_death( guys[ 0 ] );
gun1 settargetentity( guys[ 2 ] );
guys[ 1 ] thread die_soon( 0.2 );
wait_for_death( guys[ 1 ] );
wait( 0.5 );
gun2 thread shoot_mg_targets();
guys[ 2 ] thread die_soon( 0.2 );
wait_for_death( guys[ 2 ] );
wait( 0.5 );
gun1 thread shoot_mg_targets();
}
player_enters_second_floor()
{
for ( ;; )
{
flag_clear( "player_nears_second_floor" );
flag_wait( "player_nears_second_floor" );
setignoremegroup( "player", "axis" );
flag_clear( "player_disrupts_second_floor" );
flag_clear( "player_leaves_second_floor" );
wait_for_player_to_disrupt_second_floor_or_leave();
clear_player_threatbias_vs_apartment_enemies();
setthreatbias( "player", "axis", 0 );
if ( flag( "player_disrupts_second_floor" ) )
break;
}
flag_set( "second_floor_ready_for_storming" );
flag_wait( "window_enemies_under_attack" );
waittillframeend; // overwrite the over-threat set incase the player attacks from downstairs
setThreatBias( "player", "upstairs_window_enemies", 0 );
}
handle_player_flanking()
{
level endon( "player_enters_apartment_rubble_area" );
flag_wait( "player_nears_first_building" );
if ( !flag( "friendlies_moves_through_first_building" ) )
{
level.flank_guy set_force_color( "g" );
flag_wait( "friendlies_moves_through_first_building" );
}
}
player_flanks_right_or_goes_straight()
{
handle_player_flanking();
ai_apartment_flank_blocker = getent( "ai_apartment_flank_blocker", "targetname" );
ai_apartment_flank_blocker connectPaths();
ai_apartment_flank_blocker delete();
activate_trigger_with_targetname( "friendlies_moves_through_first_building" );
}
price_tells_squad_to_flank_right()
{
assertEx( !flag( "player_heads_towards_apartment" ), "This flag shouldnt be set yet" );
flag_wait( "player_reaches_end_of_bridge" );
flag_wait( "price_reaches_end_of_bridge" );
last_reminder = "";
reminder = "";
reminders = [];
reminders[ reminders.size ] = "follow_me";
reminders[ reminders.size ] = "move_it";
reminders[ reminders.size ] = "this_way";
while ( !flag( "player_heads_towards_apartment" ) )
{
remind_player = true;
if ( flag( "price_flanks_apartment" ) )
{
remind_player = distance( level.player.origin, level.price.origin ) > 200;
}
if ( remind_player )
{
while ( reminder == last_reminder )
{
reminder = random( reminders );
}
last_reminder = reminder;
level.price anim_single_queue( level.price, reminder );
}
wait( randomfloatrange( 5, 8 ) );
}
}
price_moves_behind_concrete_barrier()
{
while ( !isdefined( level.price.reached_bridge_flee_spot ) )
{
wait( 1 );
}
price_moves_up_and_waves_player_on();
flag_wait( "player_heads_towards_apartment" );
node = getnode( "price_flank_node", "targetname" );
node notify( "stop_idle" );
flag_set( "price_flanks_apartment" );
level.price flanks_apartment();
}
price_moves_up_and_waves_player_on()
{
level endon( "player_heads_towards_apartment" );
node = getnode( "price_road_node", "targetname" );
level.price setgoalnode( node );
level.price.goalradius = 64;
level.price waittill( "goal" );
flag_set( "price_reaches_moveup_point" );
wait( 1 );
node = getnode( "price_flank_node", "targetname" );
node anim_reach_solo( level.price, "wait_approach" );
node anim_single_solo( level.price, "wait_approach" );
thread price_waits_at_node_and_waves( node, "price_flanks_apartment" );
flag_set( "price_reaches_end_of_bridge" );
wait_until_player_gets_close_or_progresses();
}
wait_until_player_gets_close_or_progresses()
{
if ( flag( "player_heads_towards_apartment" ) )
return;
level endon( "player_heads_towards_apartment" );
while ( distance( level.player.origin, level.price.origin ) > 115 )
{
wait( 1 );
}
}
flanks_apartment()
{
self set_force_color( "c" );
self.ignoreSuppression = true;
self.ignoreme = false;
self.pacifist = false;
if ( self getthreatbiasgroup() == "friendlies_flanking_apartment" )
return;
if ( self getthreatbiasgroup() == "allies" )
{
self setThreatBiasGroup( "friendlies_flanking_apartment" );
}
else
{
assert( self getthreatbiasgroup() == "friendlies_under_unreachable_enemies" );
}
}
friendly_bridge_flank_grabber()
{
level endon( "player_heads_towards_apartment" );
assertEx( !flag( "player_heads_towards_apartment" ), "Flag should not be set yet" );
thread friendly_flank_deleter();
trigger = getent( "friendly_bridge_trigger", "targetname" );
runner = 2;
wait( 5 );
for ( ;; )
{
total_cyan_guys = get_force_color_guys( "allies", "c" ).size;
assert( total_cyan_guys < 3 );
if ( total_cyan_guys >= 2 )
{
wait( 1 );
continue;
}
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
for ( i = 0; i < allies.size; i++ )
{
guy = allies[ i ];
if ( !( guy istouching( trigger ) ) )
continue;
guy flanks_apartment();
break;
}
wait( 10 );
}
}
friendly_flank_deleter()
{
level endon( "player_heads_towards_apartment" );
trigger = getent( "allies_apartment_delete", "targetname" );
for ( ;; )
{
trigger waittill( "trigger", other );
if ( !isalive( other ) )
continue;
if ( other == level.price )
{
other thread ignore_triggers();
continue;
}
other set_force_color( "y" );
if ( isdefined( other.magic_bullet_shield ) )
other stop_magic_bullet_shield();
other delete();
}
}
additional_guys_chime_in()
{
ent = spawnstruct();
ent.guys = getentarray( "initial_friendly", "targetname" );
ent.index = 0;
wait( 3.5 );
ent set_talker();
ent.talker thread anim_single_solo( ent.talker, "move_it" );
wait( 2.2 );
ent set_talker();
ent.talker thread anim_single_solo( ent.talker, "keep_moving_up" );
flag_wait( "friendlies_take_fire" );
wait( 1.35 );
ent set_talker();
ent.talker thread anim_single_solo( ent.talker, "ambush1" );
wait( 1.3 );
ent set_talker();
ent.talker thread anim_single_solo( ent.talker, "contact_right" );
wait( 0.5 );
ent set_talker();
ent.talker thread anim_single_solo( ent.talker, "ambush2" );
wait( 1.5 );
level.price anim_single_queue( level.price, "suppress_building" );
flag_wait( "price_reaches_moveup_point" );
level.price anim_single_queue( level.price, "keep_moving" );
flag_wait( "price_reaches_end_of_bridge" );
level.price anim_single_queue( level.price, "take_the_stairs" );
}
apartment_second_floor()
{
thread second_floor_laser_light_show();
wait_until_player_goes_into_second_floor_or_melee_sequence_completes();
level notify( "stop_melee_sequence" );
flag_wait( "melee_sequence_complete" );
thread upstairs_enemies_respond_to_attack();
/#
if ( !is_default_start() )
return;
#/
flag_set( "friendlies_storm_second_floor" );
level.price set_force_color( "p" );
level.price.ignoresuppression = true;
instantly_promote_nearest_friendly( "b", "p" );
purple_guys = get_force_color_guys( "allies", "p" );
array_thread( purple_guys, ::set_ignoreSuppression, true );
assertEx( purple_guys.size == 3, "Not enough purple guys" );
flag_wait( "magic_lasers_turn_on" );
level.mark stop_magic_bullet_shield();
level.mark delete();
teleport_purple_guys_closer();
purple_guys = get_force_color_guys( "allies", "p" );
array_thread( purple_guys, ::set_threatbias_group, "friendlies_under_unreachable_enemies" );
array_thread( purple_guys, ::set_ignoreme, true );
flag_wait( "second_floor_ready_for_storming" );
array_thread( purple_guys, ::set_ignoreme, false );
clearThreatBias( "friendlies_under_unreachable_enemies", "upstairs_window_enemies" );
flag_wait( "lasers_have_moved" );
wait( 3 );
activate_trigger_with_targetname( "friendlies_storm_second_floor" );
flag_set( "player_can_trigger_rubble_attack" );
pacifist_trigger = getent( "second_floor_pacifist_trigger", "script_noteworthy" );
pacifist_trigger trigger_off();
flag_wait( "rubble_room_cleared" );
flag_set( "second_floor_door_breach_initiated" );
wait( 1 );
clearGuy = get_closest_colored_friendly( "p", ( 10327.1, -386.339, 236 ) );
clearGuy.animname = "third_floor_left_guy";
clearGuy anim_single_solo( clearGuy, "clear" );
flag_clear( "player_can_trigger_rubble_attack" );
activate_trigger_with_targetname( "mg_flank_trigger" );
setThreatBias( "upstairs_unreachable_enemies", "friendlies_under_unreachable_enemies", 0 );
fight_across_the_gap_until_the_enemies_die();
maps\_spawner::kill_spawnerNum( 5 );
enemies = [];
window_enemies = getentarray( "window_enemies", "script_noteworthy" );
enemies = array_combine( enemies, window_enemies );
pacifist_enemies = getentarray( "pacifist_rubble_guys", "targetname" );
enemies = array_combine( enemies, pacifist_enemies );
array_thread( enemies, ::die_shortly );
wait( 1 );
door_trace_org = getent( "door_trace_org", "targetname" );
waittill_player_not_looking( door_trace_org.origin );
thread open_laundrymat();
thread segmenttimer2( 13 );
thread price_talks_to_hq();
allies = get_all_force_color_friendlies();
array_thread( allies, ::scrub );
array_thread( allies, ::set_ignoreSuppression, true ); // cant move worth a damn without it!
restart_price();
level.price set_force_color( "c" );
allies = remove_heroes_from_array( allies );
allies = instantly_set_color_from_array_with_classname( allies, "o", "shotgun" );
allies = instantly_set_color_from_array_with_classname( allies, "o", "m4grunt" );
allies = instantly_set_color_from_array( allies, "y" );
allies = instantly_set_color_from_array( allies, "y" );
allies = instantly_set_color_from_array( allies, "y" );
remaining_guys = allies.size;
if ( remaining_guys > 2 )
{
remaining_guys = 2;
}
for ( i=0; i < remaining_guys; i++ )
{
allies = instantly_set_color_from_array( allies, "r" );
}
array_thread( allies, ::set_force_color, "g" );
array_thread( allies, ::set_ignoreall, 1 );
yellow_guys = get_force_color_guys( "allies", "y" );
orange_guys = get_force_color_guys( "allies", "o" );
red_guys = get_force_color_guys( "allies", "r" );
array_thread( red_guys, ::replace_on_death );
array_thread( yellow_guys, ::replace_on_death );
array_thread( orange_guys, ::replace_on_death );
}
price_talks_to_hq()
{
battlechatter_off( "allies" );
radio_dialogue( "get_there_asap" );
wait( 0.5 );
level.price anim_single_queue( level.price, "working_on_it" );
flag_set( "laundry_room_price_talks_to_hq" );
battlechatter_on( "allies" );
}
player_mg_reminder()
{
level endon( "unreachable_apartment_cleared" );
level.price anim_single_queue( level.price, "use_their_gun" );
wait( 4 );
if ( flag( "unreachable_enemies_under_attack" ) )
return;
level endon( "unreachable_enemies_under_attack" );
for ( ;; )
{
for ( i=0; i < 4; i++ )
{
if ( player_is_on_mg() )
return;
wait( 1 );
}
level.price anim_single_queue( level.price, "use_their_gun" );
}
}
player_mg_laser_hint()
{
if ( flag( "unreachable_apartment_cleared" ) )
return;
laser_hint_ent = getent( "laser_hint_ent", "targetname" );
targ = getent( laser_hint_ent.target, "targetname" );
laser = laser_hint_ent get_laser();
laser.origin = laser_hint_ent.origin;
laser.angles = vectortoangles( targ.origin - laser_hint_ent.origin );
laser laser_hint_on_mg();
laser notify( "stop_line" );
laser delete();
}
laser_hint_on_mg()
{
level endon( "unreachable_apartment_cleared" );
for ( ;; )
{
if ( player_is_on_mg() )
{
self thread modulate_laser();
}
while ( player_is_on_mg() )
{
wait( 0.05 );
}
self notify( "stop_line" );
self laserOff();
while ( !player_is_on_mg() )
{
wait( 0.05 );
}
}
}
fight_across_the_gap_until_the_enemies_die()
{
if ( flag( "unreachable_apartment_cleared" ) )
return;
level endon( "unreachable_apartment_cleared" );
wait_until_price_nears_balcony();
level.price anim_single_queue( level.price, "hit_their_flank" );
wait( 1 );
wait_until_player_nears_balcony();
if ( !player_is_on_mg() )
{
thread player_mg_reminder();
}
upper_floor_enemies = getentarray( "upper_floor_enemies", "script_noteworthy" );
array_thread( upper_floor_enemies, ::waitSpread_death, 12 );
for ( i=0; i < 4; i++ )
{
if ( player_is_on_mg() )
{
break;
}
wait( 1 );
}
upper_floor_hiding_blocker = getent( "upper_floor_hiding_blocker", "targetname" );
upper_floor_hiding_blocker connectPaths();
upper_floor_hiding_blocker delete();
hiding_guy = spawn_guy_from_targetname( "upper_floor_hiding_spawner" );
hiding_guy set_force_cover( "hide" );
hiding_guy thread price_congrates();
wait( 2.5 );
if ( isalive( hiding_guy ) )
{
if ( player_is_on_mg() )
{
level.price thread anim_single_queue( level.price, "shoot_through_wall" );
}
hiding_guy delayThread( 10, ::killme );
}
flag_wait( "unreachable_apartment_cleared" );
}
javelin_guy_spawns()
{
flag_wait( "contact_on_the_overpado!" );
wait_until_price_reaches_his_trigger();
wait_for_friendlies_to_reach_alley_goal();
spawner = getent( "javelin_spawner", "targetname" );
guy = spawner try_forever_spawn();
guy thread javelin_guy_runs_in();
}
javelin_guy_runs_in()
{
/#
if ( level.start_point == "shanty" )
{
self endon( "death" );
}
#/
self.animname = "javelin_guy";
self.deathanim = getanim( "death" );
self set_run_anim( "run" );
self thread magic_bullet_shield();
self animscripts\shared::placeWeaponOn( self.weapon, "back" );
level.javelin_guy = self;
self make_hero();
model = spawn( "script_model", (0,0,0) );
model setmodel( "weapon_javelin" );
model linkto( self, "tag_weapon_right", (0,0,0), (0,0,0) );
level.javmodel = model;
goal = getent( self.target, "targetname" );
goal anim_reach_solo( self, "hangout_arrival" );
goal anim_single_solo( self, "hangout_arrival" );
goal thread anim_loop_solo( self, "hangout_idle", undefined, "stop_looping" );
flag_set( "jav_guy_ready_for_briefing" );
goal notify( "stop_looping" );
self stopAnimscripted();
node = getnode( "jav_drop", "targetname" );
goal.origin = node.origin;
self.IgnoreRandomBulletDamage = true;
self disable_pain();
goal anim_reach_solo( self, "hangout_arrival" );
goal anim_single_solo( self, "hangout_arrival" );
goal thread anim_loop_solo( self, "hangout_idle", undefined, "stop_looping" );
flag_set( "javelin_guy_in_position" );
level.javelin_guy.ignoreme = false;
level.javelin_guy.threatbias = 2342343;
level.javelin_guy.health = 1;
level.javelin_guy.allowDeath = true;
level.javelin_guy stop_magic_bullet_shield();
level.javelin_guy add_wait( ::_wait, 16 );
level.javelin_guy add_wait( ::waittill_msg, "death" );
do_wait_any();
flag_set( "javelin_guy_died" );
thread play_sound_in_space( "bog_a_gm1_westisdown", ( 9153.57, 64.5412, 80 ), true );
if ( isalive( self ) )
{
self dodamage( self.health + 150, (0,0,0) );
}
disable_auto_adjust_threatbias();
level.player.threatbias = -450;
wait( 2 );
jav = spawn( "weapon_javelin", (0,0,0), 1 ); // 1 = suspended
jav.origin = model.origin + (0,0,3);
jav.angles = model.angles;
jav thread add_jav_glow( "overpass_baddies_flee" );
org = jav.origin;
level.javweap = jav;
wait( 0.25 );
model delete();
autosave_by_name( "javelin_sequence" );
flag_wait( "pickup_javelin" );
if ( player_has_javelin() )
{
flag_set( "player_has_javelin" );
return;
}
thread price_reminds_player_about_javelin();
objective_add( 4, "active", &"BOG_A_GET_THE_JAVELIN", org );
objective_current( 4 );
while( !player_has_javelin() )
{
wait( 0.05 );
}
objective_delete( 4 );
flag_set( "player_has_javelin" );
thread price_reminds_player_about_shooting_javelin();
}
price_reminds_player_about_javelin()
{
assertEx( !player_has_javelin(), "Player got javelin too soon" );
level endon( "player_has_javelin" );
hints = [];
hints[ hints.size ] = "pickup_hint_1";
hints[ hints.size ] = "pickup_hint_2";
hints[ hints.size ] = "pickup_hint_3";
hint = 0;
for ( ;; )
{
wait( randomfloatrange( 8, 12 ) );
Objective_Ring( 4 );
level.price anim_single_queue( level.price, hints[ hint ] );
hint++;
if ( hint >= hints.size )
hint = 0;
}
}
price_reminds_player_about_shooting_javelin()
{
flag_assert( "overpass_baddies_flee" );
level endon( "overpass_baddies_flee" );
level endon( "bmp_got_killed" );
hints = [];
hints[ hints.size ] = "second_floor_hint_1";
hints[ hints.size ] = "second_floor_hint_2";
hint = 0;
for ( ;; )
{
wait( randomfloatrange( 8, 12 ) );
Objective_Ring( 4 );
level.price anim_single_queue( level.price, hints[ hint ] );
hint++;
if ( hint >= hints.size )
hint = 0;
}
}
open_laundrymat()
{
flag_clear( "aa_apartment" );
delaythread( 2, ::autosave_by_name, "javelin_sequence" );
thread laundryroom_saw_gunner();
thread javelin_guy_spawns();
flag_set( "alley_enemies_spawn" );
activate_trigger_with_targetname( "alley_friendly_trigger" );
clear_promotion_order();
set_empty_promotion_order( "y" );
set_empty_promotion_order( "o" );
set_empty_promotion_order( "g" );
set_promotion_order( "r", "o" );
apartment_door = getent( "apartment_door", "targetname" );
apartment_door playsound( "door_wood_slow_open" );
apartment_door connectpaths();
apartment_door rotateyaw( -100, 1, .5, 0 );
wait( 1 );
objective_state( 2, "done");
arcademode_checkpoint( 8, "a" );
objective_current( 1 );
flag_set( "laundrymat_open" );
waittillframeend;
allies = getaiarray( "allies" );
array_thread( allies, ::disable_cqbwalk );
thread player_enters_laundrymat();
}
kick_ac_unit( guy )
{
ac_unit = getent( "window_ac_unit", "targetname" );
ac_unit stopLoopSound( "bog_ac_loop" );
ac_unit playSound( "bog_ac_kick" );
wait( 1 );
ac_unit playSound( "bog_ac_crash" );
}
seetag()
{
for ( ;; )
{
maps\_debug::drawTag( "tag_origin" );
wait( 0.05 );
}
}
laundryroom_saw_gunner()
{
saw_gunner = spawn_guy_from_targetname( "saw_gunner" );
level.mark = saw_gunner;
saw_gunner thread magic_bullet_shield();
saw_gunner make_hero();
saw_gunner.goalradius = 4;
saw_gunner.interval = 0;
trigger = getent( "friendly_enters_laundrymat", "targetname" );
node = getnode( trigger.target, "targetname" );
ac_unit = getent( "window_ac_unit", "targetname" );
ac_unit playLoopSound( "bog_ac_loop" );
ac_unit.animname = "ac";
ac_unit assign_animtree();
node anim_start_pos_solo( ac_unit, "setup" );
flag_wait( "player_nears_laundrymat" );
thread helicopter_flies_by_overhead( "alley_heli", 0, 		135, 95 );
thread helicopter_flies_by_overhead( "alley_heli", 1, 		135, 95 );
thread helicopter_flies_by_overhead( "alley_heli", 30, 	135, 95 );
thread helicopter_flies_by_overhead( "alley_heli", 31, 	135, 95 );
thread helicopter_flies_by_overhead( "alley_heli", 70, 	135, 95 );
thread helicopter_flies_by_overhead( "alley_heli", 71, 	135, 95 );
saw_gunner.animname = "saw";
team = [];
team[ team.size ] = ac_unit;
team[ team.size ] = saw_gunner;
mark_ac_block = getent( "mark_ac_block", "targetname" );
mark_ac_block connectpaths();
mark_ac_block delete();
node anim_reach_solo( saw_gunner, "setup" );
saw_gunner.goalradius = 4;
delaythread( 0, ::autosave_by_name, "saw_gunner" );
node anim_single( team, "setup" );
saw_gunner.interval = 96;
saw_gunner setgoalpos( saw_gunner.origin );
saw_gunner.goalradius = 32;
saw_gunner thread saw_gunner_chatter();
node thread anim_loop_solo( saw_gunner, "fire_loop", undefined, "stop_loop" );
wait( 5 );
node notify( "stop_loop" );
saw_gunner.fixednode = false; // so he uses cover node
flag_wait( "friendlies_charge_alley" );
saw_gunner.fixednode = true;
}
saw_gunner_chatter()
{
battlechatter_off( "allies" );
flag_wait( "laundry_room_price_talks_to_hq" );
self anim_single_solo( self, "ton_of_them" );
level.price anim_single_queue( level.price, "shut_up" );
wait( 0.5 );
self anim_single_solo( self, "suppressing_fire" );
battlechatter_on( "allies" );
}
player_enters_laundrymat()
{
activate_trigger_with_targetname( "alley_friendly_trigger" );
flag_wait( "player_enters_alley" );
green_guys = get_force_color_guys( "allies", "g" );
array_thread( green_guys, ::die_asap );
total_red_guys = get_force_color_guys( "allies", "r" ).size;
for ( i = total_red_guys; i < 2; i++ )
{
promote_nearest_friendly( "o", "r" );
spawn_reinforcement( undefined, "o" );
}
thread friendlies_charge_alley_early();
flag_wait_or_timeout( "friendlies_charge_alley", 45 );
flag_set( "friendlies_charge_alley" );
activate_trigger_with_targetname( "friendly_alley_charge_trigger" );
alley_blocker = getent( "friendly_alley_blocker", "targetname" );
alley_blocker delete();
maps\_spawner::kill_spawnerNum( 10 );
maps\_spawner::kill_spawnerNum( 9 );
alley_roof_guys = getentarray( "alley_roof_guy", "script_noteworthy" );
for ( i=0; i < alley_roof_guys.size; i++ )
{
alley_roof_guy = alley_roof_guys[ i ];
if ( isalive( alley_roof_guy ) )
{
alley_roof_guy dodamage( alley_roof_guy.health + 100, (0,0,0) );
wait( randomfloatrange( 0.5, 1.5 ) );
}
}
axis = getaiarray( "axis" );
node = getnode( "enemy_alley_node", "targetname" );
array_thread( axis, ::move_in_on_goal, node );
flag_set( "price_in_alley_position" );
thread wait_for_fence_guys_to_be_drafted();
wait_until_deathflag_enemies_remaining( "alley_cleared", 6 );
battlechatter_off( "allies" );
/#
if ( level.start_point == "shanty" )
{
wait_for_fence_guys_to_be_drafted();
shanty_opens();
return;
}
#/
wait_for_fence_guys_to_be_drafted();
defend_the_roof_with_javelin();
}
price_responds_to_overpass()
{
self waittill( "javelin_briefing" );
level.price setgoalpos( level.price.origin );
level.price.goalradius = 32;
level.price allowedstances( "crouch" );
level.price allowedstances( "stand", "crouch", "prone" );
wait( 3 );
level.price.goalradius = 512;
}
right_away_line()
{
timer = debugvar( "timer1", 4.8 );
wait( timer );
level.javelin_guy thread anim_single_solo( level.javelin_guy, "right_away" );
}
bridge_wave_spawner_think()
{
self endon( "death" );
self.ignoreme = true;
self.dontshootwhilemoving = true;
self.disablearrivals = true;
while ( self.a.lastshoottime == 0 )
{
wait( 0.05 );
}
wait( 1.2 );
flag_set( "overpass_guy_attacks!" );
self.ignoreme = false;
flag_wait( "javelin_guy_in_position" );
self.baseAccuracy = 1000;
self.accuracy = 1000;
wait( randomfloat( 0.5 ) );
self shoot();
flag_wait( "javelin_guy_died" );
self.baseAccuracy = 1;
self.accuracy = 1;
}
friendly_overpass_dialogue_response()
{
flag_wait( "overpass_guy_attacks!" );
flag_clear( "aa_alley" );
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
friendly = getclosest( level.player.origin, allies );
friendly.animname = "guy_one";
flag_set( "contact_on_the_overpado!" );
autosave_by_name( "contact_on_the_overpass" );
friendly anim_single_solo( friendly, "contact_overpass" );
}
defend_the_roof_with_javelin()
{
flag_init( "bmps_are_dead" );
bridge_wave_spawners = getentarray( "bridge_wave_spawner", "script_noteworthy" );
array_thread( bridge_wave_spawners, ::add_spawn_function, ::bridge_wave_spawner_think );
initial_contact_spawners = getentarray( "initial_contact_spawner", "script_noteworthy" );
array_thread( initial_contact_spawners, maps\_spawner::flood_spawner_think );
thread overpass_baddies_attack();
timer = gettime();
level.brieftime = gettime();
set_all_ai_ignoreme( false );
level.player.ignoreme = false;
thread friendly_overpass_dialogue_response();
wait( 15 );
flag_wait( "jav_guy_ready_for_briefing" );
level.price thread anim_single_solo( level.price, "javelin_briefing" );
thread right_away_line();
flag_wait( "javelin_guy_died" );
arcademode_checkpoint( 3.0, "b" );
autosave_by_name( "javelin_defense_begins" );
wait( 1.5 );
activate_trigger_with_targetname( "allies_prep_for_fence" );
level.price anim_single_queue( level.price, "get_jav" );
flag_set( "pickup_javelin" );
allies = getaiarray( "allies" );
array_thread( allies, ::take_cover_against_overpass );
allies = remove_all_animnamed_guys_from_array( allies );
allies = remove_heroes_from_array( allies );
roof_guy = getClosest( level.player.origin, allies );
level.javelin_helper = roof_guy;
roof_guy thread magic_bullet_shield();
roof_guy make_hero();
roof_guy.animname = "generic";
roof_node = getnode( "friendly_javelin_node", "targetname" );
roof_guy setgoalnode( roof_node );
roof_guy.goalradius = 64;
battlechatter_on( "allies" );
delaythread( 3, ::set_flag_when_bmps_are_dead );
/#
heroes = get_heroes();
assertex( heroes.size == 5, "Should be 5 heroes" );
#/
maps\_colors::kill_color_replacements();
flag_wait( "player_has_javelin" );
apartment_door = getent( "apartment_door", "targetname" );
apartment_door rotateyaw( 100, 1, .5, 0 );
thread update_obj_on_dropped_jav( roof_node.origin );
level.price delaythread( 1, ::anim_single_queue, level.price, "second_floor_hint_2" );
objective_add( 4, "active", &"BOG_A_DESTROY_THE_ARMORED_VEHICLES", roof_node.origin );
objective_current( 4 );
flag_wait( "overpass_baddies_flee" );
axis = getaiarray( "axis" );
array_thread( axis, ::flee_overpass );
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
index = 0;
for ( i = 0; i < 40; i++ )
{
if ( getaiarray( "allies" ).size <= 5 )
break;
guy = allies[ index ];
guy disable_replace_on_death();
guy dodamage( guy.health + 150, (0,0,0) );
index++;
}
/#
assertex( getaiarray( "allies" ).size <= 5, "Too many allies existed for shanty run" );
#/
flag_wait( "bmps_are_dead" );
enable_auto_adjust_threatbias();
wait( 1 );
objective_state( 4, "done" );
objective_current( 1 );
arcademode_checkpoint( 10, "c" );
thread shanty_opens();
flag_wait( "all_bmps_dead" );
wait( 2 );
roof_guy waittill_empty_queue();
if ( isdefined( roof_guy.magic_bullet_shield ) )
roof_guy stop_magic_bullet_shield();
roof_guy unmake_hero();
}
flee_overpass()
{
nodes = getnodearray( "bridge_flee_node", "targetname" );
node = random( nodes );
self setgoalnode( node );
self.goalradius = 64;
self endon( "death" );
wait( randomfloat( 3.5 ) );
self.ignoreme = true;
}
shanty_opens()
{
magic_rpg_triggers = getentarray( "magic_rpg_trigger", "targetname" );
array_thread( magic_rpg_triggers, ::magic_rpg_trigger );
thread do_in_order( ::flag_wait, "shanty_flare_trigger", maps\_flare::flare_from_targetname, "shanty_flare" );
if ( isalive( level.javelin_guy ) )
{
assertEx( level.start_point == "shanty", "Didnt come from shanty start?" );
level.javelin_guy stop_magic_bullet_shield();
level.javelin_guy delete();
}
autosave_by_name( "shanty_opens" );
level.currentColorForced[ "allies" ] = [];
activate_trigger_with_targetname( "allies_prep_for_shanty" );
allies = getaiarray( "allies" );
array_thread( allies, ::set_force_color, "o" );
shanty_fence_cut();
thread segmenttimer3( 14 );
delaythread( 1.1, maps\_flare::flare_from_targetname, "alley_flare" );
allies = getaiarray( "allies" );
level.ending_bog_redshirts = 0;
array_thread( allies, ::enable_cqbwalk );
array_thread( allies, ::shanty_allies_cqb_through );
/#
count = 0;
allies = getaiarray( "allies" );
for ( i=0; i < allies.size; i++ )
{
guy = allies[ i ];
if ( guy is_hero() )
continue;
if ( isdefined( guy.magic_bullet_shield ) )
guy stop_magic_bullet_shield();
if ( isdefined( guy.script_forcecolor ) && guy.script_forcecolor == "r" )
continue;
if ( level.start_point == "shanty" && count >= 1 )
{
guy disable_ai_color();
guy delete();
}
count++;
}
#/
/#
red = get_force_color_guys( "allies", "r" );
orange = get_force_color_guys( "allies", "o" );
assertex( red.size == 2, "Should be 2 red guys" );
assertex( orange.size <= 3, "Should be up to 3 orange guys guys" );
#/
flag_set( "shanty_open" );
thread do_in_order( ::flag_wait, "start_shanty_run", ::activate_trigger_with_targetname, "backhalf_friendly_start_trigger" );
bog_ambient_spawners = getentarray( "bog_ambient_spawner", "targetname" );
array_thread( bog_ambient_spawners, ::add_spawn_function, ::bog_ambient_fighting );
array_thread( bog_ambient_spawners, ::spawn_ai );
shanty_run_trigger = getent( "shanty_run_trigger", "targetname" );
shanty_run_trigger.trigger_num = 1;
level.shanty_timer = 0;
level.player.trigger_num = 0;
shanty_run_trigger thread shanty_run_drop_weapon();
thread radio_heavy_fire_dialogue();
flag_wait( "shanty_progress" );
activate_trigger_with_targetname( "friendly_tank_defend_trigger" );
rpgs = getentarray( "magic_shanty_rpg", "targetname" );
array_thread( rpgs, ::magic_rpgs_fire_randomly );
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
ai = getClosest( level.player.origin, allies );
assertEx( isalive( ai ), "Couldn't find a friendly for sequence" );
ai.animName = "generic";
ai thread anim_single_solo( ai, "other_side" );
thread this_way_trigger();
flag_wait( "coming_from_south" );
flag_set( "kill_bog_ambient_fighting" );
ai = getaiarray( "allies" );
array_thread( ai, ::set_fixednode_true );
waittillframeend;
maps\bog_a_backhalf::start_bog_backhalf();
}
this_way_trigger()
{
flag_wait( "this_way" );
}
radio_heavy_fire_dialogue()
{
wait( 4 );
radio_dialogue( "where_are_you" );
level.price thread anim_single_queue( level.price, "almost_there" );
}
run_until_ambush()
{
self endon( "stop_running_to_node" );
self allowedstances( "stand" );
self endon( "going_to_link_node" );
ent = self;
for ( ;; )
{
ent = getent( ent.target, "targetname" );
self.goalradius = ent.radius;
self setgoalpos( ent.origin );
self waittill( "goal" );
if ( !isdefined( ent.target ) )
break;
}
flag_wait( "friendlies_take_fire" );
}
stop_shield_when_player_runs_street()
{
self endon( "death" );
if ( is_hero() )
return;
self thread magic_bullet_shield();
flag_wait( "player_enters_the_fray" );
if ( isdefined( self.magic_bullet_shield ) )
self stop_magic_bullet_shield();
}
run_down_street()
{
spawn_failed( self );
self.fixedNode = false;
thread replace_on_death();
thread stop_shield_when_player_runs_street();
self endon( "death" );
self.interval = 0;
self.pushable = false;
self.dontshootwhilemoving = true;
self.IgnoreRandomBulletDamage = true;
self.moveplaybackrate = self.script_dot;
run_until_ambush();
self.interval = 96;
self.pushable = true;
animscripts\init::set_anim_playback_rate();
self allowedstances( "stand", "crouch", "prone" );
self.ignoreSuppression = true;
forward = anglestoforward( self.angles );
vec = vectorScale( forward, 130 );
timer = gettime() + 1000;
self setgoalpos( self.origin + vec );
self.goalradius = 8;
self waittill( "goal" );
remaining_time = ( timer - gettime() ) * 0.001;
if ( remaining_time > 0 )
wait( remaining_time );
self.pacifist = false;
self.goalradius = 4000;
if ( !flag( "friendlies_move_up_the_bridge" ) )
{
assertEx( !isdefined( self.script_forceColor ), "Friendlies shouldnt have forcecolor yet" );
bridge_volume = getent( "bridge_volume", "targetname" );
if ( !isdefined( self.dont_use_goal_volume ) )
{
self setgoalvolume( bridge_volume );
}
while ( !isdefined( self.node ) )
wait( 0.05 );
self setgoalnode( self.node );
self.goalradius = 32;
self waittill( "goal" );
self.reached_bridge_flee_spot = true;
}
thread set_engagement_to_closer();
self.fixedNode = true;
self.dontshootwhilemoving = undefined;
if ( self == level.price )
return;
flag_wait( "friendlies_move_up_the_bridge" );
self.pacifist = false;
}
apartment_rubble_helicopter()
{
flag_wait( "player_attacks_unreachable_guys_second_floor" );
thread helicopter_flies_by_overhead( "apartment_heli", 0, 95, 95 );
wait( 1 );
flag_wait( "player_attacks_unreachable_guys" );
thread helicopter_flies_by_overhead( "apartment_heli2", 0, 95, 95 );
wait( 5 );
thread helicopter_flies_by_overhead( "apartment_heli", 0, 95, 95 );
wait( 1 );
thread helicopter_flies_by_overhead( "apartment_heli2", 0, 95, 95 );
}
price_directs_players_upstairs()
{
level endon( "melee_sequence_begins" );
if ( flag( "melee_sequence_begins" ) )
return;
trigger = getent( "price_sends_you_upstairs_trigger", "targetname" );
trigger waittill( "trigger" );
for ( ;; )
{
level.price thread anim_single_queue( level.price, "head_upstairs" );
wait( randomfloatrange( 12, 14 ) );
}
}
helicopters_fly_by()
{
thread helis_ambient();
trigger = getent( "armada_trigger", "targetname" );
trigger waittill( "trigger" );
trigger = getent( "vehicle_crash_trigger", "targetname" );
trigger thread cobra_crash();
thread helicopters_flies_by_overhead( "intro_heli5", 0, 	135, 95 );
thread helicopter_flies_by_overhead( "heli_crash", 0, 		135, 95 );
}
restart_price()
{
level.price thread magic_bullet_shield();
level.price make_hero();
}
runout()
{
var = [];
wait( 5 );
for ( ;; )
{
for ( i=0;i<500;i++)
var[ var.size ] = 5;
wait( 0.05 );
}
}
bcs_disabler()
{
wait( 0.05 );
setdvar( "bcs_enable", "off" );
}
move_in_on_goal( node )
{
self endon( "death" );
wait( 10 );
self.goalradius = node.radius;
self.goalheight = 64;
self setgoalnode( node );
mindist = 300;
for ( ;; )
{
wait( randomfloatrange( 3, 11 ) );
dist = distance( node.origin, self.origin ) - 125;
if ( dist < mindist )
{
dist = mindist;
}
self.goalradius = dist;
}
}
music()
{
shantyMusicTrig = getent( "shantyMusicTrig", "targetname" );
shantyMusicTrig waittill( "trigger" );
MusicPlayWrapper( "bog_a_shantytown" );
bogMusicTrig = getent( "bogMusicTrig", "targetname" );
bogMusicTrig waittill( "trigger" );
musicStop( 3 );
wait 3.25;
MusicPlayWrapper( "bog_a_tankdefense" );
}
shanty_run_drop_weapon()
{
for ( ;; )
{
self waittill( "trigger", other );
if ( !isalive( other ) )
continue;
other thread ignore_triggers( 1.0 );
if ( other == level.player )
break;
}
weapons = getentarray( "weapon_javelin", "classname" );
array_thread( weapons, ::self_delete );
if ( !player_has_javelin() )
return;
hasGren = false;
tookWeapon = false;
weaponList = level.player GetWeaponsListPrimaries();
tookMainWeapon = false;
for ( i=0; i < weaponList.size; i++ )
{
if ( issubstr( weaponList[ i ], "avelin" ) )
{
tookWeapon = true;
if ( issubstr( level.player GetCurrentWeapon(), "avelin" ) )
{
tookMainWeapon = true;
level.player DisableWeapons();
wait( 1.5 );
}
level.player takeweapon( "javelin" );
continue;
}
if ( weaponList[ i ] == "m4_grenadier" )
{
hasGren = true;
}
}
if ( !tookWeapon )
{
return;
}
level.player EnableWeapons();
if ( !hasGren )
{
level.player giveWeapon("m4_grenadier");
}
if ( tookMainWeapon )
level.player switchToWeapon( "m4_grenadier" );
}
wait_then_go_to_target()
{
self endon( "death" );
wait( 2 );
maps\_spawner::go_to_node();
}
grenade_launcher_hint( nothing )
{
flag_wait( "nightvision_on" );
wait( 1.5 );
display_hint( "grenade_launcher" );
}