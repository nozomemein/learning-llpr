# ---------------------------------------
# 変数定義
NASM      ?= nasm
NASMFLAGS ?= -felf64
LD        ?= ld
LDFLAGS   ?=

# 規定ターゲット（hello をビルド）
.DEFAULT_GOAL := hello

# ターゲットを指定することもできる(e.g. make foo)

# --- 汎用ルール ---------------------------------
# 1. foo.asm → foo.o
%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

# 2. foo.o → foo (実行ファイル)
%: %.o
	$(LD) $(LDFLAGS) -o $@ $<
	chmod u+x $@

# --- 実行ターゲット ------------------------------
#   $ make run BIN=hello
.PHONY: run
run:
	./$(BIN)

# --- クリーン ------------------------------------
.PHONY: clean
clean:
	$(RM) *.o hello
