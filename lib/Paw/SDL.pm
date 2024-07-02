package Paw::SDL;

use strict;
use warnings;
require Exporter;
require DynaLoader;
our @ISA = qw(Exporter DynaLoader);

our @EXPORT_OK =
  qw(SDL_Init SDL_CreateWindow SDL_DestroyWindow SDL_PollEvent SDL_Quit SDL_INIT_VIDEO SDL_INIT_AUDIO SDL_INIT_TIMER SDL_QUIT SDL_GetError SDL_RenderDrawLine SDL_RenderClear SDL_RenderPresent SDL_SetRenderDrawColor SDL_CreateRenderer SDL_DestroyRenderer SDL_Delay TTF_Init TTF_Quit TTF_OpenFont TTF_CloseFont TTF_RenderText_Blended SDL_DestroyTexture SDL_RenderCopy);

our $VERSION = '0.01';

require XSLoader;
XSLoader::load("Paw::SDL");

#bootstrap Paw::SDL $VERSION;

1;
__END__

