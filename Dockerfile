FROM debian:bookworm-slim

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
ENV DEBIAN_FRONTEND=noninteractive

# 基本パッケージのインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    tzdata \
    make \
    && locale-gen ja_JP.UTF-8 \
    && localedef -f UTF-8 -i ja_JP ja_JP \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# LaTeX関連パッケージのインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-lang-japanese \
    texlive-luatex \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-bibtex-extra \
    biber \
    fonts-lmodern \
    latexmk \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# 非rootユーザーの作成
RUN useradd -m -s /bin/bash vscode && \
    chown -R vscode:vscode /workspace

USER vscode
