# UTF-8 with BOM

# ファイルパスは書きかえてください
Set-Location -Path "C:/Users/むずでょ/Documents/GitHub/kifuwarabe-collection/nngs-docker"

$env:COMPOSE_PROJECT_NAME = "nngs"

# 初回はこっち
# Start-Process -FilePath "docker-compose.exe" -ArgumentList "up -d --build" -NoNewWindow -Wait
# ビルド後はこっち
Start-Process -FilePath "docker-compose.exe" -ArgumentList "up -d" -NoNewWindow -Wait
