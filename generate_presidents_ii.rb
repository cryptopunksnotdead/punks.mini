require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   joe
   joe (a), cap blue
   joe, clown eyes blue, clown nose 
   joe, 3d glasses
   joe, regular shades
   joe (a), cap blue, regular shades
   joe, laser eyes gold

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


   joe green
   joe green, regular shades
   joe blue   
   joe blue, regular shades
 
   joe (1bit)
   joe (1bit), regular shades blue
   joe (1bit), maxi biz laser eyes blue

   donald green
   donald green, regular shades
   donald red   
   donald red, regular shades

   donald (1bit)
   donald (1bit), regular shades red
   donald (1bit), maxi biz laser eyes red

   nikki green
   nikki green, regular shades
   nikki red   
   nikki red, regular shades

   nikki (1bit)
   nikki (1bit), regular shades red
   nikki (1bit), maxi biz laser eyes red
DATA


cols = 7
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )


## random shuffle specs
# srand( 4242 )   ## make deterministic
# indexes = (0..41).to_a.shuffle
# pp indexes
indexes = [
   3, 5, 11, 7, 27, 39, 32,
  31, 18, 24, 30, 33, 6, 23,
  14, 9, 22, 1, 10, 21, 38,
  28, 26, 37, 15, 25, 36, 12,
  0, 2, 20, 4, 41, 35, 8,
  29, 19, 40, 16, 34, 17, 13]



specs.each_with_index do |spec,i|
     img = generate( *spec)
     
     img.save( "./tmp/presidents/president#{i+1}.png" )
     img.zoom(10).save( "./tmp/presidents/@10x/president#{i+1}@10x.png" )
     img.zoom(20).save( "./tmp/presidents/@20x/president#{i+1}@20x.png" )
     composite << img
end


composite.save( "./tmp/presidents/presidents.png" )
composite.zoom(4).save( "./tmp/presidents/presidents@4x.png" )
composite.zoom(10).save( "./tmp/presidents/presidents@10x.png" )


puts "bye"