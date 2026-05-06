# Tagastab nimekirja laienditest (5 algset + 10 teada-tuntud täiendavat)
function Get-Extensions {
    $extensions = @(
        ".txt", ".csv", ".json", ".md", ".xml",
        ".pdf", ".docx", ".xlsx", ".pptx", ".jpg",
        ".png", ".html", ".css", ".js", ".zip"
    )
    return $extensions
}