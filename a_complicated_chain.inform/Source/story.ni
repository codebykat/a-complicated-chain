"a complicated chain of dependencies" by kat

Section 1 - In The Apartment

The maximum score is 10.
Victory is a truth state that varies.  Victory is false.

[ living room ]
The living room is a room. "A fairly ordinary room in a fairly ordinary apartment.  Most of the furniture is from IKEA.  The door to the outside is to the south, the kitchen is to the east, and the rest of the apartment is to the north.  A bookshelf fills one corner of the room."

The couch is in the living room.  The couch is a supporter.  The description is "It's from IKEA.  It's a bit worn but looks comfy."

The bookshelves are in the living room.  The bookshelves are scenery.  The description is "The shelves are packed full of books, but you don't have time to read right now."
Understand "shelves" and "books" as the bookshelves.
	
The apartment door is a closed door.  The apartment door is south of the living room.  The apartment door is locked.
Instead of opening the apartment door:
	say "The prospect of leaving the house seems fraught with complexity and hidden dangers."

[cat]
A cat is a kind of animal.

The cardboard box is in the living room.  The cardboard box is a container.  The cardboard box contains a one-eyed cat. The cat has the indefinite article "a".

The one-eyed cat is a cat.  The description is "A well-fed orange tomcat.  Despite his missing eye, he's actually pretty cute.  He's wearing a red collar.[if the one-eyed cat is unfriendly]  He regards you warily."
The one-eyed cat is wearing a red collar.  The description of the red collar is "It says his name is 'Naranjito'."

Understand "orange cat" as the one-eyed cat.
Understand "Naranjito" or "Naran" as the one-eyed cat when the one-eyed cat is proper-named.

The small cat is on the couch.  The small cat is a female cat.  The small cat has the description "A smallish black and brown tabby.  She's wearing a black collar.[if the small cat is unfriendly]  She regards you warily."
The small cat is wearing a black collar.  The description of the black collar is "It says her name is 'Pandora'."

Understand "Pandora" or "Dora" as the small cat when the small cat is proper-named.

Before examining the red collar:
	If the one-eyed cat is unfriendly:
		Say "There's a tag on it, but he hisses at you when you try to get close enough to read it.";
		stop the action.

Before examining the black collar:
	If the small cat is unfriendly:
		Say "There's a tag on it, but she pulls away when you try to get close enough to read it.";
		stop the action.

After examining the red collar:
	Now the printed name of the one-eyed cat is "Naranjito".;
	Now the one-eyed cat is proper-named.;
	Increase the score by 2.

After examining the black collar:
	Now the printed name of the small cat is "Pandora".;
	Now the small cat is proper-named.;
	Increase the score by 2.

A cat can be friendly or unfriendly.  Cats are usually unfriendly.

Understand "pet [something]" as petting.
Petting is an action applying to one touchable thing.

Check petting:
	if the noun is a cat:
		say "[The noun] purrs.";
		Now the noun is friendly;
	else if the noun is an animal:
		say "That probably wouldn't be much fun for either you or [the noun].";
	else:
		say "You run your hands slowly across [the noun]."

Before taking the box:
	if the one-eyed cat is in the box:
		if the one-eyed cat is friendly:
			say "You don't want to disturb [the one-eyed cat].";
		otherwise:
			say "[The one-eyed cat] snarls at you.  Probably better to let him be.";
		stop the action.

Instead of taking a cat:
	if the noun is friendly and the noun is the one-eyed cat:
		say "[The noun] purrs loudly and allows himself to be held.";
		Now the player has the noun;
	else:
		say "[The noun] squirms out of your arms and runs away.";
		Now the noun is in the bedroom.

[ naran moving ]	
Every turn:
	[ only do something 1/5th of the time; cats are lazy ]
	if a random number between 1 and 5 is 1:
		if the one-eyed cat is in the box and the box is in a room:
			if the one-eyed cat is visible, say "[The one-eyed cat] stretches and climbs out of the box.";
			now the one-eyed cat is in the location of the box;
		else if the one-eyed cat is in a room (called the current space):
			if the one-eyed cat can see the cardboard box and the player does not have the box:
				if the one-eyed cat is visible, say "[The one-eyed cat] climbs into the cardboard box.";
				now the one-eyed cat is in the cardboard box;
			else if the one-eyed cat is friendly:
				if the location of the one-eyed cat is the location of the player:
					say "[The one-eyed cat] rubs up against your leg.";
				else: [follow player]
					let the way be the best route from the location of the one-eyed cat to the location of the player;
					try the one-eyed cat going the way;
			otherwise: [just wander around]
				[ do this instead of "move cat to next space" because this way he can't get out through the closed door ]
				[ update -- he can still walk through the door :( ]
				let next space be a random room which is adjacent to the current space;
				let the way be the best route from the location of the one-eyed cat to the next space;
				try the one-eyed cat going the way


[ pandora moving ]
Every turn:
	[ only do something 1/5th of the time; cats are lazy ]
	If the small cat is in a room (called the current space) and a random number between 1 and 5 is 1:
		If the small cat is friendly:
			If the location of the small cat is the location of the player:
				say "[The small cat] rubs up against your leg.";
			else: [follow player]
				let the way be the best route from the location of the small cat to the location of the player;
				try the small cat going the way;
		otherwise if a random number between 1 and 5 is 1: [just wander around]
			let next space be a random room which is adjacent to the current space;
			let the way be the best route from the location of the small cat to the next space;
			try the small cat going the way

[ ants ]
number_ants is a number that varies.  number_ants is 100.

Some ants are in the living room.  The ants are animals.  The description is "[if number_ants < 32000]According to your quick back-of-the-envelope calculation, there are roughly [number_ants] ants here.  They're the small black kind, and would be kind of cute if they weren't currently invading the apartment.[else]There are too many ants to count here.  They're the small black kind, and would be kind of cute if they weren't currently invading the apartment."

Understand "ant" as some ants.

[ move the ants ]
Every turn:
	If some ants are in a room (called the current space) and a random number between 1 and 5 is 1:
		let the next space be a random room which is adjacent to the current space;
		let the way be the best route from the location of some ants to the next space;
		if some ants are visible, say "The ants wander into the [the next space].";
		move some ants to the next space;
		if some ants are visible, say "Some ants wander in from [the current space]."

[ ants will show up if anything edible is left out ]
Every turn:
	If the location of the ants contains an edible thing (called the bait) that is not in the compost bin:
		If some ants are visible, say "The ants are crawling all over [the bait].  The number of ants seems to be increasing rapidly.";
		Increase number_ants by a random number between 1000 and 10000.;
	Else if something edible is in a room:
		If number_ants is 0:
			Let new space be a random room which contains an edible thing that is not in the compost bin;
			If the player is in new space:
				Say "More ants appear from somewhere.";
			If new space is not nothing:  [ could be nothing if the player is carrying them around ]
				Now some ants are in new space;
				Increase number_ants by a random number between 100 and 1000.;
		Else:
			If some ants are visible, say "The number of ants seems to be increasing.";
			Increase number_ants by a random number between 100 and 1000.;

[ adjust for integer overflow ]
Every turn:
	If number_ants < 0, Now number_ants is 32000


[ check for victory -- if we still have no ants after the above has run ]
Every turn:
	if number_ants is 0 and all edible things that are on-stage are in the compost bin:
		if victory is false:
			now victory is true;
			Increase score by 5;  [ no more ants ever ]
			say "You feel smug."
			
Every turn:
	If score is 10 and number_ants is 0, end the story

Instead of attacking some ants:
	say "You kill all the ants.";
	Now number_ants is 0;
	Remove ants from play.;
	
Instead of taking some ants:
	say "You try, but they just crawl all over your fingers."



[ kitchen ]
The kitchen is a room.  "It contains all the usual kitcheny things."  The kitchen is east of the living room.

There is a roll of paper towels in the kitchen.

Understand "towel" as the paper towel.
Understand "towel" as the roll of paper towels when the paper towel is not visible.
Understand "paper towel" as the roll of paper towels when the paper towel is not visible.
There is a paper towel.
There is a dirty paper towel.  The dirty paper towel is edible.

Instead of taking the roll of paper towels:
	if the player has the paper towel:
		say "You already have one.";
	otherwise:
		say "You tear a paper towel from the roll.";
		now the player has the paper towel.

There is a compost bin in the kitchen.  It is a container.  It is openable.  The compost bin is closed.

Before inserting into the closed compost bin:
	say "(first opening the compost bin)[command clarification break]";
	silently try opening the compost bin

[hallway]
The hallway is a room.  The hallway is north of the living room.

There is some cat food in the hallway.  The cat food is edible.  The description of the cat food is "There are globs of cat food on the floor.  It looks like the cats are messy eaters."  The indefinite article of cat food is "some".

Wrapped cat food is an edible thing with printed name "some cat food (wrapped in a paper towel)". 
Instead of eating the wrapped cat food:
	say "Are you really sure you want to eat that?  It's cat food, and besides that, it's been on the floor for hours now. >> ";
	if the player consents:
		say "The cat food is disgusting, but you manage to get it down.  You feel slightly ill.  You are left with a dirty paper towel.";
		remove the wrapped cat food from play;
		Now the player has the dirty paper towel.;
	Otherwise:
		say "There has to be a better way to dispose of the cat food."
		

	
Understand "take [something] with [something]" as taking it with.
Understand "get [something] with [something]" as taking it with.

Taking it with is an action applying to two things.

Check taking it with:
	If the noun is the cat food and the second noun is the paper towel:
		say "You use the paper towel to clean up the spilled food.";
		Remove the paper towel from play;
		Remove the cat food from play;
		Now the player has the wrapped cat food.;
		increase score by 1

Before taking an edible thing:
	if the location of the ants is the location of the player:
		Say "Ew, it's crawling with ants!";
		Stop the action.	

Instead of taking the cat food:
	If the player does not have the paper towel:
		Say "You don't want to pick it up with your bare hands.";
		Stop the action.;
	Else:
		Say "(with the paper towel)[command clarification break]";
		try taking the cat food with the paper towel
				
[study]
The study is a room.  The study is east of the hallway.  "A cramped room that seems to double as a guest room and an office space."

[bathroom]
The bathroom is a room.  "It's small but clean and new-looking."  The bathroom is north of the hallway.
[The bathroom door is an open door.  The bathroom door is south of the bathroom and north of the hallway.] [ using a door here breaks the ability of the ants to move to it :/ ]

There is an overripe banana in the bathroom.  The overripe banana is edible.  The overripe banana has the description "You don't know what this is doing here, but it stinks."

A banana peel is a thing.  A banana peel is edible.
After eating the overripe banana:
	say "The banana is very squishy and has dark spots, but you manage to get it down.  You feel slightly ill.  You are left with the peel.";
	Now the player has a banana peel.
[ we made it edible for the ants, but don't want the player eating it.]
Instead of eating the banana peel:
	say "That's plainly inedible."
Instead of eating the dirty paper towel:
	say "That's plainly inedible."


[bedroom]
The bedroom is a room.  The bedroom is west of the hallway.  "Most of the space is taken up by a large bed."

The bed is in the bedroom.  The bed is a supporter.  The description is "It's from IKEA.  It looks comfy."

[player]
The description of the player is "You look tired.  You're wearing your favorite pajamas."
The player is wearing dinosaur pajamas.
Dinosaur pajamas are a thing.  The description is "It's an adult Kigurumi onesie that looks like a green dinosaur.  It even has a tail."

Instead of taking off the pajamas:
	say "You don't want to take them off.   They're comfortable."


This is the print source rule:
	Say "The source for this game is on Github:[line break]https://www.github.com/codebykat/a-complicated-chain[paragraph break]"

Table of Final Question Options (continued)
final question wording   	only if victorious   	topic   	final response rule   	final response activity   
"check out the SOURCE"   	false   	"source"   	print source rule  	--  
