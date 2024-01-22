require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   rock gray
   rock gray, peak spike red
   rock gray, top hat 
   rock gray, knitted cap, 3d glasses 
   rock block gray
   rock block gray, 3d glasses 
 
   rock gray, peak spike, laser eyes 
   rock gray, laser eyes 
   rock gold
   rock gold, peak spike, laser eyes 
   rock block gold
   rock block gold, laser eyes 

   rock pink
   rock pink, peak spike blonde, laser eyes blue 
   rock pepe
   rock pepe, peak spike red 
   rock pepe, top hat 
   rock pepe, cap red 
DATA


cols = 6
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