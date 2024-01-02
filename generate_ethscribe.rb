require 'pixelart'


require_relative 'base'

##
# read in all meta data records of all 10 000 punks
recs = read_csv( './punks.csv' )
puts "#{recs.size} punk(s)"  #=> 10000 punk(s)




STATS = Hash.new(0)


def generate_punk( *values  )
   ## remove empty attibutes
  values = values.select { |value| !value.empty? }
  ## normalize
  values = values.map { |value| value.downcase.gsub( /[^a-z0-9]/, '' ) }
 
  punk_type       = values[0]
  attribute_names = values[1..-1]

  gender = punk_type.index( 'female' ) ? 'f' : 'm'
        
  # change mid
  #  male   to (ethscribe) green 
  #  female to (ethscribe) green female
  punk_type = case punk_type
              when 'male2'   then 'green'
              when 'female2' then 'greenfemale'
              else   punk_type
              end 

  # change smile  to gold
  # change frown  to demon or skeleton or bot or orc
  if attribute_names.include?( 'smile' )
     punk_type = 'gold'
  end  
  
  specials = ['demon', 'skeleton', 'bot', 'orc']

  if attribute_names.include?( 'frown' )
    punk_type = specials[ rand( specials.size ) ]
  end  

  ### more fun
  ##   turn every 10th male1 into blue
  if punk_type == 'male1'
    STATS['male1'] += 1  
    punk_type ='blue'  if STATS['male1'] % 10 == 0 
  end


  ## attributes - rm smile
  ## attributes - rm frown
  attribute_names = attribute_names.select do |attribute_name|
                              case attribute_name
                              when 'smile' then false
                              when 'frown' then false
                              else true
                              end
                         end
 

  attribute_names = attribute_names.map do |attribute_name|
                                        case attribute_name
                                        when 'smallshades'    then 'lasereyes gold'
                                        when 'weldinggoggles' then 'lasereyes gold'
                                        else attribute_name
                                        end
                                     end


  punk = generate( punk_type, *attribute_names )
  punk
end # method generate


##
# let's go - generate all 10 000 using the records

punks = CompositeImage.new( 100, 100, width: 12, height: 12 )
# punks = CompositeImage.new( 10, 10, width: 12, height: 12 )


# recs = recs[0,100]
srand( 4242 )   ## make deterministic

recs.each_with_index do |rec,i|
  puts "==> punk #{i}:"
  pp rec

  values = rec.values
  punk = generate_punk( *values )

  num = '%04d' % i
  name = "punk#{num}"

  punk.save( "./ethscribe/#{name}.png" )
  ## punk.zoom(10).save( "./ethscribe/@10x/#{name}@10x.png" )

  punks << punk   
end

punks.save( "./tmp2/ethscribes12px.png" )
# punks.zoom(4).save( "./tmp2/ethscribes12px@4x.png" )



puts "bye"