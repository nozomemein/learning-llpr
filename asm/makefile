# ────────────── 変数 ──────────────
NASM      ?= nasm
NASMFLAGS ?= -felf64
LD        ?= ld
LDFLAGS   ?=

.DEFAULT_GOAL := hello

# +++ ここを追加 +++++++++++++++++++++++++++++++++++++++++++
# `make run foo bar` なら MAKECMDGOALS = run foo bar
# run を除いた 1 個目を BIN にする（無ければ "hello"）
BIN ?= $(word 1,$(filter-out run,$(MAKECMDGOALS)))
BIN ?= hello
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# ────────────── パターンルール ──────────────
%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

%: %.o
	$(LD) $(LDFLAGS) -o $@ $<
	chmod u+x $@

# ────────────── ユーティリティ ──────────────
.PHONY: run
run: $(BIN)          # ← 依存に付けるとビルドも自動
	./$(BIN)

.PHONY: clean
clean:
	$(RM) *.o hello
