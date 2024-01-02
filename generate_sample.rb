require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 ## archetypes
  male1
  male2
  male3
  male4
  female1
  female2
  female3
  female4
  zombie
  ape
  alien
  orc
  bot
  demon

  male1, top hat
  male2, cap
  male3, cap forward
  male4, cowboy hat
  female1, wild blonde 
  female2, straight hair blonde 
  female3, blonde bob 
  female4, crazy hair 
  zombie, crazy hair 
  ape, knitted cap
  alien, headband
  orc, purple hair 
  bot, crazy hair 
  demon, top hat 

  male1, vr
  male2, 3d glasses
  male3, nerd glasses 
  male4, regular shades
  female1, big shades
  female2, classic shades
  female3, vr
  female4, 3d glasses
  zombie, nerd glasses
  ape, big shades
  alien, classic shades
  orc,   clown nose
  bot,  hoodie
  demon, vr

  male1, hoodie
  male2, bandana
  male3, clown eyes green, clown nose
  male4, earring, mohawk dark
  female1, wild blonde 
  female2, hoodie
  female3, clown eyes green, clown nose
  female4, top hat
  zombie, peak spike 
  ape, purple hair 
  alien, cap forward
  orc, bandana
  bot, cowboy hat
  demon, nerd glasses
DATA



cols = 14
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/mini#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/mini#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/minis.png" )
composite.zoom(4).save( "./tmp2/minis@4x.png" )


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
     img.save( "./tmp/topmini#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/topmini#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/topminis.png" )
composite.zoom(4).save( "./tmp2/topminis@4x.png" )


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
    
    alien green, clown eyes green #84   ## was blue - possible??

    skeleton, clown eyes green   # 86
 
   bot, crazy hair  # 92
   orc, eye mask, goat, gold chain   # 93

   female3, medical mask, cigarette    # 95
DATA

composite  = ImageComposite.new( 5, 5, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/sub1kmini#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/sub1kmini#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/sub1kminis.png" )
composite.zoom(4).save( "./tmp2/sub1kminis@4x.png" )




puts "bye"
