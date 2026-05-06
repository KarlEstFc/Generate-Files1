# Tagastab nimekirja baasnimedest (5 algset + 10 täiendavat)
function Get-BaseNames {
    $baseNames = @(
        "Document", "Report", "Data", "Image", "Log",
        "Draft", "Final", "Template", "Presentation", "Spreadsheet",
        "Invoice", "Receipt", "Roster", "Schedule", "MeetingNotes"
    )
    return $baseNames
}
