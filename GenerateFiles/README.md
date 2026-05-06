# GenerateFiles PowerShell Moodul

Utiliidmoodul juhuslike testfailide genereerimiseks kohandatavate nimedega ja laienditega. Planeeritud kiireks testandmete genereerimiseks ja süsteemitestimise stsenaariumiteks.

## Ülevaade

GenerateFiles on PowerShelli moodul, mis automatiseerib testfailide loomist juhuslike nimetamiskonventsioonidega. Moodul genereerib määratud arvu faile eelnevalt määratletud nimetamismustreid ja faililiike kasutades, samal ajal rakendades duplikaatide vältimise loogika failide unikaalsuse tagamiseks.

**Peamised omadused:**

- Automaatne väljundkataloogi loomine (`Loodud_Failid`)
- Kohandatav failide genereerimine (1-1000 faili operatsiooni kohta)
- Juhusliku failinimetamise ja kokkupõrgete vältimise loogika
- 15 levinud faililiigi ja nimetamismustriiga tugi
- Parameetrite valideerimine ja piiride kontrollimine
- Värviga konsooli väljund operatsiooni oleku jaoks

## Süsteeminõuded

- PowerShell 5.1 või uuem
- Windows operatsioonisüsteem

## Paigaldamine

### Automaatne paigaldamine

```powershell
# PowerShelli 5.1 jaoks:
Copy-Item -Path ".\GenerateFiles" -Destination "$env:USERPROFILE\Documents\WindowsPowerShell\Modules\" -Recurse -Force

# PowerShelli 7+ jaoks:
Copy-Item -Path ".\GenerateFiles" -Destination "$env:USERPROFILE\Documents\PowerShell\Modules\" -Recurse -Force
```

### Käsitsi paigaldamine

Kopeeri `GenerateFiles` kaust sobivasse PowerShelli moodulite kausta:

**PowerShell 5.1:**
```
C:\Users\[KASUTAJANIMI]\Documents\WindowsPowerShell\Modules\GenerateFiles\
```

**PowerShell 7+:**
```
C:\Users\[KASUTAJANIMI]\Documents\PowerShell\Modules\GenerateFiles\
```

## Kasutamine

### Mooduli importimine

```powershell
Import-Module GenerateFiles
```

### Failide genereerimine

15 faili genereerimine (vaikimisi):
```powershell
Start-FileGeneration
```

50 faili genereerimine:
```powershell
Start-FileGeneration -FileCount 50
```

1000 faili genereerimine:
```powershell
Start-FileGeneration -FileCount 1000
```

## API viide

### Start-FileGeneration

Peamine funktsioon failide genereerimiseks juhusliku nimetamise ja dedupliceerimisega.

**Süntaks:**
```powershell
Start-FileGeneration [-FileCount <int>]
```

**Parameetrid:**

| Parameeter | Tüüp | Vaikimisi | Vahemik | Kirjeldus |
|-----------|------|----------|--------|-----------|
| FileCount | int | 15 | 1-1000 | Genereeritavate failide arv |

**Väljund:**

- Loob väljundkataloogi `Loodud_Failid` praeguse töökataloogi suhtes
- Genereerib failid mustriga: `[BaseNimi]_[JuhuslikArv].[Laiend]`
- Näitefailid: `Document_4521.pdf`, `Report_8834.xlsx`, `Data_1234.json`
- Konsooli väljund näitab operatsiooni edenemist ja lõpetamise staatust

**Näited:**

```powershell
# 20 faili genereerimine
Start-FileGeneration -FileCount 20

# Vaikimisi 15 faili genereerimine
Start-FileGeneration
```

### Tugi funktsioonid (sisemised)

Need funktsioonid kasutatakse mooduli poolt sisemiselt:

- `Get-BaseNames` - Tagastab 15 failinimetamise baasvalike massiivi
- `Get-Extensions` - Tagastab 15 toetatud faililiikide laiendi massiivi

## Toetatud faililiigid

**Nimetamise valikud:**
Document, Report, Data, Image, Log, Draft, Final, Template, Presentation, Spreadsheet, Invoice, Receipt, Roster, Schedule, MeetingNotes

**Faililiikide laiendid:**
.txt, .csv, .json, .md, .xml, .pdf, .docx, .xlsx, .pptx, .jpg, .png, .html, .css, .js, .zip

## Projekti struktuur

```
GenerateFiles/
├── GenerateFiles.psd1          Mooduli manifest
├── GenerateFiles.psm1          Mooduli definitsioon
├── README.md                   Dokumentatsioon
└── Functions/
    ├── Start-FileGeneration    Peamine genereerimisfunktsioon
    ├── Get-BaseNames           Nimetamise pakkuja
    └── Get-Extensions          Faililiikide pakkuja
```

## Tehniline teave

**Mooduli versioon:** 1.0.0  
**Autor:** Karl Indrek Palmeos  
**PowerShelli versioon:** 5.1+  
**Litsents:** Isiklik kasutamine

## Tugi

Probleemide, soovituste või funktsioonide taotluste korral võtke ühendust projekti autoriga.