#include common_scripts\utility;
#include maps\_utility;
#include maps\_ac130;
#include maps\ac130_code;
#include scripts\customcode;
main()
{
if ( getdvar( "credits_load" ) == "1" )
{
thread maps\ac130_credits::credits_main();
return;
}
if ( getdvar( "ac130_gameplay_enabled") == "" )
setdvar( "ac130_gameplay_enabled", "1" );
setExpFog( 1000, 17300, 0/255, 0/255, 0/255, 0 );
setsaveddvar( "scr_dof_enable", "0" );
precacheLevelStuff();
flag_init( "mission_failed" );
flag_init( "hijacked_vehicles_stopped" );
flag_init( "friendlies_loading_vehicles" );
flag_init( "choppers_inbound" );
flag_init( "friendlies_moving_to_choppers" );
flag_init( "ignore_friendly_move_commands" );
flag_init( "friendlies_in_choppers" );
flag_init( "choppers_flew_away" );
level.hintPrintDuration = 5.0;
level.minimumFriendlyCount = 3;
level.minimumAutosaveFriendlyCount = 5;
add_start( "church", 	::start_church, &"STARTS_CHURCH" );
add_start( "field", 	::start_field, &"STARTS_FIELD" );
add_start( "hijack", 	::start_hijack, &"STARTS_HIJACK" );
add_start( "junkyard",	::start_junkyard, &"STARTS_JUNKYARD" );
default_start( ::start_start );
scriptCalls();
wait 10;
objective_add( 1, "current", &"AC130_OBJECTIVE_SUPPORT_FRIENDLIES", ( 0, 0, 0 ) );
}
start_start()
{
thread sectionUpdatePBLastLevel();
thread sectionUpdatePBLastLevelSeg();
thread overalltimer();
SetMissionDvar( "lastplayedlevel", 7 );
level waittill( "introscreen_almost_complete" );
spawn_friendlies( "friends_start" );
thread dialog_opening();
thread gameplay_start();
}
start_church()
{
spawn_friendlies( "friends_church" );
level.ac130.origin = getent( "ac130_waypoint_fight1", "targetname" ).origin;
flag_set( "clear_to_engage" );
flag_set( "allow_context_sensative_dialog" );
thread dialog_cleared_to_engage();
thread gameplay_chuch();
}
start_field()
{
spawn_friendlies( "friends_field1" );
level.ac130.origin = getent( "ac130_waypoint_field1", "targetname" ).origin;
flag_set( "clear_to_engage" );
flag_set( "allow_context_sensative_dialog" );
thread gameplay_fields();
}
start_hijack()
{
spawn_friendlies( "friends_hijack" );
level.ac130.origin = getent( "ac130_waypoint_hijack", "targetname" ).origin;
flag_set( "clear_to_engage" );
flag_set( "allow_context_sensative_dialog" );
wait 0.05;
thread gameplay_hijack();
}
start_junkyard()
{
spawn_friendlies( "friends_junkyard" );
level.ac130.origin = getent( "ac130_waypoint_junkyard1", "targetname" ).origin;
flag_set( "clear_to_engage" );
flag_set( "allow_context_sensative_dialog" );
wait 0.05;
thread gameplay_junkyard1();
}
gameplay_start()
{
move_friendlies( "friendly_location_01" );
thread movePlaneToWaypoint( "ac130_waypoint_fight1" );
wait 27;
thread gameplay_chuch();
}
gameplay_chuch()
{
thread segmenttimer1( 20 );
thread autosaveFriendlyCountCheck( "church" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
resetPlayerKillCount();
spawn_vehicle( "first_truck_spawn_trigger" );
wait 5;
spawn_enemies( "first_truck_reinforcement_spawn_trigger" );
wait 5;
spawn_enemies( "first_shack_spawner_trigger" );
spawn_enemies( "church_spawner_trigger" );
spawn_enemies( "church_spawner_trigger2" );
spawn_enemies( "house1_spawner_trigger" );
wait 25;
move_friendlies( "friendly_location_02" );
waitForPlayerKillCount( 7 );
wait 15;
}
thread movePlaneToWaypoint( "ac130_waypoint_fight2" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
resetPlayerKillCount();
stop_enemies( "first_shack_spawner_trigger" );
spawn_enemies( "house2_spawner_trigger" );
wait 10;
waitForPlayerKillCount( 5 );
stop_enemies( "church_spawner_trigger2" );
}
move_friendlies( "friendly_location_03" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
wait 12;
stop_enemies( "church_spawner_trigger" );
}
move_friendlies( "friendly_location_04" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
spawn_vehicle( "long_road_truck_spawn_trigger" );
wait 12;
stop_enemies( "house1_spawner_trigger" );
stop_enemies( "house2_spawner_trigger" );
}
thread gameplay_fields();
}
gameplay_fields()
{
thread segmenttimer2( 21 );
thread dialog_passing_church();
thread autosaveFriendlyCountCheck( "fields" );
thread movePlaneToWaypoint( "ac130_waypoint_field1" );
move_friendlies( "friendly_location_05" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
resetPlayerKillCount();
wait 8;
spawn_enemies( "field1_spawner_trigger" );
wait 8;
spawn_vehicle( "field1_truck_spawn_trigger" );
wait 20;
waitForPlayerKillCount( 10 );
stop_enemies( "field1_spawner_trigger" );
waittill_dead( getEnemiesInZone( "volume_field1" ), undefined, 30 );
}
thread gameplay_hijack();
}
#using_animtree( "vehicles" );
gameplay_hijack()
{
thread segmenttimer3( 22 );
thread ac130_move_in();
thread movePlaneToWaypoint( "ac130_waypoint_hijack" );
move_friendlies( "friendly_location_06" );
wait 10;
thread autosaveFriendlyCountCheck( "hijack" );
vehGroup = [];
vehGroup[ 0 ] = [];
vehGroup[ 1 ] = [];
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
maps\_vehicle::create_vehicle_from_spawngroup_and_gopath( 5 );
level.getaway_vehicle_1 = getent( "getaway_vehicle_1", "targetname" );
if ( !isdefined( level.getaway_vehicle_1 ) )
level.getaway_vehicle_1 = maps\_vehicle::waittill_vehiclespawn( "getaway_vehicle_1" );
level.getaway_vehicle_2 = getent( "getaway_vehicle_2", "targetname" );
if ( !isdefined( level.getaway_vehicle_2 ) )
level.getaway_vehicle_2 = maps\_vehicle::waittill_vehiclespawn( "getaway_vehicle_2" );
level.getaway_vehicle_1 thread friendly_fire_vehicle_thread();
level.getaway_vehicle_2 thread friendly_fire_vehicle_thread();
thread civilian_car_riders_spawn_and_idle();
thread dialog_hijack();
getVehicleNode( "vehicle_hijack_start_stop", "script_noteworthy" ) waittill( "trigger" );
level.getaway_vehicle_1 setSpeed( 0, 10 );
level.getaway_vehicle_2 setSpeed( 0, 10 );
flag_set( "hijacked_vehicles_stopped" );
wait 3;
wait 2;
for( i = 0 ; i < level.friendlies.size ; i++ )
{
if ( !isdefined( level.friendlies[ i ] ) )
continue;
if ( !isalive( level.friendlies[ i ] ) )
continue;
if ( vehGroup[ 0 ].size < 4 )
vehGroup[ 0 ][ vehGroup[ 0 ].size ] = level.friendlies[ i ];
else if ( vehGroup[ 1 ].size < 4 )
vehGroup[ 1 ][ vehGroup[ 1 ].size ] = level.friendlies[ i ];
else
assertMsg( "Tried to load more than 8 friendlies into two vehicles." );
}
assert( vehGroup[ 0 ].size > 0 );
for( p = 0 ; p < 2 ; p++ )
{
for( i = 0 ; i < vehGroup[ p ].size ; i++ )
{
if ( p == 0 )
{
switch( i )
{
case 0:
vehGroup[ p ][ i ].animname = "hijacker_car1_guy1";
vehGroup[ p ][ i ].sitTag = "tag_driver";
break;
case 1:
vehGroup[ p ][ i ].animname = "hijacker_car1_guy2";
vehGroup[ p ][ i ].sitTag = "tag_passenger";
break;
case 2:
vehGroup[ p ][ i ].animname = "hijacker_car1_guy3";
vehGroup[ p ][ i ].sitTag = "tag_guy0";
break;
case 3:
vehGroup[ p ][ i ].animname = "hijacker_car1_guy4";
vehGroup[ p ][ i ].sitTag = "tag_guy1";
break;
}
}
else
{
switch( i )
{
case 0:
vehGroup[ p ][ i ].animname = "hijacker_car2_guy1";
vehGroup[ p ][ i ].sitTag = "tag_driver";
break;
case 1:
vehGroup[ p ][ i ].animname = "hijacker_car2_guy2";
vehGroup[ p ][ i ].sitTag = "tag_passenger";
break;
case 2:
vehGroup[ p ][ i ].animname = "hijacker_car2_guy3";
vehGroup[ p ][ i ].sitTag = "tag_guy0";
break;
case 3:
vehGroup[ p ][ i ].animname = "hijacker_car2_guy4";
vehGroup[ p ][ i ].sitTag = "tag_guy1";
break;
}
}
}
}
thread do_hijack( level.getaway_vehicle_1, vehGroup[ 0 ], %ac130_carjack_door_1a, %ac130_carjack_door_others );
thread do_hijack( level.getaway_vehicle_2, vehGroup[ 1 ], %ac130_carjack_door_1b, %ac130_carjack_door_others );
flag_set( "friendlies_loading_vehicles" );
level.getaway_vehicle_1 thread mission_fail_vehicle_death();
level.getaway_vehicle_2 thread mission_fail_vehicle_death();
}
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
if ( vehGroup[ 1 ].size > 0 )
waittill_multiple_ents( level.getaway_vehicle_1, "hijack_done", level.getaway_vehicle_2, "hijack_done" );
else
waittill_multiple_ents( level.getaway_vehicle_1, "hijack_done" );
}
thread dialog_ambush();
wait 17.0;
thread gameplay_ambush();
thread ac130_move_out();
wait 17.0;
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
level.getaway_vehicle_1 resumeSpeed( 5 );
wait 1.3;
level.getaway_vehicle_2 resumeSpeed( 5 );
}
}
gameplay_ambush()
{
thread movePlaneToWaypoint( "ac130_waypoint_ambush" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
wait 5;
spawn_vehicle( "ambush_truck1_spawn_trigger" );
spawn_enemies( "ambush_rooftop_spawn_trigger" );
wait 5;
spawn_enemies( "ambush_rpg_spawn_trigger1" );
spawn_enemies( "ambush_rpg_spawn_trigger4" );
wait 5;
}
thread ac130_move_in();
thread autosaveFriendlyCountCheck( "ambush" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
spawn_enemies( "ambush_rpg_spawn_trigger3" );
wait 5;
spawn_enemies( "ambush_rpg_spawn_trigger2" );
wait 20;
spawn_vehicle( "ambush_bmp_spawn_trigger" );
wait 32;
}
thread movePlaneToWaypoint( "ac130_waypoint_junkyard1" );
getVehicleNode( "stop_at_junkyard", "script_noteworthy" ) waittill( "trigger" );
thread dialog_junkyard1();
level.getaway_vehicle_2 setSpeed( 0, 10 );
wait 1;
level.getaway_vehicle_1 setSpeed( 0, 10 );
wait 3;
level.getaway_vehicle_1 notify( "getout" );
level.getaway_vehicle_2 notify( "getout" );
level notify( "getaway_vehicles_unloaded" );
waittillframeend;
thread gameplay_junkyard1();
}
gameplay_junkyard1()
{
thread segmenttimer4( 23 );
SetMissionDvar( "lastplayedsection", 23 );
thread movePlaneToWaypoint( "ac130_waypoint_junkyard1" );
move_friendlies( "friendly_location_07" );
wait 5;
thread autosaveFriendlyCountCheck( "junkyard" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
resetPlayerKillCount();
array_thread( getaiarray( "axis" ), ::self_delete );
spawn_enemies( "junkyard_spawn_trigger1" );
wait 3;
spawn_enemies( "junkyard_spawn_trigger4" );
wait 5;
spawn_enemies( "junkyard_spawn_trigger2" );
wait 10;
spawn_enemies( "junkyard_spawn_trigger5" );
wait 15;
spawn_enemies( "junkyard_spawn_trigger3" );
wait 45;
waitForPlayerKillCount( 12 );
}
thread gameplay_junkyard2();
}
gameplay_junkyard2()
{
thread dialog_junkyard2();
stop_enemies( "junkyard_spawn_trigger1" );
stop_enemies( "junkyard_spawn_trigger2" );
stop_enemies( "junkyard_spawn_trigger3" );
thread movePlaneToWaypoint( "ac130_waypoint_junkyard2" );
move_friendlies( "friendly_location_08" );
thread autosaveFriendlyCountCheck( "junkyard2" );
if ( getdvar( "ac130_gameplay_enabled") == "1" )
{
resetPlayerKillCount();
spawn_enemies( "junkyard2_spawn_trigger1" );
spawn_vehicle( "junkyard_truck2_spawn_trigger" );
wait 10;
spawn_vehicle( "junkyard_truck1_spawn_trigger" );
wait 10;
waitForPlayerKillCount( 5 );
stop_enemies( "junkyard_spawn_trigger4" );
stop_enemies( "junkyard_spawn_trigger5" );
}
flag_set( "choppers_inbound" );
spawn_vehicle( "blackhawks_spawn_trigger" );
flag_wait( "choppers_flew_away" );
missionEnd( true );
}
friendly_health_init()
{
assert( isdefined( self ) );
assert( isalive( self ) );
assert( isAI( self ) );
self thread magic_bullet_shield();
}
clear_to_engage( fDelay )
{
if ( isdefined( fDelay ) )
wait fDelay;
flag_set( "clear_to_engage" );
array_thread( getAIArray(), ::dontShoot, false );
}
dontShoot( qTrue )
{
if ( qTrue )
{
self.ignoreme = true;
self.ignoreall = true;
}
else
{
self.ignoreme = false;
self.ignoreall = false;
}
}
dialog_opening()
{
if (getdvar("ac130_enabled") == "0")
return;
array_thread( getAIArray(), ::dontShoot, true );
wait 2;
playSoundOverRadio( level.scr_sound["price"]["ac130_pri_towntoeast"], true );
wait 1;
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_eyesonfriendlies"], true );
wait 1;
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_nofirestrobe"], true );
wait 0.5;
hintPrint( &"SCRIPT_PLATFORM_AC130_HINT_TOGGLE_THERMAL" );
if ( !flag( "player_changed_weapons" ) )
hintPrint( &"AC130_HINT_CYCLE_WEAPONS" );
thread dialog_church_spotted();
}
dialog_church_spotted()
{
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_confirmchurch"], true );
wait 1;
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_weseeit"], true );
level notify( "start_clock" );
wait 1;
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_rogerwerethere"], true );
wait 0.5;
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_notauthorizedchurch"], true );
thread dialog_cleared_to_engage();
}
dialog_cleared_to_engage()
{
if ( getdvar( "ac130_alternate_controls" ) == "1" )
hintPrint( &"SCRIPT_PLATFORM_AC130_HINT_ZOOM_AND_FIRE" );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_vehiclemovingnow"], true );
wait 1;
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_onevehiclemoving"], true );
wait 1;
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_personnelchurch"], true );
wait 1;
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_armedpersonnelchurch"], true );
wait 1;
thread clear_to_engage( 1.5 );
playSoundOverRadio( level.scr_sound["pilot"]["ac130_plt_cleartoengage"], true );
wait 1;
flag_set( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_cleartoengage"], true );
}
dialog_passing_church()
{
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_passingchurch"], true );
playSoundOverRadio( level.scr_sound["plt"]["ac130_plt_woutstrobe"], true );
flag_set( "allow_context_sensative_dialog" );
}
dialog_hijack()
{
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_movingvehicle"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_donoengage"], true );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_coverus"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_civilianvehicles"], true );
flag_wait( "hijacked_vehicles_stopped" );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_alttransport"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_nicetruck"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_nahscared"], true );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_confirmyousee"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_seebeacons"], true );
flag_set( "allow_context_sensative_dialog" );
}
dialog_ambush()
{
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_ambushroad"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_whichcurved"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_seewatertower"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_confirmyousee"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_nearintersection"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_thatstheone"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_doyouseethat"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_rogerthat"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_trackthatroad"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_howfar"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_uhhangon"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_600meters"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_rogerthat"], true );
playSoundOverRadio( level.scr_sound["plt"]["ac130_plt_bankingtovillage"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_hostilescurved"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_partiallyconcealed"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_firedrpg"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_takeout"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_outofbarn"], true );
playSoundOverRadio( level.scr_sound["plt"]["ac130_plt_smokem"], true );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_underattack"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_smoketrails"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_ushaped"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_ushaped"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_flatroof"], true );
flag_set( "allow_context_sensative_dialog" );
}
dialog_junkyard1()
{
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_junkyard"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_flashingstrobe"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_watchstrobe"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_enemyjunkyard"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_smokeem"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_gointotown"], true );
flag_set( "allow_context_sensative_dialog" );
}
dialog_junkyard2()
{
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_fireallsides"], true );
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_dangerclose"], true );
flag_set( "allow_context_sensative_dialog" );
flag_wait( "choppers_inbound" );
flag_clear( "allow_context_sensative_dialog" );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_friendliesentering"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_copy"], true );
flag_wait( "friendlies_moving_to_choppers" );
playSoundOverRadio( level.scr_sound["pri"]["ac130_pri_thanksforassist"], true );
playSoundOverRadio( level.scr_sound["fco"]["ac130_fco_highlightreel"], true );
playSoundOverRadio( level.scr_sound["tvo"]["ac130_tvo_heardthat"], true );
flag_wait( "friendlies_in_choppers" );
level notify( "segment4_stop" );
thread sectionUpdatePBLastLevelSeg();
playSoundOverRadio( level.scr_sound["nav"]["ac130_nav_vipsecure"], true );
playSoundOverRadio( level.scr_sound["plt"]["ac130_plt_returningbase"], true );
}