require './somefile'
require './somefile2'

# TODO

=begin
1. When a new game is started, script should load
dictionary and randomly select word for secret word

2. (Optional) Draw a stick figure.

2.a Display a count so player know how many guesses are left
for incorrect guesses. Also display which letters have
been correctly guessed and what position of the word it
belongs too. Also show the incorrect guesses.

3. The player must be able to guess a letter (either 
small or capital letter). If max guesses are reached before
word is revealed, game over.

4. At start of every turn, player should be able to save game.
Must use serialization.

5. At start of program, add an option to load a saved game.

6. (Optional) Add AI.
=end

Hangman = HangmanGame.new
Hangman.play