use strict;
use warnings;
use Test::More tests => 2;

use Paw::SDL
  qw(SDL_Init SDL_CreateWindow SDL_DestroyWindow SDL_INIT_VIDEO SDL_INIT_AUDIO SDL_INIT_TIMER);

diag("Testing SDL initialization...");
ok( SDL_Init( SDL_INIT_VIDEO() | SDL_INIT_AUDIO() | SDL_INIT_TIMER() == 0 ),
    "SDL2 initialized successfully." );

diag("Creating window...");
my $window =
  SDL_CreateWindow( "hello uwu", 0x2fff0000, 0x2fff0000, 800, 600, 0 );

ok( $window != 0, "Window created." );

# diag("Event loop...");
# my $quit = 0;
# while ( !$quit ) {
#     my $event_type = SDL_PollEvent();
#     if ( $event_type == SDL_QUIT ) {
#         $quit = 1;
#     }
# }

diag("Destroying window...");
SDL_DestroyWindow($window);

done_testing();

