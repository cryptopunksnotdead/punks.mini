require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   da vinci 
   van gogh
   shakespeare, earring

   da vinci, 3d glasses
   van gogh, 3d glasses
   shakespeare, 3d glasses, earring

   da vinci (a), laser eyes
   van gogh, regular shades
   shakespeare,  regular shades, earring

   da vinci (a), vr
   van gogh, regular shades, sun hat
   shakespeare,  clown eyes green, clown nose, earring

   frida
   frida,  3d glasses
   frida (a),  red mohawk, choker, earcross, green lipstick
   frida (a), hoodie green
   frida (a), hoodie white
   frida (a), hoodie red
DATA


cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/readymade#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/readymade#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/readymade#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/readymades.png" )
composite.zoom(4).save( "./tmp2/readymades@4x.png" )
composite.zoom(10).save( "./tmp2/readymades@10x.png" )


puts "bye"