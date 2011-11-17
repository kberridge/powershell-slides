$cmds = @()
$cmds += 'cd ex1'
$cmds += 'ls | select-string -pattern whatever'
$cmds += 'ls -filter *.cs | select-string -pattern whatever'
$cmds += 'ls -r -filter *.cs | select-string -pattern whatever'
$cmds += 'gvim $profile'
$cmds += "get-eventlog -logname application -newest 100 |`n  select-string -inputobject { `$_.Message } -pattern database"
$cmds += 'cd ..\ex2'
$cmds += 'hg blame -u .\default.ps1'
$cmds += 'hg blame -u .\default.ps1 | ?{$_ -match ''^.*kevin''}'
$cmds += "`$len=(ls -r -filter *.cs |`n  %{hg blame -u `$_.FullName} |`n  ?{`$_ -match '^.*kevin'}).Length;`n  `"Kevin wrote `$len lines of code`""
$cmds += 'cd ..; gvim get-tweets.ps1'
$cmds += '.\get-tweets.ps1'
$cmds += 'gvim demo-scripting.ps1;. .\demo-scripting.ps1'
$cmds += 'demo'
$cmds += 'calls'
$cmds += 'more tools.txt'
$cmds += 'GOODBYE'

$current = 0

function next {
  $global:current++;
  show
}

function prev {
  $global:current--;
  show
}

function show {
  $global:cmds[$global:current]
}

function exe {
  iex $global:cmds[$global:current]
}

set-alias n next
set-alias p prev
set-alias s show
set-alias e exe
