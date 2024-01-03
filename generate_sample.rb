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


puts "bye"
