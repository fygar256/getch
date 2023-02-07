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

SRCS        = getch.c kbhit.c main.c   # ソースファイルの列挙
OBJS        = $(SRCS:$(CSUFFIX)=.o)    # オブジェクトファイルの名前定義 

LIBNAME     = lib$(TARGET)$(LSUFFIX)   # 静的ライブラリのファイルネーム
HEADER      = $(TARGET)$(HSUFFIX)      # ヘッダファイルのファイルネーム
LIBDIRNAME  = /home/$(USER)/lib/       # ライブラリディレクトリ
INCDIR      = /home/$(USER)/include/   # インクルードディレクトリ）

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

# make とすると静的ライブラリを作成する
$(LIBNAME): $(filter-out $(MAIN)$(OSUFFIX),$(OBJS))
    ar rcs $(LIBNAME) $^

# make main とすると実行ファイルを作成
$(MAIN): $(MAIN)$(OSUFFIX) $(LIBNAME) install
    $(CC) -o $(MAIN) $(MAIN)$(OSUFFIX) $(CFLAGS) $(LIBS) $(LDFLAGS)

# make installとすると、静的ライブラリとヘッダファイルを当該ディレクトリにインストール
install: $(LIBNAME) $(HEADER)
    $(CP) $(LIBNAME) $(LIBDIRNAME)
    $(CP) $(HEADER) $(INCDIR)

# make clean とすると .o ファイル削除
clean:
    $(RM) -rf $(OBJS) $(LIBNAME)

# make all とすると最初からやる
all: clean $(MAIN)
