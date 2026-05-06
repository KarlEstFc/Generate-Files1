@{
    RootModule        = 'GenerateFiles.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = 'a1b2c3d4-e5f6-47a8-9b10-c11d12e13f14'
    Author            = 'Karl Indrek Palmeos'
    Copyright         = '(c) 2026 Karl Indrek Palmeos. All rights reserved.'
    Description       = 'Generates random test files with configurable names and extensions'
    PowerShellVersion = '5.1'
    
    FunctionsToExport = @('Start-FileGeneration')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
}