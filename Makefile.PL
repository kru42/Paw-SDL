use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Paw::SDL',
    VERSION_FROM => 'lib/Paw/SDL.pm',
    LIBS         => ['-lSDL2'],

    #DEFINE       => '',
    #INC          => '',
    CCFLAGS  => '-Wall -std=c99',
    OPTIMIZE => '-O3',
    LICENSE  => 'MIT',
    XSMULTI  => 1
);
