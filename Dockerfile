FROM ubuntu:latest

# Update and upgrade system packages
# システムパッケージを更新・アップグレード
# 시스템 패키지 업데이트 및 업그레이드
RUN apt update && \
    apt upgrade -y && \
    apt install -y curl unzip build-essential wget fonts-ipafont fonts-ipaexfont

# Install Google Chrome
# Google Chromeをインストール
# Google Chrome 설치
ENV DEBIAN_FRONTEND=noninteractive
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y --fix-missing ./google-chrome-stable_current_amd64.deb

# Install libfaketime
# libfaketimeをインストール
# libfaketime 설치
RUN curl -LO https://github.com/wolfcw/libfaketime/archive/master.zip && \
    unzip master.zip && \
    cd libfaketime-master/src && \
    make install

ENV LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1

# Setup user
# ユーザー設定
# 사용자 설정
RUN useradd -m chromeuser
USER chromeuser

# Configure Google Chrome as the entry point
# Google Chromeをエントリーポイントとして設定
# Google Chrome을 엔트리 포인트로 설정
ENTRYPOINT ["google-chrome", "--ignore-certificate-errors", "--no-first-run", "--no-sandbox"]

# Set default URL
# デフォルトURLを設定
# 기본 URL 설정
CMD ["https://google.com"]
