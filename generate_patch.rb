require 'digest'
require 'datauris'


require 'pixelart'


require_relative 'base'


recs = read_csv( "./patch.csv" )


cols = 20
rows = recs.size / cols 
rows += 1    if recs.size % cols != 0

composite  = ImageComposite.new( cols, rows, 
                                  width: 12, height: 12 )


## double check for uniques                                 
uniques = {}

recs.each do |rec|
    id         = rec['id'].to_i(10)
    type       = rec['type']
    attributes = (rec['attributes'] || '' ).split( '/').map { |attr| attr.strip }  

  
    img = generate( type, *attributes )
 
    num = '%04d' % id
    name = "punk#{num}"
 
    img.save( "./tmp4/#{name}.png" )
     img.zoom(4).save( "./tmp4/@4x/#{name}@4x.png" )
     composite << img


     blob = read_blob( "./tmp4/#{name}.png" )
     uri = DataUri.build( blob, "image/png" )
     hash = Digest::SHA256.hexdigest( uri )

     uniques[ hash ] ||= [] 
     uniques[ hash ] << id
 
     if uniques[ hash ].size != 1
        puts "!! duplicate hash; sorry"
        pp  uniques[ hash ]
        exit 1
     end
end


composite.save( "./tmp2/patch.png" )
composite.zoom(4).save( "./tmp2/patch@4x.png" )

puts "bye"