# ----------------- 変数定義 -----------------
NASM      ?= nasm
NASMFLAGS ?= -felf64

CC        ?= gcc
CFLAGS    ?= -std=c11 -O2 -Wall -Wextra
LDFLAGS   ?=

.DEFAULT_GOAL := hello      # 既定ターゲット

# ------------- パターンルール --------------
# 1. foo.asm → foo.o
%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

# 2. foo.c   → foo.o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# 3. *.o → 実行ファイル (stem と同名)
#    $^ = すべての依存オブジェクト
%: %.o
	$(CC) $(LDFLAGS) $^ -o $@
	chmod u+x $@

# --------- 実行・クリーンターゲット --------
.PHONY: run
run:
	./$(BIN)

.PHONY: clean
clean:
	$(RM) *.o
