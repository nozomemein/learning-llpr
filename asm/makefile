# ────────────── 変数 ──────────────
NASM      ?= nasm
NASMFLAGS ?= -felf64         # 64-bit ELF オブジェクトを出力
LD        ?= ld
LDFLAGS   ?=                 # 必要なら -static などを追加

.DEFAULT_GOAL := hello       # make だけで hello をビルド

# ────────────── パターンルール ──────────────
# 1. foo.asm → foo.o
%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

# 2. foo.o   → foo  (実行ファイル、libc なし)
%: %.o
	$(LD) $(LDFLAGS) -o $@ $<
	chmod u+x $@

# ────────────── ユーティリティ ──────────────
.PHONY: run
run:
	./$(BIN)

.PHONY: clean
clean:
	$(RM) *.o hello
