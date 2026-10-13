Function Invoke-DnDDice {
<# .SYNOPSIS
This script emulates a Dungeons & Dragons dice being rolled.
.DESCRIPTION
The user will be prompted to choose a die type (d4, d6, d8, d10, d12, or d20) and the script will randomly generate a number between 1 and the maximum value of the chosen die. The script will then display the result of the roll along with ASCII art representing the rolled number.

Recommendation from a colleague was to add ASCII art with a role and have 20 be a dragon.
.ROLE
For fun, Enjoy! 
This is a bonus script for the Dungeons & Dragons game. The user can use this script to roll dice for their character's actions in the game.
.EXAMPLE
Invoke-DnDDice -Die d20
.NOTES
#>

[CmdletBinding()]   
param (
  [Parameter(Mandatory)]
  [ValidateSet("d4", "d6", "d8", "d10", "d12", "d20")]
  $Die  
)

#ASCII art of die faces from ChatGPT to use when the die is rolled. 
$DieFace1 = @"
         _______
       /       /\ 
      /  x    /  \
     /_______/    \
    /       \      \
   /   1     \______\
  /___________\      
"@  
$DieFace2 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   2     \______\
  /___________\      
"@  
$DieFace3 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   3     \______\
  /___________\      
"@  
$Die_Face_4 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   4     \______\
  /___________\      
"@  
$Die_Face_5 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   5     \______\
  /___________\      
"@  
$Die_Face_6 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   6     \______\
  /___________\      
"@  
$Die_Face_7 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   7     \______\
  /___________\      
"@  
$Die_Face_8 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   8     \______\
  /___________\      
"@ 
$Die_Face_9 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   9     \______\
  /___________\      
"@   
$DieFace10 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   10    \______\
  /___________\      
"@  
$DieFace11 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  11     \______\
  /___________\      
"@  
$DieFace12 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   12    \______\
  /___________\      
"@  
$DieFace13 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  13     \______\
  /___________\      
"@  
$DieFace14 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  14     \______\
  /___________\      
"@  
$DieFace15 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  15     \______\
  /___________\      
"@  
$DieFace16 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  16     \______\
  /___________\      
"@  
$DieFace17 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  17     \______\
  /___________\      
"@  
$DieFace18 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   18    \______\
  /___________\      
"@  
$DieFace19 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   19    \______\
  /___________\      
"@  
$DieFace20 = @"
                              ___====-_  _-====___
                           _--^^^#####//      \\#####^^^--_
                        _-^##########// ( 20!) \\##########^-_
                       -############//  |\^^/|  \\############-
                     _/############//   (@::@)   \\############\_
                    /#############((     \\//     ))#############\
                   -###############\\    (oo)    //###############-
                  -#################\\  / UUU \  //#################-
                 -###################\\/  (   )  \/###################-
                _/|##########/\######(    (   )    )######/\##########|\_
               / |#/\#/\#/\/  \#/\###(   (     )   )###/\#/  \/\#/\#/\| \
              (  (  (  (    (    )  (  (     )  )  )    )  )  )  )  )
              \  \  \  \    (    )   ( ( (   )  )  )   )    )  )  )  /
               \  \  \  \   (    )  (  ( (   )  )  )   )    )  )  )  /
                \  \  \  \  (   )  (   (  (   )   )   )    )  )  )  /
                 \  \  \  \ (   )  (    ( (  )  )   )    )  )  )  /
                  \  \  \  \ (   ) (    (  (  ) )  )    )  )  )  /
                   \  \  \  \ (  ) (     ( ( ) )  )    )  )  )  /
                    \  \  \  \ () (      (  )   )   )  )  )  )  /
                     \  \  \  \     (     )   (  ) )   ) )  )  /
                      \  \  \  \    (     )  (   )  )  ) )  )  /
                       \  \  \  \   (      )  (   )  )   ) )  /
                        \  \  \  \  (       ) (    ) )  ) )  /
                         \  \  \  \  (      ( (    )  )  )  /
                          \  \  \  \ (       ) (   )  )  )  /
                           \  \  \  \ \______\_/__/  /
                            \  \  \  \__________/ /
                             \  \  \____________/

"@  

#Hashtable used with the roll hit to match up the correct die face
function Roll_Action_Function {
  $Roll_Action = @{
    1  = { Write-Host "$DieFace1" }
    2  = { Write-Host "$DieFace2" }
    3  = { Write-Host "$DieFace3" }
    4  = { Write-Host "$Die_Face_4" }
    5  = { Write-Host "$Die_Face_5" }
    6  = { Write-Host "$Die_Face_6" }
    7  = { Write-Host "$Die_Face_7" }
    8  = { Write-Host "$Die_Face_8" }
    9  = { Write-Host "$Die_Face_9" }
    10 = { Write-Host "$DieFace10" }
    11 = { Write-Host "$DieFace11" }
    12 = { Write-Host "$DieFace12" }
    13 = { Write-Host "$DieFace13" }
    14 = { Write-Host "$DieFace14" }
    15 = { Write-Host "$DieFace15" }
    16 = { Write-Host "$DieFace16" }
    17 = { Write-Host "$DieFace17" }
    18 = { Write-Host "$DieFace18" }
    19 = { Write-Host "$DieFace19" }
    20 = { Write-Host "$DieFace20" }
  }
  if ($Roll_Action.ContainsKey($roll)) {
    $Roll_Action[$roll].Invoke()
  }
}

#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
  $roll = Get-Random -Minimum 1 -Maximum 5
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd6') {
  $roll = Get-Random -Minimum 1 -Maximum 7
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
} 
ElseIf ($Die -eq 'd8') {
  $roll = Get-Random -Minimum 1 -Maximum 9
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}   
ElseIf ($Die -eq 'd10') {
  $roll = Get-Random -Minimum 1 -Maximum 11
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd12') {
  $roll = Get-Random -Minimum 1 -Maximum 13
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd20') {
  $roll = Get-Random -Minimum 1 -Maximum 21  
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
}