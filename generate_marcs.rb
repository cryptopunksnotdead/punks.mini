require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   marc, luxurious beard, clown nose
   marc xl, cap mcd visor (xl)
   marc xl, bandana (xl), eye patch (xl)
   marc xl, cowboy hat (xl), earring (xl)
DATA


cols = 2
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/marc#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/marc#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/marc#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/marcs.png" )
composite.zoom(4).save( "./tmp2/marcs@4x.png" )
composite.zoom(10).save( "./tmp2/marcs@10x.png" )


puts "bye"