require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )

  alien orange
  alien gold
  alien lime
  alien green
  alien
  alien blue
  alien purple
  alien magenta
  alien red 
  
  alien orange female
  alien gold female
  alien lime female
  alien green female
  alien female
  alien blue female
  alien purple female
  alien magenta female
  alien red female
DATA



cols = 9
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     type = spec[0]
     img = generate( *spec)
     img.save( "./tmp4/#{type}.png" )
     img.zoom(2).save( "./tmp4/@2x/#{type}@2x.png" )
     img.zoom(4).save( "./tmp4/@4x/#{type}@4x.png" )
     img.zoom(10).save( "./tmp4/@10x/#{type}@10x.png" )
     composite << img
end


composite.save( "./tmp2/martians.png" )
composite.zoom(4).save( "./tmp2/martians@4x.png" )


puts "bye"



