require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   monke light
   monke orange
   monke pink
   monke orc
   monke alien

   monke light, clown eyes green (monke), clown nose (monke), mohawk (monke)
   monke orange, peak spike (monke)
   monke pink, mohawk blonde (monke)
   monke orc, mohawk red (monke)
   monke alien, mohawk purple (monke)
 
   monke light, polarized shades (monke), peak spike (monke)
   monke orange, peak spike (monke), 3d glasses (monke)
   monke pink, mohawk2 blonde (monke), 3d glasses (monke)
   monke orc, cap red (monke)
   monke alien, mohawk2 purple (monke), vr pro (monke)
DATA


cols = 5
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/monke#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/monke#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/monke#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/monkes.png" )
composite.zoom(4).save( "./tmp2/monkes@4x.png" )
composite.zoom(10).save( "./tmp2/monkes@10x.png" )


puts "bye"