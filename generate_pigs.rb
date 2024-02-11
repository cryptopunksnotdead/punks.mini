require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   pig
   pig, bandana, gold chain 
   pig, 3d glasses

   pig, regular shades, red mohawk (pig) 
   pig, headband
   pig, laser eyes
 
   pig, cap forward, pipe
   pig, vr pro
   pig, clown eyes green, cap mcd
DATA


specs = parse_data( <<DATA )
   pig (a)
   pig (a), regular shades, red mohawk (pig) 
   pig (a), 3d glasses

   pig (aa), cap 
   pig (aa), cap forward, pipe
   pig (a), laser eyes gold
 
   pig (a), vr pro
   pig (a), clown eyes green
   pig (aa), cap mcd

   pig (aaa), hoodie (pig)
   pig (aaa), hoodie dark (pig)
   pig (aaa), hoodie light (pig)

   pig (aaa), hood (pig)
   pig (aaa), hood dark (pig)
  
   pig (aaa), clown eyes green, hoodie (pig)
   pig (aaa), clown eyes green, hoodie dark (pig)
   pig (aaa), hoodie dark (pig), laser eyes gold
   pig (aaa), hoodie dark (pig), vr pro


   pig (a), blonde bob (pig)
   pig (a), blonde bob (pig), big shades
   pig (a), blonde bob (pig), laser eyes blue
   pig (a), blonde bob (pig), mole, gold chain
   pig (a), blonde bob (pig), mole, blue eye shadow, gold chain
   

   pig (a), crazy hair (pig) 
   pig (a), crazy hair (pig), nerd glasses

   pig (a), wild blonde (pig)
   pig (a), wild blonde (pig), classic shades
   pig (a), blonde side (pig)
   pig (a), blonde side (pig), flowers
   pig (a), orange side (pig)
   pig (a), orange side (pig), choker, purple eye shadow

   pig (a), heart shades, red mohawk (pig) 
  
   pig (aa), cap mcd white
   pig (aa), cap mcd flipped
   pig (aa), cap mcd black
   pig (aa), cap subway, horned rim glasses
   pig (aa), cap burger king, regular shades
  
   pig (aa), bandana, eye patch

   pig (aa), brown_shemagh_agal (pig)
   pig (aa), red_shemagh_agal (pig)
   pig (aa), red_shemagh (pig), regular shades
   pig (aa), white_shemagh_gold_agal (pig), laser eyes gold

   pig gold (a), regular shades, red mohawk (pig) 
   pig green (a), 3d glasses

   pig alien (aa), cap 
   pig alien (aa), cap forward, pipe
   pig green (a), laser eyes gold
 
   pig blue (a), vr pro
   pig green (a), clown eyes green
   pig green (aa), cap mcd

   pig alien (aaa), hoodie (pig)
   pig orc (aaa), hoodie light (pig)
   pig pink (aaa), hoodie dark (pig)

   pig alien (aaa), hood (pig)
   pig gold (aaa), hood dark (pig)
  
   pig green (aaa), clown eyes green, hoodie (pig)
   pig gold (aaa), hoodie light (pig), laser eyes gold
   pig alien red (a), vr pro
   pig pink (aaa), hoodie dark (pig), vr pro

   pig pink (a), blonde bob (pig)
   pig pink (a), blonde bob (pig), big shades
   pig pink (a), blonde bob (pig), laser eyes blue
   pig pink (a), blonde bob (pig), mole, gold chain
   pig green (a), blonde bob (pig), mole, blue eye shadow, gold chain
   

   pig gold (a), crazy hair (pig) 
   pig green (a), crazy hair (pig), nerd glasses

   pig green (a), wild blonde (pig)
   pig gold (a), wild blonde (pig), classic shades
   pig alien red (a), blonde side (pig)
   pig pink (a), blonde side (pig), flowers
   pig blue (a), orange side (pig)
   pig blue (a), orange side (pig), choker, purple eye shadow

   pig green (a), heart shades, red mohawk (pig) 
  
   pig orc (aa), cap mcd white
   pig alien (aa), cap mcd flipped
   pig gold (aa), cap mcd black
   pig green (aa), cap subway, horned rim glasses
   pig blue (aa), cap burger king, regular shades
  
   pig orc (a), vr pro, gold chain
   pig orc (aa), bandana, eye patch

   pig alien red (aa), brown_shemagh_agal (pig)
   pig blue (aa), red_shemagh_agal (pig)
   pig green (aa), red_shemagh (pig), regular shades
   pig gold (aa), white_shemagh_gold_agal (pig), laser eyes gold
DATA



cols = 14
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0


composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     
     img.save( "./tmp/pork#{i}.png" )
     img.zoom(10).save( "./tmp/@10x/pork#{i}@10x.png" )
     img.zoom(20).save( "./tmp/@20x/pork#{i}@20x.png" )
     composite << img
end


composite.save( "./tmp2/pork.png" )
composite.zoom(4).save( "./tmp2/pork@4x.png" )
composite.zoom(10).save( "./tmp2/pork@10x.png" )


puts "bye"