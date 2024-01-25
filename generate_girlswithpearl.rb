require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   girl with pearl
   girl with pearl, vr pro   
   girl with pearl, laser eyes
   girl with pearl, 3d glasses
   girl with pearl, regular shades
   girl with pearl, clown nose  
DATA


cols = 3
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/girlwithpearl#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/girlwithpearl#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/girlwithpearl#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/girlswithpearl.png" )
composite.zoom(4).save( "./tmp2/girlswithpearl@4x.png" )
composite.zoom(10).save( "./tmp2/girlswithpearl@10x.png" )


puts "bye"