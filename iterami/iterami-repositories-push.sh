#!/bin/sh

# Required arguments:
#   $1: Relative path to the directory in which the
#         iterami repositories are/will_be stored.
#
# Example: sh iterami-repositories-push.sh iterami_repositories/

# Check if at least 1 argument was passed.
if [ $# -lt 1 ]
then
    echo 'Missing argument: path'
    exit 2
fi

# Navigate to the target directory name
#   and create it if it doesn't exist.
mkdir -p $1
cd $1

# An array of all iterami repositories.
repositories='
9YG0E6r.htm
Alarm.htm
AoM-Guide.htm
Aquarium-2D.htm
ArtEditor.htm
Avoidance-2D.htm
BaseConverter.htm
BinaryDataEndecoder.htm
Blog.php
Calculator.htm
ChatBot.py
Chrome-CookieClickerSimplifier
Chrome-DarkTheme
Chrome-GitHubCodeWrap
Chrome-iterami
Chrome-RedditSimplifier
Chrome-TwitchSimplifier
Chrome-WikipediaSimplifier
Chrome-YouTubeSimplifier
Click.htm
Clock.htm
ColorDrops.htm
ColorSelector.htm
ColorSquares.htm
ColorSteps.htm
ColorWaves.htm
common
ConfigFiles
ContactForm.htm
ContactForm.php
Countdown.htm
D2LoD-ArcaneSanctuary.htm
D2LoD-Guide.htm
Documentation.htm
DrinkingGames.htm
Dropdown.htm
Drupal-alter_field_maxlength
Drupal-callipepla
Drupal-delete_ghost_fields
Drupal-disable_window_alert
Drupal-integer_to_decimal
Drupal-move_field_description
Drupal-workflow_transitions_roles_fix
DS-Guide.htm
Duel.htm
EmojiText.htm
Engine.htm
eog-Plugin-MenuEnhancer
ESP-Test.htm
EVE-Guide.htm
ExperienceCalculator.htm
FakeLogin.php
Fireworks-2D.htm
Forums
FractalRunner-2D3D.htm
Functions.php
gedit-Plugin-MenuEnhancer
GitHub-API.htm
GitHub-Searches.htm
Guess.htm
Hallway-2D3D.htm
Hexagons-2D.htm
Hrad.htm
HS-Guide.htm
Info.php
InterestCalculator.htm
Inventory.php
IP.php
iterami.github.io
Jetpack-2D.htm
LayeredSnake-2D3D.htm
LocalStorage.htm
Market
Match.htm
MC-ResourcePacks
Music-Local.htm
Music-Server.htm
OS.asm
pages.github.io
Particleball-2D.htm
ParticleRun-2D.htm
PasswordGenerator.htm
Percentages.htm
PixelEditor.htm
Platform-2D.htm
Platform-2D.sh
PlusPlus.htm
Poem.htm
ProcessEditor
QjnyYap.htm
Race-2D.htm
Race-3D.htm
Rain-2D.htm
ReactionTest.htm
RNG.htm
RockPaperScissors.htm
RPG-Above.htm
RPG-Side.htm
RS-Guide.htm
RTS-2D.htm
RTS-Boxing.htm
Saria.htm
Scripts
Shooter-2D.htm
Slots.htm
Snakish.htm
SnowyMountains.htm
SolarSystem-2D.htm
SpeedButton.htm
SpeedShape.htm
SpeedText.htm
SpeedType.htm
Starfield-2D3D.htm
Starfield-3D.htm
Sudoku.htm
TemplateEngine.php
TemplateEngine-Lite.php
Terminal.htm
TextEditor.htm
TextInfo.htm
TF2-Guide.htm
Time.htm
TimeColors.htm
Timeline.js
Timer.htm
TinyMCE-Editor.htm
Trains-2D.htm
Trains-3D.htm
Tubes-2D3D.htm
U1.htm
UnitConverter.htm
UniverseConstructor.htm
Warped.htm
WebScraper.py
WebServer.py
Wiki.php
WindowInfo.htm
WoW-Guide.htm
Zuzanka.htm
'

# Push cloned iterami repositories.
for repository in $repositories
do
    if [ -d $repository ]
    then
        echo 'pulling https://github.com/iterami/'$repository
        cd $repository
        git push origin HEAD

    else
        echo 'https://github.com/iterami/'$repository' NOT YET CLONED'
    fi

    cd ..

    echo
done
