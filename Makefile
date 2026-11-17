# Makefile for nInvaders (hand-written replacement for configure + Makefile.in)
# Copyright (C) 2003 Sebastian Gutsfeld, Alexander Hollinger
#
# Flags for modern gcc:
#   -std=gnu17        old-style "()" prototypes (C23 default in gcc 15 breaks them)
#   -fcommon          globals defined in headers (gcc 10+ default is -fno-common)
#   -D_DEFAULT_SOURCE expose usleep/nanosleep etc.

CC      = gcc
CFLAGS  = -I. -O2 -std=gnu17 -fcommon -D_DEFAULT_SOURCE \
          -Wno-implicit-function-declaration -Wno-unused-result
LDFLAGS =
LIBS    = -lncurses

CFILES = globals.c view.c aliens.c ufo.c player.c highscore.c nInvaders.c
HFILES = globals.h view.h aliens.h ufo.h player.h highscore.h nInvaders.h
OFILES = $(CFILES:.c=.o)

all: nInvaders

nInvaders: $(OFILES)
	$(CC) $(LDFLAGS) -o $@ $(OFILES) $(LIBS)

%.o: %.c $(HFILES)
	$(CC) -c $(CFLAGS) $<

clean:
	rm -f nInvaders $(OFILES)

.PHONY: all clean
