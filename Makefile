# Deterministic-lean build for the C99 reference
CC ?= cc
CFLAGS ?= -std=c99 -O2 -Wall -Wextra -pedantic
LDFLAGS ?=

BIN_DIR := bin
SRC_DIR := src/c99
OBJ_DIR := build

all: $(BIN_DIR)/longrun

$(BIN_DIR)/longrun: $(OBJ_DIR)/longrun.o | $(BIN_DIR)
	$(CC) $(CFLAGS) $(OBJ_DIR)/longrun.o -o $(BIN_DIR)/longrun $(LDFLAGS)

$(OBJ_DIR)/longrun.o: $(SRC_DIR)/longrun.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/longrun.c -o $(OBJ_DIR)/longrun.o

$(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

clean:
	rm -rf $(BIN_DIR) $(OBJ_DIR)
