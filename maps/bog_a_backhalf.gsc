#include maps\_utility;
#include maps\_vehicle;
#include common_scripts\utility;
#include maps\_anim;
#include scripts\customcode;
bog_backhalf_shell()
{
}
force_spawn()
{
self stalingradspawn();
}
bog_backhalf_init()
{
level.tankExplosion_fx = loadfx( "explosions/javelin_explosion" );
level.abrams = getent( "abrams", "targetname" );
level.abrams.godmode = true;
assert( isdefined( level.abrams ) );
level.zpu = getent( "zpu", "targetname" );
level.tankDefenderPop = 0;
level.tankAtkDead = 0;
level.totalCount = 0;
level.tankDefenseFailsafeTime = 900;
level.encroacherInit = 3;
level.encroacherDiv = 3;
level.zpuBlastRadius = 384;
level.playerIsTargeted = false;
flag_init( "tankoverrun" );
flag_init( "zpu_speech_started" );
flag_init( "zpu_orders_given" );
flag_init( "zpus_destroyed" );
flag_init( "activate_final_bldg" );
flag_init( "lower_health_of_tank_defense_stragglers" );
flag_init( "beacon_orders" );
flag_init( "beacon_planted" );
flag_init( "final_bldg_fired_upon" );
flag_init( "pilot_final_dialogue" );
flag_init( "cobra_success" );
flag_init( "reached_ending_area" );
flag_init( "ending_final_positions" );
flag_init( "clipped_off_dest" );
level.c4_sound_override = true;
level.tankEncroachSteps = 3;
level.tankEncroachInitRadius = 1600;
level.tankEncroachRate = 0.8;
level.tankEncroachPauseTime = 7;
level.defenseSuccessRatio = 0.87;	// percentage of enemy tank attack guys killed at which the objective completes
level.beacon = getent( "beacon", "targetname" );
level.beacon.origin = level.beacon.origin + (0,0,2.85);
thread do_in_order( ::flag_wait, "final_bldg_fired_upon", maps\_spawner::kill_spawnerNum, 1008 );
array_thread( getentarray( "tank_defender", "script_noteworthy" ), ::add_spawn_function, ::tank_defender_spawn_setup );
array_thread( getentarray( "tank_defender", "script_noteworthy" ), ::add_spawn_function, ::replace_on_death );
array_thread( getentarray( "tank_attack_enemy", "script_noteworthy" ), ::add_spawn_function, ::enemy_infantry_spawn_setup );
array_thread( getentarray( "tank_attack_enemy", "script_noteworthy" ), ::add_spawn_function, ::tank_attack_death_tally );
}
start_bog_backhalf()
{
flag_set( "tank_defense_activate" );
thread objectives();
thread bog_a_backhalf_autosaves();
level.abrams thread tank_setup();
level.abrams thread tank_turret_slewing();
thread temp_friendly_boost();
thread tank_defense_flares();
thread tank_defender_deathmonitor();
thread tank_defense_enforcement();
thread tank_defense_victory_check();
thread tank_defense_killspawner_check();
thread zpu_battle_init();
thread zpu_c4();
thread zpu_dialogue();
thread cobra_bldg_activate();
thread cobra_bldg_mg();
thread cobra_sequence();
thread dialogue();
badPlaceHill = getent( "badplace_fires", "targetname" );
badplace_cylinder( "hill_fires", -1, badPlaceHill.origin, badPlaceHill.radius, badPlaceHill.height, "allies" );
}
start_zpu()
{
flag_set( "zpu_orders_given" );
player_org = getent( "zpu_player_org", "targetname" );
level.player setorigin( player_org.origin );
level.player setplayerangles( player_org.angles );
thread objectives();
thread bog_a_backhalf_autosaves();
level.abrams thread tank_setup();
thread temp_friendly_boost();
thread zpu_battle_init();
thread zpu_c4();
thread zpu_dialogue();
thread cobra_bldg_activate();
thread cobra_bldg_mg();
thread cobra_sequence();
thread dialogue();
wait( 0.1 );
activate_trigger_with_noteworthy( "zpu_trigger" );
}
start_cobras()
{
flag_set( "tank_defense_completed" );
flag_set( "final_bldg_activate" );
flag_set( "zpu_orders_given" );
flag_set( "zpus_destroyed" );
thread cobra_bldg_activate();
thread cobra_bldg_mg();
thread start_cobras_pos();
thread objectives();
thread bog_a_backhalf_autosaves();
level.abrams thread tank_setup();
thread temp_friendly_boost();
thread cobra_sequence();
thread dialogue();
wait 5;
level.zpu delete();
}
start_cobras_pos()
{
playerStart = getent( "start_cobras_player", "targetname" );
level.player setorigin( playerStart.origin );
priceStart = getent( "start_cobras_price", "targetname" );
level.price = getent( "price", "targetname" );
level.price teleport( priceStart.origin );
}
start_end()
{
level.player setplayerangles( ( 0, 80, 0 ) );
level.player setorigin( ( 4968, 1528, -12320 ) );
ai = getaiarray();
array_thread( ai, ::set_ignoreme, true );
level.abrams thread tank_setup();
level.abrams thread tank_turret_slewing();
tank_defenders = getentarray( "tank_defender", "script_noteworthy" );
array_thread( tank_defenders, ::self_delete );
wait( 0.05 );
set_vision_set( "bog_a_sunrise", 1 );
abrams_gets_drawing();
level.price = getent( "price", "targetname" );
price_spawner = getent( "price_spawner", "targetname" );
level.price teleport( price_spawner.origin );
mark = getent( "mark_spawner", "targetname" ) stalingradspawn();
level.mark = mark;
spawn_failed( mark );
spawn_failed( level.price );
level.price make_hero();
mark make_hero();
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
array_delete( allies );
otherSpawners = getentarray( "main_friendly_unit", "script_noteworthy" );
array_thread( otherSpawners, ::force_spawn );
waittillframeend;
thread ending_sequence();
wait( 0.05 );
level.player setplayerangles( ( 0, 80, 0 ) );
level.player setorigin( ( 4777, 1491, 20 ) );
}
temp_friendly_boost()
{
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
for ( i = 0; i < allies.size; i++ )
{
ally = allies[ i ];
ally.ignoresuppression = true;
ally.health = 1000;
}
}
tank_defense_flares()
{
level endon( "tank_defense_completed" );
level waittill( "detpack_rush_flare" );
wait 10;
maps\_flare::flare_from_targetname( "flare1" );
wait 12;
maps\_flare::flare_from_targetname( "flare2" );
wait 14;
maps\_flare::flare_from_targetname( "flare1" );
wait 8;
maps\_flare::flare_from_targetname( "flare2" );
wait 18;
maps\_flare::flare_from_targetname( "flare1" );
wait 20;
maps\_flare::flare_from_targetname( "flare1" );
wait 7;
maps\_flare::flare_from_targetname( "flare2" );
wait 14;
maps\_flare::flare_from_targetname( "flare1" );
wait 8;
maps\_flare::flare_from_targetname( "flare2" );
wait 18;
maps\_flare::flare_from_targetname( "flare1" );
wait 20;
maps\_flare::flare_from_targetname( "flare1" );
wait 7;
maps\_flare::flare_from_targetname( "flare2" );
}
tank_defender_spawn_setup()
{
level.tankDefenderPop++ ;
self.ignoresuppression = true;
self.health = 1000;
self thread tank_defender_deathnotify();
}
tank_defender_deathnotify()
{
self waittill( "death" );
level.tankDefenderPop -- ;
}
tank_defender_deathmonitor()
{
battleTrigger = getent( "tank_battle_spawner", "targetname" );
battleTrigger waittill( "trigger" );
wait 10;
level notify( "detpack_rush_flare" );
radio_dialogue_queue( "movingindetpacks" );
}
tank_defense_victory_check()
{
aTankAttackSpawners = [];
aEnemySpawners = [];
aEnemySpawners = getspawnerteamarray( "axis" );
for ( i = 0; i < aEnemySpawners.size; i++ )
{
enemy = aEnemySpawners[ i ];
if ( !isdefined( enemy.script_noteworthy ) )
continue;
if ( enemy.script_noteworthy == "tank_attack_enemy" )
{
aTankAttackSpawners[ aTankAttackSpawners.size ] = enemy;
}
}
enemyPop = 0;
currentCount = 0;
for ( j = 0; j < aTankAttackSpawners.size; j++ )
{
if ( !isdefined( aTankAttackSpawners[ j ].count ) )
{
count = 1;
}
else
{
count = aTankAttackSpawners[ j ].count;
}
level.totalCount = level.totalCount + count;
}
while ( !flag( "tank_defense_completed" ) )
{
completionRatio = level.tankAtkDead / level.totalCount;
if ( completionRatio >= level.defenseSuccessRatio )
{
flag_set( "tank_defense_completed" );
thread tank_defense_stragglers();
break;
}
currentCount = 0;
wait 2;
}
}
tank_defense_killspawner_check()
{
aKillTrigsDirectory = [];
aKillTrigs = getentarray( "tank_attack_killspawner", "targetname" );
for ( i = 0; i < aKillTrigs.size; i++ )
{
aKillTrigs[ i ] thread tank_defense_killspawner_monitor();
}
}
tank_defense_killspawner_monitor()
{
level endon( "tank_defense_completed" );
aKillTrigSpawners = [];
killTriggerCount = 0;
aEnemySpawners = getspawnerteamarray( "axis" );
for ( i = 0; i < aEnemySpawners.size; i++ )
{
if ( !isdefined( aEnemySpawners[ i ].script_killspawner ) )
continue;
if ( aEnemySpawners[ i ].script_killspawner == self.script_killspawner )
aKillTrigSpawners[ aKillTrigSpawners.size ] = aEnemySpawners[ i ];
}
for ( i = 0; i < aKillTrigSpawners.size; i++ )
{
if ( !isdefined( aKillTrigSpawners[ i ].count ) )
count = 1;
else
count = aKillTrigSpawners[ i ].count;
killTriggerCount = killTriggerCount + count;
}
self waittill( "trigger" );
level.totalCount = level.totalCount - killTriggerCount;
}
bog_a_backhalf_autosaves()
{
flag_wait( "tank_defense_completed" );
autosave_by_name( "tank_defense_finished" );
if ( !flag( "zpus_destroyed" ) )
{
zpuMidSaveTrig = getent( "zpuMidSaveTrig", "targetname" );
zpuMidSaveTrig waittill( "trigger" );
autosave_by_name( "zpu_midpoint_approach" );
zpuCloseSaveTrig = getent( "zpu_autosave", "targetname" );
zpuCloseSaveTrig waittill( "trigger" );
autosave_by_name( "zpu_dont_blow_yourself_up" );
}
flag_wait( "zpus_destroyed" );
thread segmenttimer4( 15 );
SetMissionDvar( "lastplayedsection", 15 );
autosave_by_name( "airstrike_begin" );
}
tank_defense_stragglers()
{
aKillTriggers = getentarray( "tank_attack_killspawner", "targetname" );
array_thread( aKillTriggers, ::activate_trigger );
flag_set( "lower_health_of_tank_defense_stragglers" );
}
tank_attack_death_tally()
{
self waittill( "death" );
level.tankAtkDead++ ;
}
enemy_infantry_spawn_setup()
{
self endon( "death" );
self waittill( "reached_path_end" );
self thread enemy_infantry_tank_encroach();
flag_wait( "lower_health_of_tank_defense_stragglers" );
self.health = 5;
}
enemy_infantry_tank_encroach()
{
self endon( "death" );
level endon( "tank_defense_completed" );
level endon( "suicide_bomber_reached_tank" );
self enemy_tank_encroach_mvmt();
choke = level.encroacherInit % level.encroacherDiv;
level.encroacherInit++ ;
if ( !choke )
{
self.goalradius = 64;
self.pathenemyfightdist = 512;
self.pathenemylookahead = 512;
self waittill( "goal" );
/#
if ( isgodmode( level.player ) )
return;
#/
if ( !flag( "tank_defense_completed" ) )
{
thread tank_destruction();
waittillframeend;
level notify( "suicide_bomber_reached_tank" );
}
else
{
self.goalradius = 1000;
self setgoalentity( level.player );
}
}
}
enemy_tank_encroach_mvmt()
{
self endon( "death" );
destNode = getnode( "tank_suicide_bomb_dest", "targetname" );
self setgoalnode( destNode );
self.goalradius = level.tankEncroachInitRadius;
self.pathenemyfightdist = 96;
self.pathenemylookahead = 512;
for ( i = 0; i < level.tankEncroachSteps; i++ )
{
wait level.tankEncroachPauseTime;
self.goalradius = self.goalradius * level.tankEncroachRate;
}
}
objectives()
{
objective_add( 1, "active", &"BOG_A_SECURE_THE_M1A1_ABRAMS", ( 4800, 1488, 32 ) );
objective_add( 5, "active", &"BOG_A_INTERCEPT_THE_ENEMY_BEFORE", ( 4800, 1488, 32 ) );
objective_current( 5 );
flag_wait( "tank_defense_completed" );
flag_clear( "aa_bog" );
flag_wait( "zpu_orders_given" );
flag_init( "aa_zpu" );
flag_set( "aa_zpu" );
objective_state( 5, "done" );
arcademode_checkpoint( 4.5, "d" );
objective_add( 6, "active", &"BOG_A_DESTROY_THE_ZPU_ANTI", level.zpu.origin );
objective_current( 6 );
flag_wait( "zpus_destroyed" );
flag_clear( "aa_zpu" );
objective_state( 6, "done" );
southernObjLoc = getent( "southern_area_objective", "targetname" );
objective_add( 7, "active", &"BOG_A_SECURE_THE_SOUTHERN_SECTOR", southernObjLoc.origin );
objective_current( 7 );
flag_wait( "beacon_orders" );
objective_add( 8, "active", &"BOG_A_PLANT_THE_IR_BEACON_TO", level.beacon.origin );
obj_fx = spawnFx( getfx( "beacon_glow" ), level.beacon.origin );
triggerFx( obj_fx );
objective_current( 8 );
arcademode_checkpoint( 1.5, "e" );
flag_wait( "beacon_planted" );
obj_fx delete();
arcademode_checkpoint( 3, "f" );
objective_state( 8, "done" );
objective_current( 7 );
flag_wait( "cobra_success" );
objective_state( 7, "done" );
endingOrigin = ( 5099.6, 1602.45, -6.36579 );
objective_add( 9, "active", &"BOG_A_REGROUP_WITH_THE_SQUAD", endingOrigin );
objective_current( 9 );
flag_wait( "reached_ending_area" );
objective_state( 9, "done" );
objective_state( 1, "current" );
}
cobra_bldg_activate()
{
flag_wait( "activate_final_bldg" );
trig = getent( "post_zpu_final_bldg_spawn", "script_linkname" );
trig notify( "trigger" );
}
cobra_bldg_mg()
{
flag_wait( "activate_final_bldg" );
backhalfmgs = getentarray( "backhalf_manual_mg", "targetname" );
array_thread( backhalfmgs, ::backhalf_mg_setmode, "manual" );
array_thread( backhalfmgs, ::cobra_bldg_mg_targeting );
array_thread( backhalfmgs, ::cobra_bldg_mg_cleanup );
}
cobra_bldg_mg_targeting()
{
level endon( "final_bldg_fired_upon" );
targets = getentarray( self.target, "targetname" );
self thread backhalf_manual_mg_fire();
n = 0;
while ( 1 )
{
target = random( targets );
wait( randomfloatrange( 1, 2 ) );
if ( n > 6 && !flag( "beacon_planted" ) && !level.playerIsTargeted )
{
level.playerIsTargeted = true;
self settargetentity( level.player );
n = 0;
}
else
self settargetentity( target );
wait( randomfloatrange( 1, 5 ) );
level.playerIsTargeted = false;
n++ ;
}
}
backhalf_mg_setmode( mode )
{
self setmode( mode );
}
backhalf_manual_mg_fire()
{
self endon( "stop_firing" );
self.turret_fires = true;
for ( ;; )
{
timer = randomfloatrange( 0.2, 0.7 ) * 20;
if ( self.turret_fires )
{
for ( i = 0; i < timer; i++ )
{
self shootturret();
wait( 0.05 );
}
}
wait( randomfloat( 0.5, 2 ) );
}
}
cobra_bldg_mg_cleanup()
{
thread do_in_order( ::flag_wait, "final_bldg_fired_upon", ::send_notify, "stop_firing" );
flag_wait( "final_bldg_fired_upon" );
self delete();
}
cobra_sequence()
{
flag_wait( "zpus_destroyed" );
wait 4;
radio_dialogue_queue( "plantbeacon" );
thread cobra_sequence_reminder();
flag_set( "beacon_orders" );
glowingBeacon = spawn( "script_model", level.beacon.origin + (0,0,-3) );
glowingBeacon setmodel( "com_night_beacon_obj" );
flag_set( "beacon_ready_to_use" );
beaconUseTrig = getent( "beaconTrig", "targetname" );
beaconUseTrig sethintstring( &"SCRIPT_PLATFORM_HINT_PLANTBEACON" );
beaconUseTrig waittill( "trigger" );
beaconUseTrig delete();
glowingBeacon setmodel( "com_night_beacon" );
flag_set( "beacon_planted" );
cobra1 = spawn_vehicle_from_targetname( "cobra1" );
cobra2 = spawn_vehicle_from_targetname( "cobra2" );
cobra1 thread mgon();
cobra2 thread mgon();
cobra1 thread cobra_flightplan();
cobra2 thread cobra_flightplan();
musicStop( 1.9 );
wait 2;
MusicPlayWrapper( "bog_a_victory" );
radio_dialogue_queue( "cominhot" );
wait 2;
radio_dialogue_queue( "standby" );
}
cobra_sequence_reminder()
{
level endon( "beacon_planted" );
n = 0;
while ( 1 )
{
wait 40;
if( n == 0 )
{
radio_dialogue_queue( "buttonedup" );
}
else
if( n == 1 )
{
radio_dialogue_queue( "whereistheairsupport" );
}
else
if( n == 2 )
{
radio_dialogue_queue( "canttakebuilding" );
}
else
if( n == 3 )
{
radio_dialogue_queue( "rippingusapart" );
}
else
if( n == 4 )
{
radio_dialogue_queue( "plantbeacon" );
n = 0;
}
n++ ;
}
}
cobra_flightplan()
{
speed = 50;
yawAccel = 25;
self setspeed( speed, 50 );
self setyawspeed( 45, yawAccel );
self setmaxpitchroll( 25, 50 );
self sethoverparams( 128 );
pathpoint = undefined;
if ( isdefined( self.target ) )
pathpoint = getent( self.target, "targetname" );
else
assertmsg( "helicopter without target" );
pathpoints = [];
while ( isdefined( pathpoint ) )
{
pathpoints[ pathpoints.size ] = pathpoint;
if ( isdefined( pathpoint.target ) )
pathpoint = getent( pathpoint.target, "targetname" );
else
break;
}
hoverwait = 0;
attackPattern = "alpha";
radius = 256;
accel = 20;
decel = 20;
for ( i = 0; i < pathpoints.size; i++ )
{
engageDelay = 0;
waypoint = pathpoints[ i ];
if ( isdefined( waypoint.radius ) )
radius = waypoint.radius;
self setNearGoalNotifyDist( radius );
if ( isdefined( waypoint.script_engageDelay ) )
engageDelay = waypoint.script_engageDelay;
if ( isdefined( waypoint.script_attackPattern ) )
attackPattern = waypoint.script_attackPattern;
if ( isdefined( waypoint.script_engage ) )
self thread cobra_fire( engageDelay, attackPattern );
if ( isdefined( waypoint.script_pilottalk ) )
flag_set( "pilot_final_dialogue" );
if ( isdefined( waypoint.script_hoverwait ) )
{
hoverwait = waypoint.script_hoverwait;
wait hoverwait;
hoverwait = 0;
}
if ( isdefined( waypoint.script_airspeed ) )
speed = waypoint.script_airspeed;
if ( isdefined( waypoint.script_accel ) )
accel = waypoint.script_accel;
if ( isdefined( waypoint.script_decel ) )
self setspeed( speed, accel, waypoint.script_decel );
else
self setspeed( speed, accel );
if ( isdefined( waypoint.script_yawspeed ) )
self setyawspeed( waypoint.script_yawspeed, yawAccel );
if ( isdefined( waypoint.script_forceyaw ) )
self settargetyaw( waypoint.angles[ 1 ] );
if ( isdefined( waypoint.script_cleartargetyaw ) )
self cleartargetyaw();
stop = false;
if ( isdefined( pathpoints[ i ].script_stopnode ) )// z: stop at nodes if there is a script_stopnode = 1 value
stop = pathpoints[ i ].script_stopnode;
self setvehgoalpos( pathpoints[ i ].origin, stop );
self waittill( "near_goal" );
}
}
cobra_fire( delay, pattern )
{
wait delay;
switch( pattern )
{
case "alpha":
eTarget = getent( "ffar_1001", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1001 );
killTrigs = getentarray( "finalBldgKillSpawn", "targetname" );
for ( i = 0; i < killTrigs.size; i++ )
{
trig = killTrigs[ i ];
trig notify( "trigger" );
}
aFinalGuys = [];
aFinalGuys = getentarray( "finalBldgGuys", "script_noteworthy" );
for ( i = 0; i < ( aFinalGuys.size / 2 ); i++ )
{
guy = aFinalGuys[ i ];
guy doDamage( guy.health + 5000, guy.origin );
}
wait 0.5;
flag_set( "final_bldg_fired_upon" );
eTarget = getent( "ffar_1002", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1002 );
eTarget = getent( "ffar_1003", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1003 );
if ( !flag( "clipped_off_dest" ) )
{
flag_set( "clipped_off_dest" );
}
break;
case "gamma":
eTarget = getent( "ffar_1008", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1008 );
break;
case "delta":
eTarget = getent( "ffar_1000", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1000 );
wait 2;
eTarget = getent( "ffar_1004", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1004 );
wait 2;
eTarget = getent( "ffar_1005", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 1, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1005 );
break;
case "zeta":
eTarget = getent( "ffar_1007", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1007 );
wait 3;
eTarget = getent( "ffar_1006", "targetname" );
self maps\_helicopter_globals::fire_missile( "ffar_bog_a_lite", 2, eTarget );
self thread cobra_missile_fired_earthquake();
thread cobra_building_damage_fx( 1006 );
break;
}
}
cobra_building_damage_fx( number )
{
wait 0.2;
exploder( number );
}
cobra_missile_fired_earthquake()
{
earthquake( 0.3, 1.0, self.origin, 4000 );
}
tank_defense_enforcement()
{
desertionWarnTrig = getent( "tank_defense_warning", "targetname" );
desertionFailTrig = getent( "tank_defense_failed", "targetname" );
desertionWarnTrig thread tank_defense_warning();
desertionFailTrig thread tank_defense_failure();
}
tank_defense_warning()
{
level endon( "zpu_speech_started" );
level endon( "tank_was_overrun" );
level endon( "tank_defense_completed" );
i = 0;
j = 0;
while ( !flag( "zpu_speech_started" ) )
{
self waittill( "trigger" );
switch( i )
{
case 0:
radio_dialogue_queue( "dangeroverrun" );
break;
case 1:
radio_dialogue_queue( "jacksonawol" );
break;
case 2:
radio_dialogue_queue( "fallbacktank" );
break;
}
wait 20;
i++ ;
if ( i > 2 )
{
i = 0;	// reset warning dialogue to recycle
j++ ;	// player is messing around with the situation so the mission fails anyway after enough cycles
}
if ( j == 2 )
thread tank_destruction();
}
}
tank_defense_failure()
{
level endon( "zpu_speech_started" );
level endon( "tank_defense_completed" );
self waittill( "trigger" );
thread tank_destruction();
}
tank_setup()
{
tank_path = getVehicleNode( self.target, "targetname" );
self attachPath( tank_path );
self startPath();
}
tank_turret_slewing()
{
level endon( "abrams_stop_slewing_turret" );
self endon( "death" );
aDummyTargets = [];
aDummyTargets = getentarray( "abrams_targetref", "targetname" );
assert( aDummyTargets.size > 2 );
i = randomint( aDummyTargets.size );
j = i + 1;
cycleCount = 0;
while ( 1 )
{
if ( i == j )
{
wait 1;
i = randomint( aDummyTargets.size );
continue;
}
else
{
self setturrettargetent( aDummyTargets[ i ] );
self waittill( "turret_on_target" );
wait randomfloatrange( 1, 2 );
cycleCount++ ;
if ( cycleCount == 2 )
{
wait randomfloatrange( 3, 5 );
cycleCount = 0;
}
}
j = i;
i = randomint( aDummyTargets.size );
}
}
tank_destruction()
{
level endon( "tank_defense_completed" );
level notify( "tank_was_overrun" );
thread tank_missionfailure();
play_sound_in_space( "generic_meleecharge_arab_6", level.abrams.origin );
level.player playsound( "explo_mine" );
playfx( level.tankExplosion_fx, level.abrams.origin );
earthquake( 0.5, 2, level.player.origin, 1250 );
radiusDamage( level.abrams.origin, 512, 100500, 100500 );
}
tank_missionfailure()
{
wait 2.25;
setDvar( "ui_deadquote", &"BOG_A_THE_TANK_WAS_OVERRUN" );
maps\_utility::missionFailedWrapper();
}
zpu_battle_init()
{
flag_wait( "zpu_orders_given" );
flag_set( "zpu_battle_started" );
thread zpu_battle_friendly_advance();
zpuBadPlace = getnode( "zpu_badplace", "targetname" );
badplace_cylinder( "zpuNoAllies", -1, zpuBadPlace.origin, zpuBadPlace.radius, zpuBadPlace.height, "allies" );
zpuBattleSeedTrig = getent( "zpu_battle_seed", "targetname" );
wait 2;
zpuBattleSeedTrig notify( "trigger" );
}
zpu_battle_friendly_advance()
{
aTrigs = getentarray( "zpu_friendly_advance_trigger", "script_noteworthy" );
for ( i = 0; i < aTrigs.size; i++ )
{
aTrigs[ i ] thread zpu_battle_trigger_control();
}
}
zpu_battle_trigger_control()
{
self endon( "deleted" );
self waittill( "trigger" );
triggers = [];
oldTrigger = undefined;
if ( isdefined( self.target ) )
oldTrigger = getent( self.target, "targetname" );
while ( isdefined( oldTrigger ) )
{
triggers[ triggers.size ] = oldTrigger;
if ( isdefined( oldTrigger.target ) )
oldTrigger = getent( oldTrigger.target, "targetname" );
else
break;
}
for ( i = 0; i < triggers.size; i++ )
{
trig = triggers[ i ];
trig notify( "deleted" );
trig delete();
}
}
zpu_c4()
{
zpu = getent( "zpu", "targetname" );
zpu maps\_c4::c4_location( "tag_c4", (0,0,0), (0,0,0) );
zpu waittill( "c4_detonation" );
zpu notify( "death" );
playfx( level.tankExplosion_fx, zpu.origin );
thread play_sound_in_space( "bog_aagun_explode", zpu.origin );
zpu setmodel( "vehicle_zpu4_burn" );
radiusDamage( zpu.origin + ( 0, 0, 96 ), level.zpuBlastRadius, 1000, 50 );
arcadeMode_kill( zpu.origin, "explosive", 2000 );
flag_set( "zpus_destroyed" );
abrams_gets_drawing();
}
zpu_dialogue()
{
trig = getent( "plantc4_dialogue", "targetname" );
trig waittill( "trigger" );
flag_set( "activate_final_bldg" );
node = getnode( "zpuTalkingFriendly", "targetname" );
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
guy = getclosest( node.origin, allies );
guy thread magic_bullet_shield();
guy.animname = "marine";
guy thread anim_single_queue( guy, "plantc4" );
level waittill( "c4_in_place" );
thread zpu_interface();
autosave_by_name( "zpu_c4_planted" );
guy anim_single_queue( guy, "goodjob" );
zpu = getent( "zpu", "targetname" );
dist = length( level.player.origin - zpu.origin );
while ( dist <= ( level.zpuBlastRadius * 1.05 ) )
{
dist = length( level.player.origin - zpu.origin );
wait 0.05;
}
if ( !flag( "zpus_destroyed" ) )
{
guy anim_single_queue( guy, "jacksondoit" );
}
guy stop_magic_bullet_shield();
}
dont_show_C4_hint()
{
if ( flag( "zpus_destroyed" ) )
return false;
weapon = level.player getcurrentweapon();
return ( weapon == "c4" );
}
zpu_interface()
{
level endon( "zpus_destroyed" );
wait 2;
thread display_hint( "c4_use" );
}
dialogue()
{
if ( !flag( "tank_defense_completed" ) )
{
thread dialogue_south_tank_attack();
trig = getent( "backhalf_dialogue", "targetname" );
trig waittill( "trigger" );
radio_dialogue_queue( "alphasixstatus" );
battlechatter_on( "allies" );
battlechatter_on( "axis" );
radio_dialogue_queue( "stillsurrounded" );
radio_dialogue_queue( "maingunsoffline" );
}
flag_wait( "tank_defense_completed" );
if ( !flag( "zpus_destroyed" ) )
{
thread zpu_player_followers();
radio_dialogue_queue( "morewest" );
level.price anim_single_queue( level.price, "twocharliebravosix" );
flag_set( "zpu_speech_started" );
radio_dialogue_queue( "negativebravo" );
flag_set( "zpu_orders_given" );
level.price anim_single_queue( level.price, "jacksonfindzpu" );
radio_dialogue_queue( "securewest" );
wait 2;
level.scr_sound[ "price" ][ "letsmoveout" ]				 = "bog_a_pri_letsmoveout";
}
flag_wait( "pilot_final_dialogue" );
ai = getaiarray( "axis" );
array_thread( ai, ::die );
spawners = getspawnerteamarray( "axis" );
array_thread( spawners, ::self_delete );
radio_dialogue_queue( "seeanyoneleft" );
wait 0.5;
radio_dialogue_queue( "negative" );
wait 0.3;
radio_dialogue_queue( "alltargetsdestroyed" );
set_vision_set( "bog_a_sunrise", 90 );
wait 3;
level.price anim_single_queue( level.price, "lzissecure" );
wait 0.15;
flag_set( "cobra_success" );
thread ending_sequence();
level notify( "abrams_stop_slewing_turret" );
radio_dialogue_queue( "goodworkout" );
level.mark.animname = "left_guy";
level.mark anim_single_queue( level.mark, "regroupattank" );
}
abrams_gets_drawing()
{
level.abrams setmodel( getmodel( "tank_draw" ) );
level.vtmodel = getmodel( "tank_draw" );
level.abrams build_exhaust( "distortion/abrams_exhaust" );
level.abrams build_deckdust( "dust/abrams_desk_dust" );
}
zpu_player_followers()
{
thread promote_nearest_friendly( "c", "p" );
thread promote_nearest_friendly( "c", "p" );
}
ending_sequence()
{
level.price make_hero();
allies = getaiarray( "allies" );
allies = remove_heroes_from_array( allies );
level.price.animname = "price";
allies[ 0 ].animname = "right_guy";
level.mark.animname = "left_guy";
extraGuys = [];
for ( i = 1; i < allies.size; i++ )
{
extraGuys[ extraGuys.size ] = allies[ i ];
}
thread schoolcircle( "schoolcircle", extraGuys );
team = [];
team[ team.size ] = level.price;
team[ team.size ] = allies[ 0 ];
team[ team.size ] = level.mark;
org = spawn( "script_origin", ( 0, 0, 0 ) );
org.origin = level.abrams.origin;
org.angles = level.abrams.angles;
{
org anim_teleport( team, "tank_talk" );
}
org anim_reach_and_idle( team, "tank_talk", "tank_talk_idle", "stop_loop" );
while ( distance( level.player.origin, org.origin ) > 220 )
{
wait( 0.05 );
}
flag_set( "reached_ending_area" );
level notify( "segment4_stop" );
thread sectionUpdatePBLastLevelSeg();
org notify( "stop_loop" );
level.price thread new_goal_at_scene_end();
org thread anim_single( team, "tank_talk" );
wait( 14.95 );
objective_state( 1, "done" );
nextmission();
}
new_goal_at_scene_end()
{
self waittillend( "single anim" );
self setgoalpos( self.origin );
self.goalradius = 0;
self.walkdist = 15010;
}
dialogue_south_tank_attack()
{
trig = undefined;
aTrigs = getentarray( "flood_spawner", "targetname" );
for ( i = 0; i < aTrigs.size; i++ )
{
if ( !isdefined( aTrigs[ i ].script_noteworthy ) )
continue;
if ( aTrigs[ i ].script_noteworthy == "south_tank_attack_wave" )
{
trig = aTrigs[ i ];
break;
}
}
if ( isdefined( trig ) )
trig waittill( "trigger" );
wait( 4 );
radio_dialogue_queue( "contactseast" );
}
heroShield()
{
hero_spawners = getentarray( "hero", "script_noteworthy" );
array_thread( hero_spawners, ::add_spawn_function, ::hero );
}
hero()
{
self thread magic_bullet_shield();
self.IgnoreRandomBulletDamage = true;
}
schoolcircle( nodename, guys )
{
nodearray = getnodearray( nodename, "targetname" );
assertEX( nodearray.size >= guys.size, "You have more guys than nodes for them to go to." );
for ( i = 0; i < guys.size; i++ )
{
guys[ i ] thread schoolcircle_nav( nodearray, i );
}
}
schoolcircle_nav( nodearray, i )
{
self endon( "death" );
wait 2.5;	// soft wait to avoid traffic jams w / leader
self setgoalnode( nodearray[ i ] );
self.goalradius = 32;
self.dontavoidplayer = true;
self allowedstances( "stand" );
if ( !isdefined( nodearray[ i ].script_noteworthy ) )
return;
if ( nodearray[ i ].script_noteworthy == "kneel" )
thread schoolcircle_crouch( self );
}
schoolcircle_crouch( soldier )
{
soldier waittill( "goal" );
soldier allowedstances( "crouch" );
}