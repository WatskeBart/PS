Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.SelectVoice('Microsoft Frank')
$speak.Speak('MArtijn error error')

Foreach ($voice in $speak.GetInstalledVoices()){
    $Voice.VoiceInfo | Select-Object Gender, Name, Culture, Description
}

#Bron: https://learn-powershell.net/2013/12/04/give-powershell-a-voice-using-the-speechsynthesizer-class/