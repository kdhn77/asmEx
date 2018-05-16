# Makefile
OBJECTS = homework01.o
TARGET = homework01

SRCS = $(OBJECTS:.o=.s)

$(TARGET): $(OBJECTS)
	gcc -o $@ $+
	
$(OBJECTS): $(SRCS)
	as -o $@ $<
	
clean:
	rm -vf $(TARGET) *.o
