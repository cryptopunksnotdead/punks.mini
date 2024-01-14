require 'pixelart'


require_relative 'base'


###
# the saudis - MAX BIDDING!
specs = parse_data( <<DATA )
  male2, normal beard black,  white shemagh & agal,  laser eyes gold
  male1, shadow beard, white shemagh
  male3, mustache, red shemagh & agal,earring  
  male2, luxurious white beard,  brown shemagh & agal 

  male1, white shemagh & gold agal, big shades 
  male3, spots, red shemagh, gold chain, pipe
  male1, white shemagh, goat, laser eyes gold
  male2, white shemagh & agal, clown eyes green, clown nose

  male1, chinstrap, red shemagh & agal, horned_rim_glasses  
  male3, normal beard black, brown shemagh & agal, small shades 
  male2, shadow beard, red shemagh, nerd_glasses, bubble gum
  orange, white shemagh & gold agal,  laser eyes
DATA



composite  = ImageComposite.new( 4, 3, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     frame = Image.new( 12, 12, '#006C35' )
     frame.compose!( generate( *spec))
     
     frame.save( "./tmp/saudi#{i}.png" )
     frame.zoom(10).save( "./tmp/@10x/saudi#{i}@10x.png" )
     frame.zoom(20).save( "./tmp/@20x/saudi#{i}@20x.png" )
     composite << frame
end


composite.save( "./tmp2/saudis.png" )
composite.zoom(4).save( "./tmp2/saudis@4x.png" )
composite.zoom(10).save( "./tmp2/saudis@10x.png" )


puts "bye"