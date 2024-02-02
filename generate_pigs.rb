require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   pig
   pig, bandana, gold chain 
   pig, 3d glasses

   pig, regular shades, red mohawk (pig) 
   pig, headband
   pig, laser eyes
 
   pig, cap forward, pipe
   pig, vr pro
   pig, clown eyes green, cap mcd
DATA


cols = 3
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/pig#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/pig#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/pig#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/pigs.png" )
composite.zoom(4).save( "./tmp2/pigs@4x.png" )
composite.zoom(10).save( "./tmp2/pigs@10x.png" )


puts "bye"