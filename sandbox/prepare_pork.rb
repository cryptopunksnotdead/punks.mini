############################
#  to run use (cd into /sandbox):
#    $  ruby prepare_pork.rb



require 'pixelart'


ETHSCRIBES_GREEN = Color.from_hex( '#c3ff00' )

ALIEN_BASE     = Color.from_hex( '#c8fbfb' )
ALIEN_RED_BASE = Color.from_hex( '#fd2929' )


GOLD_BASE = Color.from_hex( '#ffd700' )

ORANGE_BASE = Color.from_hex( '#f7931a' )

ORC_BASE = Color.from_hex( '#50650e' )
BLUE_BASE = Color.from_hex( '#462e8d' )
PINK_BASE = Color.from_hex( '#ff1493' ) 


puts "(ethscribes) green:"
puts "  #{Color.format( ETHSCRIBES_GREEN )}"
puts "alien (aqua):"
puts "  #{Color.format( ALIEN_BASE )}"
puts "alien (red):"
puts "  #{Color.format( ALIEN_RED_BASE )}"
puts "gold:"
puts "  #{Color.format( GOLD_BASE )}"
puts "orange:"
puts "  #{Color.format( ORANGE_BASE )}"
puts "orc:"
puts "  #{Color.format( ORC_BASE )}"
puts


# (ethscribes) green:
#   #c3ff00 / rgb(195 255   0) - hsl( 74° 100%  50%) - hsv( 74° 100% 100%)
# alien:
#   #c8fbfb / rgb(200 251 251) - hsl(180°  86%  88%) - hsv(180°  20%  98%)
# alien (red):
#    #fd2929 / rgb(253  41  41) - hsl(  0°  98%  58%) - hsv(  0°  84%  99%)


imgdef = Image.read( "./pork.png" )
imga   = Image.read( "./pork_(a).png" )
imgaa   = Image.read( "./pork_(aa).png" )
imgaaa   = Image.read( "./pork_(aaa).png" )
imgb   =  Image.read( "./pork_(b).png" )


imgx =  Image.read( "./more/pork_(x).png" )
imgy =  Image.read( "./more/pork_(y).png" )


def dump_colors( img )
    count = Hash.new(0)
    img.pixels.each do |color|
        count[color] += 1
    end

    count = count.sort { |l,r|  r[1] <=> l[1] }

    puts "colors:"
    count.each_with_index do |(color,count), i|
        print "[#{i}]  "
        print '%4d ' %  count
        print Color.format( color )
        print "\n"
    end    
end


dump_colors( imga )


def derive_colors( base, lighter: false )
    hsl = Color.to_hsl( base )
    pp hsl  
    #=> [74, 1.0, 0.5, 255]  - ethscribe green
    #=> [180, 0.8644067796610165, 0.884313725490196, 255]   - alien
    #=> [51, 1.0, 0.5, 255]   - gold
    #=> [33, 0.9324894514767933, 0.5352941176470588, 255]   - orange
    #=> 74, 0.7565217391304349, 0.22549019607843135, 255]  - orc
    color_map = {
    '#feb9b4' => base,     # base
    '#eb8185' =>  lighter == false ? Color.from_hsl( (hsl[0]-6)%360, 
                                   hsl[1]-0.24, 
                                   hsl[2]-0.14)
                                : Color.from_hsl( (hsl[0]-6)%360, 
                                   hsl[1]-0.24/2, 
                                   hsl[2]-0.07),     # snout base
    '#c45659' =>    Color.from_hsl( (hsl[0]-6)%360, 
                                    hsl[1]-0.49, 
                                    [hsl[2]-0.30, 0,0].max ),                   
    '#f69c93' =>   Color.from_hsl( (hsl[0]+1)%360, 
                                    hsl[1]-0.12,
                                    hsl[2]-0.08),    
  }
  color_map
end



types = {
    green: { color: ETHSCRIBES_GREEN  },
    alien: { color: ALIEN_BASE,
             patch:  -> (img) {
                    # patch eyes
                    img[4,4] =  Color.parse( '#75bdbd')
                    img[5,4] =  Color.parse( '#000000')
                    img[5,5] =  Color.parse( '#9be0e0')
                    img[7,4] =  Color.parse( '#75bdbd')
                    img[8,4] =  Color.parse( '#000000')
                    img[8,5] =  Color.parse( '#9be0e0')
                    img
             }
           },
   alien_red: { color: ALIEN_RED_BASE,
             patch:  -> (img) {
                    # patch eyes
                    img[4,4] =  Color.parse( '#712727')
                    img[5,4] =  Color.parse( '#000000')
                    img[5,5] =  Color.parse( '#ba2626')
                    img[7,4] =  Color.parse( '#712727')
                    img[8,4] =  Color.parse( '#000000')
                    img[8,5] =  Color.parse( '#ba2626')
                    img
             }
              },
   gold: {  color: GOLD_BASE  }, 
   orange: { color: ORANGE_BASE },   
   orc:  { color:  ORC_BASE, 
           opts: { lighter: true },
           patch: ->(img) {
                 # patch eye brows
                 img[3,4] =  Color.parse( '#171a08')
                 img[4,4] =  Color.parse( '#171a08')
                 img[5,4] =  Color.parse( '#171a08')
                 img[7,4] =  Color.parse( '#171a08')
                 img[8,4] =  Color.parse( '#171a08')
                 img
             }
            },
   blue:   { color: BLUE_BASE },
   pink:   { color: PINK_BASE,
                       patch: ->(img) {
                 # patch eyes
                 img[4,5] =  Color.parse( '#0094ff')
                 img[7,5] =  Color.parse( '#0094ff')
                 img
             }
  },
}           


pp types



types.each do |name, spec|
    puts
    puts "==> #{name}"

    opts = spec[:opts] || {}
    img2 = imgdef.change_colors( derive_colors( spec[:color], **opts ))
    img2 = spec[:patch].call( img2 )  if spec[:patch]

    img2.save( "./tmp/pork_#{name}.png" )
    img2.zoom(10).save( "./tmp/@10x/pork_#{name}@10x.png" )

    
    img2 = imga.change_colors( derive_colors( spec[:color], **opts ))
    img2 = spec[:patch].call( img2 )  if spec[:patch]

    img2.save( "./tmp/pork_#{name}_(a).png" )
    img2.zoom(10).save( "./tmp/@10x/pork_#{name}_(a)@10x.png" )

    img2 = imgaa.change_colors( derive_colors( spec[:color], **opts ))
    img2 = spec[:patch].call( img2 )  if spec[:patch]

    img2.save( "./tmp/pork_#{name}_(aa).png" )
    img2.zoom(10).save( "./tmp/@10x/pork_#{name}_(aa)@10x.png" )

    img2 = imgaaa.change_colors( derive_colors( spec[:color], **opts ))
    img2 = spec[:patch].call( img2 )  if spec[:patch]

    img2.save( "./tmp/pork_#{name}_(aaa).png" )
    img2.zoom(10).save( "./tmp/@10x/pork_#{name}_(aaa)@10x.png" )


    img2 = imgb.change_colors( derive_colors( spec[:color], **opts ))
    img2 = spec[:patch].call( img2 )  if spec[:patch]

    img2.save( "./tmp/pork_#{name}_(b).png" )
    img2.zoom(10).save( "./tmp/@10x/pork_#{name}_(b)@10x.png" )
end




imga.zoom(10).save( "./tmp/@10x/pork_(a)@10x.png" )
imgb.zoom(10).save( "./tmp/@10x/pork_(b)@10x.png" )
imgx.zoom(10).save( "./tmp/@10x/pork_(x)@10x.png" )
imgy.zoom(10).save( "./tmp/@10x/pork_(y)@10x.png" )



puts "bye"




__END__

new base #c3ff00    - hsl( 74° 100%  50%) - hsv( 74° 100% 100%)

base  47 #feb9b4   - hsl(  4°  97%  85%) - hsv(  4°  29% 100%)
snout    13 #eb8185  - hsl(358°  73%  71%) - hsv(358°  45%  92%)
snout2nd  2 #c45659  - hsl(358°  48%  55%) - hsv(358°  56%  77%)
base2nd   3 #f69c93   - hsl(  5°  85%  77%) - hsv(  5°  40%  96%)


diff in hsl   is   h (-6° % 360), s - 24%  l - 14%
                   h (-6° % 360), s - 49%  l - 30%
                   h ( +1° % 360), s - 12%, l - 8%
colors:
[0]    71 #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - hsv(  0°   0%   0%) - α(  0%) - TRANSPARENT
[1]    47 #feb9b4 / rgb(254 185 180) - hsl(  4°  97%  85%) - hsv(  4°  29% 100%)
[2]    13 #eb8185 / rgb(235 129 133) - hsl(358°  73%  71%) - hsv(358°  45%  92%)
[3]     6 #ffffff / rgb(255 255 255) - hsl(  0°   0% 100%) - hsv(  0°   0% 100%)           - WHITE
[4]     3 #f69c93 / rgb(246 156 147) - hsl(  5°  85%  77%) - hsv(  5°  40%  96%)
[5]     2 #c45659 / rgb(196  86  89) - hsl(358°  48%  55%) - hsv(358°  56%  77%)
[6]     2 #000000 / rgb(  0   0   0) - hsl(  0°   0%   0%) - hsv(  0°   0%   0%)           - BLACK