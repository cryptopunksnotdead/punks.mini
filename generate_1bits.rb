require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   joe (1bit)
   joe (1bit), regular shades blue
   joe (1bit), maxi biz laser eyes blue
   donald (1bit)
   donald (1bit), regular shades red
   donald (1bit), maxi biz laser eyes red
   nikki (1bit)
   nikki (1bit), regular shades red
   nikki (1bit), maxi biz laser eyes red

   pig (1bit), regular shades red
   pig (1bit), regular shades green
   pig (1bit), regular shades blue
   pig (1bit)

   ape (1bit), regular shades red
   ape (1bit), regular shades green
   ape (1bit), regular shades blue
   ape (1bit), cap (1bit), regular shades red
   ape (1bit), cap (1bit), regular shades green
   ape (1bit), cap (1bit), regular shades blue
   ape (1bit), cap (1bit), maxi biz laser eyes red
   ape (1bit), cap (1bit), maxi biz laser eyes green
   ape (1bit), cap (1bit), maxi biz laser eyes blue
   bitmap (1bit), maxi biz laser eyes red
   bitmap (1bit), maxi biz laser eyes green
   bitmap (1bit), maxi biz laser eyes blue
   ape (1bit)
   bitmap (1bit)
DATA


cols = 3
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/1bit#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/1bit#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/1bit#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/1bits.png" )
composite.zoom(4).save( "./tmp2/1bits@4x.png" )
composite.zoom(10).save( "./tmp2/1bits@10x.png" )


puts "bye"