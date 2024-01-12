require 'pixelart'


require_relative 'base'



###
# orange punks  
specs = parse_data( <<DATA )
   # archetypes
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
     img.save( "./tmp/orange#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/orange#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/oranges.png" )
composite.zoom(4).save( "./tmp2/oranges@4x.png" )
composite.zoom(10).save( "./tmp2/oranges@10x.png" )



puts "bye"