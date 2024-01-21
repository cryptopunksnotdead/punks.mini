require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   rock gray
   rock gray, peak spike red (rock)
   rock block gray
   rock block gray, 3d glasses (rock)
   rock gray, top hat (rock)
   rock gray, knitted cap (rock), 3d glasses (rock)
   rock gray, peak spike (rock), laser eyes (rock)
   rock gray, laser eyes (rock)
DATA


cols = 4
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/rock#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/rock#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/rock#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/rocks.png" )
composite.zoom(4).save( "./tmp2/rocks@4x.png" )
composite.zoom(10).save( "./tmp2/rocks@10x.png" )


puts "bye"