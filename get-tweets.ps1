function SpeakText {
  begin {
    add-type -assemblyname System.Speech
    $spk = new-object System.Speech.Synthesis.SpeechSynthesizer
  }
  process {
    $_
    $spk.Speak($_)
  }
}

$wc = new-object System.Net.WebClient
$xml = [xml]$wc.DownloadString('http://search.twitter.com/search.atom?q=kberridge')
$xml.feed.entry | %{ $_.title } | SpeakText
