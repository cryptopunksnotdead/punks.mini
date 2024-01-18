require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   bitmap orange
   bitmap orange,  red mohawk (bmp)
   bitmap orange,  peak spike, regular shades
   bitmap orange,  3d glasses
   bitmap orange,  laser eyes
   bitmap orange,  crazy hair, nerd glasses
   bitmap orange,  clown eyes green, clown nose
   bitmap orange,  jester hat, clown nose
   bitmap orange,  cap forward, pipe (bmp)
   bitmap orange,  cap mcd
   bitmap orange,  bandana, regular shades
   bitmap orange,  purple hair (bmp), classic shades, earring

   bitmap pink   
   bitmap pink, blonde bob (bmp)
   bitmap pink, blonde bob (bmp), 3d glasses   
   bitmap pink, 3d glasses   
   bitmap pink, laser eyes    
   bitmap pink, blonde side, big shades, gold chain, earring   
   bitmap pink, blonde short, nerd glasses   
   bitmap pink, half shaved blonde (bmp)   
   bitmap pink, choker, red mohawk (bmp), heart shades  
   bitmap pink, pig tails blonde, classic shades   
   bitmap pink, wild blonde (bmp), mole
   bitmap pink, tassle hat, clown eyes blue, clown nose   
DATA


cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/bitmap#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/bitmap#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/bitmap#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/bitmaps.png" )
composite.zoom(4).save( "./tmp2/bitmaps@4x.png" )
composite.zoom(10).save( "./tmp2/bitmaps@10x.png" )


puts "bye"