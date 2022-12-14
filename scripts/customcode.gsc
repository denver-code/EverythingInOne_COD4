#include common_scripts\utility;
#include maps\_utility;
#include maps\_utility_code;
#include maps\_hud_util;
set_hud_white( new_alpha )
{
if ( isdefined( new_alpha ) )
{
self.alpha = new_alpha;
self.glowAlpha = new_alpha;
}
self.color = ( 1, 1, 1 );
self.glowcolor = ( 0.6, 0.6, 0.6 );
}
chaos_so_create_hud_item( xoff, yoff, message, player, always_draw )
{
if ( isdefined( player ) )
assertex( isplayer( player ), "so_create_hud_item() received a value for player that did not pass the isplayer() check." );
// This is to globally shift all the SOs down by two lines to help with overlap with the objective and help text.
hudelem = undefined;
hudelem = newHudElem();
hudelem.alignX = "right";
hudelem.alignY = "middle";
hudelem.horzAlign = "right";
hudelem.vertAlign = "middle";
hudelem.x = -748 + xoff;
hudelem.y = -221 + yoff;
hudelem.font = "default";
hudelem.fontscale = 1.7;
hudelem.foreground = 1;
hudelem.hidewheninmenu = true;
hudelem.hidewhendead = true;
hudelem.sort = 2;
hudelem set_hud_white();
if ( isdefined( message ) )
hudelem.label = message;
return hudelem;
}
so_create_hud_item2( yLine, xOffset, message, player, customy, always_draw )
{
if ( isdefined( player ) )
assertex( isplayer( player ), "so_create_hud_item() received a value for player that did not pass the isplayer() check." );
if ( !isdefined( yLine ) )
yLine = 0;
if ( !isdefined( xOffset ) )
xOffset = 0;

timerglow = GetDvarInt( "timerglow" );

// This is to globally shift all the SOs down by two lines to help with overlap with the objective and help text.
yLine += 2;
hudelem = undefined;
hudelem = newHudElem();
hudelem.alignX = "center";
hudelem.alignY = "middle";
hudelem.horzAlign = "center";
hudelem.vertAlign = "middle";
hudelem.x = xOffset;
hudelem.y = customy + ( 15 * yLine );
hudelem.color = ( 1, 1, 1 );
colorcode = "";
if( timerglow == 1 )
{
	color = GetDvar( "timerglowcolor" );
	if( color == "Blue" )
		colorcode = ( 0, 0, 1 );
	if( color == "Red" )
		colorcode = ( 1, 0, 0 );
	if( color == "Green" )
		colorcode = ( 0, 1, 0 );
	if( color == "Aqua" )
		colorcode = ( 0, 1, 1 );
	if( color == "Pink" )
		colorcode = ( 1, 0.41, 0.71 );
	if( color == "Yellow" )
		colorcode = ( 1, 1, 0 );
	if( color == "Orange" )
		colorcode = ( 1, 0.65, 0 );
	hudelem.glowcolor = colorcode;
	hudelem.glowAlpha = 0.7;
}
hudelem.font = "default";
hudelem.fontscale = 1.7;
hudelem.foreground = 1;
hudelem.hidewheninmenu = true;
hudelem.hidewhendead = true;
hudelem.sort = 999;
// hudelem set_hud_white();
if ( isdefined( message ) )
hudelem.label = message;
return hudelem;
}
so_create_hud_item3( yLine, xOffset, message, player, customy, always_draw )
{
if ( isdefined( player ) )
assertex( isplayer( player ), "so_create_hud_item() received a value for player that did not pass the isplayer() check." );
if ( !isdefined( yLine ) )
yLine = 0;
if ( !isdefined( xOffset ) )
xOffset = 0;
// This is to globally shift all the SOs down by two lines to help with overlap with the objective and help text.
yLine += 2;
hudelem = undefined;
hudelem = newHudElem();
hudelem.alignX = "center";
hudelem.alignY = "middle";
hudelem.horzAlign = "center";
hudelem.vertAlign = "middle";
hudelem.x = xOffset;
hudelem.y = customy + ( 15 * yLine );
hudelem.font = "default";
hudelem.fontscale = 1.7;
hudelem.foreground = 1;
hudelem.hidewheninmenu = true;
hudelem.hidewhendead = true;
hudelem.sort = 2;
hudelem set_hud_white();
if ( isdefined( message ) )
hudelem.label = message;
return hudelem;
}

so_create_hud_item( xoff, yoff, message, player, fontscale )
{
if ( isdefined( player ) )
assertex( isplayer( player ), "so_create_hud_item() received a value for player that did not pass the isplayer() check." );
hudelem = undefined;
hudelem = newHudElem();
hudelem.alignX = "right";
hudelem.alignY = "middle";
hudelem.horzAlign = "right";
hudelem.vertAlign = "middle";
hudelem.x = -785 + xoff;
hudelem.y = -233 + yoff;
hudelem.font = "default";
hudelem.fontscale = fontscale;
hudelem.foreground = 1;
hudelem.hidewheninmenu = true;
hudelem.hidewhendead = true;
hudelem.sort = 2;
hudelem set_hud_white();
if ( isdefined( message ) )
hudelem.label = message;
return hudelem;
}
enable_velo()
{
if( GetDvarInt( "enablevmeter" ) == 0 )
{
while ( true )
{
wait 60;
}
}
diffi = "";
xpos = GetDvarFloat( "customhudx" );
if( xpos < 786 && xpos > -1 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "customhudy" );
if( ypos > -1 && ypos < 434 )
{
wait 0.1;
}
else
{
ypos = 0;
}
customfontscale = GetDvarFloat( "customfontscale" );
if( customfontscale > 0.99 && customfontscale < 2.01 )
{
wait 0.1;
}
else
{
customfontscale = 1.7;
}
self.hud_difficulty_msg = so_create_hud_item( xpos, ypos + customfontscale * 15, "Difficulty: ", self, customfontscale );
self.hud_difficulty_value = so_create_hud_item( xpos, ypos + customfontscale * 15, diffi, self, customfontscale );
self.hud_difficulty_value.alignX = "left";
vel = "";
self.hud_velocity_msg = so_create_hud_item( xpos, ypos + customfontscale * 7.5, "Velocity: ", self, customfontscale );
self.hud_velocity_value = so_create_hud_item( xpos, ypos + customfontscale * 7.5, vel, self, customfontscale );
self.hud_velocity_value.alignX = "left";
frames = "";
self.hud_fps_msg = so_create_hud_item( xpos, ypos, "FPS: ", self, customfontscale );
self.hud_fps_value = so_create_hud_item( xpos, ypos, frames, self, customfontscale );
self.hud_fps_value.alignX = "left";
thread fpsColorShift( self.hud_fps_msg );
while( true )
{
difficulty_tracker( self.hud_difficulty_value, self.hud_velocity_value, self.hud_fps_value );
}
}
difficulty_tracker( hud_difficulty, hud_velocity, hud_fps )
{
wait 0.005;
vel = level.player GetVelocity();
velocity = Distance( ( vel[ 0 ], vel[ 1 ], 0 ), ( 0, 0, 0 ) );
if ( velocity < 330 )
{
hud_velocity.color = ( 0.6, 1, 0.6 );
hud_velocity.glowcolor = ( 0.4, 0.7, 0.4 );
}
else if ( velocity <= 340 )
{
hud_velocity.color = ( 0.8, 1, 0.6 );
hud_velocity.glowcolor = ( 0.6, 0.7, 0.4 );
}
else if ( velocity <= 350 )
{
hud_velocity.color = ( 1, 1, 0.6 );
hud_velocity.glowcolor = ( 0.7, 0.7, 0.4 );
}
else if ( velocity <= 360 )
{
hud_velocity.color = ( 1, 0.8, 0.4 );
hud_velocity.glowcolor = ( 0.7, 0.6, 0.2 );
}
else if ( velocity <= 370 )
{
hud_velocity.color = ( 1, 0.6, 0.2 );
hud_velocity.glowcolor = ( 0.7, 0.4, 0.1 );
}
else if ( velocity <= 380 )
{
hud_velocity.color = ( 1, 0.2, 0 );
hud_velocity.glowcolor = ( 0.7, 0.1, 0 );
}
else
{
hud_velocity.color = ( 0.6, 0, 0 );
hud_velocity.glowcolor = ( 0.3, 0, 0 );
}
if ( GetDvar( "g_gameskill" ) == "0" )
{
hud_difficulty.label = "Recruit";
hud_difficulty.color = ( 0.6, 1, 0.6 );
hud_difficulty.glowcolor = ( 0.4, 0.7, 0.4 );
}
if ( GetDvar( "g_gameskill" ) == "1" )
{
hud_difficulty.label = "Regular";
hud_difficulty.color = ( 1, 1, 0.5 );
hud_difficulty.glowcolor = ( 0.7, 0.7, 0.2 );
}
if ( GetDvar( "g_gameskill" ) == "2" )
{
hud_difficulty.label = "Hardened";
hud_difficulty.color = ( 0.8, 0.4, 0 );
hud_difficulty.glowcolor = ( 0.6, 0.2, 0 );
}
if ( GetDvar( "g_gameskill" ) == "3" )
{
hud_difficulty.label = "Veteran";
hud_difficulty.color = ( 1, 0.4, 0.4 );
hud_difficulty.glowcolor = ( 0.7, 0.2, 0.2 );
}
fps = GetDvarInt( "com_maxfps" );
if( fps > 250 )
{
hud_fps setText( "Over 250" );
hud_fps.color = ( 1, 0.4, 0.4 );
hud_fps.glowcolor = ( 0.7, 0.2, 0.2 );
}
if( fps == 0 )
{
hud_fps setText( "Uncapped" );
hud_fps.color = ( 1, 0.4, 0.4 );
hud_fps.glowcolor = ( 0.7, 0.2, 0.2 );
}
if( fps > 0 && fps < 251 )
{
hud_fps setText( fps );
hud_fps.color = ( 0.6, 1, 0.6 );
hud_fps.glowcolor = ( 0.4, 0.7, 0.4 );
}
if( GetDvarInt( "enablevelodecimals" ) == 0 )
	velocity = Int( velocity );

hud_velocity setValue( velocity );
}
fpsColorShift( hud_fps_msg )
{
while( true )
{
hud_fps_msg.color = ( 1, 1, 1 );
wait 0.08;
hud_fps_msg.color = ( 1, 0.8, 0.9 );
wait 0.08;
hud_fps_msg.color = ( 1, 0.7, 0.7 );
wait 0.08;
hud_fps_msg.color = ( 1, 0.8, 0.7 );
wait 0.08;
hud_fps_msg.color = ( 1, 1, 0.8 );
wait 0.08;
hud_fps_msg.color = ( 0.9, 1, 0.8 );
wait 0.08;
hud_fps_msg.color = ( 0.8, 1, 0.8 );
wait 0.08;
hud_fps_msg.color = ( 0.8, 1, 0.9 );
wait 0.08;
hud_fps_msg.color = ( 0.9, 1, 1 );
wait 0.08;
hud_fps_msg.color = ( 0.8, 0.9, 1 );
wait 0.08;
hud_fps_msg.color = ( 0.9, 0.8, 1 );
wait 0.08;
hud_fps_msg.color = ( 1, 0.8, 1 );
wait 0.08;
}
}
enable_randomizer()
{
chaosxpos = GetDvarFloat( "chaoscustomhudx" );
if( chaosxpos < 681 && chaosxpos > -1 )
{
wait 0.1;
}
else
{
chaosxpos = -100;
}
chaosypos = GetDvarFloat( "chaoscustomhudy" );
if( chaosypos > -1 && chaosypos < 421 )
{
wait 0.1;
}
else
{
chaosypos = 3;
}
thread enable_randomizer_setup( chaosxpos, chaosypos );
}
enable_randomizer_setup( chaosxpos, chaosypos )
{
time = "";
self.hud_weaptimer_msg = chaos_so_create_hud_item( chaosxpos, chaosypos, "Randomized in: ", self );
self.hud_weaptimer_value = chaos_so_create_hud_item( chaosxpos, chaosypos, time, self );
self.hud_weaptimer_value.alignX = "left";
startevent = 1;
shufflenegative = 1;
eventshufflenegative = 1;
thread setKillFunc();
levelmodifier = randomIntRange( 1, 6 );
if( levelmodifier > 4 )
{
levelmodifiershuffle = randomIntRange( 1, 4 );
if( levelmodifiershuffle == 1 )
{
startcolor = ( 0, 1, 0 );
text = "Level modifier: Ca$h.";
thread random_text4( text, startcolor );
self thread displayPoints();
}
if( levelmodifiershuffle == 2 )
{
startcolor = ( 0, 1, 0 );
text = "Level modifier: Berserker!";
thread random_text4( text, startcolor );
level.player thread Berserker();
}
if( levelmodifiershuffle == 3 )
{
startcolor = ( 1, 0, 0 );
text = "Level modifier: Unstable arms.";
thread random_text4( text, startcolor );
thread AccuracyWorsensIfShot();
}
}
while ( true )
{
startevent = weapon_randomizer( self.hud_weaptimer_value, shufflenegative, eventshufflenegative, chaosxpos, chaosypos, startevent );
eventshufflenegative -= 1;
shufflenegative -= 1;
if ( shufflenegative == 0 )
shufflenegative = 30;
if ( eventshufflenegative == 0 )
{
eventshufflenegative = 30;
}
}
}
weapon_randomizer( hud_weaptimer, shuffletime, eventshuffletime, chaosxpos, chaosypos, begevent )
{
wait 1;
color = ( 1, 1, 1 );
hud_weaptimer setValue( shuffletime );
if ( shuffletime == 30 )
{
level notify( "floor_is_safe" );
level notify( "event_expired" );
SetTimeScale( 1 );
level.player TakeAllWeapons();
thread loadoutRoll();
level.player ResetSpreadOverride();
level notify( "thanos_ended" );
level notify( "fovads_ended" );
level notify( "bullettime_ended" );
level notify( "stop_flight" );
level notify( "snake_ended" );
level notify( "stop_fastboy" );
level notify( "stop_lagging" );
level notify( "reset_stopped" );
level.player GiveWeapon("flash_grenade");
level.player GiveWeapon("fraggrenade");
text = "Randomized!";
random_text( text, chaosxpos, chaosypos );
level.player AllowStand(true);
level.player AllowSprint(true);
level.player FreezeControls( false );
level.player setMoveSpeedScale( 1 );
SetTimeScale ( 1 );
}
if( eventshuffletime == 30 )
{
curmap = getDvar( "mapname" );
eventtype = randomintrange( 1, 11 );
level.player AllowJump(true);
SetSavedDvar( "player_sustainAmmo", 0 );
SetSavedDvar( "bg_viewkickscale", 0.8 );
if( eventtype == 1 )
{
thread SeverePunishment( curmap );
begevent = 0;
}
if( eventtype > 1 && eventtype < 10 )
{
thread Common( begevent, curmap );
begevent = 0;
}
if( eventtype > 9 )
{
thread GreatAssistance( curmap );
begevent = 0;
}
}
return begevent;
}
random_text( label, xpos, ypos )
{
display_time = 3000;
fade_time = 700;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = ( 0.0, 0.7, 0.73 );
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary( xpos );
remaining_print.y = -233 + ypos;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( label );
wait 0.1;
}
random_text2( label, textcolor )
{
display_time = 4500;
fade_time = 700;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = textcolor;
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary2();
remaining_print.y = -60;
remaining_print.sort = 999;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( label );
wait 0.1;
}
random_text3( label, textcolor )
{
display_time = 3000;
fade_time = 700;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = textcolor;
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary2();
remaining_print.y = -90;
remaining_print.sort = 999;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( label );
wait 0.1;
}
random_text4( label, textcolor )
{
display_time = 4500;
fade_time = 700;
wait 8;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = textcolor;
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary2();
remaining_print.y = -90;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( label );
wait 0.1;
}
random_text5( label, textcolor, xOffset, customy )
{
display_time = 4500;
fade_time = 700;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = textcolor;
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary2();
remaining_print.alignX = "left";
remaining_print.alignY = "middle";
remaining_print.horzAlign = "center";
remaining_print.vertAlign = "middle";
remaining_print.x = xOffset - 136;
remaining_print.y = customy + ( -7 * 15 );
remaining_print.sort = 999;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( "Pace against PB: " + label );
wait 0.1;
}
random_text6( label, textcolor )
{
display_time = 10000;
fade_time = 700;
remaining_print = createFontString( "objective", 1.3 );
remaining_print.glowColor = textcolor;
remaining_print.glowAlpha = 1;
remaining_print setup_hud_elem_secondary2();
remaining_print.y = 0;
remaining_print.sort = 999;
remaining_print SetPulseFX( 60, display_time, fade_time );
remaining_print SetText ( label );
wait 0.1;
}
setup_hud_elem_secondary( xpos )
{
self.color = ( 0, 0.9, 0.93 );
self.alpha = 1;
self.x = -748 + xpos;
self.alignX = "right";
self.alignY = "middle";
self.horzAlign = "right";
self.vertAlign = "middle";
self.foreground = true;
}
setup_hud_elem_secondary2()
{
self.color = ( 1, 1, 1 );
self.alpha = 1;
self.x = 0;
self.alignx = "center";
self.aligny = "middle";
self.horzAlign = "center";
self.vertAlign = "middle";
self.foreground = true;
}
setup_hud_elem_secondary3()
{
self.color = ( 1, 1, 1 );
self.alpha = 0;
self.alignx = "left";
self.aligny = "middle";
self.horzAlign = "right";
self.vertAlign = "middle";
self.foreground = true;
}
setup_hud_elem_secondary4()
{
self.color = ( 1, 1, 1 );
self.alpha = 0;
self.alignx = "center";
self.aligny = "top";
self.horzAlign = "center";
self.vertAlign = "top";
self.foreground = true;
}
grenade_death_indicator_hudelement2()
{
overlay2 = NewHudElem();
overlay2.x = 0;
overlay2.y = -72;
overlay2 SetShader( "hud_grenadepointer", 24, 12 );
overlay2.alignX = "center";
overlay2.alignY = "middle";
overlay2.horzAlign = "center";
overlay2.vertAlign = "middle";
overlay2.foreground = true;
overlay2.alpha = 1;
while( true )
{
overlay2 FadeOverTime( 0.08 );
overlay2.alpha = 0.1;
wait 0.08;
overlay2 FadeOverTime( 0.08 );
overlay2.alpha = 1;
wait 0.25;
}
}
grenade_death_indicator_hudelement3()
{
overlay = NewHudElem();
overlay.x = 0;
overlay.y = -50;
overlay SetShader( "hud_grenadeicon", 25, 25 );
overlay.alignX = "center";
overlay.alignY = "middle";
overlay.horzAlign = "center";
overlay.vertAlign = "middle";
overlay.foreground = true;
overlay.alpha = 1;
while( true )
{
overlay FadeOverTime( 0.08 );
overlay.alpha = 0.1;
wait 0.08;
overlay FadeOverTime( 0.08 );
overlay.alpha = 1;
wait 0.25;
}
}
gamespeed_set( speed, refspeed, lerp_time )
{
self notify("gamespeed_set");
self endon("gamespeed_set");
//we're going to calculate the time to lerp to the new speed
//if we dont define a time then we want to know how long it should
//take from our current speed to lerp to the default normal or slowmo
//this way if the player wants to come out of slowmo before he's finishing
//going in, it only takes a fraction of time to come out instead taking
//the same ammount as if he was all the way into slow mo.
default_range 	= ( speed - refspeed );
actual_range 	= ( speed - self.speed_current );
actual_rangebytime = actual_range * lerp_time;
if( !default_range )
return;
time 			= ( actual_rangebytime / default_range );
interval 		= self.lerp_interval; // serverframe
cycles 			= int( time / interval );
if(!cycles)
cycles = 1;
increment 		= ( actual_range / cycles );
self.lerping 	= time;
while(cycles)
{
self.speed_current += increment;
settimescale( self.speed_current );
//println( self.speed_current );
cycles--;
self.lerping -= interval;
wait interval;
}
self.speed_current = speed;
settimescale( self.speed_current );
//println( self.speed_current );
self.lerping = 0;
}
gamespeed_slowmo()
{
gamespeed_set( self.speed_slow, self.speed_norm, self.lerp_time_in );
}
gamespeed_reset()
{
gamespeed_set( self.speed_norm, self.speed_slow, self.lerp_time_out );
}
create_clusterGrenade2()
{
prevorigin = self.origin;
prevorigin += (0,0,80);
numSecondaries = 14;
aiarray = getaiarray();
if ( aiarray.size == 0 )
return;
ai = undefined;
for ( i = 0; i < aiarray.size; i++ )
{
if ( aiarray[i].team == "allies" )
{
ai = aiarray[i];
break;
}
}
if ( !isdefined( ai ) )
ai = aiarray[0];
oldweapon = ai.grenadeweapon;
ai.grenadeweapon = "fraggrenade";
for ( i = 0; i < numSecondaries; i++ )
{
velocity = getClusterGrenadeVelocity2();
timer = 3;
ai magicGrenadeManual( prevorigin, velocity, timer );
}
ai.grenadeweapon = oldweapon;
}
create_BlueNade()
{
prevorigin = self.origin;
prevorigin += (0,0,20);
numSecondaries = 1;
aiarray = getaiarray();
if ( aiarray.size == 0 )
return;
ai = undefined;
for ( i = 0; i < aiarray.size; i++ )
{
if ( aiarray[i].team == "allies" )
{
ai = aiarray[i];
break;
}
}
if ( !isdefined( ai ) )
ai = aiarray[0];
oldweapon = ai.grenadeweapon;
ai.grenadeweapon = "fraggrenade";
for ( i = 0; i < numSecondaries; i++ )
{
velocity = ( 0, 0, 0 );
timer = 2.5;
ai magicGrenadeManual( prevorigin, velocity, timer );
}
ai.grenadeweapon = oldweapon;
}
create_clusterFlash()
{
prevorigin = self.origin;
prevorigin += (0,0,40);
numSecondaries = 14;
aiarray = getaiarray();
if ( aiarray.size == 0 )
return;
ai = undefined;
for ( i = 0; i < aiarray.size; i++ )
{
if ( aiarray[i].team == "allies" )
{
ai = aiarray[i];
break;
}
}
if ( !isdefined( ai ) )
ai = aiarray[0];
oldweapon = ai.grenadeweapon;
ai.grenadeweapon = "flash_grenade";
for ( i = 0; i < numSecondaries; i++ )
{
velocity = getClusterGrenadeVelocity2();
timer = 0.3;
ai magicGrenadeManual( prevorigin, velocity, timer );
}
ai.grenadeweapon = oldweapon;
}
getClusterGrenadeVelocity2()
{
yaw = randomFloat( 360 );
pitch = randomFloatRange( 65, 85 );
amntz = sin( pitch );
cospitch = cos( pitch );
amntx = cos( yaw ) * cospitch;
amnty = sin( yaw ) * cospitch;
speed = randomFloatRange( 400, 600); // play with these values
velocity = (amntx, amnty, amntz) * speed;
return velocity;
}
Thanos()
{
level endon( "thanos_ended" );
while( true )
{
if( level.player IsMeleeing() )
{
aiarray = GetAIArray( "axis" );
for( i = 0; i < aiarray.size; i++ )
{
guy = aiarray[i];
guy Delete();
}
}
wait 0.05;
}
}
EnemiesHaveGod()
{
level endon( "stop_enemygod" );
thread EnemiesHaveGod_timer();
while( true )
{
aiarray = GetAIArray( "axis" );
for( i = 0; i < aiarray.size; i++ )
{
guy = aiarray[i];
guy.health = 50000;
}
wait 0.05;
}
}
ChooseEvent()
{
level endon( "event_expired" );
color = ( 255, 0, 0 );
while ( true )
{
if( level.player GetStance() == "prone" )
{
text = "Movement speed granted.";
random_text3 ( text, color );
level.player setMoveSpeedScale( 1.5 );
wait 15;
text = "Effect wore off!";
random_text3 ( text, color );
level.player setMoveSpeedScale( 1.0 );
break;
}
if( level.player IsMeleeing() )
{
text = "God mode granted.";
random_text3 ( text, color );
level.player EnableInvulnerability();
wait 15;
text = "Effect wore off!";
random_text3 ( text, color );
level.player DisableInvulnerability();
break;
}
wait 0.05;
}
}
FOVWhileADS()
{
level endon( "fovads_ended" );
fov = GetDvar( "cg_fov" );
ticks = 0;
while( true )
{
if( level.player PlayerAds() > 0.9 )
{
SetSavedDvar( "cg_fov", 10 );
}
else
{
SetSavedDvar( "cg_fov", fov );
}
wait 0.05;
ticks += 0.05;
if( ticks > 29.5 )
{
SetSavedDvar( "cg_fov", fov );
wait 2;
}
}
}
EnemiesAreAccurate()
{
for( i = 0; i < 30; i++ )
{
aiarray = GetAIArray( "axis" );
for( j = 0; j < aiarray.size; j++ )
{
guy = aiarray[i];
guy.baseAccuracy = 2000;
}
wait 1;
}
aiarray = GetAIArray( "axis" );
for( k = 0; k < aiarray.size; k++ )
{
guy = aiarray[i];
guy.baseAccuracy = 0.2;
}
}
BulletTime()
{
level endon( "bullettime_ended" );
while ( true )
{
if( level.player PlayerAds() > 0.95 )
{
level.slowmo thread gamespeed_set( 0.3, 1, 0.3 );
}
else
{
level.slowmo thread gamespeed_set( 1, 0.3, 0.3 );
}
wait 0.05;
}
}
NotOnGround()
{
map = GetDvar( "mapname" );
for( i = 0; i < 3; i++ )
{
time = "";
self.hud_jumptimer_msg = so_create_hud_item3( 7, 0, "The ground will kill you in: ", self );
self.hud_jumptimer_value = so_create_hud_item3( 7, 86, time, self );
self.hud_jumptimer_value.alignX = "left";
timer = 100;
while( true )
{
self.hud_jumptimer_value SetValue( timer / 10 );
if( timer <= 0 )
{
if( GetDvar( "sv_znear" ) == "100" && map == "sniperescape" )
{
text = "Softlock prevention.";
random_text2( text );
}
else if( level.player IsOnGround() )
{
level.player DoDamage( 99999, (0,0,0) );
text = "And you didn't...";
color = ( 255, 0, 0 );
random_text3( text, color );
}
self.hud_jumptimer_msg Destroy();
self.hud_jumptimer_value Destroy();
break;
}
timer -= 1;
wait 0.1;
}
if( GetDvar( "sv_znear" ) == "100" && map == "sniperescape" )
{
break;
}
}
}
FlyingPlayer()
{
level endon( "stop_flight" );
while( true )
{
while( level.player ButtonPressed( "space" ) )
{
level.player SetVelocity( level.player GetVelocity() + (0, 0, 60) );
wait 0.05;
}
wait 0.05;
}
}
SnakeMode()
{
level endon( "snake_ended" );
while ( true )
{
if( level.player GetStance() == "prone" )
level.player setMoveSpeedScale( 10 );
else
{
level.player setMoveSpeedScale( 1 );
}
wait 0.05;
}
}
PlayerIsMovingFast()
{
level endon( "stop_fastboy" );
speedboostincrement = 10 / 100;
while( true )
{
vel2 = level.player GetVelocity();
velocity2 = Distance( ( vel2[ 0 ], vel2[ 1 ], 0 ), ( 0, 0, 0 ) );
if( velocity2 > 200 )
{
level.player setMoveSpeedScale( speedboostincrement + 1 );
speedboostincrement = speedboostincrement * 1.1;
}
else
{
level.player setMoveSpeedScale( 1 );
speedboostincrement = 10 / 100;
}
wait 1;
}
}
GameLagging()
{
level endon( "stop_lagging" );
while ( true )
{
level.player FreezeControls( true );
wait 0.1;
level.player FreezeControls( false );
wait randomFloatRange( 0.2, 2 );
}
}
DeathThing()
{
thread death_reset_timer();
autosave_by_name( "death_awaits" );
map = getDvar( "mapname" );
level endon( "reset_stopped" );
SetSavedDvar( "player_meleeDamageMultiplier", 0.001 );
SetSavedDvar( "player_radiusDamageMultiplier", 0.02 );
SetSavedDvar( "player_deathInvulnerableTime", "50" );
level.player EnableInvulnerability();
wait 5;
level.player DisableInvulnerability();
while ( true )
{
SetSavedDvar( "player_meleeDamageMultiplier", 0.001 );
SetSavedDvar( "player_radiusDamageMultiplier", 0.02 );
SetSavedDvar( "player_deathInvulnerableTime", "50" );
level.player waittill( "damage", amount, attacker, direction_vec, point, type );
if( type == "MOD_MELEE" && level.player.health < 80 )
{
ChangeLevel( map, false );
wait 0.05;
level.player DoDamage( 999999, (0,0,0) );
}
if( type == "MOD_GRENADE_SPLASH" && amount > 2 || type == "MOD_GRENADE_SPLASH" && level.player.health < 30 )
{
ChangeLevel( map, false );
wait 0.05;
level.player DoDamage( 999999, (0,0,0) );
}
if( type == "MOD_PROJECTILE_SPLASH" && amount > 6 || type == "MOD_PROJECTILE_SPLASH" && level.player.health < 30 )
{
ChangeLevel( map, false );
wait 0.05;
level.player DoDamage( 999999, (0,0,0) );
}
if( type == "MOD_RIFLE_BULLET" && level.player.health > 20 || type == "MOD_PISTOL_BULLET" && level.player.health > 20 )
{
if( level.player.health > 20 )
{
level.player DoDamage( 10, (0,0,0) );
}
}
if( type == "MOD_MELEE" && level.player.health >= 80 )
level.player DoDamage( 400, (0,0,0) );
if( level.player.health <= 1 )
{
level.player.health = 1;
ChangeLevel( map, false );
wait 0.05;
level.player DoDamage( 999999, (0,0,0) );
}
wait 0.005;
}
}
ShootingIsPain()
{
level endon( "stop_shootingpunishment" );
thread shooting_is_pain_timer();
while( true )
{
level.player waittill( "weapon_fired" );
level.player DoDamage( 12, (0,0,0) );
}
}
ReloadingMakesYouSlow()
{
level endon( "stop_reloadingpunishment" );
thread reloading_slows_you_timer();
counter = 1;
while( true )
{
deduction = counter * 0.025;
level.player waittill( "reload" );
level.player SetMoveSpeedScale( 1 - deduction );
counter++;
}
}
EnemyKnockback()
{
level endon( "stop_knockback" );
thread enemy_knockback_timer();
while( true )
{
level.player waittill( "damage" );
randomX = randomIntRange( -500, 500 );
randomZ = randomIntRange( -500, 500 );
randomY = randomIntRange( 200, 300 );
level.player SetVelocity( level.player GetVelocity() + (randomX, randomZ, randomY) );
}
}
Trivia()
{
wait 5;
question = RandomIntRange( 1, 16 );
correct = "";
text = "";
text2 = "";
color = ( 255, 0, 0 );
if( question == 1 )
{
text = "How many bullets in UMP's Mag in MW2 MP?";
text2 = "O.) 25 | P.) 32";
correct = "p";
}
if( question == 2 )
{
text = "Number of Campaign levels in MW2?";
text2 = "O.) 18 | P.) 19";
correct = "p";
}
if( question == 3 )
{
text = "Starter AR in MW2 MP?";
text2 = "O.) M16A4 | P.) FAMAS";
correct = "p";
}
if( question == 4 )
{
text = "Max Prestige in MW3?";
text2 = "O.) 15 | P.) 20";
correct = "p";
}
if( question == 5 )
{
text = "Pick-10-System. First in which CoD?";
text2 = "O.) Black Ops 2 | P.) Advanced Warfare";
correct = "o";
}
if( question == 6 )
{
text = "CoD1 first released in...?";
text2 = "O.) 2002 | P.) 2003";
correct = "p";
}
if( question == 7 )
{
text = "Raven Software first involved in which CoD?";
text2 = "O.) Black Ops 1 | P.) Modern Warfare 3";
correct = "o";
}
if( question == 8 )
{
text = "What is Soap's rank during the events of CoD4?";
text2 = "O.) Sergeant | P.) Lieutenant";
correct = "o";
}
if( question == 9 )
{
text = "In MW2, which perk requires the higher rank to unlock?";
text2 = "O.) Danger Close | P.) Last Stand";
correct = "p";
}
if( question == 10 )
{
text = "Which iconic handgun does Zakhaev use?";
text2 = "O.) The Desert Eagle | P.) The .44 Magnum";
correct = "o";
}
if( question == 11 )
{
text = "Hardest camo you can unlock for all guns in CoD4 MP?";
text2 = "O.) Gold | P.) Red Tiger";
correct = "p";
}
if( question == 12 )
{
text = "How many enemies are in the Nikolai house on Blackout?";
text2 = "O.) 5 | P.) 6";
correct = "p";
}
if( question == 13 )
{
text = "CoD4 sold over 10 million copies in one year. True/False?";
text2 = "O.) True | P.) False";
correct = "o";
}
if( question == 14 )
{
text = "What engine does CoD4 run on?";
text2 = "O.) IW 3.0 | P.) IW 4.0";
correct = "o";
}
if( question == 15 )
{
text = "When was CoD4 released?";
text2 = "O.) November 5th, 2007 | P.) October 5th, 2007";
correct = "o";
}
thread random_text2( text, color );
wait 4;
thread random_text3( text2, color );
thread trivia_kill_timer();
incorrect = "";
if( correct == "o" )
incorrect = "p";
if( correct == "p" )
incorrect = "o";
while( true )
{
if( level.player ButtonPressed( correct ) )
{
color = ( 0, 255, 0 );
text = "Correct!";
random_text2( text, color );
level notify( "answer_correct" );
break;
}
if( level.player ButtonPressed( incorrect ) )
{
color = ( 255, 0, 0 );
text = "Incorrect!";
random_text2( text, color );
level.player DoDamage( 999999, (0,0,0) );
}
wait 0.005;
}
}
hide_enemies()
{
level endon( "stop_hiding" );
thread hide_timer();
while( true )
{
aiarray = GetAIArray( "axis" );
for( i = 0; i < aiarray.size; i++ )
{
guy = aiarray[i];
guy Hide();
}
wait 0.005;
}
}
heavy_mags()
{
level endon( "stop_heavy_mags" );
thread heavy_mags_timer();
bulletCount = 0;
while( true )
{
bulletCount = level.player GetCurrentWeaponClipAmmo();
deduction = bulletCount * 0.02;
level.player SetMoveSpeedScale( 1 - deduction );
wait 0.05;
}
}
leaking_ammo_pouch()
{
level endon( "stop_leaking" );
thread ammo_pouch_timer();
while( true )
{
currentweapon = level.player GetCurrentWeapon();
ammoCount = level.player GetWeaponAmmoStock( currentweapon );
level.player SetWeaponAmmoStock( currentweapon, ammocount - 1 );
wait 0.1;
}
}
sprinting_is_tiring()
{
level endon( "stop_tired_sprint" );
thread sprinting_is_tiring_timer();
counter = 1;
while( true )
{
decrease = 0.01 * counter;
vel2 = level.player GetVelocity();
velocity2 = Distance( ( vel2[ 0 ], vel2[ 1 ], 0 ), ( 0, 0, 0 ) );
if( velocity2 > 210 )
{
counter++;
level.player setMoveSpeedScale( 1 - decrease );
}
if( counter == 34 )
{
level.player setMoveSpeedScale( 1 - decrease );
wait 5;
level.player setMoveSpeedScale( 1 );
wait 3;
}
if( velocity2 < 210 || counter >= 34 )
{
level.player setMoveSpeedScale( 1 );
counter = 1;
}
wait 0.1;
}
}
dont_feel_so_good_pulse()
{
level endon( "stop_pulse" );
thread pulse_timer();
while( true )
{
SetBlur( 10, 1 );
wait 2;
SetBlur( 0, 1 );
wait 2;
}
}
get_blurry()
{
level endon( "stop_blurry" );
thread blurry_timer();
while( true )
{
SetBlur( 10, 1 );
wait 0.05;
}
}
increased_damage()
{
level endon( "stop_superdamage" );
thread increased_damage_timer();
while( true )
{
level.player waittill( "damage", amount, attacker, direction_vec, point, type );
if( type == "MOD_RIFLE_BULLET" || type == "MOD_PISTOL_BULLET" )
{
level.player DoDamage( 120, (0,0,0) );
}
}
}
melee_highjump()
{
level endon( "stop_meleejump" );
thread melee_highjump_timer();
while( true )
{
if( level.player IsMeleeing() )
{
level.player SetVelocity( level.player GetVelocity() + (0, 0, 400) );
wait 1.7;
}
wait 0.05;
}
}
enemies_get_teleported()
{
level endon( "stop_enemytp" );
thread enemies_get_teleported_timer();
while( true )
{
aiarray = GetAIArray( "axis" );
for( i = 0; i < aiarray.size; i++ )
{
guy = aiarray[i];
guy teleport( level.player.origin, level.player.angles );
}
wait 16;
}
}
damage_deletes_enemies()
{
level endon( "stop_deleting" );
thread damage_deletes_enemies_timer();
while( true )
{
level.player waittill( "damage" );
aiarray = GetAIArray( "axis" );
guy = aiarray[0];
guy1 = aiarray[1];
guy2 = aiarray[2];
guy3 = aiarray[3];
guy Delete();
guy1 Delete();
guy2 Delete();
guy3 Delete();
wait 0.05;
}
}
teleport_melee()
{
level endon( "stop_teleportmelee" );
thread teleport_melee_timer();
while( true )
{
if( level.player IsMeleeing() )
{
newLoc = level.player GetCursorPos();
level.player SetOrigin( ( newLoc ) );
wait 2;
}
wait 0.05;
}
}
explosive_bullets()
{
mapnameexplosives = GetDvar( "mapname" );
level endon( "stop_explosivebullets" );
thread explosive_bullets_timer();
SetSavedDvar( "player_radiusDamageMultiplier", 0.02 );
if( mapnameexplosives == "af_caves" )
{
while( true )
{
level.player waittill( "weapon_fired" );
endPoint = level.player GetCursorPos();
MagicBullet( "at4", level.player GetEye(), endPoint );
wait 0.05;
}
}
else
{
while( true )
{
level.player waittill( "weapon_fired" );
endPoint = level.player GetCursorPos();
MagicBullet( "rpg", level.player GetEye() + ( 0, 0, 50 ), endPoint );
wait 0.05;
}
}
}
laser_beam()
{
level endon( "stop_laser" );
thread laser_beam_timer();
while( true )
{
endPoint = level.player GetCursorPos();
MagicBullet( "beretta", level.player GetEye() + ( 0, 0, 50 ), endPoint );
MagicBullet( "beretta", level.player GetEye() + ( 0, 0, 50 ), endPoint );
MagicBullet( "beretta", level.player GetEye() + ( 0, 0, 50 ), endPoint );
wait 0.005;
}
}
player_makes_noises()
{
level endon( "stop_noises" );
thread player_makes_noises_timer();
while( true )
{
level.player PlaySound( "generic_pain_russian_1" );
wait randomFloatRange( 0.1, 2.1 );
}
}
//thermal_visioning()
//{
//	thread thermal_off_timer();
//	level.player ThermalVisionOn();
//	level.player ThermalVisionFOFOverlayOn();
//	level.player LaserAltViewOn();
//}
Ayy_Cee()
{
level endon( "stop_ayycee" );
thread ayy_cee_timer();
while( true )
{
VisionSetNaked( "ac130_inverted" );
wait 0.005;
}
}
KeepHell()
{
wait 5;
while( true )
{
SetExpFog( 100, 200, 1, 0, 0, 5 );
wait 1;
}
}
godMode()
{
level endon( "stop_godmode" );
thread godMode_timer();
while( true )
{
level.player EnableInvulnerability();
wait 1;
}
}
Montage()
{
level endon( "stop_montage" );
savedfov = getDvar( "cg_fov" );
thread montage_timer();
overlay = NewHudElem();
overlay.x = 0;
overlay.y = 200;
overlay SetShader( "black", 99200, 120 );
overlay.alignX = "center";
overlay.alignY = "bottom";
overlay.horzAlign = "center";
overlay.vertAlign = "bottom";
overlay.foreground = true;
overlay.alpha = 1;
overlay MoveOverTime( 4 );
overlay.y = 58;
overlay2 = NewHudElem();
overlay2.x = 0;
overlay2.y = -200;
overlay2 SetShader( "black", 99200, 120 );
overlay2.alignX = "center";
overlay2.alignY = "top";
overlay2.horzAlign = "center";
overlay2.vertAlign = "top";
overlay2.foreground = true;
overlay2.alpha = 1;
overlay2 MoveOverTime( 4 );
overlay2.y = -58;
level thread montagestopper( savedfov, overlay, overlay2 );
while ( true )
{
setSavedDvar( "cg_fov", 120 );
wait 0.005;
}
}
displayPoints()
{
killCount = 0;
self thread AddPoints();
self thread monitorPlayerButtons();
self.Points = 0;
cashtext = createFontString( "objective", 1.3 );
cashtext.glowColor = ( 0, 1, 0 );
cashtext.glowAlpha = 1;
cashtext setup_hud_elem_secondary3();
cashtext.y = -100;
cashtext.x = -100;
cashtext SetText( "Cash: " );
cashtextvalue = createFontString( "objective", 1.3 );
cashtextvalue.glowColor = ( 0.5, 0.5, 0.5 );
cashtextvalue.glowAlpha = 1;
cashtextvalue setup_hud_elem_secondary3();
cashtextvalue.y = -100;
cashtextvalue.x = -50;
cashtextvalue SetText( self.Points );
ga = createFontString( "objective", 1.3 );
ga.glowColor = ( 0, 1, 0 );
ga.glowAlpha = 1;
ga setup_hud_elem_secondary4();
ga.y = 0;
ga.x = 0;
ga SetText( "F1 | Great Assistance event | $1500" );
common = createFontString( "objective", 1.3 );
common.glowColor = ( 0.44, 0.5, 0.56 );
common.glowAlpha = 1;
common setup_hud_elem_secondary4();
common.y = 15;
common.x = 0;
common SetText( "F2 | Common event | $250" );
loadout = createFontString( "objective", 1.3 );
loadout.glowColor = ( 0.44, 0.5, 0.56 );
loadout.glowAlpha = 1;
loadout setup_hud_elem_secondary4();
loadout.y = 30;
loadout.x = 0;
loadout SetText( "F3 | Reroll gun | $100" );
wait 9;
cashtext FadeOverTime( 1 );
cashtext.alpha = 1;
cashtextvalue FadeOverTime( 1 );
cashtextvalue.alpha = 1;
ga FadeOverTime( 1 );
ga.alpha = 1;
common FadeOverTime( 1 );
common.alpha = 1;
loadout FadeOverTime( 1 );
loadout.alpha = 1;
while( true )
{
cashtextvalue setText( "$" + self.Points );
wait 0.005;
}
}
wawXP()
{
level.player thread create_clusterGrenade2();
for( i = 0; i < 2; i++ )
{
wait randomIntRange( 7, 11 );
level.player thread create_clusterGrenade2();
text = "Think fast!";
color = ( 1, 1, 1 );
random_text2( text, color );
}
}
slowmo()
{
for( i = 1; i < 16; i++ )
{
calc = i * 0.04;
time = 1 - calc;
SetTimeScale( time );
wait 1;
}
SetTimeScale( 1 );
}
hophop()
{
for( i = 0; i < 29; i++ )
{
wait 1;
level.player SetVelocity( level.player GetVelocity() + (0, 0, 350));
}
}
InfiniteAmmo()
{
SetSavedDvar( "player_sustainAmmo", 1 );
wait 30;
SetSavedDvar( "player_sustainAmmo", 0 );
}
greenberetlite()
{
level endon( "stop_gberet" );
thread greenberet_timer();
while( true )
{
currentweapon = level.player GetCurrentWeapon();
level.player SetWeaponAmmoStock( currentweapon, 0 );
wait 0.05;
}
}
Berserker()
{
while( true )
{
self waittill( "damage" );
if( self.health < 80 )
{
thread BerserkMode();
thread BerserkTimer();
wait 30;
}
wait 0.005;
}
}
BerserkMode()
{
level endon( "stop_berserk" );
while( true )
{
level.player setMoveSpeedScale ( 1.3 );
level.player EnableInvulnerability();
wait 0.005;
}
}
Surviv0rSpirit_loop()
{
while( true )
{
level endon( "survived_finalstand" );
Surviv0rSpirit();
wait 0.005;
}
}
Surviv0rSpirit()
{
level endon( "stop_finalstand" );
level endon( "survived_finalstand" );
while( true )
{
if( level.player.health <= 2 )
{
thread finalstand_prep_timer();
wait 3.999;
level.player.health = 1000;
level.player waittill( "damage" );
level.player.health = 1;
level notify( "into_finalstand" );
level.player AllowStand( false );
level.player AllowCrouch( false );
level.player AllowProne( true );
level.player AllowSprint( false );
level.player AllowJump( false );
level.player SetStance( "prone" );
level.player EnableInvulnerability();
thread finalstand_timer();
text = "Survive!";
color = ( 1, 0, 0 );
random_text3( text, color );
wait 2;
level.player DisableInvulnerability();
while( true )
{
level.player.health = 1;
wait 0.005;
}
}
wait 0.005;
}
}
BlueCurse()
{
level.player setMoveSpeedScale( 0.1 );
level.player FreezeControls( true );
wait 0.005;
level.player FreezeControls( false );
level.player thread create_BlueNade();
wait 2.5;
level.player setMoveSpeedScale( 1 );
}
fake_crash()
{
black = NewHudElem();
black.x = 0;
black.y = 0;
black SetShader( "black", 2000, 2000 );
black.alignX = "center";
black.alignY = "middle";
black.horzAlign = "center";
black.vertAlign = "middle";
black.foreground = true;
black.alpha = 0;
wait 1;
black.sort = 89;
black.alpha = 1;
wait 6;
black Destroy();
}
errormsg()
{
error = createFontString( "default", 2 );
error.color = ( 1, 0.8, 0.4 );
error.y = -60;
error.x = 0;
error.alignX = "center";
error.alignY = "middle";
error.horzAlign = "center";
error.vertAlign = "middle";
error SetText( "Error" );
error.foreground = true;
error.alpha = 0;
errordesc = createFontString( "default", 1.3 );
errordesc.color = ( 1, 1, 1 );
errordesc.y = -30;
errordesc.x = 0;
errordesc.alignX = "center";
errordesc.alignY = "middle";
errordesc.horzAlign = "center";
errordesc.vertAlign = "middle";
errordesc SetText( "Oh you actually thought?" );
errordesc.foreground = true;
errordesc.alpha = 0;
errorexit = createFontString( "default", 1.1 );
errorexit.color = ( 0.48, 0.48, 0.48 );
errorexit.y = 110;
errorexit.x = 0;
errorexit.alignX = "center";
errorexit.alignY = "middle";
errorexit.horzAlign = "center";
errorexit.vertAlign = "middle";
errorexit SetText( "Exit" );
errorexit.foreground = true;
errorexit.alpha = 0;
wait 1;
error.sort = 90;
errordesc.sort = 91;
errorexit.sort = 92;
error.alpha = 1;
errordesc.alpha = 1;
errorexit.alpha = 1;
wait 6;
errorexit Destroy();
error Destroy();
errordesc Destroy();
}
errormsg2()
{
error = createFontString( "default", 2 );
error.color = ( 1, 0.8, 0.4 );
error.y = -60;
error.x = 0;
error.alignX = "center";
error.alignY = "middle";
error.horzAlign = "center";
error.vertAlign = "middle";
error SetText( "Error" );
error.foreground = true;
error.alpha = 0;
errordesc = createFontString( "default", 1.3 );
errordesc.color = ( 1, 1, 1 );
errordesc.y = -30;
errordesc.x = 0;
errordesc.alignX = "center";
errordesc.alignY = "middle";
errordesc.horzAlign = "center";
errordesc.vertAlign = "middle";
errordesc SetText( "Oh you actually thought?" );
errordesc.foreground = true;
errordesc.alpha = 0;
wait 0.02;
errorexit = createFontString( "default", 1.1 );
errorexit.color = ( 0.48, 0.48, 0.48 );
errorexit.y = 110;
errorexit.x = 0;
errorexit.alignX = "center";
errorexit.alignY = "middle";
errorexit.horzAlign = "center";
errorexit.vertAlign = "middle";
errorexit SetText( "Exit" );
errorexit.foreground = true;
errorexit.alpha = 0;
errorexit2 = createFontString( "default", 1.1 );
errorexit2.color = ( 0.48, 0.48, 0.48 );
errorexit2.y = 110;
errorexit2.x = 0;
errorexit2.alignX = "center";
errorexit2.alignY = "middle";
errorexit2.horzAlign = "center";
errorexit2.vertAlign = "middle";
errorexit2 SetText( "Exit" );
errorexit2.foreground = true;
errorexit2.alpha = 0;
wait 0.5;
error.alpha = 1;
errordesc.alpha = 1;
errorexit.alpha = 1;
errorexit2.alpha = 1;
wait 6;
errorexit Destroy();
errorexit2 Destroy();
error Destroy();
errordesc Destroy();
}
MonsterMode()
{
thread speedymonster();
green = NewHudElem();
green.x = 0;
green.y = 0;
green SetShader( "white", 2000, 2000 );
green.color = ( 0, 1, 0 );
green.alignX = "center";
green.alignY = "middle";
green.horzAlign = "center";
green.vertAlign = "middle";
green.foreground = true;
green.alpha = 0;
green FadeOverTime( 1 );
green.alpha = 0.4;
wait 29;
green.alpha = 0.4;
green FadeOverTime( 1 );
green.alpha = 0;
wait 1;
green Destroy();
level notify( "stop_monster" );
}
speedymonster()
{
level endon( "stop_monster" );
while( true )
{
level.player setMoveSpeedScale( 1.1 );
SetTimeScale( 1.3 );
wait 0.005;
}
}
AccuracyWorsensIfShot()
{
wait 5;
spreadvalue = 1;
level.player SetSpreadOverride( 1 );
while( true )
{
thread KeepBadAccuracy( spreadvalue );
level.player waittill( "damage" );
level notify( "new_acc_value" );
spreadvalue += 2;
level.player SetSpreadOverride( spreadvalue );
wait 0.33;
}
}
KeepBadAccuracy( acc )
{
level endon( "new_acc_value" );
while( true )
{
level.player SetSpreadOverride( acc );
wait 0.05;
}
}
//TargetingBoxes()
//{
//	while( true )
//	{
//		aiarray = GetAIArray( "axis" );
//		for( i = 0; i < aiarray.size; i++ )
//		{
//			guy = aiarray[i];
//			Target_Set( guy, ( 0, 0, 32 ) );
//			Target_SetShader( guy, "remotemissile_infantry_target" );
//			Target_ShowToPlayer( guy, level.player );
//		}
//		wait 0.005;
//	}
//}
Armor()
{
level notify( "tf141_armor_finished" );
wait 0.6;
level.armor = createFontString( "default", 1.2 );
level.armor.color = ( 1, 1, 1 );
level.armor.y = 90;
level.armor.x = 0;
level.armor.alignX = "center";
level.armor.alignY = "middle";
level.armor.horzAlign = "center";
level.armor.vertAlign = "middle";
level.armor SetText( "Armor:" );
level.armor.foreground = true;
level.armor.alpha = 0;
level.armor FadeOverTime( 0.7 );
level.armor.alpha = 1;
level.armorvalue = createFontString( "default", 1.2 );
level.armorvalue.color = ( 1, 1, 1 );
level.armorvalue.y = 90;
level.armorvalue.x = 20;
level.armorvalue.alignX = "left";
level.armorvalue.alignY = "middle";
level.armorvalue.horzAlign = "center";
level.armorvalue.vertAlign = "middle";
level.armorvalue SetText( "" );
level.armorvalue.foreground = true;
level.armorvalue.color = ( 0, 1, 0 );
level.armorvalue.alpha = 0;
level.armorvalue FadeOverTime( 0.7 );
level.armorvalue.alpha = 1;
thread armortracking();
thread deleteifdupe();
}
armortracking()
{
level endon( "tf141_armor_finished" );
armorpoints = 750;
level.armorvalue SetText( armorpoints );
while( true )
{
level.player.health = 999999;
level.player waittill( "damage", amount );
armorpoints -= amount;
level.armorvalue SetText( armorpoints );
if( armorpoints > 499 )
{
level.armorvalue.color = ( 0, 1, 0 );
}
if( armorpoints > 249 && armorpoints < 500 )
{
level.armorvalue.color = ( 1, 1, 0 );
}
if( armorpoints > 0 && armorpoints < 250 )
{
level.armorvalue.color = ( 1, 0, 0 );
}
if( armorpoints <= 0 )
{
level.player.health = 100;
level notify( "tf141_armor_finished" );
}
}
}
deleteifdupe()
{
level waittill( "tf141_armor_finished" );
armorpoints = 750;
level.armor.alpha = 1;
level.armor FadeOverTime( 0.4 );
level.armor.alpha = 0;
level.armorvalue.alpha = 1;
level.armorvalue FadeOverTime( 0.4 );
level.armorvalue.alpha = 0;
wait 0.4;
level.armor Destroy();
level.armorvalue Destroy();
}
setKillFunc()
{
wait 0.05;
level.global_kill_func = ::killCounter;
level.global_damage_func_ads = ::hitmarker_damage;
level.global_damage_func = ::hitmarker_damage;
}
killCounter()
{
level notify( "add_points" );
hitmarker_destroy();
level endon( "hitmarker" );
level.hud_hitmarker = newHudElem();
level.hud_hitmarker.horzAlign = "center";
level.hud_hitmarker.vertAlign = "middle";
level.hud_hitmarker.x = -12;
level.hud_hitmarker.y = -12;
level.hud_hitmarker.alpha = 1;
level.hud_hitmarker.foreground = 1;
level.hud_hitmarker.color = (1, 0.2, 0.2);
level.hud_hitmarker setShader( "damage_feedback" , 24, 48 );
level.hud_hitmarker fadeOverTime( 1 );
level.hud_hitmarker.alpha = 0;
wait 1;
level.hud_hitmarker destroy();
}
AddPoints()
{
while( true )
{
level waittill( "add_points" );
wait 0.005;
self.Points += 50;
}
}
legacy_grenadeParanoia()
{
thread grenade_death_indicator_hudelement2();
thread grenade_death_indicator_hudelement3();
}
GetCursorPos()
{
angles = level.player GetPlayerAngles();
pos2 = vector_Scal(anglestoforward( angles ),100000);
pos = level.player GetEye();
pos3 = BulletTrace( pos, pos2, 0, level.player )[ "position" ];
return pos3;
}
vector_scal(vec, scale)
{
return (vec[0] * scale, vec[1] * scale, vec[2] * scale);
}
shooting_is_pain_timer()
{
wait 60;
level notify( "stop_shootingpunishment" );
}
death_reset_timer()
{
wait 90;
level notify( "reset_stopped" );
SetSavedDvar( "player_meleeDamageMultiplier", 0.4 );
SetSavedDvar( "player_radiusDamageMultiplier", 1 );
SetSavedDvar( "player_deathInvulnerableTime", "4000" );
}
reloading_slows_you_timer()
{
wait 90;
level notify( "stop_reloadingpunishment" );
level.player SetMoveSpeedScale( 1 );
}
enemy_knockback_timer()
{
wait 60;
level notify( "stop_knockback" );
}
trivia_kill_timer()
{
level endon( "answer_correct" );
wait 17;
text = "Should've answered";
random_text2( text );
level.player DoDamage( 999999, (0,0,0) );
}
hide_timer()
{
wait 15;
level notify( "stop_hiding" );
}
heavy_mags_timer()
{
wait 60;
level notify( "stop_heavy_mags" );
}
ammo_pouch_timer()
{
wait 60;
level notify( "stop_leaking" );
}
sprinting_is_tiring_timer()
{
wait 60;
level notify( "stop_tired_sprint" );
level.player setMoveSpeedScale( 1 );
}
pulse_timer()
{
wait 30;
level notify( "stop_pulse" );
SetBlur( 0, 1 );
}
blurry_timer()
{
wait 30;
level notify( "stop_blurry" );
SetBlur( 0, 1 );
}
increased_damage_timer()
{
wait 30;
level notify( "stop_superdamage" );
}
melee_highjump_timer()
{
wait 30;
level notify( "stop_meleejump" );
}
enemies_get_teleported_timer()
{
wait 15;
level notify( "stop_enemytp" );
}
damage_deletes_enemies_timer()
{
wait 30;
level notify( "stop_deleting" );
}
teleport_melee_timer()
{
wait 30;
level notify( "stop_teleportmelee" );
}
explosive_bullets_timer()
{
wait 30;
level notify( "stop_explosivebullets" );
SetSavedDvar( "player_radiusDamageMultiplier", 0.4 );
}
laser_beam_timer()
{
wait 30;
level notify( "stop_laser" );
}
player_makes_noises_timer()
{
wait 30;
level notify( "stop_noises" );
}
//thermal_off_timer()
//{
//	wait 30;
//	level.player ThermalVisionOff();
//	level.player ThermalVisionFOFOverlayOff();
//	level.player LaserAltViewOff();
//}
ayy_cee_timer()
{
wait 30;
level notify( "stop_ayycee" );
VisionSetNaked( "default", 0.2 );
}
godMode_timer()
{
wait 30;
level notify( "stop_godmode" );
level.player DisableInvulnerability();
}
EnemiesHaveGod_timer()
{
wait 30;
level notify( "stop_enemygod" );
for( i = 0; i < 100; i++ )
{
aiarray = GetAIArray( "axis" );
for( k = 0; k < aiarray.size; k++ )
{
guy = aiarray[k];
guy.health = 100;
}
wait 0.005;
}
}
montage_timer()
{
wait 30;
level notify( "stop_montage" );
}
greenberet_timer()
{
wait 30;
level notify( "stop_gberet" );
}
BerserkTimer()
{
berserkvision = NewHudElem();
berserkvision.x = 0;
berserkvision.y = 0;
berserkvision SetShader( "white", 2000, 2000 );
berserkvision.color = ( 0.4, 0, 0 );
berserkvision.alignX = "center";
berserkvision.alignY = "middle";
berserkvision.horzAlign = "center";
berserkvision.vertAlign = "middle";
berserkvision.foreground = true;
berserkvision.alpha = 0;
berserkvision FadeOverTime( 1 );
berserkvision.alpha = 0.4;
wait 5;
level notify( "stop_berserk" );
wait 0.1;
level.player setMoveSpeedScale ( 1 );
level.player DisableInvulnerability();
berserkvision.alpha = 0.4;
berserkvision FadeOverTime( 1 );
berserkvision.alpha = 0;
wait 1;
berserkvision Destroy();
}
finalstand_prep_timer()
{
level endon( "into_finalstand" );
wait 6.7;
level notify( "stop_finalstand" );
level.player.health = 100;
}
finalstand_timer()
{
wait 7.95;
level notify( "survived_finalstand" );
wait 0.05;
level.player AllowStand( true );
level.player AllowCrouch( true );
level.player AllowProne( true );
level.player AllowSprint( true );
level.player AllowJump( true );
level.player SetStance( "stand" );
level.player.health = 100;
}
montagestopper( returnfov, bar1, bar2 )
{
level waittill( "stop_montage" );
bar1 MoveOverTime( 3 );
bar1.y = 200;
bar2 MoveOverTime( 3 );
bar2.y = -200;
setSavedDvar( "cg_fov", returnfov );
setSavedDvar( "cg_fovScale", 1 );
wait 0.2;
setSavedDvar( "cg_fov", returnfov );
setSavedDvar( "cg_fovScale", 1 );
wait 3;
bar1 Destroy();
bar2 Destroy();
}
monitorPlayerButtons()
{
mapname = GetDvar( "mapname" );
while( true )
{
if( level.player ButtonPressed( "f1" ) && self.Points >= 1500 )
{
self.Points -= 1500;
thread GreatAssistance( mapname );
level.player PlaySound( "intelligence_pickup" );
wait 5;
}
if( level.player ButtonPressed( "f2" ) && self.Points >= 250 )
{
self.Points -= 250;
thread Common( mapname );
level.player PlaySound( "intelligence_pickup" );
wait 5;
}
if( level.player ButtonPressed( "f3" ) && self.Points >= 100 )
{
self.Points -= 100;
level.player PlaySound( "intelligence_pickup" );
level.player TakeAllWeapons();
thread loadoutRoll();
wait 5;
}
wait 0.005;
}
}
playerteleporter()
{
wait 1.05;
playerorigin = level.player.origin;
tpto = ( 200000, 200000, 200000 );
level.player SetOrigin( tpto );
wait 5.97;
level.player SetOrigin( playerorigin );
}
hitmarker_damage( type, location, point )
{
//level notify( "hitmarker" );
thread display_hitmarker();
}
display_hitmarker()
{
hitmarker_destroy();
level endon( "hitmarker" );
level.hud_hitmarker = newHudElem();
level.hud_hitmarker.horzAlign = "center";
level.hud_hitmarker.vertAlign = "middle";
level.hud_hitmarker.x = -12;
level.hud_hitmarker.y = -12;
level.hud_hitmarker.alpha = 1;
level.hud_hitmarker.foreground = 1;
level.hud_hitmarker setShader( "damage_feedback" , 24, 48 );
level.hud_hitmarker fadeOverTime( 1 );
level.hud_hitmarker.alpha = 0;
wait 1;
level.hud_hitmarker destroy();
}
hitmarker_destroy()
{
level notify( "hitmarker" );
if ( isDefined( level.hud_hitmarker ) )
{
level.hud_hitmarker destroy();
}
}
GreatAssistance( map )
{
color = ( 0, 255, 0 );
greatassistance = randomIntRange( 1, 7 );
if( greatassistance == 1 )
{
text = "Getting shot has never been so beneficial. (30s)";
thread damage_deletes_enemies();
random_text2( text, color );
}
if( greatassistance == 2 )
{
if( map != "cliffhanger" && map != "trainer" && map != "ending" )
{
text = "Explosive playstyle. (30s)";
thread explosive_bullets();
random_text2( text, color );
}
else
{
text = "I wonder what meleeing does?";
thread teleport_melee();
random_text2( text, color );
}
}
if( greatassistance == 3 )
{
text = "Laser Gun! (30s)";
thread laser_beam();
random_text2( text, color );
}
if( greatassistance == 4 )
{
text = "Woah, Im floating. (30s)";
thread FlyingPlayer();
random_text2( text, color );
}
if( greatassistance == 5 )
{
text = "Godmode. (30s)";
thread godMode();
random_text2( text, color );
}
if( greatassistance == 6 )
{
text = "TF141 Armor(TM)";
thread Armor();
random_text2( text, color );
}
firstevent = 0;
}
Common( firstevent, map )
{
color = ( 0.44, 0.5, 0.56 );
common = randomIntRange( 1, 41 );
if( common == 1 )
{
if( map == "sniperescape" )
{
text = "No jumping!";
level.player AllowJump(false);
random_text2( text, color );
}
else
{
text = "Hope you like crouching...";
level.player AllowStand(false);
level.player AllowSprint(false);
level.player SetStance( "crouch" );
random_text2( text, color );
}
}
if( common == 2 )
{
text = "No jumping!";
level.player AllowJump(false);
random_text2( text, color );
}
if( common == 3 )
{
text = "Gotta go fast!";
level.player setMoveSpeedScale( 1.5 );
random_text2( text, color );
}
if( common == 4 )
{
text = "WaW Experience!";
thread wawXP();
random_text2( text, color );
}
if( common == 5 )
{
text = "Hard to keep it steady?";
Earthquake( 1, 15, level.player.origin, 8000 );
random_text2( text, color );
}
if( common == 6 )
{
text = "Pew pew pew!";
level.player TakeAllWeapons();
level.player GiveWeapon("defaultweapon");
level.player SwitchToWeapon("defaultweapon");
random_text2( text, color );
}
if( common == 7 )
{
text = "Welcome to Hell.";
SetExpFog( 100, 200, 1, 0, 0, 5 );
thread KeepHell();
random_text2( text, color );
}
if( common == 8 )
{
text = "Well that hurt.";
level.player DoDamage( level.player.health * 4.72, (0,0,0) );
random_text2( text, color );
}
if( common == 9 )
{
text = "Sloooooow Motion!";
thread slowmo();
random_text2( text, color );
}
if( common == 10 )
{
text = "Ammo is for ammo-teurs.";
thread InfiniteAmmo();
random_text2( text, color );
}
if( common == 11 )
{
text = "What do they put in those bullets?";
thread increased_damage();
random_text2( text, color );
}
if( common == 12 )
{
text = "Flashbang!";
level.player thread create_clusterFlash();
random_text2( text, color );
}
if( common == 13 )
{
text = "Ayy-Cee-Wan-Dirty";
VisionSetNaked( "ac130_inverted", 0.2 );
thread Ayy_Cee();
random_text2( text, color );
}
if( common == 14 )
{
text = "Why do you jump so much?";
level.player SetVelocity( level.player GetVelocity() + (0, 0, 350));
thread hophop();
random_text2( text, color );
}
if( common == 15 )
{
if( map != "hunted" )
{
text = "So anyway, I started blasting.";
level.player TakeAllWeapons();
level.player GiveWeapon("rpg");
level.player SwitchToWeapon("rpg");
SetSavedDvar( "player_sustainAmmo", 1 );
random_text2( text, color );
thread GodMode();
thread FlyingPlayer();
thread InfiniteAmmo();
}
else
{
text = "I wonder what meleeing does?";
thread teleport_melee();
random_text2( text, color );
}
}
if( common == 16 )
{
text = "Green Beret Lite";
level.player TakeAllWeapons();
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player SetWeaponAmmoClip( "beretta", 0 );
level.player SetWeaponAmmoStock( "beretta", 0 );
thread greenberetlite();
random_text2( text, color );
}
if( common == 17 )
{
text = "Accuracy buff!";
level.player SetSpreadOverride( 1 );
random_text2( text, color );
}
if( common == 18 )
{
text = "Now that's aim punch.";
SetSavedDvar( "bg_viewkickscale", 10 );
random_text2( text, color );
}
if( common == 19 )
{
text = "Snake Mode";
thread SnakeMode();
random_text2( text, color );
}
if( common == 20 )
{
text = "Thanos Snap";
thread Thanos();
random_text2( text, color );
}
if( common == 21 )
{
text = "Prone = Movement Speed, Melee = God.";
thread ChooseEvent();
random_text2( text, color );
}
if( common == 22 )
{
text = "Ultra Zoom";
thread FOVWhileADS();
random_text2( text, color );
}
if( common == 23 )
{
text = "Aimbot Bots";
thread EnemiesAreAccurate();
random_text2( text, color );
}
if( common == 24 )
{
text = "Bullet Time!";
thread BulletTime();
random_text2( text, color );
}
if( common == 25 )
{
text = "Jump when I say so!";
thread NotOnGround();
random_text2( text, color );
}
if( common == 26 )
{
text = "Momentum!";
thread PlayerIsMovingFast();
random_text2( text, color );
}
if( common == 27 )
{
text = "Mom my game is lagging!!!!111";
thread GameLagging();
random_text2( text, color );
}
if( common == 28 )
{
text = "Heavy Mag.";
thread heavy_mags();
random_text2( text, color );
}
if( common == 29 )
{
text = "Your pockets are leaking.";
thread leaking_ammo_pouch();
random_text2( text, color );
}
if( common == 30 )
{
text = "Out of breath";
thread sprinting_is_tiring();
random_text2( text, color );
}
if( common == 31 )
{
text = "I don't feel so good...";
thread dont_feel_so_good_pulse();
random_text2( text, color );
}
if( common == 32 )
{
text = "Melee = Highjump.";
thread melee_highjump();
random_text2( text, color );
}
if( common == 33 )
{
text = "Surprise!";
thread enemies_get_teleported();
random_text2( text, color );
}
if( common == 34 )
{
text = "I wonder what meleeing does?";
thread teleport_melee();
random_text2( text, color );
}
if( common == 35 )
{
text = "Where does it hurt?";
thread player_makes_noises();
random_text2( text, color );
}
//if( common == 36 )
//{
//	text = "Thermal imaging.";
//	thread thermal_visioning();
//	random_text2( text, color );
//}
if( common == 36 )
{
text = "Montage time.";
random_text2( text, color );
thread Montage();
}
if( common == 37 )
{
text = "Surviv0r Spirit!";
random_text2( text, color );
thread Surviv0rSpirit_loop();
}
if( common == 38 )
{
color = ( 0.28, 0.63, 0.97 );
text = "The Blue Curse.";
random_text2( text, color );
thread BlueCurse();
}
if( common == 39 )
{
if( firstevent == 1 )
{
text = "Surviv0r Spirit!";
random_text2( text, color );
thread Surviv0rSpirit_loop();
}
else
{
level.player FreezeControls( true );
wait 1;
thread fake_crash();
thread errormsg();
thread playerteleporter();
wait 0.5;
thread fake_crash();
thread errormsg2();
wait 6.5;
level.player FreezeControls( false );
}
}
if( common == 40 )
{
text = "I LIKE MONSTER!!!!!!!!";
random_text2( text, color );
thread MonsterMode();
}
if( common == 99 )
{
wait 0.005;
}
}
SeverePunishment( map )
{
color = ( 255, 0, 0 );
severepunishment = randomIntRange( 1, 9 );
if( severepunishment == 1 )
{
text = "I really don't feel good... (30s)";
thread get_blurry();
random_text2( text, color );
}
if( severepunishment == 2 )
{
text = "BB Gun and rubber knife. (30s)";
thread EnemiesHaveGod();
random_text2( text, color );
}
if( severepunishment == 3 )
{
text = "Dying = Reset. (1.5 min)";
text2 = "+ Extra Damage";
thread DeathThing();
random_text2( text, color );
random_text3( text2, color );
}
if( severepunishment == 4 )
{
text = "I wouldn't reload too much. (1.5 min)";
thread ReloadingMakesYouSlow();
random_text2( text, color );
}
if( severepunishment == 5 )
{
text = "Bouncy. (1 min)";
thread EnemyKnockback();
random_text2( text, color );
}
if( severepunishment == 6 )
{
text = "Shooting is wrong.";
thread ShootingIsPain();
random_text2( text, color );
}
if( severepunishment == 7 )
{
text = "Trivia! Answer with keys O and P.";
thread Trivia();
random_text2( text, color );
}
if( severepunishment == 8 )
{
text = "They're gone. Just like that.";
thread hide_enemies();
random_text2( text, color );
}
}
loadoutRoll()
{
loadoutmap = GetDvar( "mapname" );
randomizer = randomintrange( 1, 20 );
if ( randomizer == 1 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
level.player GiveWeapon("dragunov");
level.player SwitchToWeapon("dragunov");
}
if ( randomizer == 2 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
}
if ( randomizer == 3 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player GiveWeapon("ak74u");
level.player SwitchToWeapon("ak74u");
}
if ( randomizer == 4 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
}
if ( randomizer == 5 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
level.player GiveWeapon("colt45");
level.player SwitchToWeapon("colt45");
}
if ( randomizer == 6 )
{
level.player GiveWeapon("rpg");
level.player SwitchToWeapon("rpg");
level.player GiveWeapon("g3");
level.player SwitchToWeapon("g3");
}
if ( randomizer == 7 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player GiveWeapon("g36c");
level.player SwitchToWeapon("g36c");
}
if ( randomizer == 8 )
{
level.player GiveWeapon("rpg");
level.player SwitchToWeapon("rpg");
level.player GiveWeapon("mp5");
level.player SwitchToWeapon("mp5");
}
if ( randomizer == 9 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
level.player GiveWeapon("p90");
level.player SwitchToWeapon("p90");
}
if ( randomizer == 10 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player GiveWeapon("remington700");
level.player SwitchToWeapon("remington700");
}
if ( randomizer == 11 )
{
level.player GiveWeapon("rpg");
level.player SwitchToWeapon("rpg");
}
if ( randomizer == 12 )
{
level.player GiveWeapon("rpd");
level.player SwitchToWeapon("rpd");
}
if ( randomizer == 13 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
level.player GiveWeapon("saw");
level.player SwitchToWeapon("saw");
}
if ( randomizer == 14 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player GiveWeapon("usp");
level.player SwitchToWeapon("usp");
}
if ( randomizer == 15 )
{
level.player GiveWeapon("rpg");
level.player SwitchToWeapon("rpg");
level.player GiveWeapon("uzi");
level.player SwitchToWeapon("uzi");
}
if ( randomizer == 16 )
{
level.player GiveWeapon("ak47");
level.player SwitchToWeapon("ak47");
level.player GiveWeapon("winchester1200");
level.player SwitchToWeapon("winchester1200");
}
if ( randomizer == 17 )
{
level.player GiveWeapon("rpd");
level.player SwitchToWeapon("rpd");
level.player GiveWeapon("skorpion");
level.player SwitchToWeapon("skorpion");
}
if ( randomizer == 18 )
{
level.player GiveWeapon("beretta");
level.player SwitchToWeapon("beretta");
level.player GiveWeapon("m60e4");
level.player SwitchToWeapon("m60e4");
}
if ( randomizer == 19 )
{
level.player GiveWeapon("rpd");
level.player SwitchToWeapon("rpd");
level.player GiveWeapon("m4");
level.player SwitchToWeapon("m4");
}
}
overalltimer()
{
thread calculatePBs();
if( GetDvar( "mapname" ) == "sniperescape" )
	SetMissionDvar( "playeronosok", 1 );
else
	SetMissionDvar( "playeronosok", 0 );

if( GetDvarInt( "fullgametracking" ) == 1 )
{
	thread fullgametimer();
}

xpos = GetDvarFloat( "timerhudx" );
if( xpos < 331 && xpos > -295 )
{
	wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "timerhudy" );
if( ypos > -112 && ypos < 286 )
{
	wait 0.1;
}
else
{
ypos = 0;
}
level endon( "timer_stop" );
if( GetDvarInt( "enabletimer" ) == 0 )
{
while( true )
{
wait 60;
}
}
SetMissionDvar( "trigger01", 0 );
SetMissionDvar( "trigger02", 0 );
timermin = 0;
if( GetDvar( "mapname" ) == "killhouse" )
{
	SetMissionDvar( "timervalue", -2.4 );
	SetMissionDvar( "timerminutes", 0 );
}
else if( GetDvar( "mapname" ) == "sniperescape" && GetDvarInt( "playeronosok" ) == 1 && GetDvarInt( "fullgametracking" ) == 1 )
{
	osoksecs = GetDvarFloat( "osoktimervalue" );
	osokmins = GetDvarFloat( "osoktimerminutes" );
	SetMissionDvar( "timervalue", osoksecs );
	SetMissionDvar( "timerminutes", osokmins );
}
else
{
	SetMissionDvar( "osoktimerminutes", 0 );
	SetMissionDvar( "osoktimervalue", 0 );
	SetMissionDvar( "timervalue", 0 );
	SetMissionDvar( "timerminutes", 0 );
}
if( GetDvarInt( "fullgametracking" ) == 0 )
	SetMissionDvar( "playerrestarting", 0 );

time = "";
self.hud_jumptimer_msg = so_create_hud_item2( -10, xpos, "Level time: ", self, ypos );
self.hud_jumptimer_value = so_create_hud_item2( -10, xpos + 78, time, self, ypos );
self.hud_jumptimer_value_sec = so_create_hud_item2( -10, xpos + 85, "s", self, ypos );
self.hud_jumptimer_msg.alignX = "right";
self.hud_jumptimer_value.alignX = "right";
self.hud_mintimer_value = so_create_hud_item2( -10, xpos + 20, time, self, ypos );
self.hud_mintimer_value_min = so_create_hud_item2( -10, xpos + 32, " min", self, ypos );
self.hud_mintimer_value.alignX = "right";
self.hud_mintimer_value SetValue( timermin );
while( true )
{
timerval = GetDvarFloat( "timervalue" );
timermin = GetDvarInt( "timerminutes" );
if( IsAlive( level.player ) == false )
{
timerval += 4.9;
if( timerval >= 60 )
{
timerval -= 60;
timermin += 1;
SetMissionDvar( "timerminutes", timermin );
}
SetMissionDvar( "timervalue", timerval );
break;
}
if( timerval >= 60 )
{
timerval -= 60;
timermin += 1;
SetMissionDvar( "timerminutes", timermin );
SetMissionDvar( "timervalue", timerval );
if( GetDvar( "mapname" ) == "sniperescape" )
{
	SetMissionDvar( "osoktimerminutes", timermin );
	SetMissionDvar( "osoktimervalue", timerval );
}
}
self.hud_jumptimer_value SetValue( timerval );
SetMissionDvar( "timervalue", timerval+0.1 );
if( GetDvar( "mapname" ) == "sniperescape" )
	SetMissionDvar( "osoktimervalue", timerval+0.1 );

self.hud_mintimer_value SetValue( timermin );
firstloop = 0;
wait 0.1;
}
}
segmenttimer1( sectionnumber )
{
if( GetDvarInt( "enabletimer" ) == 0 )
{
while( true )
{
wait 60;
}
}
xpos = GetDvarFloat( "timerhudx" );
if( xpos < 331 && xpos > -295 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "timerhudy" );
if( ypos > -112 && ypos < 286 )
{
wait 0.1;
}
else
{
ypos = 0;
}
level endon( "segment1_stop" );
segtimermin = 0;
SetMissionDvar( "segtimerminutes", 0 );
SetMissionDvar( "segtimervalue", 0 );
time = "";
sectionname = sectionLookUp( sectionnumber );
self.hud_seg_msg = so_create_hud_item2( -9, xpos, sectionname, self, ypos );
self.hud_seg_value = so_create_hud_item2( -9, xpos + 78, time, self, ypos );
self.hud_seg_value_sec = so_create_hud_item2( -9, xpos + 85, "s", self, ypos );
self.hud_seg_msg.alignX = "right";
self.hud_seg_value.alignX = "right";
self.hud_segmintimer_value = so_create_hud_item2( -9, xpos + 20, time, self, ypos );
self.hud_segmintimer_value_min = so_create_hud_item2( -9, xpos + 32, " min", self, ypos );
self.hud_segmintimer_value.alignX = "right";
while( true )
{
segtimerval = GetDvarFloat( "segtimervalue" );
segtimermin = GetDvarInt( "segtimerminutes" );
if( IsAlive( level.player ) == false )
{
segtimerval += 4.9;
if( segtimerval >= 60 )
{
segtimerval -= 60;
segtimermin += 1;
SetMissionDvar( "segtimerminutes", segtimermin );
}
SetMissionDvar( "segtimervalue", segtimerval );
break;
}
if( segtimerval == 60 )
{
SetMissionDvar( "segtimervalue", 0 );
segtimerval = 0;
segtimermin++;
SetMissionDvar( "segtimerminutes", segtimermin );
self.hud_segmintimer_value SetValue( segtimermin );
}
self.hud_seg_value SetValue( segtimerval );
self.hud_segmintimer_value SetValue( segtimermin );
SetMissionDvar( "segtimervalue", segtimerval+0.1 );
self.hud_segmintimer_value SetValue( segtimermin );
wait 0.1;
}
}
segmenttimer2( sectionnumber )
{
if( GetDvarInt( "enabletimer" ) == 0 )
{
while( true )
{
wait 60;
}
}
xpos = GetDvarFloat( "timerhudx" );
if( xpos < 331 && xpos > -295 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "timerhudy" );
if( ypos > -112 && ypos < 286 )
{
wait 0.1;
}
else
{
ypos = 0;
}
level endon( "segment2_stop" );
level notify( "segment1_stop" );
if( sectionnumber > 1 )
sectionUpdatePB( sectionnumber - 1 );
segtimermin2 = 0;
SetMissionDvar( "segtimerminutes2", 0 );
SetMissionDvar( "segtimervalue2", 0 );
segfirstloop = 1;
time = "";
sectionname = sectionLookUp( sectionnumber );
self.hud_seg_msg2 = so_create_hud_item2( -8, xpos, sectionname, self, ypos );
self.hud_seg_value2 = so_create_hud_item2(-8, xpos + 78, time, self, ypos );
self.hud_seg_value_sec2 = so_create_hud_item2( -8, xpos + 85, "s", self, ypos );
self.hud_seg_msg2.alignX = "right";
self.hud_seg_value2.alignX = "right";
self.hud_segmintimer_value2 = so_create_hud_item2( -8, xpos + 20, time, self, ypos );
self.hud_segmintimer_value_min2 = so_create_hud_item2( -8, xpos + 32, " min", self, ypos );
self.hud_segmintimer_value2.alignX = "right";
while( true )
{
segtimerval2 = GetDvarFloat( "segtimervalue2" );
segtimermin2 = GetDvarInt( "segtimerminutes2" );
if( IsAlive( level.player ) == false )
{
segtimerval2 += 4.9;
if( segtimerval2 >= 60 )
{
segtimerval2 -= 60;
segtimermin2 += 1;
SetMissionDvar( "segtimerminutes2", segtimermin2 );
}
SetMissionDvar( "segtimervalue2", segtimerval2 );
break;
}
if( segtimerval2 == 60 )
{
SetMissionDvar( "segtimervalue2", 0 );
segtimerval2 = 0;
segtimermin2++;
SetMissionDvar( "segtimerminutes2", segtimermin2 );
self.hud_segmintimer_value2 SetValue( segtimermin2 );
}
self.hud_seg_value2 SetValue( segtimerval2 );
self.hud_segmintimer_value2 SetValue( segtimermin2 );
SetMissionDvar( "segtimervalue2", segtimerval2+0.1 );
wait 0.1;
}
}
segmenttimer3( sectionnumber )
{
if( GetDvarInt( "enabletimer" ) == 0 )
{
while( true )
{
wait 60;
}
}
xpos = GetDvarFloat( "timerhudx" );
if( xpos < 331 && xpos > -295 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "timerhudy" );
if( ypos > -112 && ypos < 286 )
{
wait 0.1;
}
else
{
ypos = 0;
}
level endon( "segment3_stop" );
level notify( "segment2_stop" );
if( sectionnumber > 1 )
sectionUpdatePB( sectionnumber - 1 );
segtimermin3 = 0;
SetMissionDvar( "segtimerminutes3", 0 );
SetMissionDvar( "segtimervalue3", 0 );
time = "";
sectionname = sectionLookUp( sectionnumber );
self.hud_seg_msg3 = so_create_hud_item2( -7, xpos, sectionname, self, ypos );
self.hud_seg_value3 = so_create_hud_item2( -7, xpos + 78, time, self, ypos );
self.hud_seg_value_sec3 = so_create_hud_item2( -7, xpos + 85, "s", self, ypos );
self.hud_seg_msg3.alignX = "right";
self.hud_seg_value3.alignX = "right";
self.hud_segmintimer_value3 = so_create_hud_item2( -7, xpos + 20, time, self, ypos );
self.hud_segmintimer_value_min3 = so_create_hud_item2( -7, xpos + 32, " min", self, ypos );
self.hud_segmintimer_value3.alignX = "right";
while( true )
{
segtimerval3 = GetDvarFloat( "segtimervalue3" );
segtimermin3 = GetDvarInt( "segtimerminutes3" );
if( IsAlive( level.player ) == false )
{
segtimerval3 += 4.9;
if( segtimerval3 >= 60 )
{
segtimerval3 -= 60;
segtimermin3 += 1;
SetMissionDvar( "segtimerminutes3", segtimermin3 );
}
SetMissionDvar( "segtimervalue3", segtimerval3 );
break;
}
if( segtimerval3 == 60 )
{
SetMissionDvar( "segtimervalue3", 0 );
segtimerval3 = 0;
segtimermin3++;
SetMissionDvar( "segtimerminutes3", segtimermin3 );
self.hud_segmintimer_value3 SetValue( segtimermin3 );
}
self.hud_seg_value3 SetValue( segtimerval3 );
self.hud_segmintimer_value3 SetValue( segtimermin3 );
SetMissionDvar( "segtimervalue3", segtimerval3+0.1 );
wait 0.1;
}
}
segmenttimer4( sectionnumber )
{
if( GetDvarInt( "enabletimer" ) == 0 )
{
while( true )
{
wait 60;
}
}
xpos = GetDvarFloat( "timerhudx" );
if( xpos < 331 && xpos > -295 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "timerhudy" );
if( ypos > -112 && ypos < 286 )
{
wait 0.1;
}
else
{
ypos = 0;
}
level endon( "segment4_stop" );
level notify( "segment3_stop" );
if( sectionnumber > 1 )
sectionUpdatePB( sectionnumber - 1 );
segtimermin4 = 0;
SetMissionDvar( "segtimerminutes4", 0 );
SetMissionDvar( "segtimervalue4", 0 );
time = "";
sectionname = sectionLookUp( sectionnumber );
self.hud_seg_msg4 = so_create_hud_item2( -6, xpos, sectionname, self, ypos );
self.hud_seg_value4 = so_create_hud_item2( -6, xpos + 78, time, self, ypos );
self.hud_seg_value_sec4 = so_create_hud_item2( -6, xpos + 85, "s", self, ypos );
self.hud_seg_msg4.alignX = "right";
self.hud_seg_value4.alignX = "right";
self.hud_segmintimer_value4 = so_create_hud_item2( -6, xpos + 20, time, self, ypos );
self.hud_segmintimer_value_min4 = so_create_hud_item2( -6, xpos + 32, " min", self, ypos );
self.hud_segmintimer_value4.alignX = "right";
while( true )
{
segtimerval4 = GetDvarFloat( "segtimervalue4" );
segtimermin4 = GetDvarInt( "segtimerminutes4" );
if( IsAlive( level.player ) == false )
{
segtimerval4 += 4.9;
if( segtimerval4 >= 60 )
{
segtimerval4 -= 60;
segtimermin4 += 1;
SetMissionDvar( "segtimerminutes4", segtimermin4 );
}
SetMissionDvar( "segtimervalue4", segtimerval4 );
break;
}
if( segtimerval4 == 60 )
{
SetMissionDvar( "segtimervalue4", 0 );
segtimerval4 = 0;
segtimermin4++;
SetMissionDvar( "segtimerminutes4", segtimermin4 );
self.hud_segmintimer_value4 SetValue( segtimermin4 );
}
self.hud_seg_value4 SetValue( segtimerval4 );
self.hud_segmintimer_value4 SetValue( segtimermin4 );
SetMissionDvar( "segtimervalue4", segtimerval4+0.1 );
wait 0.1;
}
}
updateLevelPB( levelnum )
{
color = ( 0, 1, 0 );
label = "New level PB!";
if( levelnum == 1 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "fng" ) )
{
SetMissionDvar( "fng", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 2 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "crewexp" ) )
{
SetMissionDvar( "crewexp", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 3 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "blackout" ) )
{
SetMissionDvar( "blackout", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 4 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "cds" ) )
{
SetMissionDvar( "cds", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 5 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "bog" ) )
{
SetMissionDvar( "bog", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 6 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "hunted" ) )
{
SetMissionDvar( "hunted", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 7 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "dfa" ) )
{
SetMissionDvar( "dfa", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 8 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "wp" ) )
{
SetMissionDvar( "wp", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 9 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "saa" ) )
{
SetMissionDvar( "saa", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 10 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "afterm" ) )
{
SetMissionDvar( "afterm", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 11 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "safeh" ) )
{
SetMissionDvar( "safeh", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 12 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "agu" ) )
{
SetMissionDvar( "agu", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 13 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "osok" ) )
{
SetMissionDvar( "osok", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 14 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "heat" ) )
{
SetMissionDvar( "heat", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 15 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "sins" ) )
{
SetMissionDvar( "sins", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 16 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "ulti" ) )
{
SetMissionDvar( "ulti", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 17 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "allin" ) )
{
SetMissionDvar( "allin", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 18 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "nfitwr" ) )
{
SetMissionDvar( "nfitwr", improvedtime );
random_text2( label, color );
}
}
if( levelnum == 19 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "gameover" ) )
{
SetMissionDvar( "gameover", improvedtime );
random_text2( label, color );
}
}
}
sectionUpdatePB( number )
{
color = ( 0, 1, 0 );
label = "New section PB!";
if( number == 1 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "fng_01" ) )
{
SetMissionDvar( "fng_01", improvedtime );
random_text3( label, color );
}
}
if( number == 2 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "fng_02" ) )
{
SetMissionDvar( "fng_02", improvedtime );
random_text3( label, color );
}
}
if( number == 3 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "crewexp_01" ) )
{
SetMissionDvar( "crewexp_01", improvedtime );
random_text3( label, color );
}
}
if( number == 4 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "crewexp_02" ) )
{
SetMissionDvar( "crewexp_02", improvedtime );
random_text3( label, color );
}
}
if( number == 5 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "crewexp_03" ) )
{
SetMissionDvar( "crewexp_03", improvedtime );
random_text3( label, color );
}
}
if( number == 6 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "blackout_01" ) )
{
SetMissionDvar( "blackout_01", improvedtime );
random_text3( label, color );
}
}
if( number == 7 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "blackout_02" ) )
{
SetMissionDvar( "blackout_02", improvedtime );
random_text3( label, color );
}
}
if( number == 8 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "blackout_03" ) )
{
SetMissionDvar( "blackout_03", improvedtime );
random_text3( label, color );
}
}
if( number == 9 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "blackout_04" ) )
{
SetMissionDvar( "blackout_04", improvedtime );
random_text3( label, color );
}
}
if( number == 10 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "cds_01" ) )
{
SetMissionDvar( "cds_01", improvedtime );
random_text3( label, color );
}
}
if( number == 11 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "cds_02" ) )
{
SetMissionDvar( "cds_02", improvedtime );
random_text3( label, color );
}
}
if( number == 12 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "bog_01" ) )
{
SetMissionDvar( "bog_01", improvedtime );
random_text3( label, color );
}
}
if( number == 13 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "bog_02" ) )
{
SetMissionDvar( "bog_02", improvedtime );
random_text3( label, color );
}
}
if( number == 14 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "bog_03" ) )
{
SetMissionDvar( "bog_03", improvedtime );
random_text3( label, color );
}
}
if( number == 15 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "bog_04" ) )
{
SetMissionDvar( "bog_04", improvedtime );
random_text3( label, color );
}
}
if( number == 16 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "hunted_01" ) )
{
SetMissionDvar( "hunted_01", improvedtime );
random_text3( label, color );
}
}
if( number == 17 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "hunted_02" ) )
{
SetMissionDvar( "hunted_02", improvedtime );
random_text3( label, color );
}
}
if( number == 18 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "hunted_03" ) )
{
SetMissionDvar( "hunted_03", improvedtime );
random_text3( label, color );
}
}
if( number == 19 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "hunted_04" ) )
{
SetMissionDvar( "hunted_04", improvedtime );
random_text3( label, color );
}
}
if( number == 20 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "dfa_01" ) )
{
SetMissionDvar( "dfa_01", improvedtime );
random_text3( label, color );
}
}
if( number == 21 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "dfa_02" ) )
{
SetMissionDvar( "dfa_02", improvedtime );
random_text3( label, color );
}
}
if( number == 22 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "dfa_03" ) )
{
SetMissionDvar( "dfa_03", improvedtime );
random_text3( label, color );
}
}
if( number == 23 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "dfa_04" ) )
{
SetMissionDvar( "dfa_04", improvedtime );
random_text3( label, color );
}
}
if( number == 24 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "wp_01" ) )
{
SetMissionDvar( "wp_01", improvedtime );
random_text3( label, color );
}
}
if( number == 25 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "wp_02" ) )
{
SetMissionDvar( "wp_02", improvedtime );
random_text3( label, color );
}
}
if( number == 26 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "wp_03" ) )
{
SetMissionDvar( "wp_03", improvedtime );
random_text3( label, color );
}
}
if( number == 27 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "saa_01" ) )
{
SetMissionDvar( "saa_01", improvedtime );
random_text3( label, color );
}
}
if( number == 28 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "saa_02" ) )
{
SetMissionDvar( "saa_02", improvedtime );
random_text3( label, color );
}
}
if( number == 29 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "safeh_01" ) )
{
SetMissionDvar( "safeh_01", improvedtime );
random_text3( label, color );
}
}
if( number == 30 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "safeh_02" ) )
{
SetMissionDvar( "safeh_02", improvedtime );
random_text3( label, color );
}
}
if( number == 31 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "agu_01" ) )
{
SetMissionDvar( "agu_01", improvedtime );
random_text3( label, color );
}
}
if( number == 32 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "agu_02" ) )
{
SetMissionDvar( "agu_02", improvedtime );
random_text3( label, color );
}
}
if( number == 33 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "agu_03" ) )
{
SetMissionDvar( "agu_03", improvedtime );
random_text3( label, color );
}
}
if( number == 34 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "osok_01" ) )
{
SetMissionDvar( "osok_01", improvedtime );
random_text3( label, color );
}
}
if( number == 35 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "osok_02" ) )
{
SetMissionDvar( "osok_02", improvedtime );
random_text3( label, color );
}
}
if( number == 36 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "osok_03" ) )
{
SetMissionDvar( "osok_03", improvedtime );
random_text3( label, color );
}
}
if( number == 37 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "osok_04" ) )
{
SetMissionDvar( "osok_04", improvedtime );
random_text3( label, color );
}
}
if( number == 38 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "heat_01" ) )
{
SetMissionDvar( "heat_01", improvedtime );
random_text3( label, color );
}
}
if( number == 39 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "heat_02" ) )
{
SetMissionDvar( "heat_02", improvedtime );
random_text3( label, color );
}
}
if( number == 40 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "heat_03" ) )
{
SetMissionDvar( "heat_03", improvedtime );
random_text3( label, color );
}
}
if( number == 41 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "heat_04" ) )
{
SetMissionDvar( "heat_04", improvedtime );
random_text3( label, color );
}
}
if( number == 42 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "sins_01" ) )
{
SetMissionDvar( "sins_01", improvedtime );
random_text3( label, color );
}
}
if( number == 43 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "sins_02" ) )
{
SetMissionDvar( "sins_02", improvedtime );
random_text3( label, color );
}
}
if( number == 44 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "sins_03" ) )
{
SetMissionDvar( "sins_03", improvedtime );
random_text3( label, color );
}
}
if( number == 45 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "ulti_01" ) )
{
SetMissionDvar( "ulti_01", improvedtime );
random_text3( label, color );
}
}
if( number == 46 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "ulti_02" ) )
{
SetMissionDvar( "ulti_02", improvedtime );
random_text3( label, color );
}
}
if( number == 47 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "ulti_03" ) )
{
SetMissionDvar( "ulti_03", improvedtime );
random_text3( label, color );
}
}
if( number == 48 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "allin_01" ) )
{
SetMissionDvar( "allin_01", improvedtime );
random_text3( label, color );
}
}
if( number == 49 )
{
seconds = GetDvarFloat( "segtimervalue" );
minutes = GetDvarInt( "segtimerminutes" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "nfitwr_01" ) )
{
SetMissionDvar( "nfitwr_01", improvedtime );
random_text3( label, color );
}
}
if( number == 50 )
{
seconds = GetDvarFloat( "segtimervalue2" );
minutes = GetDvarInt( "segtimerminutes2" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "nfitwr_02" ) )
{
SetMissionDvar( "nfitwr_02", improvedtime );
random_text3( label, color );
}
}
if( number == 51 )
{
seconds = GetDvarFloat( "segtimervalue3" );
minutes = GetDvarInt( "segtimerminutes3" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "nfitwr_03" ) )
{
SetMissionDvar( "nfitwr_03", improvedtime );
random_text3( label, color );
}
}
if( number == 52 )
{
seconds = GetDvarFloat( "segtimervalue4" );
minutes = GetDvarInt( "segtimerminutes4" );
improvedtime = improvement( seconds, minutes );
if( improvedtime < GetDvarFloat( "nfitwr_04" ) )
{
SetMissionDvar( "nfitwr_04", improvedtime );
random_text3( label, color );
}
}
}
sectionUpdatePBLastLevel()
{
levelnumber = GetDvarInt( "lastplayedlevel" );
updateLevelPB( levelnumber );
}
sectionUpdatePBLastLevelSeg()
{
sectionnumber2 = GetDvarInt( "lastplayedsection" );
sectionUpdatePB( sectionnumber2 );
}
sectionLookUp( number )
{
label = "";
if( number == 1 )
{
label = "Range: ";
}
if( number == 2 )
{
label = "CQB Course: ";
}
if( number == 3 )
{
label = "Deck: ";
}
if( number == 4 )
{
label = "Ship clear: ";
}
if( number == 5 )
{
label = "Escape: ";
}
if( number == 6 )
{
label = "Door: ";
}
if( number == 7 )
{
label = "Rappel: ";
}
if( number == 8 )
{
label = "Nikolai house: ";
}
if( number == 9 )
{
label = "Heli: ";
}
if( number == 10 )
{
label = "Streets: ";
}
if( number == 11 )
{
label = "CDS Skip: ";
}
if( number == 12 )
{
label = "Ambush: ";
}
if( number == 13 )
{
label = "Overpass: ";
}
if( number == 14 )
{
label = "ZPU: ";
}
if( number == 15 )
{
label = "Ending: ";
}
if( number == 16 )
{
label = "Field entry: ";
}
if( number == 17 )
{
label = "Farm clear: ";
}
if( number == 18 )
{
label = "Barn door: ";
}
if( number == 19 )
{
label = "Ending: ";
}
if( number == 20 )
{
label = "Church: ";
}
if( number == 21 )
{
label = "Rolling in: ";
}
if( number == 22 )
{
label = "Convoy: ";
}
if( number == 23 )
{
label = "Junkyard: ";
}
if( number == 24 )
{
label = "B6, moving up: ";
}
if( number == 25 )
{
label = "Tank advance: ";
}
if( number == 26 )
{
label = "Tank shot: ";
}
if( number == 27 )
{
label = "Backlot: ";
}
if( number == 28 )
{
label = "Pilot rescue: ";
}
if( number == 29 )
{
label = "Barn clear: ";
}
if( number == 30 )
{
label = "Al-Asad breach: ";
}
if( number == 31 )
{
label = "OoB: ";
}
if( number == 32 )
{
label = "Apartment: ";
}
if( number == 33 )
{
label = "End trigger: ";
}
if( number == 34 )
{
label = "Rappel: ";
}
if( number == 35 )
{
label = "Mac door: ";
}
if( number == 36 )
{
label = "LZ reached: ";
}
if( number == 37 )
{
label = "Evac'd: ";
}
if( number == 38 )
{
label = "Smokescreens: ";
}
if( number == 39 )
{
label = "Detonators: ";
}
if( number == 40 )
{
label = "Tanks destroyed: ";
}
if( number == 41 )
{
label = "Chopper boarded: ";
}
if( number == 42 )
{
label = "Area clear: ";
}
if( number == 43 )
{
label = "Apartment entered: ";
}
if( number == 44 )
{
label = "Viktor reached: ";
}
if( number == 45 )
{
label = "Basement door: ";
}
if( number == 46 )
{
label = "Fence cut: ";
}
if( number == 47 )
{
label = "Meetup: ";
}
if( number == 48 )
{
label = "Cutting vents: ";
}
if( number == 49 )
{
label = "Staircase: ";
}
if( number == 50 )
{
label = "The Door: ";
}
if( number == 51 )
{
label = "Control room: ";
}
if( number == 52 )
{
label = "End area clear: ";
}
return label;
}
improvement( sec, min )
{
mintosec = 60 * min;
totaltime = mintosec + sec;
totaltime -= 0.1;
return totaltime;
}
improvement2( sec, min )
{
mintosec = 60 * min;
totaltime = mintosec + sec;
return totaltime;
}
calculatePBs()
{
calculategoldstotal();
wait 0.1;
timecalc( "fng" );
wait 0.1;
timecalc( "crewexp" );
wait 0.1;
timecalc( "blackout" );
wait 0.1;
timecalc( "cds" );
wait 0.1;
timecalc( "bog" );
wait 0.1;
timecalc( "hunted" );
wait 0.1;
timecalc( "dfa" );
wait 0.1;
timecalc( "wp" );
wait 0.1;
timecalc( "saa" );
wait 0.1;
timecalc( "afterm" );
wait 0.1;
timecalc( "safeh" );
wait 0.1;
timecalc( "agu" );
wait 0.1;
timecalc( "osok" );
wait 0.1;
timecalc( "heat" );
wait 0.1;
timecalc( "sins" );
wait 0.1;
timecalc( "ulti" );
wait 0.1;
timecalc( "allin" );
wait 0.1;
timecalc( "nfitwr" );
wait 0.1;
timecalc( "gameover" );
wait 0.1;
timecalchours( "goldstotal" );

timecalchours( "fulltimepb" );
	wait 0.1;
	timecalc( "fng_any" );
	wait 0.1;
	timecalc( "crewexp_any" );
	wait 0.1;
	timecalc( "blackout_any" );
	wait 0.1;
	timecalc( "cds_any" );
	wait 0.1;
	timecalc( "bog_any" );
	wait 0.1;
	timecalc( "hunted_any" );
	wait 0.1;
	timecalc( "dfa_any" );
	wait 0.1;
	timecalc( "wp_any" );
	wait 0.1;
	timecalc( "saa_any" );
	wait 0.1;
	timecalc( "afterm_any" );
	wait 0.1;
	timecalc( "safeh_any" );
	wait 0.1;
	timecalc( "agu_any" );
	wait 0.1;
	timecalc( "osok_any" );
	wait 0.1;
	timecalc( "heat_any" );
	wait 0.1;
	timecalc( "sins_any" );
	wait 0.1;
	timecalc( "ulti_any" );
	wait 0.1;
	timecalc( "allin_any" );
	wait 0.1;
	timecalc( "nfitwr_any" );
	wait 0.1;
	timecalc( "gameover_any" );
}
timecalc( levelname )
{
time = GetDvarFloat( levelname );
if( time > 90000 )
{
string = levelname + "_string";
timestring = "N/A";
}
else
{
minutes = int( time/60 );
seconds = time/60 - minutes;
seconds = 60 * seconds;
seconds = int( seconds * 10 );
seconds = seconds / 10;
string = levelname + "_string";
timestring = minutes + "min " + seconds + "s";
}
SetMissionDvar( string, timestring );
}

calculategoldstotal()
{
	fng = GetDvarFloat( "fng" );
	crewexp = GetDvarFloat( "crewexp" );
	blackout = GetDvarFloat( "blackout" );
	cds = GetDvarFloat( "cds" );
	bog = GetDvarFloat( "bog" );
	hunted = GetDvarFloat( "hunted" );
	dfa = GetDvarFloat( "dfa" );
	wp = GetDvarFloat( "wp" );
	saa = GetDvarFloat( "saa" );
	afterm = GetDvarFloat( "afterm" );
	safeh = GetDvarFloat( "safeh" );
	agu = GetDvarFloat( "agu" );
	osok = GetDvarFloat( "osok" );
	heat = GetDvarFloat( "heat" );
	sins = GetDvarFloat( "sins" );
	ulti = GetDvarFloat( "ulti" );
	allin = GetDvarFloat( "allin" );
	nfitwr = GetDvarFloat( "nfitwr" );
	gameover = GetDvarFloat( "gameover" );
	coup = 284;
	total = fng+crewexp+blackout+cds+bog+hunted+dfa+wp+saa+afterm+safeh+agu+osok+heat+sins+ulti+allin+nfitwr+gameover+coup;
	SetMissionDvar( "goldstotal", total );
}

timecalchours( levelname )
{
time = GetDvarFloat( levelname );
if( time > 90000 )
{
string = levelname + "_string";
timestring = "N/A";
}
else
{
hours = int( time/60/60 );
hourmins = 60 * hours;
minutes = int( time/60 );
minutes = minutes - hourmins;
seconds = time/60 - minutes - hourmins;
seconds = 60 * seconds;
seconds = int( seconds * 10 );
seconds = seconds / 10;
string = levelname + "_string";
timestring = hours + "h " + minutes + "min " + seconds + "s";
}
SetMissionDvar( string, timestring );
}

fullgametimer()
{
level endon( "timer_stop" );

if( GetDvarInt( "selectinglevel" ) == 1 && GetDvar( "mapname" ) == "killhouse" )
{
	updateLevelPBFull( "killhouse" );
	SetMissionDvar( "fulltimervalue", -2.2 );
	SetMissionDvar( "fulltimerminutes", 0 );
	SetMissionDvar( "fulltimerhours", 0 );
}

else if( GetDvar( "mapname" ) == "coup" )
{
	updateLevelPBFull( "coup" );
	secs = GetDvarFloat( "fulltimervalue" );
	secs += 44;
	mins = GetDvarInt( "fulltimerminutes" );
	mins += 4;
	SetMissionDvar( "fulltimervalue", secs );
	SetMissionDvar( "fulltimerminutes", mins );
	while( true )
	{
		wait 120;
	}
}

else if( GetDvarInt( "selectinglevel" ) == 1 && GetDvar( "mapname" ) != "blackout" )
{
	while( true )
	{
		wait 120;
	}
}
else if( GetDvarInt( "fulltimerminutes" ) < 7 && GetDvar( "mapname" ) == "blackout" )
{
	while( true )
	{
		wait 120;
	}
}
mapname = GetDvar( "mapname" );
if( mapname != "killhouse"  && GetDvarInt( "playerrestarting" ) == 0 )
	thread updateLevelPBFull( mapname );
	
SetMissionDvar( "selectinglevel", 0 );
SetMissionDvar( "playerrestarting", 0 );
xpos = GetDvarFloat( "fulltimerhudx" );
if( xpos < 331 && xpos > -288 )
{
	
}
else
{
	xpos = 0;
}
ypos = GetDvarFloat( "fulltimerhudy" );
if( ypos > -112 && ypos < 331 )
{
	
}
else
{
	ypos = 0;
}

time = "";
fulltimerhour = 0;
fulltimermin = 0;
self.hud_fulltimer_msg = so_create_hud_item2( -10, xpos - 30, "Full Game time: ", self, ypos );
self.hud_fulltimer_value = so_create_hud_item2( -10, xpos + 46, time, self, ypos );
self.hud_fulltimer_msg.alignX = "right";
self.hud_fulltimer_value.alignX = "right";
self.hud_fullmintimer_value = so_create_hud_item2( -10, xpos + 10, time, self, ypos );
self.hud_fullmintimer_value_min = so_create_hud_item2( -10, xpos + 12, " :", self, ypos );
self.hud_fullmintimer_value.alignX = "right";
self.hud_fullmintimer_value SetValue( fulltimermin );
self.hud_fullhourtimer_value = so_create_hud_item2( -10, xpos -20, time, self, ypos );
self.hud_fullhourtimer_value_min = so_create_hud_item2( -10, xpos - 12, ":", self, ypos );
self.hud_fullhourimer_value.alignX = "right";
self.hud_fullhourtimer_value SetValue( fulltimerhour );
while( true )
{
fulltimerval = GetDvarFloat( "fulltimervalue" );
fulltimermin = GetDvarInt( "fulltimerminutes" );
fulltimerhour = GetDvarInt( "fulltimerhours" );
if( IsAlive( level.player ) == false )
{
fulltimerval += 4.9;
if( fulltimerval >= 60 )
{
fulltimerval -= 60;
fulltimermin += 1;
if( fulltimermin >= 60 )
{
	fulltimermin -= 60;
	fulltimerhour += 1;
	SetMissionDvar( "fulltimerhours", fulltimerhour );
}
SetMissionDvar( "fulltimerminutes", fulltimermin );
}
SetMissionDvar( "fulltimervalue", fulltimerval );
break;
}
if( fulltimerval >= 60 )
{
fulltimerval -= 60;
fulltimermin += 1;
if( fulltimermin >= 60 )
{
	fulltimermin -= 60;
	fulltimerhour += 1;
	SetMissionDvar( "fulltimerhours", fulltimerhour );
}
SetMissionDvar( "fulltimerminutes", fulltimermin );
SetMissionDvar( "fulltimervalue", fulltimerval );
}
SetMissionDvar( "fulltimervalue", fulltimerval+0.1 );
self.hud_fulltimer_value SetValue( fulltimerval );
self.hud_fullmintimer_value SetValue( fulltimermin );
self.hud_fullhourtimer_value SetValue( fulltimerhour );
wait 0.1;
}
}

updateLevelPBFull( map )
{
fulltimetemp = 0;
levelnum = 0;
fulltime = GetDvarFloat( "fulltimec" );
fulltimecut = 0;
improvedtime = 0;
if( map == "cargoship" )
{
fulltime = GetDvarFloat( "fulltimepb" );
SetMissionDvar( "fulltimec", fulltime );
SetMissionDvar( "fulltimecomparison", fulltime );
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "fng_temp", improvedtime );
fng_any = GetDvarFloat( "fng_any" );
fulltimecut = fulltime - fng_any;
}
if( map == "coup" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "crewexp_temp", improvedtime );
crewexp_any = GetDvarFloat( "crewexp_any" );
fulltimecut = fulltime - crewexp_any;
}
if( map == "blackout" )
{
fulltimecut = fulltime - 284;
}
if( map == "armada" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "blackout_temp", improvedtime );
blackout_any = GetDvarFloat( "blackout_any" );
fulltimecut = fulltime - blackout_any;
}
if( map == "bog_a" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "cds_temp", improvedtime );
cds_any = GetDvarFloat( "cds_any" );
fulltimecut = fulltime - cds_any;
}
if( map == "hunted" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "bog_temp", improvedtime );
bog_any = GetDvarFloat( "bog_any" );
fulltimecut = fulltime - bog_any;
}
if( map == "ac130" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "hunted_temp", improvedtime );
hunted_any = GetDvarFloat( "hunted_any" );
fulltimecut = fulltime - hunted_any;
}
if( map == "bog_b" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "dfa_temp", improvedtime );
dfa_any = GetDvarFloat( "dfa_any" );
fulltimecut = fulltime - dfa_any;
}
if( map == "airlift" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "wp_temp", improvedtime );
wp_any = GetDvarFloat( "wp_any" );
fulltimecut = fulltime - wp_any;
}
if( map == "aftermath" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "saa_temp", improvedtime );
saa_any = GetDvarFloat( "saa_any" );
fulltimecut = fulltime - saa_any;
}
if( map == "village_assault" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "afterm_temp", improvedtime );
afterm_any = GetDvarFloat( "afterm_any" );
fulltimecut = fulltime - afterm_any;
}
if( map == "scoutsniper" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "safeh_temp", improvedtime );
safeh_any = GetDvarFloat( "safeh_any" );
fulltimecut = fulltime - safeh_any;
}
if( map == "sniperescape" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "agu_temp", improvedtime );
agu_any = GetDvarFloat( "agu_any" );
fulltimecut = fulltime - agu_any;
}
if( map == "village_defend" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "osok_temp", improvedtime );
osok_any = GetDvarFloat( "osok_any" );
fulltimecut = fulltime - osok_any;
}
if( map == "ambush" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "heat_temp", improvedtime );
heat_any = GetDvarFloat( "heat_any" );
fulltimecut = fulltime - heat_any;
}
if( map == "icbm" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "sins_temp", improvedtime );
sins_any = GetDvarFloat( "sins_any" );
fulltimecut = fulltime - sins_any;
}
if( map == "launchfacility_a" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "ulti_temp", improvedtime );
ulti_any = GetDvarFloat( "ulti_any" );
fulltimecut = fulltime - ulti_any;
}
if( map == "launchfacility_b" )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "allin_temp", improvedtime );
allin_any = GetDvarFloat( "allin_any" );
fulltimecut = fulltime - allin_any;
SetMissionDvar( "gameoversplit", 0 );
}
if( map == "jeepride" && GetDvarInt( "gameoversplit" ) == 1 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "calcPB", 1 ); 
SetMissionDvar( "gameover_temp", improvedtime );
gameover_any = GetDvarFloat( "gameover_any" );
fulltimecut = fulltime - gameover_any;
}
if( map == "jeepride" && GetDvarInt( "gameoversplit" ) == 0 )
{
seconds = GetDvarFloat( "timervalue" );
minutes = GetDvarInt( "timerminutes" );
improvedtime = improvement2( seconds, minutes );
SetMissionDvar( "nfitwr_temp", improvedtime );
SetMissionDvar( "gameoversplit", 1 );
nfitwr_any = GetDvarFloat( "nfitwr_any" );
fulltimecut = fulltime - nfitwr_any;
}

SetMissionDvar( "fulltimec", fulltimecut );
fulltimetemp = GetDvarFloat( "fulltimetemp" );
fulltimetemp += improvedtime;
SetMissionDvar( "fulltimetemp", fulltimetemp );
fulltimecomp = 0;
if( map == "killhouse" )
{
	fulltimecomp = GetDvarFloat( "fulltimepb" );
	SetMissionDvar( "fulltimetemp", 0 );
}
else
	fulltimecomp = GetDvarFloat( "fulltimecomparison" );
if( map == "coup" )
{
	fulltimecomp = fulltimecomp - 284;
	fulltimecomp = fulltimecomp - improvedtime;
}
else
	fulltimecomp = fulltimecomp - improvedtime;
	
SetMissionDvar( "fulltimecomparison", fulltimecomp );
differential = fulltimecut - fulltimecomp;
label = "";
color = ( 1, 1, 1 );
if( differential >= 60 )
{
	differentialminutes = int( differential / 60 ); 
	differentialseconds = differentialminutes * 60;
	differentialseconds = differential - differentialseconds;
	differentialseconds = int(differentialseconds * 10);
	differentialseconds = differentialseconds/10;
	if( differentialseconds < 10 )
		label = "+" + differentialminutes + ":0" + differentialseconds;
	else
		label = "+" + differentialminutes + ":" + differentialseconds;
		
	color = ( 1, 0, 0 );
}

else if( differential <= -60 )
{
	differential = differential * -1;
	differentialminutes = int( differential / 60 ); 
	differentialseconds = differentialminutes * 60;
	differentialseconds = differential - differentialseconds;
	differentialseconds = int(differentialseconds * 10);
	differentialseconds = differentialseconds/10;
	if( differentialseconds < 10 )
		label = "-" + differentialminutes + ":0" + differentialseconds;
	else
		label = "-" + differentialminutes + ":" + differentialseconds;
		
	color = ( 0, 1, 0 );
}

else if( differential >= 0 )
{
	differential = int(differential * 10);
	differential = differential/10;
	label = "+" + differential;
	color = ( 1, 0, 0 );
}

else if( differential <= 0 )
{
	differential = differential * -1;
	differential = int(differential * 10);
	differential = differential/10;
	label = "-" + differential;
	color = ( 0, 1, 0 );
}
xpos = GetDvarFloat( "fulltimerhudx" );
if( xpos < 331 && xpos > -288 )
{
wait 0.1;
}
else
{
xpos = 0;
}
ypos = GetDvarFloat( "fulltimerhudy" );
if( ypos > -112 && ypos < 331 )
{
wait 0.1;
}
else
{
ypos = 0;
}
if( map != "killhouse" && map != "coup" && differential < 50000 && differential > -50000 )
	random_text5( label, color, xpos, ypos );
	
	if( map == "jeepride" && GetDvarInt( "gameoversplit" ) == 1 && GetDvarInt( "calcPB" ) == 1 )
		thread calcIfNewPB();
}

calcIfNewPB()
{
	label = "New Personal Best!";
	color = ( 0, 1, 0 );
	SetMissionDvar( "gameoversplit", 0 );
	SetMissionDvar( "calcPB", 0 ); 
	fulltimecontender = GetDvarFloat( "fulltimetemp" );
	fulltimecontender += 284;
	fulltimecurpb = GetDvarFloat( "fulltimepb" );
	fulltimecurpb += 284;
	if( fulltimecontender < fulltimecurpb )
	{
		SetMissionDvar( "fulltimepb", fulltimecontender );
		SetMissionDvar( "fng_any", GetDvarFloat( "fng_temp" ) );
		SetMissionDvar( "crewexp_any", GetDvarFloat( "crewexp_temp" ) );
		SetMissionDvar( "blackout_any", GetDvarFloat( "blackout_temp" ) );
		SetMissionDvar( "cds_any", GetDvarFloat( "cds_temp" ) );
		SetMissionDvar( "bog_any", GetDvarFloat( "bog_temp" ) );
		SetMissionDvar( "hunted_any", GetDvarFloat( "hunted_temp" ) );
		SetMissionDvar( "dfa_any", GetDvarFloat( "dfa_temp" ) );
		SetMissionDvar( "wp_any", GetDvarFloat( "wp_temp" ) );
		SetMissionDvar( "saa_any", GetDvarFloat( "saa_temp" ) );
		SetMissionDvar( "afterm_any", GetDvarFloat( "afterm_temp" ) );
		SetMissionDvar( "safeh_any", GetDvarFloat( "safeh_temp" ) );
		SetMissionDvar( "agu_any", GetDvarFloat( "agu_temp" ) );
		SetMissionDvar( "osok_any", GetDvarFloat( "osok_temp" ) );
		SetMissionDvar( "heat_any", GetDvarFloat( "heat_temp" ) );
		SetMissionDvar( "sins_any", GetDvarFloat( "sins_temp" ) );
		SetMissionDvar( "ulti_any", GetDvarFloat( "ulti_temp" ) );
		SetMissionDvar( "allin_any", GetDvarFloat( "allin_temp" ) );
		SetMissionDvar( "nfitwr_any", GetDvarFloat( "nfitwr_temp" ) );
		SetMissionDvar( "gameover_any", GetDvarFloat( "gameover_temp" ) );
		random_text6( label, color );
	}
	timecalchours( "fulltimepb" );
	wait 0.1;
	timecalc( "fng_any" );
	wait 0.1;
	timecalc( "crewexp_any" );
	wait 0.1;
	timecalc( "blackout_any" );
	wait 0.1;
	timecalc( "cds_any" );
	wait 0.1;
	timecalc( "bog_any" );
	wait 0.1;
	timecalc( "hunted_any" );
	wait 0.1;
	timecalc( "dfa_any" );
	wait 0.1;
	timecalc( "wp_any" );
	wait 0.1;
	timecalc( "saa_any" );
	wait 0.1;
	timecalc( "afterm_any" );
	wait 0.1;
	timecalc( "safeh_any" );
	wait 0.1;
	timecalc( "agu_any" );
	wait 0.1;
	timecalc( "osok_any" );
	wait 0.1;
	timecalc( "heat_any" );
	wait 0.1;
	timecalc( "sins_any" );
	wait 0.1;
	timecalc( "ulti_any" );
	wait 0.1;
	timecalc( "allin_any" );
	wait 0.1;
	timecalc( "nfitwr_any" );
	wait 0.1;
	timecalc( "gameover_any" );	
}

enable_hc()
{
	if( GetDvar( "g_gameskill" ) == "0" )
		SetSavedDvar( "player_damageMultiplier", 0.2947364);
	if( GetDvar( "g_gameskill" ) == "3" )
		SetSavedDvar( "player_damageMultiplier", 1.218);
	if( GetDvar( "mapname" ) != "killhouse" )
	{
		level.player SetSpreadOverride( 20 );
		thread weaponammoDepletes();
		thread explosion_monitor();
	}
	while( true )
	{
		SetSavedDvar( "compass", 0 );
		SetSavedDvar( "hud_showStance", 0 );
		SetSavedDvar( "ammoCounterHide", 1 );
		SetSavedDvar( "hud_drawhud", 1 );
		SetSavedDvar( "bg_viewkickscale", 4 );
		SetSavedDvar( "cg_weaponhintsCoD1Style", 0 );
		SetExpFog( 300, 600, 0, 0, 0, 1 );
		wait 1;
	}
}

weaponammoDepletes()
{
	while( true )
	{
		currentammo = level.player GetCurrentWeaponClipAmmo();
		if( currentammo == 0 )
		{
			currentweapon = level.player GetCurrentWeapon();
			currentreserve = level.player GetWeaponAmmoStock( currentweapon );
			if( currentreserve > 0 )
			{
				wait 5;
				level.player SetWeaponAmmoStock( currentweapon, 0 );
			}
		}
		
		else
		{
			currentweapon = level.player GetCurrentWeapon();
			if( currentweapon == "javelin" )
				wait 0.05;
		
			else
				level.player SetWeaponAmmoStock( currentweapon, 0 );
		}
		wait 0.05;
	}
}

explosion_monitor()
{
	while ( true )
	{
		level.player waittill( "damage", amount, attacker, direction_vec, point, type );
		if( type == "MOD_GRENADE_SPLASH" || type == "MOD_PROJECTILE_SPLASH")
		level.player ShellShock( "jeepride_bridgebang", 5 );
		wait 0.05;
	}
}