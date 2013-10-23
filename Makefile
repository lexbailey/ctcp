#Program = ctcp
#
#all: ${Program}
#
#${Program}.tab.c: ${Program}.y
#		bison -d $^
#lex.yy.c: ${Program}.l ${Program}.tab.h
#	flex $<
#
#${Program}: ${Program}.tab.c lex.yy.c
#	gcc -o $@ $^ -lfl
#
#.PHONY: clean
#
#clean:
#	rm -f *.o
#	rm -f *.s
#	rm -f *.ii
#	rm -f *.tab.* *.yy.* ${Program}

Program = ctcp

all: ${Program}

${Program}.tab.cpp: ${Program}.ypp
		bison -d $^
lex.yy.cpp: ${Program}.lpp ${Program}.tab.hpp
#	flex --outfile=lex.yy.cpp $<
	flex -+ $<

${Program}: ${Program}.tab.cpp lex.yy.cpp
	gcc -o $@ $^ -lfl -lstdc++

.PHONY: clean

clean:
	rm -f *.o
	rm -f *.s
	rm -f *.ii
	rm -f *.tab.* *.yy.* ${Program}
