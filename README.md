# Punks, The Mini Edition (12×12px)


## What's News? Updates

**NEW!**   Free self-inscribe first-is-first mint (via [bitcoin ordinal inscriptions](https://ordinals.com)) of Punks 12px (10000 max.) started. See [**orc721.github.io/punks12px »**](https://orc721.github.io/punks12px) 


**NEW!**  Free self-inscribe first-is-first mint (via [ethscriptions on ethereum](https://ethscriptions.com) of Punks 12px, The Ethscribe Edition  Vol. 1 - Classic (10000 max.) &
Vol. 2 - Alien Invasion, The Martians (1000 max.)
 See [**0xcompute.github.io/punks12px.vol2 »**](https://0xcompute.github.io/punks12px.vol2) 


**NEW!** D.I.Y. (Create & Download) Punks 12px Builder by [@0xAvocato (SkullCat)](https://twitter.com/0xAvocato/status/1744719873526439992)  Thanks!  See [**illegalmemes.wtf/12pxpunks »**](https://illegalmemes.wtf/12pxpunks)



## Intro

yes, you can - generate your own punk minis in the 12×12px format


[Top](#top) • 
[Ordinal Punks](#ordinal-punks) •
[Orange-Pilled](#orange-pilled) •
[Readymades - The Presidents (of The United States of Amercia)](#readymades---the-presidents-of-the-united-states-of-amercia) •
[Punk Rocks](#punk-rocks)



### Top

let's try the top selling (matt & john's crypto) punks (anno 2017):


``` ruby
require 'pixelart'

require_relative 'base'   ## pull in (local) attributes and generator 

###
# top selling (matt & john's crypo) punks  as of dec/30, 2023
specs = parse_data( <<DATA )
  alien, bandana
  alien, cap forward, pipe, small shades
  alien, headband
  ape, hoodie
  ape, bandana
  ape, cowboy hat
  ape, eye mask, vape, do-rag
  ape, gold chain, knitted cap
  zombie, wild hair, 3d glasses
  ape, knitted cap, small shades
  zombie, chinstrap, earring, crazy hair
  zombie, mohawk thin
DATA

composite  = ImageComposite.new( 4, 3, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./topmini#{i}.png" )
     img.zoom(10).save( "./topmini#{i}@10x.png" )
     composite << img
end


composite.save( "./topminis.png" )
composite.zoom(4).save( "./topminis@4x.png" )
```

resulting in:

![](i/topmini0.png)
![](i/topmini1.png)
![](i/topmini2.png)
![](i/topmini3.png)
![](i/topmini4.png)
![](i/topmini5.png)
![](i/topmini6.png)
![](i/topmini7.png)
![](i/topmini8.png)
![](i/topmini9.png)
![](i/topmini10.png)
![](i/topmini11.png)

in 10x

![](i/topmini0@10x.png)
![](i/topmini1@10x.png)
![](i/topmini2@10x.png)
![](i/topmini3@10x.png)
![](i/topmini4@10x.png)
![](i/topmini5@10x.png)
![](i/topmini6@10x.png)
![](i/topmini7@10x.png)
![](i/topmini8@10x.png)
![](i/topmini9@10x.png)
![](i/topmini10@10x.png)
![](i/topmini11@10x.png)



and the fam (all-in-one image composite)

![](i/topminis.png)

in 4x

![](i/topminis@4x.png)



### Ordinal Punks

let's try twenty five (sub1k, 100 max.) ordinal punks (anno 2023):

``` ruby
require 'pixelart'

require_relative 'base'   ## pull in (local) attributes and generator 

###
# ordinal (sub1k) punks  
specs = parse_data( <<DATA )
   bot, big beard   #1
   demon, hoodie, pipe  #4
   female3, mole, choker, wild white hair,  big shades, cigarette   #10 
   zombie, mole, 3d glasses, big beard, earring #11  
   orc, beanie, vr, clown nose   # 12
   demon, cigarette, laser eyes  # 17
   alien gold, top hat, silver chain # 21
   blue, clown hair blue  # 22 
   skeleton, eye patch, fedora  #35
   orc female, blonde bob   # 38
   male2, bandana, laser eyes  # 40
   gold, cap forward, laser eyes  #48
   blue female, nerd glasses, blonde short  # 51
   skeleton female, bandana, cigarette #55
   orc female, mole, frumpy hair, green eye shadow  #64
   bot, 3d glasses #69
   alien purple female, pipe, knitted cap  #73
   demon, big beard  #75
   bot, classic shades, cigarette  #76
   zombie, pipe, hoodie, pipe  #78 
   alien green, clown eyes green #84 
   skeleton, clown eyes green   # 86
   bot, crazy hair  # 92
   orc, eye mask, goat, gold chain   # 93
   female3, medical mask, cigarette    # 95
DATA

composite  = ImageComposite.new( 5, 5, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./sub1kmini#{i}.png" )
     img.zoom(10).save( "./sub1kmini#{i}@10x.png" )
     composite << img
end


composite.save( "./sub1kminis.png" )
composite.zoom(4).save( "./sub1kminis@4x.png" )
```


resulting in:

![](i/sub1kmini0.png)
![](i/sub1kmini1.png)
![](i/sub1kmini2.png)
![](i/sub1kmini3.png)
![](i/sub1kmini4.png)
![](i/sub1kmini5.png)
![](i/sub1kmini6.png)
![](i/sub1kmini7.png)
![](i/sub1kmini8.png)
![](i/sub1kmini9.png)
![](i/sub1kmini10.png)
![](i/sub1kmini11.png)
![](i/sub1kmini12.png)
![](i/sub1kmini13.png)
![](i/sub1kmini14.png)
![](i/sub1kmini15.png)
![](i/sub1kmini16.png)
![](i/sub1kmini17.png)
![](i/sub1kmini18.png)
![](i/sub1kmini19.png)
![](i/sub1kmini20.png)
![](i/sub1kmini21.png)
![](i/sub1kmini22.png)
![](i/sub1kmini23.png)
![](i/sub1kmini24.png)


in 10x

![](i/sub1kmini0@10x.png)
![](i/sub1kmini1@10x.png)
![](i/sub1kmini2@10x.png)
![](i/sub1kmini3@10x.png)
![](i/sub1kmini4@10x.png)
![](i/sub1kmini5@10x.png)
![](i/sub1kmini6@10x.png)
![](i/sub1kmini7@10x.png)
![](i/sub1kmini8@10x.png)
![](i/sub1kmini9@10x.png)
![](i/sub1kmini10@10x.png)
![](i/sub1kmini11@10x.png)
![](i/sub1kmini12@10x.png)
![](i/sub1kmini13@10x.png)
![](i/sub1kmini14@10x.png)
![](i/sub1kmini15@10x.png)
![](i/sub1kmini16@10x.png)
![](i/sub1kmini17@10x.png)
![](i/sub1kmini18@10x.png)
![](i/sub1kmini19@10x.png)
![](i/sub1kmini20@10x.png)
![](i/sub1kmini21@10x.png)
![](i/sub1kmini22@10x.png)
![](i/sub1kmini23@10x.png)
![](i/sub1kmini24@10x.png)


and the fam (all-in-one image composite)

![](i/sub1kminis.png)

in 4x

![](i/sub1kminis@4x.png)



### Orange-Pilled

Is orange the new black? let's try all (bitcoin) orange punks:

``` ruby
require 'pixelart'

require_relative 'base'

###
# orange punks  
specs = parse_data( <<DATA )
   orange
   zombie orange
   ape orange
   alien orange
   demon orange
   orc orange
   skeleton orange
   vampire orange
   mummy orange
   bot orange

   orange,  3d glasses, cap red
   zombie orange, crazy hair
   ape orange, knitted cap, earring, bubble gum
   alien orange, spots, clown nose, clown hair blue
   demon orange, laser eyes, pipe
   orc orange,  eye mask, goat, gold chain 
   skeleton orange, bandana, cigarette
   vampire orange,  purple hair, classic shades
   mummy orange, hoodie
   bot orange, big beard
DATA

composite  = ImageComposite.new( 10, 2, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./orange#{i}.png" )
     img.zoom(10).save( "./orange#{i}@10x.png" )
     composite << img
end


composite.save( "./oranges.png" )
composite.zoom(4).save( "./oranges@4x.png" )
```


resulting in:

![](i/orange0.png)
![](i/orange1.png)
![](i/orange2.png)
![](i/orange3.png)
![](i/orange4.png)
![](i/orange5.png)
![](i/orange6.png)
![](i/orange7.png)
![](i/orange8.png)
![](i/orange9.png)
![](i/orange10.png)
![](i/orange11.png)
![](i/orange12.png)
![](i/orange13.png)
![](i/orange14.png)
![](i/orange15.png)
![](i/orange16.png)
![](i/orange17.png)
![](i/orange18.png)
![](i/orange19.png)
![](i/orange20.png)


in 10x

![](i/orange0@10x.png)
![](i/orange1@10x.png)
![](i/orange2@10x.png)
![](i/orange3@10x.png)
![](i/orange4@10x.png)
![](i/orange5@10x.png)
![](i/orange6@10x.png)
![](i/orange7@10x.png)
![](i/orange8@10x.png)
![](i/orange9@10x.png)
![](i/orange10@10x.png)
![](i/orange11@10x.png)
![](i/orange12@10x.png)
![](i/orange13@10x.png)
![](i/orange14@10x.png)
![](i/orange15@10x.png)
![](i/orange16@10x.png)
![](i/orange17@10x.png)
![](i/orange18@10x.png)
![](i/orange19@10x.png)
![](i/orange20@10x.png)


and the fam (all-in-one image composite)

![](i/oranges.png)

in 4x

![](i/oranges@4x.png)




### Readymades - The Presidents (of The United States of Amercia)

Let's try readymade characters. Let's start with the presidents (and presidents to be):

``` ruby
require 'pixelart'

require_relative 'base'

###
# the presidents
specs = parse_data( <<DATA )
   joe
   joe (a), cap blue
   joe, clown eyes blue, clown nose 
   joe, 3d glasses
   joe, regular shades
   joe (a), cap blue, regular shades
   joe, laser eyes

   donald
   donald (a), cap red
   donald (a), cap mcd
   donald, clown eyes green, clown nose
   donald, 3d glasses
   donald, laser eyes
   donald, regular shades
 
   nikki
   nikki (a)
   nikki, big shades, earring
   nikki, 3d glasses
   nikki, laser eyes, gold chain
   nikki (a), vr
   nikki (b), hoodie red
DATA

composite  = ImageComposite.new( 7, 3, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./president#{i}.png" )
     img.zoom(10).save( "./president#{i}@10x.png" )
     composite << img
end


composite.save( "./presidents.png" )
composite.zoom(4).save( "./presidents@4x.png" )
```

resulting in:

![](i/president0.png)
![](i/president1.png)
![](i/president2.png)
![](i/president3.png)
![](i/president4.png)
![](i/president5.png)
![](i/president6.png)
![](i/president7.png)
![](i/president8.png)
![](i/president9.png)
![](i/president10.png)
![](i/president11.png)
![](i/president12.png)
![](i/president13.png)
![](i/president14.png)
![](i/president15.png)
![](i/president16.png)
![](i/president17.png)
![](i/president18.png)
![](i/president19.png)
![](i/president20.png)


in 10x

![](i/president0@10x.png)
![](i/president1@10x.png)
![](i/president2@10x.png)
![](i/president3@10x.png)
![](i/president4@10x.png)
![](i/president5@10x.png)
![](i/president6@10x.png)
![](i/president7@10x.png)
![](i/president8@10x.png)
![](i/president9@10x.png)
![](i/president10@10x.png)
![](i/president11@10x.png)
![](i/president12@10x.png)
![](i/president13@10x.png)
![](i/president14@10x.png)
![](i/president15@10x.png)
![](i/president16@10x.png)
![](i/president17@10x.png)
![](i/president18@10x.png)
![](i/president19@10x.png)
![](i/president20@10x.png)


and the fam (all-in-one image composite)

![](i/presidents.png)

in 4x

![](i/presidents@4x.png)




### Punk Rocks

Let's rock the punks:

```ruby
require 'pixelart'

require_relative 'base'

###
# punk rocks
specs = parse_data( <<DATA )
   rock gray
   rock gray, peak spike red
   rock gray, top hat 
   rock gray, knitted cap, 3d glasses 
   rock block gray
   rock block gray, 3d glasses 
 
   rock gray, peak spike, laser eyes 
   rock gray, laser eyes 
   rock gold
   rock gold, peak spike, laser eyes 
   rock block gold
   rock block gold, laser eyes 

   rock pink
   rock pink, peak spike blonde, laser eyes blue 
   rock pepe
   rock pepe, peak spike red 
   rock pepe, top hat 
   rock pepe, cap red 
DATA


composite  = ImageComposite.new( 6, 3, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./rock#{i}.png" )
     img.zoom(10).save( "./rock#{i}@10x.png" )
     composite << img
end

composite.save( "./rocks.png" )
composite.zoom(4).save( "./rocks@4x.png" )
```

resulting in:

![](i/rock0.png)
![](i/rock1.png)
![](i/rock2.png)
![](i/rock3.png)
![](i/rock4.png)
![](i/rock5.png)
![](i/rock6.png)
![](i/rock7.png)
![](i/rock8.png)
![](i/rock9.png)
![](i/rock10.png)
![](i/rock11.png)
![](i/rock12.png)
![](i/rock13.png)
![](i/rock14.png)
![](i/rock15.png)
![](i/rock16.png)
![](i/rock17.png)


in 10x

![](i/rock0@10x.png)
![](i/rock1@10x.png)
![](i/rock2@10x.png)
![](i/rock3@10x.png)
![](i/rock4@10x.png)
![](i/rock5@10x.png)
![](i/rock6@10x.png)
![](i/rock7@10x.png)
![](i/rock8@10x.png)
![](i/rock9@10x.png)
![](i/rock10@10x.png)
![](i/rock11@10x.png)
![](i/rock12@10x.png)
![](i/rock13@10x.png)
![](i/rock14@10x.png)
![](i/rock15@10x.png)
![](i/rock16@10x.png)
![](i/rock17@10x.png)


and the fam (all-in-one image composite)

![](i/rocks.png)

in 4x

![](i/rocks@4x.png)






## Bonus -  Factory of Modern Originals (FoMO)

Do-it-yourself (DIY) - yes, you can! - fab(criate) your own unique punks in 
12×12px  w/ text attributes (via built-in spritesheets) incl. 2x/4x/8x zoom for bigger sizes and more.


Let's try to fab(ricate) a pink marilyn:

```
$ fab punk12 pink_female blonde_bob mole --zoom=10
```

resulting in:

![](i/punk12_pink_female@10x.png)

or an ultra-rare (green martian) alien with hoodie:

```
$ fab punk12 alien_green hoodie --zoom=10
```

resulting in:

![](i/punk12_alien_green@10x.png)



More [**Factory of Modern Originals (FoMO) »**](https://github.com/profilepic/originals)






## Questions? Comments?

Join us in the [Punk Art discord (chat server)]( https://discord.gg/FE3HeXNKRa). Yes you can.
Your questions and commetary welcome.


Or post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.

