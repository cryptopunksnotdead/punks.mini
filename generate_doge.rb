require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   doge
   doge (a), top hat
   doge, wild hair (doge)
   doge, regular shades, red mohawk (doge)
   doge, headband
   doge, laser eyes 

   doge dark
   doge dark (a), bandana, gold chain
   doge dark, wild white hair (doge)
   doge dark, big shades, earring (doge)
   doge dark (a), purple hair (doge)
   doge dark, laser eyes gold

   doge zombie
   doge zombie, crazy hair
   doge zombie, 3d glasses
   doge zombie (a), cowboy hat
   doge zombie, laser eyes
   doge zombie, knitted cap, nerd glasses, earring (doge)

   doge alien
   doge alien (a), cap forward, pipe
   doge alien (a), cap
   doge alien, headband
   doge alien, laser eyes blue
   doge alien (a), cap mcd
DATA


cols = 6
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/doge#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/doge#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/doge#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/doges.png" )
composite.zoom(4).save( "./tmp2/doges@4x.png" )
composite.zoom(10).save( "./tmp2/doges@10x.png" )


puts "bye"