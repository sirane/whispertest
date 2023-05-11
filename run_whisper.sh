# shファイルだけど実行したら出来るもんじゃないです。以下を手で実行してね。
# 以下記事を参照
# https://zenn.dev/kento1109/articles/d7d8f512802935

# まずはbuildする。
docker rm whisper
docker build -t whisper .

# イメージ起動
docker run -it -d -v $(pwd):/workspace/ --name whisper whisper

# bashで入る
docker exec -it whisper bash

# 以下をdockerの中で実行するべし
# smallで起動
# whisper filename --language ja

# largeで起動
# whisper filename --language ja --model large

# whisper 20230411_111212.wav --language ja --model large

# 次やることがあるとすれば
# - 音声ファイルをdocker外マウントされた場所に入れれば読み取れるようにする: docker-compose作るか
# - 出力結果をどっかにまとめてChatGPTに投げる
# - 起動したらすぐひちゃに通知。LINEとかメールとか