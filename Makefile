CFLAGS = -g -D DEBUG
CFLAGS = -pg -g -D NDEBUG
CFLAGS = -O3
CFLAGS = -g 

CFLAGS += -Wall -Wno-parentheses
CFLAGS += -D __STDC_LIMIT_MACROS -D __STDC_FORMAT_MACROS
CFLAGS += -I/usr/local/include

# choose your C compiler.
CC = g++

.SUFFIXES:	.o .cc .h

#---------------------- user defined files
MYSATFIL = Main.cc Options.cc SimpSolver.cc Solver.cc System.cc

MYSATOBJ = Main.o Options.o SimpSolver.o Solver.o System.o

#---------------------- make binary code
full: $(MYSATOBJ) 
	$(CC) $(CFLAGS) $(MYSATOBJ) -lz -o minisat

Options.o: Sort.h Options.h ParseUtils.h Vec.h
	$(CC) $(CFLAGS) -c Options.cc

SimpSolver.o: Queue.h Solver.h SolverTypes.h Vec.h Map.h Alg.h Heap.h Options.h IntTypes.h Alloc.h
	$(CC) $(CFLAGS) -c SimpSolver.cc

Solver.o: Queue.h Solver.h SolverTypes.h Vec.h Map.h Alg.h Heap.h Options.h IntTypes.h Alloc.h
	$(CC) $(CFLAGS) -c Solver.cc

System.o: System.h IntTypes.h
	$(CC) $(CFLAGS) -c System.cc

Main.o: System.h ParseUtils.h Options.h Dimacs.h SimpSolver.h IntTypes.h
	$(CC) $(CFLAGS) -c Main.cc
