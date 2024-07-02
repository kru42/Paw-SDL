use strict;
use warnings;
use Paw::SDL
  qw(SDL_Init SDL_CreateWindow SDL_DestroyWindow SDL_PollEvent SDL_Quit SDL_QUIT SDL_INIT_VIDEO SDL_CreateRenderer SDL_DestroyRenderer SDL_SetRenderDrawColor SDL_RenderClear SDL_RenderDrawLine SDL_RenderPresent SDL_Delay);

# Initialize SDL
if ( SDL_Init(SDL_INIT_VIDEO) != 0 ) {
    die "Failed to initialize SDL: "
      . SDL_GetError();    # TODO: implement SDL_GetError
}

# Create a window
my $window =
  SDL_CreateWindow( "Hello, SDL", 0x2fff0000, 0x2fff0000, 800, 600, 0 );

my $renderer = SDL_CreateRenderer( $window, -1, 0 );

# Event loop
my $quit  = 0;
my $angle = 0;
while ( !$quit ) {
    my $event_type = SDL_PollEvent();
    if ( $event_type == SDL_QUIT ) {
        $quit = 1;
    }

    # Update angle
    $angle += 1;
    $angle = 0 if $angle >= 360;

    # Clear screen
    SDL_SetRenderDrawColor( $renderer, 0, 0, 0, 255 );
    SDL_RenderClear($renderer);

    # Set draw color
    SDL_SetRenderDrawColor( $renderer, 255, 255, 255, 255 );

    # Calculate triangle vertices
    my $cx   = 400;
    my $cy   = 300;
    my $size = 100;
    my $x1   = $cx + $size * cos( deg2rad($angle) );
    my $y1   = $cy + $size * sin( deg2rad($angle) );
    my $x2   = $cx + $size * cos( deg2rad( $angle + 120 ) );
    my $y2   = $cy + $size * sin( deg2rad( $angle + 120 ) );
    my $x3   = $cx + $size * cos( deg2rad( $angle + 240 ) );
    my $y3   = $cy + $size * sin( deg2rad( $angle + 240 ) );

    # Draw triangle
    SDL_RenderDrawLine( $renderer, $x1, $y1, $x2, $y2 );
    SDL_RenderDrawLine( $renderer, $x2, $y2, $x3, $y3 );
    SDL_RenderDrawLine( $renderer, $x3, $y3, $x1, $y1 );

    # Present renderer
    SDL_RenderPresent($renderer);

    # Delay to control frame rate
    SDL_Delay(16);    # ~60 FPS
}

SDL_DestroyRenderer($renderer);
SDL_DestroyWindow($window);

# Quit SDL
SDL_Quit();

sub deg2rad {
    my $deg = shift;
    return $deg * ( 3.14159265358979 / 180 );
}
