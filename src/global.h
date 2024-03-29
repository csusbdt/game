#ifndef APP_GLOBAL_H
#define APP_GLOBAL_H

#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#include "SDL.h"
#include "SDL_image.h"
#include "SDL_ttf.h"
//#include "SDL_mixer.h"

typedef int bool;
#define false 0
#define true 1

extern bool drawing;
extern SDL_Window   * window;
extern SDL_Renderer * renderer;
extern int window_width;
extern int window_height;
extern bool app_fullscreen;
extern char * app_title;
extern SDL_DisplayMode   display_mode;

extern const SDL_Color APP_WHITE;

bool is_osx();
bool is_windows();
bool is_linux();
void fatal(const char * fmt, ...);
int windowed(lua_State * L);

const char * resource_path(const char * path);
const char * save_path(const char * path);

#endif

