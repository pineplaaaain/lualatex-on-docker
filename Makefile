.PHONY: build clean help

# デフォルトのTeXファイル
TEX_FILE ?= sample.tex
PDF_FILE = $(TEX_FILE:.tex=.pdf)

help: ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build-slim: ## LaTeX文書をビルド
	mkdir -p out
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)

build: ## 参考文献付きでビルド
	mkdir -p out
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)
	cd src && biber --output-directory=../out $(basename $(TEX_FILE))
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)
	cd src && lualatex -output-directory=../out -synctex=1 -interaction=nonstopmode -file-line-error $(TEX_FILE)

clean: ## 生成ファイルを削除
	rm -f *.aux *.bbl *.blg *.fdb_latexmk *.fls *.log *.out *.synctex.gz *.toc *.dvi
	rm -rf out/

watch: ## ファイル変更を監視してビルド
	mkdir -p out
	cd src && latexmk -lualatex -pvc -synctex=1 -interaction=nonstopmode -output-directory=../out $(TEX_FILE)

docker-build: ## Dockerイメージをビルド
	docker-compose build

docker-up: ## Dockerコンテナを起動
	docker-compose up -d

docker-down: ## Dockerコンテナを停止
	docker-compose down
