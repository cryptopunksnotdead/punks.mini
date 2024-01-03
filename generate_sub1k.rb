require 'pixelart'


require_relative 'base'



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