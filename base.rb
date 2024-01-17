

ATTRIBUTES = {
   base: [
      'male1',
      'male2',
      'male3',
      'male4',
      'female1',
      'female2',
      'female3',
      'female4',
      'zombie',
      'zombie_female',
      'zombie_orange',
      'ape',
      'ape_blue',
      'ape_orange',
      'ape_gold',
      'ape_alien',
      'ape_zombie',
      'ape_female',
      'alien',
      'alien_orange',
      'alien_lime',
      'alien_green',
      'alien_gold',
      'alien_blue',
      'alien_purple',
      'alien_magenta',
      'alien_red',
      'alien_female',
      'alien_orange_female',
      'alien_lime_female',
      'alien_green_female',
      'alien_gold_female',      
      'alien_blue_female',
      'alien_purple_female',
      'alien_magenta_female',
      'alien_red_female',
      'orc',
      'orc_female',
      'orc_orange',
      'demon',
      'demon_female',
      'demon_orange',
      'bot',
      'bot_orange',
      'skeleton',
      'skeleton_female',
      'skeleton_orange',
      'pink_female',
      'pepe',
      'gold',
      'orange',
      'blue',
      'blue_female',
      'blue_female_(a)',
      'green',
      'green_female',
      'red',
      'red_female',
      'purple',
      'purple_female',
      'aqua',
      'vampire',
      'vampire_female',
      'vampire_orange',
      'mummy',
      'mummy_orange',
      'davinci',
      'davinci_(a)',
      'shakespeare',
      'vangogh',
      'frida',
      'frida_(a)',
   ],
   hair: [
      'blonde_bob',
      'crazy_hair_(f)',
      'crazy_hair_(m)',
      'mohawk_dark',
      'peak_spike',
      'purple_hair',
      'straight_hair_blonde',
      'wild_blonde',
      'wild_hair_(m)',
      'wild_hair_(f)',
      'wild_white_hair',
      'half_shaved',
      'half_shaved_blonde',
      'half_shaved_purple',
      'mohawk_thin',
      'mohawk',
      'red_mohawk',
      'messy_hair_(m)',
      'messy_hair_(f)',
      'messy_hair_green_(f)',
      'messy_hair_blonde_(f)',
      'dark_hair',
      'straight_hair',
      'straight_hair_dark',
      'shaved_head',
      'blonde_short',
      'pink_short',
      'stringy_hair',
      'frumpy_hair_(f)',
      'frumpy_hair_(m)',
      'orange_side',
      'blonde_side',
      'white_side',
      'pink_with_hat',
      'clown_hair_green_(f)',
      'clown_hair_green_(m)',
      'clown_hair_blue_(m)',
      'vampire_hair',
      'pigtails', 
      'pigtails_red',
      'pigtails_blonde',
   ],
   head: [
      'bandana',
      'cap',
      'cap_red',
      'cap_forward',
      'cowboy_hat',
      'headband',
      'knitted_cap',
      'top_hat',
      'beanie',
      'do-rag',
      'police_cap',
      'pilot_helmet',
      'tassle_hat',
      'fedora',
      'tiara',
      'crown',
      'jester_hat',
      'flowers',
      'sombrero',
      'birthday_hat',
      'bow',
      'sun_hat',
   ],
   eyes: [
      '3d_glasses',
      'big_shades',
      'classic_shades',
      'classic_shades_green',
      'clown_eyes_green',
      'clown_eyes_blue',
      'nerd_glasses',
      'regular_shades',
      'vr',
      'vr_pro',
      'small_shades',
      'laser_eyes',
      'laser_eyes_gold',
      'eye_mask',
      'eye_mask_(a)',
      'horned_rim_glasses',
      'eye_patch',
      'green_eye_shadow',
      'purple_eye_shadow',
      'blue_eye_shadow',
      'heart_shades',
   ],
   beard: [
      'chinstrap',
      'big_beard',
      'luxurious_beard',
      'luxurious_white_beard',
      'goat',
      'front_beard_dark',
      'front_beard',
      'normal_beard',
      'normal_beard_black',
      'muttonchops',
      'handlebars',
      'shadow_beard',
      'mustache',
   ],
   more: [
      'clown_nose',
      'earring',
      'earcross',
      'hoodie',
      'hoodie_green',
      'hoodie_red',
      'hoodie_white',
      'choker',
      'pipe',
      'cigarette',
      'cigar',
      'vape',
      'gold_chain',
      'silver_chain',
      'spots',
      'mole',
      'rosy_cheeks',
      'black_lipstick',
      'purple_lipstick',
      'hot_lipstick',  
      'pink_lipstick',
      'burgundy_lipstick',
      'green_lipstick',
      'medical_mask',
      'buck_teeth',
      'demon_horns',
      'bubble_gum',
      'tears',
      'frown',   # face expression / emotion
  ],
  saudis: [
     'brown_shemagh_agal',
     'red_shemagh',
     'red_shemagh_agal',
     'white_shemagh',
     'white_shemagh_agal',
     'white_shemagh_gold_agal',
  ],
  fastfood: [
   'cap_mcd',
   'cap_mcd_flipped',
   'cap_mcd_white',
   'cap_mcd_black',  
   'cap_burgerking',
   'cap_subway',
  ],
}.reduce( {} ) do |h,(category, names)| 
     names.each do |name|
        key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

        ## fix-up file path by category
        path =  category == :base ? name : "#{category}/#{name}"

        puts "  #{key} / #{category}"
        if h.has_key?( key )
          puts "!! ERROR - duplicate key >#{key}<; already in use; sorry"
          exit 1
        end

        h[ key ] = Image.read( "./attributes/#{path}.png" )
     end
     h
end




def generate( *attributes )
   base = Image.new( 12,12 )
   
   ## normalize attribute names 
   keys = attributes.map { |attribute| attribute.downcase.gsub( /[^a-z0-9]/, '' ) }

   ## check for male/female gender
   gender = keys[0].index( 'female' ) ? 'f' : 'm'

   keys.each_with_index do |key,i|
        img = nil
        img = ATTRIBUTES[ "#{key}#{gender}" ]   if i > 0    ## try gender-specific first for accessores (not base e.g. i==0)
        img = ATTRIBUTES[ key ]    unless img       
        if img.nil?
           puts "!! attribute with key #{key} not found; sorry"
           exit 1
        end
        base.compose!( img )
   end
   base
end



