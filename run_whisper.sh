# 以下記事を参照
# https://zenn.dev/kento1109/articles/d7d8f512802935

# docker build -t whisper .

# イメージ起動
docker run -it -d -v $(pwd):/workspace/ --name whisper whisper

# bashで入る
docker exec -it whisper bash

# smallで起動
# whisper test.m4a --language ja

# largeで起動
whisper test.m4a --language ja --model large

# 次やることがあるとすれば
# - 音声ファイルをdocker外マウントされた場所に入れれば読み取れるようにする: docker-compose作るか
# - 出力結果をどっかにまとめてChatGPTに投げる
# - 起動したらすぐひちゃに通知。LINEとかメールとか