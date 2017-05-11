# The game is a large case statement with child case statements within it. I wanted to create a story/path for the player to follow. 
# At this time, since I have many different deaths to track, I stayed away from using variables for deaths. 
# I tailored each death out to the path the player chose. 
# In the future, I look forward to thinking about ways to make this code less repetitive. 

# Before the code for the game begins, I've added variables for my game title, win, and game over message.

game_over_text = "
  ▄████  ▄▄▄       ███▄ ▄███▓▓█████     ▒█████   ██▒   █▓▓█████  ██▀███  
 ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀    ▒██▒  ██▒▓██░   █▒▓█   ▀ ▓██ ▒ ██▒
▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███      ▒██░  ██▒ ▓██  █▒░▒███   ▓██ ░▄█ ▒
░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄    ▒██   ██░  ▒██ █░░▒▓█  ▄ ▒██▀▀█▄  
░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒   ░ ████▓▒░   ▒▀█░  ░▒████▒░██▓ ▒██▒
 ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░   ░ ▒░▒░▒░    ░ ▐░  ░░ ▒░ ░░ ▒▓ ░▒▓░
  ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░     ░ ▒ ▒░    ░ ░░   ░ ░  ░  ░▒ ░ ▒░
░ ░   ░   ░   ▒   ░      ░      ░      ░ ░ ░ ▒       ░░     ░     ░░   ░ 
      ░       ░  ░       ░      ░  ░       ░ ░        ░     ░  ░   ░     
                                                     ░                    "

game_win_text = "
▓██   ██▓ ▒█████   █    ██     █     █░ ██▓ ███▄    █  ▐██▌ 
 ▒██  ██▒▒██▒  ██▒ ██  ▓██▒   ▓█░ █ ░█░▓██▒ ██ ▀█   █  ▐██▌ 
  ▒██ ██░▒██░  ██▒▓██  ▒██░   ▒█░ █ ░█ ▒██▒▓██  ▀█ ██▒ ▐██▌ 
  ░ ▐██▓░▒██   ██░▓▓█  ░██░   ░█░ █ ░█ ░██░▓██▒  ▐▌██▒ ▓██▒ 
  ░ ██▒▓░░ ████▓▒░▒▒█████▓    ░░██▒██▓ ░██░▒██░   ▓██░ ▒▄▄  
   ██▒▒▒ ░ ▒░▒░▒░ ░▒▓▒ ▒ ▒    ░ ▓░▒ ▒  ░▓  ░ ▒░   ▒ ▒  ░▀▀▒ 
 ▓██ ░▒░   ░ ▒ ▒░ ░░▒░ ░ ░      ▒ ░ ░   ▒ ░░ ░░   ░ ▒░ ░  ░ 
 ▒ ▒ ░░  ░ ░ ░ ▒   ░░░ ░ ░      ░   ░   ▒ ░   ░   ░ ░     ░ 
 ░ ░         ░ ░     ░            ░     ░           ░  ░    
 ░ ░                                                       "

game_title = "
      ▓█████   ██████  ▄████▄   ▄▄▄       ██▓███  ▓█████ 
      ▓█   ▀ ▒██    ▒ ▒██▀ ▀█  ▒████▄    ▓██░  ██▒▓█   ▀ 
      ▒███   ░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██░ ██▓▒▒███   
      ▒▓█  ▄   ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▄█▓▒ ▒▒▓█  ▄ 
      ░▒████▒▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒▒██▒ ░  ░░▒████▒
      ░░ ▒░ ░▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░░░ ▒░ ░
       ░ ░  ░░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░░▒ ░      ░ ░  ░
         ░   ░  ░  ░  ░          ░   ▒   ░░          ░  
          ░  ░      ░  ░ ░            ░  ░            ░  ░
                       ░                                    "

game_title_img= "   
    .o oOOOOOOOo                                            OOOo
    Ob.OOOOOOOo  OOOo.      oOOo.                      .adOOOOOOO
    OboO00000000000.OOo. .oOOOOOo.    OOOo.oOOOOOo..0000000000OO
    OOP.oOOOOOOOOOOO 0POOOOOOOOOOOo.   00OOOOOOOOOP,OOOOOOOOOOOB0
    0O0OOOO0     0OOOOo0OOOOOOOOOOO0 .adOOOOOOOOO0oOOO0    0OOOOo
    oOOOO0            0OOOOOOOOOOOOOOOOOOOOOOOOOO'            oOO
    OOOOO                 ooOOOOOOOOOOOOOOOOoo                oOO
   oOOOOOba.                .adOOOOOOOOOOba               .adOOOOo.
  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
 OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOOoo  ooOOOOOOOOOOOOO.OOOOOOOOOOOOOO
 oOOOO0       oYOoOOOOMOIONODOOoo  .   ooOOROAOPOEOOOoOYo     oOOOo
    Y           oOOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?o         :o
    :            .oO00OOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
    .            oOOP00OOOOOOOOoOOOOOOOooOOOOO?OOOO?OOo
                  ooo  OOOOOOOOoo?OOOOO?OOOOOOpOOO?o
                      ?$o  oOOOO? oOoY o ?OOOOo  o             .
    .                  .     OPo          : o     .
                              
                              . "


# Setting up my typing speed with a proc! Changing the speed around and testing things really saves time with this. 
# I used the .each_char method to print out my characters one by one. Like in an old style game. 

type_speed = Proc.new { |chars| print chars; sleep 0.02; $stdout.flush }

## let the game begin!

puts game_title
puts game_title_img
puts "\n"
puts "         Type the commands in the square brackets to play!"
puts "		To exit, hit Ctrl+C. Stay Alive."
puts "		  Difficulty Level: Nightmare"
puts "		   Only two ways to survive."
puts "\n"
puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
puts "\n"

sleep(2)

"You wake up in a dark and dirty room with a horrible headache.\n".each_char(&type_speed)
"What happened? \nWhere the hell are you? \nWhat should you do? \n".each_char(&type_speed)
puts "\n"

sleep(1)

puts "Should you:"
puts "[Exit]		Exit the room. You're getting out of this dump."
puts "[Look]		Look out the window. Maybe you can see where you are."

# I named my questions with names such as quest_rm_ex or quest_rm_lk, so I can see what path the player is one. 

quest_rm = gets.chomp.downcase

case quest_rm

# Tree_name: rm_ex. For easier reading, before you open this, close the other trees.

	when "exit"
		puts "\n"
		puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		puts "\n"
		"You walk outside. It's cold. You shiver in the dark hallway and see a dim light at the end of it.\n".each_char(&type_speed)
		
		sleep (1)
		puts "\n"
		
		puts "Should you:"
		puts "[Walk]		Walk to the light. Maybe it's warmer there."
		puts "[Turn]		Turn away from the light and walk in the opposite direction."
		
		quest_rm_ex = gets.chomp.downcase

		case quest_rm_ex
			when "walk"
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"The dim light leads to a grimy kitchen. The light is the kitchen hood shining over the stove top.\n".each_char(&type_speed)
				"You hear footsteps behind you coming from the hallway.\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts "Should you:"
				puts "[Off]		Turn off the light switch. It'll be easier to hide that way."
				puts "[Escape]	Quick run! Avoid the footsteps!"

				quest_rm_ex_wk = gets.chomp.downcase

					case quest_rm_ex_wk
						when "off"
							puts "\n"
							puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
							puts "\n"
							"You switch off the lights. Unfortunately, you can't see where you are now.\n".each_char(&type_speed)
							"Suddenly, you feel a sharp pain at the back of your head, and blood oozing down your neck.\n".each_char(&type_speed)
							"You drop to the ground as everything fades to black...\n".each_char(&type_speed)

							sleep(1)
							puts "\n"

							puts game_over_text	
						when "escape"
							puts "\n"
							puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
							puts "\n"
							"You run to the other side of the kitchen. You were hoping to find an exit, but there is no way out.\n".each_char(&type_speed)
							"You turn and find yourself face to face with a muscular and brute figure whose long hair covers their face.\n".each_char(&type_speed)
							"You try to fight back, but everything fades to black as you are overpowered...\n".each_char(&type_speed)

							sleep(1)
							puts "\n"

							puts game_over_text	
						else
							puts "\n"
							puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
							puts "\n"
							"You hear footsteps behind you. Suddenly, you feel a sharp pain \nat the back of your head, and blood oozing down your neck.\n".each_char(&type_speed)
							"You drop to the ground as everything fades to black...\n".each_char(&type_speed)

							sleep(1)
							puts "\n"

							puts game_over_text	
					end

			when "turn"
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"You walk away from the dim light and turn to go the other direction. \n".each_char(&type_speed)
				"At the end of the hallway you find stairs. \nOnce downstairs, you find a door that leads outside.\n".each_char(&type_speed)
				"The area is secluded. There aren't any other houses close by.\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts "Should you:"
				puts "[Road]		Go to the dirt road."
				puts "[Forest]	Go to the forest."

				quest_rm_ex_tn = gets.chomp.downcase

				case quest_rm_ex_tn
					when "road"
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You run toward the dirt road. You follow it for some time, and end up on a larger country road.\n".each_char(&type_speed)
						"You see two headlights far away in the distance.\nYou run to the center of the street and wave your arms for help.\n".each_char(&type_speed)
						"You hear a roar from the dirt road where you came from. \nYou see the monster making its way toward you.\n".each_char(&type_speed)
						"You start to run toward the two headlights, but the monster is close behind.\n".each_char(&type_speed)
						"The headlights are getting closer, but you're afraid it might be too late.".each_char(&type_speed)
						puts "\n"
						puts "\n"
						"It's right behind you.".each_char(&type_speed)
						puts "\n"
						puts "\n"
						"Just when you think you'll be caught, the car hits it. It's gone. \nThe driver runs to you to see how you are doing.\n".each_char(&type_speed)
						"You both drive away as soon as possible. You don't bother to find out what the hell that monster was.".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_win_text
					when "forest"
						puts "\n"
							puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
							puts "\n"
							"You run toward the line of trees and end up in the forest. \nYou were hoping to find a better place to hide, but instead you are lost.\n".each_char(&type_speed)
							"You turn and find yourself face to face with a muscular and brute figure whose long hair covers their face.\n".each_char(&type_speed)
							"You try to fight back, but everything fades to black as you are overpowered...\n".each_char(&type_speed)

							sleep(1)
							puts "\n"

							puts game_over_text	
					else
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You hear footsteps behind you. Suddenly, you feel a sharp pain \nat the back of your head, and blood oozing down your neck.\n".each_char(&type_speed)
						"You drop to the ground as everything fades to black...\n".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_over_text	
				end		

			else
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"You hear footsteps behind you. Suddenly, you feel a sharp pain \nat the back of your head, and blood oozing down your neck.\n".each_char(&type_speed)
				"You drop to the ground as everything fades to black...\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts game_over_text
		end
	
# Tree name: rm_lk. For easier reading, before you open this, close the other trees.

	when "look"
		puts "\n"
		puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		puts "\n"
		"Where the hell are you? You look out the window and see only a large \nbarren backyard followed by a line of trees and forest.\n".each_char(&type_speed)
		"The trees continue on for miles. \nSuddenly, you hear the door knob rattle and shake.\n".each_char(&type_speed)
		
		sleep (1)
		puts "\n"
		
		puts "Should you:"
		puts "[Hold]		Hold the door knob and block the door with your body."
		puts "[Confront]	You see a bat on the floor. Pick it up and defend yourself."

		quest_rm_lk = gets.chomp.downcase

		case  quest_rm_lk
			when "hold"
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"You hold the door and push your body against it. \nYou don't want anyone entering right now\n".each_char(&type_speed)
				"The person on the other side is banging on the door. \nSuddenly, they hit the door with a crowbar.\n".each_char(&type_speed)
				"They keep on hitting the door without stopping, \nthe hole is almost large enough for them to come inside.\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts "Should you:"
				puts "[Escape]	You see a window across the room. Escape through there."
				puts "[Confront]	You see a bat on the floor. Pick it up and defend yourself."

				quest_rm_lk_hl = gets.chomp.downcase

					case quest_rm_lk_hl
					when "escape"
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You decide to escape by jumping out the window. \nYou realize too late that you are on the third floor of a house. \n".each_char(&type_speed)
						"You meet your end when you hit the ground.\n".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_over_text
					when "confront"
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"The door bursts opens and a figure storming into the room charges at you with a crowbar.\n".each_char(&type_speed)
						"Thankfully you grabbed that bat off the floor. You dodge a few swings and hit him across the head.\n".each_char(&type_speed)
						puts "\n"
						"It's knocked out.\n".each_char(&type_speed)
						puts "\n"
						"You run out of the room as fast as you can.\nYou find a phone in the kitchen and call the police.\n".each_char(&type_speed)
						"You don't wait for them to arrive with that thing in the house.\nYou run to the road outside and wait for them there.\n".each_char(&type_speed)
						"You don't bother to find out what the hell that monster was. You just want to go home as fast as possible.".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_win_text

					else
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"The door bursts opens and a figure storming into the room hits you with the crowbar.\n".each_char(&type_speed)
						"You try to fight back, but everything fades to black as you are overpowered...\n".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_over_text
					end
			when "confront"
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"The door bursts opens and a figure storming into the room charges at you with a crowbar.\n".each_char(&type_speed)
				"Thankfully you grabbed that bat off the floor. You dodge a few swings and hit him across the head.\n".each_char(&type_speed)
				"He falls to the ground. Is he knocked out?\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts "Should you:"
				puts "[Look]		Look more closely at who the hell this. Why were they trying to hit you with a crowbar?"
				puts "[Hit]		Hit them again with the bat for good measure. Make sure this thing doesn't wake up again."

				quest_rm_lk_cn = gets.chomp.downcase
				
				case quest_rm_lk_cn
					when "look"
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You take a closer look at who this is. Why are they trying to hurt you? \n".each_char(&type_speed)
						"You have no time to figure out as they wake up again and bring you down to the ground.\n".each_char(&type_speed)
						"You try to fight back, but everything fades to black as you are overpowered...\n".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_over_text
					when "hit"
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You hit them again across the head. You want to make sure \nthey are really knocked out. You aren't taking any chances.\n".each_char(&type_speed)
						"Suddenly the figure wakes up again, unharmed, and drags you down to the ground.\n".each_char(&type_speed)
						"You try to fight back but everything fades to black as you are overpowered...\n".each_char(&type_speed)
						
						sleep(1)
						puts "\n"

						puts game_over_text
					else
						puts "\n"
						puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
						puts "\n"
						"You were able to beat down this weirdo who tried to hurt you.\nYou walk away from them and exit the room.\n".each_char(&type_speed)
						"You hear footsteps behind you. Suddenly, you feel a sharp pain \nat the back of your head, and blood oozing down your neck.\n".each_char(&type_speed)
						"You drop to the ground as everything fades to black...\n".each_char(&type_speed)

						sleep(1)
						puts "\n"

						puts game_over_text
				end
			else
				puts "\n"
				puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
				puts "\n"
				"The door bursts opens and a figure storming into the room hits you with a crowbar.\n".each_char(&type_speed)
				"You try to fight back, but everything fades to black as you are overpowered...\n".each_char(&type_speed)

				sleep(1)
				puts "\n"

				puts game_over_text
		end	
	
# For those who don't want to follow the rules!

	else
		puts "\n"
		puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
		puts "\n"
		"The door bursts opens and a figure storming into the room hits you with a crowbar.\n".each_char(&type_speed)
		"Everything fades to black as you lay on the bed...\n".each_char(&type_speed)

		sleep (1)

		puts game_over_text
end



