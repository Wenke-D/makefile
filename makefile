# name your prog here
target = hello

# Parameters
BIN = bin/
SRC = src/
INC = include/
DOC = doc/

CC = gcc
CFLAGS = -Wall -I$(INC) -g
LDFLAGS =

# find executable and dependencies
COMP = $(basename $(shell ls $(SRC)))

## Generate object file list
objects = $(addsuffix .o, $(addprefix $(BIN), $(COMP)))

# build rules
#############################
$(target) : $(objects)
	$(CC) -o $@ $^ $(LDFLAGS)

$(BIN)%.o : $(SRC)%.c $(INC)%.h
	$(CC) -o $@ -c $^ $(CFLAGS)

$(BIN)%.o : $(SRC)%.c
	$(CC) -o $@ -c $^ $(CFLAGS)

#############################

# auxiliary commands
#############################
# arguments from terminal
arg =
run: $(target)
	./$(target) $(arg)


func =
chapitre =
.PHONY:doc
doc:
	man $(chapitre) $(func) > $(DOC)man_$(func).md

clean:
	rm -f $(BIN)*
	rm -f $(target)

# initialize project sturcture at current floder
init:
	@mkdir $(BIN) $(INC) $(SRC) $(DOC)
	@echo "#include <stdio.h>\n\nint main(){\n    printf(\"Hello World\\\n\");\n    return 0;\n}" > "$(SRC)$(target).c"
#############################
