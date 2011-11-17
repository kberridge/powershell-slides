function demo
{
  "awesome is awesome!?: " + ('awesome' -eq 'awesome!')
  $a = 1, 2, 3
  "a is $a"
  $a[0] -lt $a[-1]
}

$results = demo

function parensfunc($a, $b, $c) {
  "a is $a, b is $b, c is $c"
}

function calls {
  "first call:  $( parensfunc(1, 2, 3) )"
  "second call: $( parensfunc 1, 2, 3 )"
  "third call:  $( parensfunc 1 2 3 )"
  #parensfunc(1 2 3) #does not parse!
}
