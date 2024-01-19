require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   joe
   joe (a), cap blue
   joe, clown eyes blue, clown nose 
   joe, 3d glasses
   joe, regular shades
   joe (a), cap blue, regular shades
   joe, laser eyes

   donald
   donald (a), cap red
   donald (a), cap mcd
   donald, clown eyes green, clown nose
   donald, 3d glasses
   donald, laser eyes
   donald, regular shades
 
   nikki
   nikki (a)
   nikki, big shades, earring
   nikki, 3d glasses
   nikki, laser eyes, gold chain
   nikki (a), vr
   nikki (b), hoodie red
DATA


cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/president#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/president#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/president#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/presidents.png" )
composite.zoom(4).save( "./tmp2/presidents@4x.png" )
composite.zoom(10).save( "./tmp2/presidents@10x.png" )


puts "bye"