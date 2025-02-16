try {
    # Set Japanese culture
    $culture = New-Object System.Globalization.CultureInfo("ja-JP")

    # Get current time
    $currentTime = Get-Date

    # Format dates and times using custom format specifiers
    $formattedTime = $currentTime.ToString("yyyy/MM/dd(ddd) HH:mm:ss", $culture)

    # copy to clipboard
    Set-Clipboard -Value $formattedTime

    # Show success message
    # Write-Host "Current time copied to clipboard successfully: $formattedTime" -ForegroundColor Green
} catch {
    # Show failure message
    Write-Host "Failed to copy current time to clipboard." -ForegroundColor Red
    Write-Host "Error details: $_" -ForegroundColor Red
}