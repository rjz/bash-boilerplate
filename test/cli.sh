#!/usr/bin/env bats

@test 'greeting' {
  result="$(./cli.sh greet @rjz | cut -f3- -d' ')"
  echo $result
  [ "$result" == "So then I says, 'Top o' the morning to ye, @rjz!'" ]
}

@test 'dismissal' {
  result="$(./cli.sh dismiss @rjz | cut -f3- -d' ')"
  echo $result
  [ "$result" == "So then I says, 'Fare thee well, @rjz!'" ]
}
