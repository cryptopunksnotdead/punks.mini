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



###
# ordinal (sub1k) punks   vol. 2
specs = parse_data( <<DATA )
    ape gold, laser eyes  #0
    female 1, flowers, gold chain   #3
 
    ape blue, buck teeth, cowboy hat  #5
 
    vampire, demon horns   #8
 
    ape zombie, bubble gum  #20
 
    male 2, sombrero, mustache   #25

    vampire, bubble gum, spots, do rag  #26
 
    mummy, beanie   #27

    male 2, jester hat  #30
    male 1, cap red    #31

    male 1, buck teeth, 3D glasses, cigarette  #37
 
    mummy, crown    #41
 
    demon female, cigar, choker  #42
    female 4, frumpy hair, nerd glasses   #43
    ape alien, goat, fedora  #50

    demon female, frumpy hair, clown nose  #53
    male 3, heart shades, do rag  #54
 

    vampire female, heart shades  #58

    ape female, sombrero #66


    mummy, dark hair  #72
    orc       #80
    vampire female, dark hair   #81

    mummy, cowboy hat, eye mask (a)  # 82
 
    vampire, demon horns, chinstrap  #90

    ape alien, eye patch, frumpy hair  #94

DATA

composite  = ImageComposite.new( 5, 5,    
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/sub1kmini#{i}_vol2.png" )
     img.zoom(10).save( "./tmp/@10x/sub1kmini#{i}_vol2@10x.png" )
     composite << img
end


composite.save( "./tmp2/sub1kminis_vol2.png" )
composite.zoom(4).save( "./tmp2/sub1kminis_vol2@4x.png" )
composite.zoom(10).save( "./tmp2/sub1kminis_vol2@10x.png" )



###
# ordinal (sub1k) punks   vol. 3
specs = parse_data( <<DATA )

male 2, birthday hat, bubble gum   #2
male 1, cap burger king    #7
 

female 4, pilot helmet, silver chain, clown eyes green  #13
female1, bow  #19
 
zombie female, birthday hat, vr #39

blue, cap burger king, classic shades  #46
 
female 3, do rag, gold chain   #87
DATA

composite  = ImageComposite.new( 5, 5,    
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/sub1kmini#{i}_vol3.png" )
     img.zoom(10).save( "./tmp/@10x/sub1kmini#{i}_vol3@10x.png" )
     composite << img
end


composite.save( "./tmp2/sub1kminis_vol3.png" )
composite.zoom(4).save( "./tmp2/sub1kminis_vol3@4x.png" )
composite.zoom(10).save( "./tmp2/sub1kminis_vol3@10x.png" )



puts "bye"


puts "bye"