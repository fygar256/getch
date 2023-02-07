# Makefileのコマンド行の先頭キャラクタをスペースに
.RECIPEPREFIX +=

# ユーザーネーム
USER        = gar

CC          = g++                      # コンパイラはg++を使うものとします
RM          = rm
CP          = cp
CSUFFIX     = .c
OSUFFIX     = .o
LSUFFIX     = .a
HSUFFIX     = .h

# 静的ライブラリの名前
TARGET      = getch

# 実行ファイル名
MAIN        = main

# ソースファイルの列挙
SRCS        = main.c
OBJS        = $(SRCS:$(CSUFFIX)=.o)    # オブジェクトファイルの名前定義 

LIBNAME     = lib$(TARGET)$(LSUFFIX)   # 静的ライブラリのファイルネーム
HEADER      = $(TARGET)$(HSUFFIX)      # ヘッダファイルのファイルネーム

# ライブラリディレクトリ
LIBDIRNAME  = /home/$(USER)/lib/
# インクルードディレクトリ）
INCDIR      = /home/$(USER)/include/
# バイナリディレクトリ
BINDIR      = /home/$(USER)/bin/

# コンパイラに渡すオプション（インクルードディレクトリ）
INCLUDE     = -I$(INCDIR)

# コンパイラに渡すオプション（ライブラリディレクトリ）
LDFLAGS     = -L$(LIBDIRNAME)

# コンパイラ渡すオプション（静的ライブラリのファイル指定)
LIBS        = -l$(TARGET)

# コンパイラに渡すオプション
CFLAGS      = -Wall -O2 $(INCLUDE)

# 一つづつオブジェクトファイルを生成
$(CSUFFIX).$(OSUFFIX):
    $(CC) -c $<

# make とすると実行ファイルを作成
$(MAIN): $(MAIN)$(OSUFFIX)
    $(CC) -o $(MAIN) $(MAIN)$(OSUFFIX) $(CFLAGS) $(LIBS) $(LDFLAGS)

# make installとすると、実行バイナリをバイナリファイルにインストール
install: $(MAIN)
    $(CP) $(MAIN) $(BINDIR)

# make clean とすると .o ファイル削除
clean:
    $(RM) -rf $(OBJS) 

# make all とすると最初からやる
all: clean $(MAIN)
