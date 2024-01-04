require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
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
  alien_green
  alien_gold
  alien_purple_female
  orc
  orc_female
  demon
  bot
  skeleton
  skeleton_female
  pink_female
  pepe
  gold
  orange
  blue
  blue_female
  green
  green_female
  red
  red_female
  purple
  purple_female
  aqua
  
DATA



cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     type = spec[0]
     img = generate( *spec)
     img.save( "./tmp3/#{type}.png" )
     img.zoom(2).save( "./tmp3/@2x/#{type}@2x.png" )
     img.zoom(4).save( "./tmp3/@4x/#{type}@4x.png" )
     img.zoom(10).save( "./tmp3/@10x/#{type}@10x.png" )
     composite << img
end


composite.save( "./tmp2/types.png" )
composite.zoom(4).save( "./tmp2/types@4x.png" )


puts "bye"
