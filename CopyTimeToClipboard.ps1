try {
    # 日本語のカルチャを設定
    $culture = New-Object System.Globalization.CultureInfo("ja-JP")

    # 現在時刻を取得
    $currentTime = Get-Date

    # カスタム書式指定子を使用して日付と時刻をフォーマット
    $formattedTime = $currentTime.ToString("yyyy/MM/dd(ddd) HH:mm:ss", $culture)

    # クリップボードにコピー
    Set-Clipboard -Value $formattedTime

    # 成功メッセージを表示
    # Write-Host "Current time copied to clipboard successfully: $formattedTime" -ForegroundColor Green
} catch {
    # 失敗メッセージを表示
    Write-Host "Failed to copy current time to clipboard." -ForegroundColor Red
    Write-Host "Error details: $_" -ForegroundColor Red
}