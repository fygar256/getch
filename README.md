LinuxのCプログラミングにちょっと慣れてきたら、自分のライブラリが欲しくなります。

静的ライブラリを活用することで、複数の実行ファイルに共通する関数の管理がやりやすくなります。

makeを使って、ターミナルのCUIでやります。

ここでは、getch()を例に取り、getch()と、kbhit()で構成されるlibgetch.aという

静的ライブラリを開発することを目的とします。

LinuxのCの開発環境がインストールされているものとしておいて下さい。

# ディレクトリ構成

以下のディレクトリ構成の開発環境だとします。

    /home/user/
    ├── getch　　　　　　# カレントディレクトリ
    │   ├── getch.c
    │   ├── getch.h
    │   ├── kbhit.c
    │   ├── main.c
    │   ├── Makefile   # 実行ファイルを作るだけのためのmakefile
    │   └── makefile   # libgetch.aと実行ファイルを作るためのmakefile
    ├── include        # ユーザー用インクルードディレクトリ
    └── lib            # ユーザー用ライブラリディレクトリ

# makefileのmake のコマンド

    $ make             # 静的ライブラリlibgetch.aを作成する
    $ make main        # 実行ファイルを作成
    $ make install     # 静的ライブラリとヘッダファイルを当該ディレクトリにインストール
    $ make clean       # オブジェクトファイル削除、静的ライブラリlibgetch.aを削除
    $ make all         # オブジェクをファイルを削除、静的ライブラリ削除、
                       # また作成、実行ファイル作成、静的ライブラリとヘッダファイルを                  
                       # 当該ディレクトリにインストール

注意点

コンパイラが静的ライブラリ(.a)をリンクする場合は、例えばA.oがB.aに依存しているなら、

A.oをB.aの前に引数で与えなくてはなりません。

静的ライブラリ(.a)は、オブジェクトファイル(.o)をarで束ねただけのものです。

# make allの実行をした結果のディレクトリ構造

    /home/user/
    ├── getch　　　　　　# カレントディレクトリ
    │   ├── getch.c
    │   ├── getch.h
    │   ├── getch.o
    │   ├── kbhit.c
    │   ├── kbhit.o
    │   ├── libgetch.a
    │   ├── main
    │   ├── main.c
    │   ├── main.o
    │   ├── Makefile
    │   └── makefile
    ├── include
    │   └── getch.h
    └── lib
        └── libgetch.a
