# LuaLaTeX on Docker

LuaLatex環境をDockerでコンテナとして構築し, 日本語での卒修論の執筆などのテンプレファイルを含んでいます. 

VSCodeのDev Containerを利用することでVSCodeのLaTex機能を利用することができます. 

## 特徴

- LuaLaTeX + 日本語フォント対応
- VS Code Dev Containers対応
- LaTeX Workshop拡張機能設定済み
- Debian Bookwormベース

## セットアップ

### 必要な環境

- Docker
- Docker Compose
- VS Code + Dev Containers拡張機能

### 使用方法

1. リポジトリをクローン
```bash
git clone <repository-url>
cd lualatex-on-docker
```

2. VS Codeで開く
```bash
code .
```

3. Dev Containerで再オープン
   - コマンドパレット（Ctrl+Shift+P）を開く
   - "Dev Containers: Reopen in Container" を選択

### LaTeX文書のコンパイル

- VS Code内でTeXファイルを開き, Ctrl+Alt+B でビルド
- PDFは自動的に生成され, VS Code内で表示されます

## ディレクトリ構造

```
.
├── .devcontainer/          # Dev Container設定
│   ├── devcontainer.json  # VS Code設定
│   └── docker-compose.yml # Dev Container用Compose設定
├── src/                    # LaTeX文書ファイル
│   ├── chapters/          # 章ごとのTeXファイル
│   │   ├── figures/       # 図表ファイル（TikZ図, PDFなど）
│   │   ├── introduction.tex  # はじめに
│   │   ├── hoge.tex          # 第2章のサンプル
│   │   ├── fuga.tex          # 第3章のサンプル
│   │   └── conclusion.tex    # 結論
│   ├── .latexmkrc         # LaTeXビルド設定
│   ├── sample.tex         # サンプル論文
│   └── references.bib     # 参考文献ファイル
├── out/                    # ビルド出力ディレクトリ（自動生成）
├── Dockerfile             # Docker設定
├── docker-compose.yml     # Docker Compose設定
└── Makefile              # ビルド自動化
```

## 含まれるサンプル

- **sample.tex**: 基本的な論文構造のサンプル
- **TikZ図例**: ネットワーク図、散布図、関数プロット
- **参考文献管理**: BibLaTeX + Biberを使用
- **日本語フォント**: 原ノ味フォントを使用

## カスタマイズ

### パッケージの追加

Dockerfileの`RUN apt-get install`セクションに必要なパッケージを追加してください. 

### VS Code設定の変更

`.devcontainer/devcontainer.json`でVS Codeの設定をカスタマイズできます. 
