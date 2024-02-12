require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   pork
   pork, bandana, gold chain 
   pork, 3d glasses

   pork, regular shades, red mohawk (pork) 
   pork, headband
   pork, laser eyes
 
   pork, cap forward, pipe
   pork, vr pro
   pork, clown eyes green, cap mcd

   ## add more types
   pork orange, red mohawk (pork), choker
   pork orange, vr pro
   pork orange, laser eyes

   pork alien, cap forward, pipe
   pork alien, bandana
   pork alien, headband

   pork pink, mole, gold chain
   pork pink, vr pro
   pork pink (aaa), hoodie dark (pork)
 
   pork gold, cap mcd
   pork gold (aaa), hood dark (pork)
   pork gold, laser eyes

   pork orc,  vr pro
   pork orc (aaa), hoodie light (pork)

   pork blue, regular shades, cap burger king
   pork blue, knitted cap, gold chain

   pork alien red, bandana
   pork alien red (aaa), hoodie (pork)
DATA



cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/morepork#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/morepork#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/morepork#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/morepork.png" )
composite.zoom(4).save( "./tmp2/morepork@4x.png" )
composite.zoom(10).save( "./tmp2/morepork@10x.png" )


puts "bye"