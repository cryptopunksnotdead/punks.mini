require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
   pork (a)
   pork (a), regular shades, red mohawk (pork) 
   pork (a), 3d glasses

   pork (aa), cap 
   pork (aa), cap forward, pipe
   pork (a), laser eyes gold
 
   pork (a), vr pro
   pork (a), clown eyes green
   pork (aa), cap mcd

   pork (aaa), hoodie (pork)
   pork (aaa), hoodie dark (pork)
   pork (aaa), hoodie light (pork)

   pork (aaa), hood (pork)
   pork (aaa), hood dark (pork)
  
   pork (aaa), clown eyes green, hoodie (pork)
   pork (aaa), clown eyes green, hoodie dark (pork)
   pork (aaa), hoodie dark (pork), laser eyes gold
   pork (aaa), hoodie dark (pork), vr pro


   pork (a), blonde bob (pork)
   pork (a), blonde bob (pork), big shades
   pork (a), blonde bob (pork), laser eyes blue
   pork (a), blonde bob (pork), mole, gold chain
   pork (a), blonde bob (pork), mole, blue eye shadow, gold chain
   

   pork (a), crazy hair (pork) 
   pork (a), crazy hair (pork), nerd glasses

   pork (a), wild blonde (pork)
   pork (a), wild blonde (pork), classic shades
   pork (a), blonde side (pork)
   pork (a), blonde side (pork), flowers
   pork (a), orange side (pork)
   pork (a), orange side (pork), choker, purple eye shadow

   pork (a), heart shades, red mohawk (pork) 
  
   pork (aa), cap mcd white
   pork (aa), cap mcd flipped
   pork (aa), cap mcd black
   pork (aa), cap subway, horned rim glasses
   pork (aa), cap burger king, regular shades
  
   pork (aa), bandana, eye patch

   pork (aa), brown_shemagh_agal (pork)
   pork (aa), red_shemagh_agal (pork)
   pork (aa), red_shemagh (pork), regular shades
   pork (aa), white_shemagh_gold_agal (pork), laser eyes gold

   pork gold (a), regular shades, red mohawk (pork) 
   pork green (a), 3d glasses

   pork alien (aa), cap 
   pork alien (aa), cap forward, pipe
   pork green (a), laser eyes gold
 
   pork blue (a), vr pro
   pork green (a), clown eyes green
   pork green (aa), cap mcd

   pork alien (aaa), hoodie (pork)
   pork orc (aaa), hoodie light (pork)
   pork pink (aaa), hoodie dark (pork)

   pork alien (aaa), hood (pork)
   pork gold (aaa), hood dark (pork)
  
   pork green (aaa), clown eyes green, hoodie (pork)
   pork gold (aaa), hoodie light (pork), laser eyes gold
   pork alien red (a), vr pro
   pork pink (aaa), hoodie dark (pork), vr pro

   pork pink (a), blonde bob (pork)
   pork pink (a), blonde bob (pork), big shades
   pork pink (a), blonde bob (pork), laser eyes blue
   pork pink (a), blonde bob (pork), mole, gold chain
   pork green (a), blonde bob (pork), mole, blue eye shadow, gold chain
   

   pork gold (a), crazy hair (pork) 
   pork green (a), crazy hair (pork), nerd glasses

   pork green (a), wild blonde (pork)
   pork gold (a), wild blonde (pork), classic shades
   pork alien red (a), blonde side (pork)
   pork pink (a), blonde side (pork), flowers
   pork blue (a), orange side (pork)
   pork blue (a), orange side (pork), choker, purple eye shadow

   pork green (a), heart shades, red mohawk (pork) 
  
   pork orc (aa), cap mcd white
   pork alien (aa), cap mcd flipped
   pork gold (aa), cap mcd black
   pork green (aa), cap subway, horned rim glasses
   pork blue (aa), cap burger king, regular shades
  
   pork orc (a), vr pro, gold chain
   pork orc (aa), bandana, eye patch

   pork alien red (aa), brown_shemagh_agal (pork)
   pork blue (aa), red_shemagh_agal (pork)
   pork green (aa), red_shemagh (pork), regular shades
   pork gold (aa), white_shemagh_gold_agal (pork), laser eyes gold
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