/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx       = 2;   /* border pixel of windows */
static const unsigned int snap           = 32;  /* snap pixel */
static const unsigned int gappih         = 10;  /* horiz inner gap between windows */
static const unsigned int gappiv         = 10;  /* vert inner gap between windows */
static const unsigned int gappoh         = 15;  /* horiz outer gap between windows and screen edge */
static const unsigned int gappov         = 15;  /* vert outer gap between windows and screen edge */
static const int smartgaps_fact          = 1;   /* gap factor when there is only one client; 0 = no gaps, 3 = 3x outer gaps */
static const int showbar                 = 1;   /* 0 means no bar */
static const int topbar                  = 1;   /* 0 means bottom bar */
static const int bar_height              = 30;   /* 0 means derive from font, >= 1 explicit height */
static const int focusonwheel            = 0;
static const char buttonbar[]            = "<O>";
/* Indicators: see patch/bar_indicators.h for options */
static int tagindicatortype              = INDICATOR_TOP_BAR;
static int tiledindicatortype            = INDICATOR_NONE;
static int floatindicatortype            = INDICATOR_TOP_LEFT_SQUARE;
static void (*bartabmonfns[])(Monitor *) = { monocle /* , customlayoutfn */ };
static const char *fonts[]               = { "Monospace Regular:size=12" };
static const char dmenufont[]            = "Monospace Regular:size=12";

static char normfgcolor[]                = "#ebdbb2";
static char normbgcolor[]                = "#282828";
static char normbordercolor[]            = "#504945";
static char normfloatcolor[]             = "#504945";

static char selfgcolor[]                 = "#282828";
static char selbgcolor[]                 = "#d79921";
static char selbordercolor[]             = "#d79921";
static char selfloatcolor[]              = "#d79921";

static char titlenormfgcolor[]           = "#ebdbb2";
static char titlenormbgcolor[]           = "#282828";
static char titlenormbordercolor[]       = "#504945";
static char titlenormfloatcolor[]        = "#504945";

static char titleselfgcolor[]            = "#282828";
static char titleselbgcolor[]            = "#d79921";
static char titleselbordercolor[]        = "#d79921";
static char titleselfloatcolor[]         = "#d79921";

static char tagsnormfgcolor[]            = "#ebdbb2";
static char tagsnormbgcolor[]            = "#282828";
static char tagsnormbordercolor[]        = "#504945";
static char tagsnormfloatcolor[]         = "#504945";

static char tagsselfgcolor[]             = "#282828";
static char tagsselbgcolor[]             = "#d79921";
static char tagsselbordercolor[]         = "#d79921";
static char tagsselfloatcolor[]          = "#d79921";

static char hidfgcolor[]                 = "#7c6f64";
static char hidbgcolor[]                 = "#282828";
static char hidbordercolor[]             = "#504945";
static char hidfloatcolor[]              = "#504945";



static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
	[SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
	[SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
	[SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
	[SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
	[SchemeHid]          = { hidfgcolor,       hidbgcolor,       hidbordercolor,       hidfloatcolor },
};


static const char *layoutmenu_cmd = "layoutmenu.sh";


const char *spcmd1[] = {"gnome-terminal", "--name", "quick-term", "--hide-menubar", "--geometry", "120x34", NULL };
static Sp scratchpads[] = {
   /* name          cmd  */
   {"quick-term",      spcmd1},
};

/* Tags
 * In a traditional dwm the number of tags in use can be changed simply by changing the number
 * of strings in the tags array. This build does things a bit different which has some added
 * benefits. If you need to change the number of tags here then change the NUMTAGS macro in dwm.c.
 *
 * Examples:
 *
 *  1) static char *tagicons[][NUMTAGS*2] = {
 *         [DEFAULT_TAGS] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I" },
 *     }
 *
 *  2) static char *tagicons[][1] = {
 *         [DEFAULT_TAGS] = { "•" },
 *     }
 *
 * The first example would result in the tags on the first monitor to be 1 through 9, while the
 * tags for the second monitor would be named A through I. A third monitor would start again at
 * 1 through 9 while the tags on a fourth monitor would also be named A through I. Note the tags
 * count of NUMTAGS*2 in the array initialiser which defines how many tag text / icon exists in
 * the array. This can be changed to *3 to add separate icons for a third monitor.
 *
 * For the second example each tag would be represented as a bullet point. Both cases work the
 * same from a technical standpoint - the icon index is derived from the tag index and the monitor
 * index. If the icon index is is greater than the number of tag icons then it will wrap around
 * until it an icon matches. Similarly if there are two tag icons then it would alternate between
 * them. This works seamlessly with alternative tags and alttagsdecoration patches.
 */
static char *tagicons[][NUMTAGS] = {
	[DEFAULT_TAGS]        = { "1", "2", "3", "4", "5" },
};


/* There are two options when it comes to per-client rules:
 *  - a typical struct table or
 *  - using the RULE macro
 *
 * A traditional struct table looks like this:
 *    // class      instance  title  wintype  tags mask  isfloating  monitor
 *    { "Gimp",     NULL,     NULL,  NULL,    1 << 4,    0,          -1 },
 *    { "Firefox",  NULL,     NULL,  NULL,    1 << 7,    0,          -1 },
 *
 * The RULE macro has the default values set for each field allowing you to only
 * specify the values that are relevant for your rule, e.g.
 *
 *    RULE(.class = "Gimp", .tags = 1 << 4)
 *    RULE(.class = "Firefox", .tags = 1 << 7)
 *
 * Refer to the Rule struct definition for the list of available fields depending on
 * the patches you enable.
 */
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 *	WM_WINDOW_ROLE(STRING) = role
	 *	_NET_WM_WINDOW_TYPE(ATOM) = wintype
	 */
	RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
	RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
	RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
	RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
	RULE(.class = "Gimp", .tags = 1 << 4)
	RULE(.class = "Firefox", .tags = 1 << 7)
	RULE(.instance = "quick-term", .tags = SPTAG(0), .iscentered = 1, .isfloating = 1)
};



/* Bar rules allow you to configure what is shown where on the bar, as well as
 * introducing your own bar modules.
 *
 *    monitor:
 *      -1  show on all monitors
 *       0  show on monitor 0
 *      'A' show on active monitor (i.e. focused / selected) (or just -1 for active?)
 *    bar - bar index, 0 is default, 1 is extrabar
 *    alignment - how the module is aligned compared to other modules
 *    widthfunc, drawfunc, clickfunc - providing bar module width, draw and click functions
 *    name - does nothing, intended for visual clue and for logging / debugging
 */
static const BarRule barrules[] = {
	/* monitor  bar    alignment         widthfunc                drawfunc                clickfunc                name */
	{ -1,       0,     BAR_ALIGN_LEFT,   width_stbutton,          draw_stbutton,          click_stbutton,          "statusbutton" },
	{ -1,       0,     BAR_ALIGN_LEFT,   width_tags,              draw_tags,              click_tags,              "tags" },
	{ -1,       0,     BAR_ALIGN_LEFT,   width_ltsymbol,          draw_ltsymbol,          click_ltsymbol,          "layout" },
	{ 'A',      0,     BAR_ALIGN_RIGHT,  width_status,            draw_status,            click_status,            "status" },
	{ -1,       0,     BAR_ALIGN_NONE,   width_bartabgroups,      draw_bartabgroups,      click_bartabgroups,      "bartabgroups" },
};

/* layout(s) */
static const float mfact     = 0.65; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int decorhints  = 1;    /* 1 means respect decoration hints */

/* mouse scroll resize */
static const int scrollsensetivity = 30; /* 1 means resize window by 1 pixel for each scroll event */
/* resizemousescroll direction argument list */
static const int scrollargs[][2] = {
	/* width change         height change */
	{ +scrollsensetivity,	0 },
	{ -scrollsensetivity,	0 },
	{ 0, 				  	+scrollsensetivity },
	{ 0, 					-scrollsensetivity },
};

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "|M|",      centeredmaster },
	{ "[\\]",     dwindle },
	{ "---",      horizgrid },
	{ NULL,       NULL },
};


/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },



/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
	"dmenu_run",
	"-m", dmenumon,
	"-fn", dmenufont,
	"-nb", normbgcolor,
	"-nf", normfgcolor,
	"-sb", selbgcolor,
	"-sf", selfgcolor,
    "-i", 
    "-b",
	NULL
};
static const char *termcmd[]  = { "gnome-terminal", NULL };


static const char* firefoxcmd[] = {"firefox", NULL};
static Key on_empty_keys[] = {
	/* modifier key            function                argument */
	{ 0,        XK_p,          spawn,                  {.v = dmenucmd } },
    { 0,        XK_t,          spawn,                  {.v = termcmd } },
	{ 0,        XK_f,          spawn,                  {.v = firefoxcmd } },
};

static Key keys[] = {
	/* modifier                     key            function                argument */
        /* key mode */
	{ MODKEY,                       XK_Escape,     setkeymode,             {.ui = COMMANDMODE} },
        /* spawn program */
	{ MODKEY|ShiftMask,             XK_p,          spawn,                  {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_t,          spawn,                  {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_f,          spawn,                  {.v = firefoxcmd } },
        /* bar manipulation */
	{ MODKEY,                       XK_b,          togglebar,              {0} },
        /* focus movement */
	{ MODKEY,                       XK_j,          focusstack,             {.i = +1 } },
	{ MODKEY,                       XK_k,          focusstack,             {.i = -1 } },
	{ MODKEY,                       XK_space,      switchcol,              {0} },
        /* client movement */
	{ MODKEY,                       XK_a,          incnmaster,             {.i = +1 } },
	{ MODKEY,                       XK_f,          incnmaster,             {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,          movestack,              {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,          movestack,              {.i = -1 } },
	{ MODKEY,                       XK_Return,     zoom,                   {0} },
	{ MODKEY|ShiftMask,             XK_Return,     transfer,               {0} },
        /* adjust dimension */
	{ MODKEY,                       XK_h,          setmfact,               {.f = -0.05} },
	{ MODKEY,                       XK_l,          setmfact,               {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_h,          setcfact,               {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_l,          setcfact,               {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_g,          setcfact,               {.f =  0.00} },
        /* client */
	{ MODKEY|ControlMask,           XK_z,          showhideclient,         {0} },
	{ MODKEY|ControlMask,           XK_w,          killclient,             {0} },
        /* layout */
	{ MODKEY|ControlMask,           XK_t,          setlayout,              {.v = &layouts[0]} },
	{ MODKEY|ControlMask,           XK_m,          setlayout,              {.v = &layouts[2]} },
	{ MODKEY|ControlMask,           XK_c,          setlayout,              {.v = &layouts[3]} },
	{ MODKEY|ControlMask,           XK_d,          setlayout,              {.v = &layouts[4]} },
	{ MODKEY|ControlMask,           XK_h,          setlayout,              {.v = &layouts[5]} },
	{ MODKEY|ControlMask,           XK_comma,      cyclelayout,            {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period,     cyclelayout,            {.i = +1 } },
        /* scratchpad */
        /* !!HAVENT CONFIGURED!! */
	{ MODKEY|ControlMask|ShiftMask, XK_s,          togglescratch,          {.ui = 0 } },
	{ MODKEY|ControlMask,           XK_grave,      setscratch,             {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_grave,      removescratch,          {.ui = 0 } },
        /* tag manipulation */
	TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	{ MODKEY,                       XK_0,          view,                   {.ui = ~SPTAGMASK } },
	{ MODKEY|ShiftMask,             XK_0,          tag,                    {.ui = ~SPTAGMASK } },
	{ MODKEY,                       XK_Tab,        shiftview,              { .i = +1 } },
	{ MODKEY|ShiftMask,             XK_Tab,        shiftview,              { .i = -1 } },
};

static Key cmdkeys[] = {
	/* modifier                    keys                     function         argument */
	{ 0,                           XK_Escape,               clearcmd,        {0} },
	{ 0,                           XK_i,                    setkeymode,      {.ui = INSERTMODE} },
};

static Command commands[] = {
	/* modifier (4 keys)                          keysyms (4 keys)                                function         argument */
        /* focus movement */
	{ {0,           0,          0        , 0},    {XK_j,      0,        0,         0},            focusstack,      {.i = +1} },
    { {0,           0,          0        , 0},    {XK_k,      0,        0,         0},            focusstack,      {.i = -1} },
	{ {0,           0,          0        , 0},    {XK_h,      0,        0,         0},            switchcol,       {0} },
	{ {0,           0,          0        , 0},    {XK_l,      0,        0,         0},            switchcol,       {0} },
        /* number of client */
	{ {0,           0,          0        , 0},    {XK_a,      0,        0,         0},            incnmaster,      {.i = +1} },
	{ {0,           0,          0        , 0},    {XK_f,      0,        0,         0},            incnmaster,      {.i = -1} },
        /* adjust dimension */
	{ {ControlMask, 0,          0        , 0},    {XK_h,      0,        0,         0},            setmfact,        {.f = -0.05} },
	{ {ControlMask, 0,          0        , 0},    {XK_l,      0,        0,         0},            setmfact,        {.f = +0.05} },
	{ {ControlMask, 0,          0        , 0},    {XK_j,      0,        0,         0},            setcfact,        {.f = -0.05} },
	{ {ControlMask, 0,          0        , 0},    {XK_k,      0,        0,         0},            setcfact,        {.f = +0.05} },
	{ {ControlMask, 0,          0        , 0},    {XK_g,      0,        0,         0},            setcfact,        {.f =  0.00} },
        /* bar manipulation */
	{ {0,           0,          0        , 0},    {XK_b,      0,        0,         0},            togglebar,       {.i = -1} },
        /* gap */
	{ {0,           0,          0        , 0},    {XK_KP_Begin,  0,        0,         0},         defaultgaps,     {0} },
	{ {0,           0,          0        , 0},    {XK_KP_Up,     0,        0,         0},         incrogaps,       {.i = +1} },
	{ {0,           0,          0        , 0},    {XK_KP_Down,   0,        0,         0},         incrogaps,       {.i = -1} },
	{ {0,           0,          0        , 0},    {XK_KP_Right,  0,        0,         0},         incrigaps,       {.i = +1} },
	{ {0,           0,          0        , 0},    {XK_KP_Left,   0,        0,         0},         incrigaps,       {.i = -1} },
        /* dwm */
	{ {MODKEY,      ShiftMask,  ControlMask, 0},  {XK_r,      XK_r,     XK_r,      0},            quit,            {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask           button          function        argument */
	{ ClkButton,            0,                   Button1,        spawn,          {.v = dmenucmd } },
	{ ClkLtSymbol,          0,                   Button1,        cyclelayout,    {.i = +1} },
	{ ClkLtSymbol,          0,                   Button3,        cyclelayout,    {.i = -1} },
	{ ClkLtSymbol,          MODKEY,              Button3,        layoutmenu,     {0} },
	{ ClkWinTitle,          0,                   Button3,        showhideclient, {0} },
	{ ClkWinTitle,          0,                   Button1,        zoom,           {0} },
	{ ClkStatusText,        0,                   Button1,        spawn,          {.v = termcmd } },
	/* placemouse options, choose which feels more natural:
	 *    0 - tiled position is relative to mouse cursor
	 *    1 - tiled postiion is relative to window center
	 *    2 - mouse pointer warps to window center
	 *
	 * The moveorplace uses movemouse or placemouse depending on the floating state
	 * of the selected client. Set up individual keybindings for the two if you want
	 * to control these separately (i.e. to retain the feature to move a tiled window
	 * into a floating position).
	 */
	{ ClkClientWin,         MODKEY,              Button1,        moveorplace,    {.i = 1} },
	{ ClkClientWin,         MODKEY|ShiftMask,    Button3,        dragcfact,      {0} },
	{ ClkClientWin,         MODKEY|ShiftMask,    Button1,        dragmfact,      {0} },
	{ ClkTagBar,            0,                   Button1,        view,           {0} },
	{ ClkTagBar,            0,                   Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
};


