trap { 
    # Throw "An error occurred: $_" -ForegroundColor Magenta 
    Write-Host "An Error Ocurred. But I don't care. Moving on..."
}


Invoke-Nonsense -Path c:\Does-Not-Exist
