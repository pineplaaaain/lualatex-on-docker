.PHONY: build clean help

# デフォルトのTeXファイル
TEX_FILE ?= template.tex
PDF_FILE = $(TEX_FILE:.tex=.pdf)

help: ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-slim: ## LaTeX文書をビルド
	mkdir -p out
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)

build: ## 参考文献付きでビルド (latexmk)
	mkdir -p out
	cd src && latexmk -output-directory=../out $(TEX_FILE)

clean: ## 生成ファイルを削除
	rm -rf out/

watch: ## ファイル変更を監視してビルド
	mkdir -p out
	cd src && latexmk -pvc -output-directory=../out $(TEX_FILE)
