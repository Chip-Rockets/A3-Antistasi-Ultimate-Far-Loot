/*  Creates and maintains UAV support

Environment: Server, must be spawned

Arguments:
    <ARRAY> Active support data, see initSupports
    <STRING> Resource pool of support, "attack" or "defence"
    <STRING> Marker name of source airport
    <POS2D> Target position for airstrike
    <STRING> Classname of aircraft to use
    <SCALAR> Delay time in seconds
    <SCALAR> Amount of information to reveal to rebels, 0-1
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_suppData", "_resPool", "_airport", "_planeType", "_sleepTime", "_reveal"];
_suppData params ["_supportName", "_side", "_suppType", "_suppCenter", "_suppRadius", "_suppTarget"];

//Sleep to simulate preparation time
sleep _sleepTime;
private _currentTarget = objNull;
private _laser = objNull;
private _spawnPos = markerPos _airport vectorAdd [0,0,300];
private _uav = createVehicle [_planeType, _spawnPos, [], 0, "FLY"];
[_side, _uav] call A3A_fnc_createVehicleCrew;
_groupVeh = group driver _uav;
{ [_x, nil, false, _resPool] call A3A_fnc_NATOinit } forEach (crew _uav);           // arguable
[_uav, _side, _resPool] call A3A_fnc_AIVEHinit;
private _gunner = gunner _uav;

_uav addEventHandler ["Fired", {
    params ["_uav", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    _uav setVariable ["A3A_currentMissile", _projectile];
}];

#if __A3_DEBUG__
		_uav spawn {
			while {alive _this} do {
				sleep 1;
				private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
				_localMarker setMarkerSizeLocal [1,1];
				_localMarker setMarkerAlpha 1; 
				_localMarker setMarkerTypeLocal "hd_dot";
				_localMarker setMarkerColorLocal "ColorRed";
			};

			if (!alive _this) then {
				private _localMarker = createMarkerLocal [format ["%1test%2", random 10000, random 10000], (position _this)];
				_localMarker setMarkerSizeLocal [1,1];
				_localMarker setMarkerAlpha 1; 
				_localMarker setMarkerTypeLocal "KIA";
				_localMarker setMarkerColorLocal "ColorRed";	
			};
		};
#endif

_wp = _groupVeh addWayPoint [_suppCenter, 0];
_wp setWaypointBehaviour "AWARE";
_wp setWaypointType "SAD";
/* _wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointSpeed "NORMAL";
_wp setWaypointLoiterRadius 1200; */
_groupVeh setCurrentWaypoint _wp;
_uav flyInHeight 500;           // maybe not necessary if we lock the waypoint
_groupVeh lockWP true;          // prevent exiting the SAD waypoint

// do we just run for 20mins and then RTB?
private _timeout = time + 1200;
private _enemySide = [Invaders, Occupants] select (_side == Invaders);
_uav addEventHandler
[
    "Fired",
    {
        params ["_uav", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

        private _target = _uav getVariable ["currentTarget", objNull]; //what target?
        if(_target isEqualTo objNull) exitWith {};//what?

        if(_target isEqualType objNull) then
        {
            _target = getPosASL _target;
        };

        /* if(_weapon == "rockets_Skyfire") then ///something else or remove completly
        {}; */
        _target = _target apply {_x + (random 50) - 25};
        [_projectile, _target] spawn
        {
            params ["_projectile", "_target"];
            sleep 0.25;
            private _speed = (speed _projectile)/3.6;
            while {!(isNull _projectile) && {alive _projectile}} do
            {
                sleep 0.25;
                private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
                _projectile setVelocity (_dir vectorMultiply _speed);
                _projectile setVectorDir _dir;
            };
        };
        
    }
];
{
    private _fnc_executeFireOrder =
    {
        Debug_1("Fireorder %1 recieved", _this);
        params ["_gunner", "_target", "_gunshots", "_belt", "_rocketShots"];
        private _gunship = vehicle _gunner;
        private _steps = _gunshots max _rocketShots;

        //Calculate used ammo
        private _rocketsLeft = _gunship getVariable ["Rockets", 0];
        _rocketsLeft = _rocketsLeft - _rocketShots;
        if(_rocketsLeft <= 0) then {_gunship setVariable ["OutOfAmmo", true]};
        _gunship setVariable ["Rockets", _rocketsLeft];

        private _HEUsed = {_x} count _belt;
        private _APUsed = 3 - _HEUsed;

        private _APLeft = _gunship getVariable ["AP_Ammo", 0];
        _APLeft = _APLeft - ((_APUsed/3) * _gunshots);
        _gunship setVariable ["AP_Ammo", _APLeft];

        private _HELeft = _gunship getVariable ["HE_Ammo", 0];
        _HELeft = _HELeft - ((_HEUsed/3) * _gunshots);
        _gunship setVariable ["HE_Ammo", _HELeft];

        if(_HELeft <= 0 || _APLeft <= 0) then
        {
            _gunship setVariable ["OutOfAmmo", true];
        };

        _gunship setVariable ["currentTarget", _target];

        _gunner reveal [_target, 3];
        _gunner doTarget _target;
        _gunner doWatch _target;

        //Simulate targeting time (cause the fucking AI does not targets for real)
        sleep 0.3;

        for "_i" from 1 to _steps do
        {
            if(_gunshots > 0) then
            {
                private _muzzle = if(_belt select ((_i - 1) % 3)) then {"HE"} else {"AP"};
                _gunner forceWeaponFire [_muzzle, "close"];
                _gunshots = _gunshots - 1;
            };
            if(_rocketShots > 0) then
            {
                _gunner forceWeaponFire ["rockets_Skyfire", "Burst"];
                _rocketShots = _rocketShots - 1;
            };
            sleep 0.1;
        };

        _gunner doTarget objNull;
        _gunner doWatch objNull;
        _gunship setVariable ["currentTarget", nil];
    };
};
while {time < _timeout && canMove _uav} do
{
    waitUntil { sleep 5; _uav distance2d _suppCenter < 750 || !alive _uav};
    // check if launcher/crew are intact
    if !(canFire _uav and gunner _uav call A3A_fnc_canFight || alive _uav) exitWith {
        Info_1("%1 has been destroyed or disabled, aborting routine", _supportName);
    };

    private _friends = units _side inAreaArray [_suppCenter, 1000, 1000];
    private _friendGroups = allGroups select {(leader _x in _friends) and {isNull objectParent leader _x} };

    // Choose four random enemies to spot
    private _allEnemies = (units teamPlayer + units _enemySide) inAreaArray [_suppCenter, 500, 500];
    diag_log _allEnemies;
    diag_log _allEnemies;
    diag_log _allEnemies;
    diag_log _allEnemies;
    private _spottedEnemies = [];
    for "_i" from 0 to 3 do {
        if (count _allEnemies == 0) exitWith {};
        private _index = floor random (count _allEnemies);
        _spottedEnemies pushBack (_allEnemies # _index);
        _allEnemies deleteAt _index;
    };
    {
        private _group = _x;
        //or: [[_group, _spottedEnemies], { { _this#0 reveal [_x, 2] } forEach _this#1 }] remoteExec ["call", leader _group];
        { [_group, [_x, 2]] remoteExec ["reveal", leader _group] } forEach _spottedEnemies;
    } forEach _friendGroups;

    // check if we're past the active time/missiles
    if (time > _timeout) exitWith {
        Info_1("%1 has timed out, aborting", _supportName);
    };

    if (isNull _currentTarget) then
    {
        diag_log _spottedEnemies;
        diag_log _spottedEnemies;
        diag_log _spottedEnemies;
        diag_log _spottedEnemies;
        private _currentTarget = selectRandom _spottedEnemies;
        diag_log _currentTarget;
        diag_log _currentTarget;
        diag_log _currentTarget;
        diag_log _currentTarget;
        //Creates the laser target to mark the target
        _laser = createVehicle ["LaserTargetE", (getPos _currentTarget), [], 0, "CAN_COLLIDE"];
        Info_1("Trying to attack laser to %1", _currentTarget);
        _uav setVariable ["currentTarget", _currentTarget];
        _laser attachTo [_currentTarget, [0,0,0]];
        _uav doWatch _laser;

        //Send the laser target to the launcher
        _side reportRemoteTarget [_laser, 300];
        _laser confirmSensorTarget [_side, true];
        _uav reveal [_laser, 4]; 
        _uav fireAtTarget [_laser, currentMuzzle (gunner _uav)];
        if !(alive _currentTarget) exitWith {
            _uav doTarget objNull; /// _gunner
            _uav doWatch objNull; /// _gunner
            _uav setVariable ["currentTarget", nil];
            _suppTarget resize 0;
            Debug_1("%1 skips target, as it is already dead", _supportName);
            continue;
        };
    };

/*     //Target no longer valid
    if (!canMove _currentTarget or time > _targTimeout) then {
        Debug_1("%1 target lost or destroyed, returning to idle", _supportName);
        _suppTarget resize 0;
        _currentTarget = objNull;
        _uav doWatch objNull;
        continue;
    }; */

/*     // Update acquisition depending on whether path to target is blocked
    private _dir = _uav getDir _currentTarget;
    private _intercept = (getPosASL _uav) getPos [250, _dir] vectorAdd [0,0,300];
    private _isBlocked = terrainIntersectASL [_intercept, getPosASL _currentTarget];
    _acquisition = _acquisition + ([0.1, -0.1] select _isBlocked);
    _acquisition = 1 min _acquisition max 0;
    _uav doWatch _intercept;
    if (_acquisition < 1) then { sleep 1; continue }; */

    // wait for previous missile to have effect (or not)
    if (alive (_uav getVariable ["A3A_currentMissile", objNull])) then { sleep 1; continue };

    // Actually fire
    Debug("Firing at target");
    _uav reveal [_currentTarget, 4];           // does this do anything?
    _currentTarget confirmSensorTarget [_side, true];
    _side reportRemoteTarget [_currentTarget, 300];
    _uav fireAtTarget [_laser];
    //_targTimeout = (time + 120);
    sleep 1;
    sleep 60;
};

_suppData set [4, 0];           // Set activesupport radius to zero, prevents adding further targets

[_groupVeh] spawn A3A_fnc_groupDespawner;
[_uav] spawn A3A_fnc_vehDespawner;

//Have the plane fly back home
if (canMove _uav) then
{
    while {count waypoints _groupVeh > 0} do { deleteWaypoint [_groupVeh, 0] };
    private _wpBase = _groupVeh addWaypoint [markerPos _airport, 0];
    _wpBase setWaypointSpeed "NORMAL";
    _wpBase setWaypointBehaviour "CARELESS";
    _groupVeh setCurrentWaypoint _wpBase;

    private _timeout = time + (_uav distance2d _spawnPos) / 20;
    waitUntil { sleep 2; (currentWaypoint _groupVeh != 0) or (time > _timeout) };
    if (time > _timeout) exitWith {};
    { deleteVehicle _x } forEach (units _groupVeh);
    deleteVehicle _uav;
};
