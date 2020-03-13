# Celine Choo (cc972)
# CS 2043 Bonus Assignment
# Rock Paper Scissors script

LINE="=================================================="
TITLE="======== WELCOME TO ROCK PAPER SCISSORS. ========="
DESC1="Hello, welcome to rock paper scissors. You will"
DESC2="be playing against the rock paper scissors"
DESC3="master."
CONT_TXT="Great, let's go!"
RPS=(r p s)
WIN_MSG="You win!"
LOSE_MSG="You lose!"
TIE_MSG="That's a tie..!"
CONFUSED_MSG="Hm. That's not a valid input. Let's try again!"

slow_print () {
 for word in "$@"; do
    while read -n 1 c; do
      echo -n "$c"
      sleep 0.005
    done <<< "$word"
    echo -n " "
  done
  echo
}

slower_print () {
  for word in "$@"; do
    while read -n 1 c; do
      echo -n "$c"
      if [ "$c" == "." ]
        then
          sleep 0.5
        else
          sleep 0.05
        fi
    done <<< "$word"
    echo -n " "
  done
  echo
}

end_game () {
  echo
  ENDING="Thank you for playing! Hope to see you next time. :)"
  slower_print $ENDING
  clear
  exit 1
}

play () {
  TEMP=$(( $RANDOM%3 ))
  RESULT=${RPS[$(( TEMP ))]}
  read -s -p "Your move (r/p/s): " userinput
  echo
  echo

  TEMP_MSG="So the game begins. Ready, set, go!"
  slower_print $TEMP_MSG
  sleep 0.2
  
  echo "----------------------------"
  echo "||  YOU: $userinput    MASTER: $RESULT   ||"
  echo "----------------------------"
  case $userinput in
    rock | r )
      play_rock $RESULT
    ;;
    paper | p )
      play_paper $RESULT
    ;;
    scissors | s | scissor )
      play_scissors $RESULT
    ;;
    * )
      slower_print $CONFUSED_MSG
      echo
    ;;
  esac
}

play_rock () {
  case "$1" in
    p )
      slower_print $LOSE_MSG
    ;;
    s )
      slower_print $WIN_MSG
    ;;
    r )
      slower_print $TIE_MSG
    ;;
    * )
      slower_print $CONFUSED_MSG
    ;;
  esac
}

play_scissors () {
  case "$1" in
    p )
      slower_print $WIN_MSG
    ;;
    s )
      slower_print $TIE_MSG
    ;;
    r )
      slower_print $LOSE_MSG
    ;;
    * )
      slower_print $CONFUSED_MSG
    ;;
  esac
}

play_paper () {
  case "$1" in
    p )
      slower_print $TIE_MSG
    ;;
    s )
      slower_print $LOSE_MSG
    ;;
    r )
      slower_print $WIN_MSG
    ;;
    * )
      slower_print $CONFUSED_MSG
    ;;
  esac
}

clear
slow_print $LINE
slow_print $LINE
slow_print $TITLE
slow_print $LINE
slow_print $LINE

slower_print $DESC1
slower_print $DESC2
slower_print $DESC3

continue=y
while [[ 1 == 1 ]]; do
  case $continue in
    Y | y )
      slower_print $CONT_TXT
      echo
      play
    ;;
    N | n )
      end_game
    ;;
    * )
      MSG="Sorry, I didn't get that. "
      slower_print $MSG
      echo
      echo
    ;;
  esac
  echo
  read -p "Continue playing? (Y/N): " continue
done

end_game
