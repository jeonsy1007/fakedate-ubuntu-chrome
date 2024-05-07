# Dockerfile for Running Google Chrome with GUI

This README explains how to run Google Chrome with a graphical user interface (GUI) inside a Docker container. This setup is particularly useful when you cannot directly change the local date on systems like Windows.

## English Description

### Prerequisites

- Docker must be installed on your system.
- X11 display server must be accessible.

### Reasons for Use

- This setup is used when it is not possible to directly modify the local date settings, such as on Windows systems.

### Running the Container

To run Google Chrome in a Docker container with GUI support, use the following command:

bash

Copy code

`docker run --rm \     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \     --env DISPLAY=$DISPLAY \     --env FAKETIME="+90d" \     chrome-image`

#### Command Explanation

- `--rm`: Automatically removes the container after it exits.
- `--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"`: Mounts the host's X11 socket directory inside the container, allowing the container to access the host's display. `rw` grants read-write permissions.
- `--env DISPLAY=$DISPLAY`: Passes the host's DISPLAY environment variable to the container, enabling GUI applications to locate the display server.
- `--env FAKETIME="+90d"`: Uses `libfaketime` to adjust the system time by 90 days forward.
- `chrome-image`: The name of the Docker image to use.

---

# DockerfileでGUIを持つGoogle Chromeを実行する

このREADMEは、Dockerコンテナ内でグラフィカルユーザーインターフェース（GUI）を持つGoogle Chromeを実行する方法を説明しています。特にWindowsのようなシステムでローカルの日付を直接変更できない場合に便利です。

## 日本語説明

### 前提条件

- システムにDockerがインストールされている必要があります。
- X11ディスプレイサーバーにアクセス可能であること。

### 使用する理由

- Windowsシステムなど、ローカルの日付設定を直接変更できない場合に使用します。

### コンテナの実行

GUIサポートでDockerコンテナ内でGoogle Chromeを実行するには、以下のコマンドを使用します：

bash

Copy code

`docker run --rm \     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \     --env DISPLAY=$DISPLAY \     --env FAKETIME="+90d" \     chrome-image`

#### コマンドの説明

- `--rm`: コンテナが終了した後に自動的に削除されます。
- `--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"`: ホストのX11ソケットディレクトリをコンテナ内にマウントし、コンテナがホストのディスプレイにアクセスできるようにします。`rw`は読み書きの許可を与えます。
- `--env DISPLAY=$DISPLAY`: ホストのDISPLAY環境変数をコンテナに渡し、GUIアプリケーションがディスプレイサーバーを見つけられるようにします。
- `--env FAKETIME="+90d"`: `libfaketime`を使用してシステム時間を90日前に調整します。
- `chrome-image`: 使用するDockerイメージの名前です。

---

# Dockerfile로 GUI가 있는 Google Chrome 실행하기

이 README는 Docker 컨테이너 내에서 그래픽 사용자 인터페이스(GUI)를 가진 Google Chrome을 실행하는 방법을 설명합니다. 특히 윈도우 같은 시스템에서 직접적으로 로컬 날짜를 변경할 수 없는 경우에 유용합니다.

## 한글 설명

### 필요 조건

- 시스템에 Docker가 설치되어 있어야 합니다.
- X11 디스플레이 서버에 접근 가능해야 합니다.

### 사용하는 이유

- 윈도우나 직접적으로 로컬 날짜를 변경할 수 없는 경우 이용합니다.

### 컨테이너 실행 방법

GUI 지원으로 Docker 컨테이너에서 Google Chrome을 실행하려면 다음 명령어를 사용하세요:

bash

Copy code

`docker run --rm \     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \     --env DISPLAY=$DISPLAY \     --env FAKETIME="+90d" \     chrome-image`

#### 명령어 설명

- `--rm`: 컨테이너가 종료되면 자동으로 삭제됩니다.
- `--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"`: 호스트의 X11 소켓 디렉토리를 컨테이너 내부에 마운트하여 컨테이너가 호스트의 디스플레이에 접근할 수 있게 합니다. `rw`는 읽기/쓰기 권한을 부여합니다.
- `--env DISPLAY=$DISPLAY`: 호스트의 `DISPLAY` 환경 변수를 컨테이너에 전달하여, GUI 애플리케이션이 디스플레이 서버를 찾을 수 있도록 합니다.
- `--env FAKETIME="+90d"`: `libfaketime`을 사용하여 시스템 시간을 현재로부터 90일 후로 조정합니다.
- `chrome-image`: 사용할 Docker 이미지 이름입니다.
