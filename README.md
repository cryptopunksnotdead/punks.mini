# Punks, The Mini Edition (12×12px)


## What's News? Updates

**NEW!**   Free self-inscribe first-is-first mint (via [bitcoin ordinal inscriptions](https://ordinals.com)) of Punks 12px (10000 max.) started. See [**orc721.github.io/punks12px »**](https://orc721.github.io/punks12px) 


**NEW!**  Free self-inscribe first-is-first mint (via [ethscriptions on ethereum](https://ethscriptions.com) of Punks 12px, The Ethscribe Edition  Vol. 1 - Classic (10000 max.) &
Vol. 2 - Alien Invasion, The Martians (1000 max.)
 See [**0xcompute.github.io/punks12px.vol2 »**](https://0xcompute.github.io/punks12px.vol2) 


**NEW!** D.I.Y. (Create & Download) Punks 12px Builder by [@0xAvocato (SkullCat)](https://twitter.com/0xAvocato/status/1744719873526439992)  Thanks!  See [**illegalmemes.wtf/12pxpunks »**](https://illegalmemes.wtf/12pxpunks)



## Intro

yes, you can - generate your own punk minis in the 12×12px format


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




## Questions? Comments?

Join us in the [Punk Art discord (chat server)]( https://discord.gg/FE3HeXNKRa). Yes you can.
Your questions and commetary welcome.


Or post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.

