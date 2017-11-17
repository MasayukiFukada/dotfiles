# dotfiles

dropboxで管理していたファイルが突然中身が０になり
履歴も消滅した為、以降、設定ファイルはここで管理する

Ubuntu環境について
--------------------------------------------------------------------------------

* tig
    - make configure -> configure -> make -> make install で導入
    - 文字化けで変になることがあるかも
        - `whereis` して tig の実行ファイルを検索。それぞれ実行してみる
        - ホームディレクトリの tig が正しく動くか確認する。  
          場合によっては削除して他の場所にある実行ファイルにリンクを張る
* atom
    - Community Package
        - vim-mode-plus
            - relative number
        - minimap
        - teletype
        - file-icons
        - editor-background
        - editorconfig

vim: ft=markdown
