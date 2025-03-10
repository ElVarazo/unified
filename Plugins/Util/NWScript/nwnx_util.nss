#include "nwnx"

const int NWNX_UTIL_RESREF_TYPE_NSS       = 2009;
const int NWNX_UTIL_RESREF_TYPE_NCS       = 2010;
const int NWNX_UTIL_RESREF_TYPE_AREA_ARE  = 2012;
const int NWNX_UTIL_RESREF_TYPE_TWODA     = 2017;
const int NWNX_UTIL_RESREF_TYPE_AREA_GIT  = 2023;
const int NWNX_UTIL_RESREF_TYPE_ITEM      = 2025;
const int NWNX_UTIL_RESREF_TYPE_CREATURE  = 2027;
const int NWNX_UTIL_RESREF_TYPE_DIALOG    = 2029;
const int NWNX_UTIL_RESREF_TYPE_TRIGGER   = 2032;
const int NWNX_UTIL_RESREF_TYPE_SOUND     = 2035;
const int NWNX_UTIL_RESREF_TYPE_ENCOUNTER = 2040;
const int NWNX_UTIL_RESREF_TYPE_DOOR      = 2042;
const int NWNX_UTIL_RESREF_TYPE_PLACEABLE = 2044;
const int NWNX_UTIL_RESREF_TYPE_STORE     = 2051;
const int NWNX_UTIL_RESREF_TYPE_WAYPOINT  = 2058;

// Returns the name of the currently executing script.
// If depth is >0, it will return the name of the script that called this one via ExecuteScript()
string NWNX_Util_GetCurrentScriptName(int depth = 0);
// Returns a string that contains all characters at their position (e.g. 'A' at 65).
// The character at index 0 is a space.
string NWNX_Util_GetAsciiTableString();
// Returns an integer hash of a string
int NWNX_Util_Hash(string str);
// Gets the value of customTokenNumber
string NWNX_Util_GetCustomToken(int customTokenNumber);
// Convert an effect type to an IP type
itemproperty NWNX_Util_EffectToItemProperty(effect e);
// Convert an IP type to an effect type
effect NWNX_Util_ItemPropertyToEffect(itemproperty ip);
// Generate a v4 UUID.
string NWNX_Util_GenerateUUID();
// Strip any color codes from a string
string NWNX_Util_StripColors(string str);
// Is a valid resref
int NWNX_Util_IsValidResRef(string resref, int type = NWNX_UTIL_RESREF_TYPE_CREATURE);
// Retrieve an environment variable
string NWNX_Util_GetEnvironmentVariable(string sVarname);
// Gets the module real life minutes per in game hour
int NWNX_Util_GetMinutesPerHour();
// Set module real life minutes per in game hour
void NWNX_Util_SetMinutesPerHour(int minutes);
// Encodes a string for usage in a URL
string NWNX_Util_EncodeStringForURL(string str);
// Gets the row count for a 2da
int NWNX_Util_Get2DARowCount(string str);
// Get the first resref of nType
// - nType: NWNX_UTIL_RESREF_TYPE_*
// - sRegexFilter: Lets you filter out resrefs using a regexfilter
//                 For example: "nwnx_.*" gets you all scripts prefixed with nwnx_
//                 when using the NSS resref type.
// - bModuleResourcesOnly: If TRUE only custom resources will be returned
//
// Returns "" if no resref is found
string NWNX_Util_GetFirstResRef(int nType, string sRegexFilter = "", int bModuleResourcesOnly = TRUE);
// Get the next resref
// Returns "" if no resref is found
string NWNX_Util_GetNextResRef();
// Get the ticks per second of the server
// Useful to dynamically detect lag and adjust behavior accordingly
int NWNX_Util_GetServerTicksPerSecond();
// Get the nNthLast created object of nObjectType
// - nObjectType: Does not take the NWScript OBJECT_TYPE_* constants
//                Use NWNX_Consts_TranslateNWScriptObjectType() to get their
//                NWNX equivalent.
// * Return value: The last created object. On error, this returns OBJECT_INVALID.
object NWNX_Util_GetLastCreatedObject(int nObjectType, int nNthLast = 1);


const string NWNX_Util = "NWNX_Util";


string NWNX_Util_GetCurrentScriptName(int depth = 0)
{
    string sFunc = "GetCurrentScriptName";
    NWNX_PushArgumentInt(NWNX_Util, sFunc, depth);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

string NWNX_Util_GetAsciiTableString()
{
    string sFunc = "GetAsciiTableString";
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

int NWNX_Util_Hash(string str)
{
    string sFunc = "Hash";
    NWNX_PushArgumentString(NWNX_Util, sFunc, str);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueInt(NWNX_Util, sFunc);
}

string NWNX_Util_GetCustomToken(int customTokenNumber)
{
    string sFunc = "GetCustomToken";
    NWNX_PushArgumentInt(NWNX_Util, sFunc, customTokenNumber);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

itemproperty NWNX_Util_EffectToItemProperty(effect e)
{
    string sFunc = "EffectTypeCast";
    NWNX_PushArgumentEffect(NWNX_Util, sFunc, e);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueItemProperty(NWNX_Util, sFunc);
}

effect NWNX_Util_ItemPropertyToEffect(itemproperty ip)
{
    string sFunc = "EffectTypeCast";
    NWNX_PushArgumentItemProperty(NWNX_Util, sFunc, ip);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueEffect(NWNX_Util, sFunc);
}

string NWNX_Util_GenerateUUID()
{
    string sFunc = "GenerateUUID";
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

string NWNX_Util_StripColors(string str)
{
    string sFunc = "StripColors";
    NWNX_PushArgumentString(NWNX_Util, sFunc, str);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

int NWNX_Util_IsValidResRef(string resref, int type = NWNX_UTIL_RESREF_TYPE_CREATURE)
{
    string sFunc = "IsValidResRef";
    NWNX_PushArgumentInt(NWNX_Util, sFunc, type);
    NWNX_PushArgumentString(NWNX_Util, sFunc, resref);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueInt(NWNX_Util, sFunc);
}

string NWNX_Util_GetEnvironmentVariable(string sVarname)
{
    string sFunc = "GetEnvironmentVariable";
    NWNX_PushArgumentString(NWNX_Util, sFunc, sVarname);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

int NWNX_Util_GetMinutesPerHour()
{
    string sFunc = "GetMinutesPerHour";
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueInt(NWNX_Util, sFunc);
}

void NWNX_Util_SetMinutesPerHour(int minutes)
{
    string sFunc = "SetMinutesPerHour";
    NWNX_PushArgumentInt(NWNX_Util, sFunc, minutes);
    NWNX_CallFunction(NWNX_Util, sFunc);
}

string NWNX_Util_EncodeStringForURL(string sURL)
{
    string sFunc = "EncodeStringForURL";

    NWNX_PushArgumentString(NWNX_Util, sFunc, sURL);
    NWNX_CallFunction(NWNX_Util, sFunc);

    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

int NWNX_Util_Get2DARowCount(string str)
{
    string sFunc = "Get2DARowCount";
    NWNX_PushArgumentString(NWNX_Util, sFunc, str);
    NWNX_CallFunction(NWNX_Util, sFunc);
    return NWNX_GetReturnValueInt(NWNX_Util, sFunc);
}

string NWNX_Util_GetFirstResRef(int nType, string sRegexFilter = "", int bModuleResourcesOnly = TRUE)
{
    string sFunc = "GetFirstResRef";

    NWNX_PushArgumentInt(NWNX_Util, sFunc, bModuleResourcesOnly);
    NWNX_PushArgumentString(NWNX_Util, sFunc, sRegexFilter);
    NWNX_PushArgumentInt(NWNX_Util, sFunc, nType);
    NWNX_CallFunction(NWNX_Util, sFunc);

    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

string NWNX_Util_GetNextResRef()
{
    string sFunc = "GetNextResRef";

    NWNX_CallFunction(NWNX_Util, sFunc);

    return NWNX_GetReturnValueString(NWNX_Util, sFunc);
}

int NWNX_Util_GetServerTicksPerSecond()
{
    string sFunc = "GetServerTicksPerSecond";

    NWNX_CallFunction(NWNX_Util, sFunc);

    return NWNX_GetReturnValueInt(NWNX_Util, sFunc);
}

object NWNX_Util_GetLastCreatedObject(int nObjectType, int nNthLast = 1)
{
    string sFunc = "GetLastCreatedObject";

    NWNX_PushArgumentInt(NWNX_Util, sFunc, nNthLast);
    NWNX_PushArgumentInt(NWNX_Util, sFunc, nObjectType);
    NWNX_CallFunction(NWNX_Util, sFunc);

    return NWNX_GetReturnValueObject(NWNX_Util, sFunc);
}
