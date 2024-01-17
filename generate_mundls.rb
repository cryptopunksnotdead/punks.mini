require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   mundl
   mundl, sun hat (a)
   mundl, cigarette
   mundl, 3d glasses
DATA


cols = 2
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/mundl#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/mundl#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/mundl#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/mundls.png" )
composite.zoom(4).save( "./tmp2/mundls@4x.png" )
composite.zoom(10).save( "./tmp2/mundls@10x.png" )


puts "bye"