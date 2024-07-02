#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <SDL2/SDL.h>
#include <SDL2/SDL_ttf.h>

MODULE = Paw::SDL    PACKAGE = Paw::SDL
PROTOTYPES: ENABLE

void
SDL_QUIT()
PPCODE:
    PUSHs(sv_2mortal(newSViv(SDL_QUIT)));

void
SDL_INIT_VIDEO()
PPCODE:
    PUSHs(sv_2mortal(newSViv(SDL_INIT_VIDEO)));

void
SDL_INIT_AUDIO()
PPCODE:
    PUSHs(sv_2mortal(newSViv(SDL_INIT_AUDIO)));

void
SDL_INIT_TIMER()
PPCODE:
    PUSHs(sv_2mortal(newSViv(SDL_INIT_TIMER)));

int
SDL_Init(int flags)
CODE:
    RETVAL = SDL_Init(flags);
OUTPUT:
    RETVAL

const char*
SDL_GetError()
CODE:
    RETVAL = SDL_GetError();
OUTPUT:
    RETVAL

void
SDL_Delay(int ms)
CODE:
    SDL_Delay(ms);

SV*
SDL_CreateWindow(const char* title, int x, int y, int w, int h, int flags)
CODE:
{
    SDL_Window* window = SDL_CreateWindow(title, x, y, w, h, flags);
    if (!window)
    {
        croak("Could not create SDL2 window: %s\n", SDL_GetError());
    }
    RETVAL = newSViv(PTR2IV(window));
}
OUTPUT:
    RETVAL

void
SDL_DestroyWindow(SV *window_sv)
CODE:
{
    SDL_Window *window = INT2PTR(SDL_Window*, SvIV(window_sv));
    SDL_DestroyWindow(window);
}

int
SDL_PollEvent()
PREINIT:
    SDL_Event event;
CODE:
    if (SDL_PollEvent(&event))
    {
        RETVAL = event.type;
    }
    else
    {
        RETVAL = 0;
    }
OUTPUT:
    RETVAL

void
SDL_Quit()
CODE:
    SDL_Quit();

SV*
SDL_CreateRenderer(SV* window_sv, int index, int flags)
CODE:
{
    SDL_Window* window = INT2PTR(SDL_Window*, SvIV(window_sv));
    SDL_Renderer* renderer = SDL_CreateRenderer(window, index, flags);
    if (!renderer) {
        croak("Could not create renderer: %s\n", SDL_GetError());
    }
    RETVAL = newSViv(PTR2IV(renderer));
}
OUTPUT:
    RETVAL

void
SDL_DestroyRenderer(SV* renderer_sv)
CODE:
{
    SDL_Renderer* renderer = INT2PTR(SDL_Renderer*, SvIV(renderer_sv));
    SDL_DestroyRenderer(renderer);
}

void
SDL_SetRenderDrawColor(SV* renderer_sv, unsigned char r, unsigned char g, unsigned char b, unsigned char a)
CODE:
{
    SDL_Renderer *renderer = INT2PTR(SDL_Renderer *, SvIV(renderer_sv));
    SDL_SetRenderDrawColor(renderer, r, g, b, a);
}

void
SDL_RenderClear(SV* renderer_sv)
CODE:
{
    SDL_Renderer *renderer = INT2PTR(SDL_Renderer *, SvIV(renderer_sv));
    SDL_RenderClear(renderer);
}

void
SDL_RenderDrawLine(SV* renderer_sv, int x1, int y1, int x2, int y2)
CODE:
{
    SDL_Renderer *renderer = INT2PTR(SDL_Renderer *, SvIV(renderer_sv));
    SDL_RenderDrawLine(renderer, x1, y1, x2, y2);
}

void
SDL_RenderPresent(SV* renderer_sv)
CODE:
{
    SDL_Renderer *renderer = INT2PTR(SDL_Renderer *, SvIV(renderer_sv));
    SDL_RenderPresent(renderer);
}

