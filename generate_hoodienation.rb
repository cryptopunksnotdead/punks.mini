require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
 male2, luxurious beard, hoodie
 male2, luxurious beard, hood
 male1, normal beard, hoodie dark
 male1, normal beard, hood dark
 ape, hoodie light, regular shades
 ape, hood light
 female3, hoodie pink, big shades
 female3, hood pink
 female2, hood pharoah
 ape, hood pharoah
 pepe, hoodie ice
 male 3, luxurious beard, hoodie ice, regular shades
DATA


cols = 4
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/hoodie#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/hoodie#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/hoodie#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/hoodienation.png" )
composite.zoom(4).save( "./tmp2/hoodienation@4x.png" )
composite.zoom(10).save( "./tmp2/hoodienation@10x.png" )


puts "bye"