require 'pixelart'


require_relative 'base'


###
# top selling (matt & john's crypo) punks  as of dec/30, 2023
specs = parse_data( <<DATA )
  alien, bandana
  alien, cap forward, pipe, small shades
  alien, headband
  ape, hoodie
  ape, bandana
  ape, cowboy hat
  ape, eye mask, vape, do-rag
  ape, gold chain, knitted cap
  zombie, wild hair, 3d glasses
  ape, knitted cap, small shades
  zombie, chinstrap, earring, crazy hair
  zombie, mohawk thin
DATA


composite  = ImageComposite.new( 4, 3, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/topmini#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/topmini#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp2/topminis.png" )
composite.zoom(4).save( "./tmp2/topminis@4x.png" )


puts "bye"