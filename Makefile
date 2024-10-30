# Nom du projet
TARGET = Pong

# Dossiers
SRC_DIR = src
BUILD_DIR = build

# Fichiers source et objets
SOURCES = $(SRC_DIR)/main.asm $(SRC_DIR)/graphics.asm $(SRC_DIR)/input.asm $(SRC_DIR)/logic.asm $(SRC_DIR)/utils.asm
OBJECTS = $(BUILD_DIR)/main.o $(BUILD_DIR)/graphics.o $(BUILD_DIR)/input.o $(BUILD_DIR)/logic.o $(BUILD_DIR)/utils.o

# Assembleur et options
ASM = nasm
ASM_FLAGS = -f elf32   # Utiliser elf32 pour une architecture 32 bits (ajuster selon l’architecture)

# Editeur de liens
LD = ld
LD_FLAGS = -m elf_i386 # Lien pour une architecture 32 bits (ajuster si nécessaire)

# Règle principale : assembler et lier pour créer le binaire final
$(BUILD_DIR)/$(TARGET).bin: $(OBJECTS)
	$(LD) $(LD_FLAGS) -o $@ $^

# Règle pour assembler chaque fichier .asm en fichier .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	$(ASM) $(ASM_FLAGS) -o $@ $<

# Nettoyage des fichiers compilés
clean:
	rm -f $(BUILD_DIR)/*.o $(BUILD_DIR)/$(TARGET).bin
