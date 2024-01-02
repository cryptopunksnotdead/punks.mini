# Punks, The Mini Edition (12×12px)

yes, you can - generate your own punk minis in the 12×12px format


let's try the top selling (matt & john's crypto) punks:


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
     img.zoom(10).save( "./@10x/topmini#{i}@10x.png" )
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




## Questions? Comments?

Join us in the [Punk Art discord (chat server)]( https://discord.gg/FE3HeXNKRa). Yes you can.
Your questions and commetary welcome.


Or post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.

