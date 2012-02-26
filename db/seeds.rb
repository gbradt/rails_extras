# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Mix.create({:mix_id => 1, :icecast_title => 'Between Two Islands - Summer mix 2008', :length => 4434})
Mix.create({:mix_id => 2, :icecast_title => 'Between Two Islands - Summer mix 2006', :length => 4561})

DisplayInfo.create({:track_id => 321, :icecast_title => 'Stereolab - Miss Modular', 
    :artist => 'Stereolab', :title => 'Miss Modular', :year => '1997'})
DisplayInfo.create({:track_id => 7218, :icecast_title => 'Maxwell - Ascension (Don\'t Ever Wonder)', 
    :artist => 'Maxwell', :title => 'Ascension (Don\'t ever wonder)', :year => '1996'})
DisplayInfo.create({:track_id => 11353, :icecast_title => 'Stefon Harris and Jacky Terrasson - Shané', 
    :artist => 'Stefon Harris and Jacky Terrasson', :title => 'Shané', :year => '2001'})
DisplayInfo.create({:track_id => 370, :icecast_title => 'Pet Shop Boys - Home and dry (ambient mix)', 
    :artist => 'Pet Shop Boys', :title => 'Home and dry (ambient mix)', :year => '2002'})
DisplayInfo.create({:track_id => 1409, :icecast_title => 'Teddy Pendergrass - Love T.K.O.', 
    :artist => 'Teddy Pendergrass', :title => 'Love T.K.O.', :year => '1980'})
DisplayInfo.create({:track_id => 4108, :icecast_title => 'Grace Jones - La vie en rose', 
    :artist => 'Grace Jones', :title => 'La vie en rose', :year => '1977'})
DisplayInfo.create({:track_id => 5761, :icecast_title => 'Nightmares On Wax - Les nuits', 
    :artist => 'Nightmares On Wax', :title => 'Les nuits', :year => '1999'})
DisplayInfo.create({:track_id => 6327, :icecast_title => 'Kruder & Dorfmeister - Definition', 
    :artist => 'Kruder & Dorfmeister', :title => 'Definition', :year => '1995'})
DisplayInfo.create({:track_id => 7101, :icecast_title => 'Saint Etienne - Spring', 
    :artist => 'Saint Etienne', :title => 'Spring', :year => '1991'})
DisplayInfo.create({:track_id => 7111, :icecast_title => 'Bent - Magic love (with Toni Tennille)', 
    :artist => 'Bent with Toni Tennille', :title => 'Magic love', :year => '2003'})
DisplayInfo.create({:track_id => 7124, :icecast_title => 'Bebel Gilberto - Samba da Benção (with Amon Tobin)', 
    :artist => 'Bebel Gilberto with Amon Tobin', :title => 'Samba da Benção', :year => '2000'})
DisplayInfo.create({:track_id => 7171, :icecast_title => 'Erlend Øye - Sudden rush (with Kompis)', 
    :artist => 'Erlend Øye with Kompis', :title => 'Sudden rush', :year => '2003'})
DisplayInfo.create({:track_id => 7950, :icecast_title => 'Thievery Corporation - Satyam shivam sundaram (with Gunjan)', 
    :artist => 'Thievery Corporation with Gunjan', :title => 'Satyam shivam sundaram', :year => '2005'})
DisplayInfo.create({:track_id => 8328, :icecast_title => 'Michel Legrand - I still see you (with Scott Walker)', 
    :artist => 'Michel Legrand with Scott Walker', :title => 'I still see you', :year => '1970'})
DisplayInfo.create({:track_id => 8341, :icecast_title => 'Chet Baker - Funk in deep freeze', 
    :artist => 'Chet Baker', :title => 'Funk in deep freeze', :year => '1974'})
DisplayInfo.create({:track_id => 8744, :icecast_title => 'Fila Brazillia - Mammon dad', 
    :artist => 'Fila Brazillia', :title => 'Mammon dad', :year => '2005'})
DisplayInfo.create({:track_id => 9048, :icecast_title => 'Los Amigos Invisibles - La vecina', 
    :artist => 'Los Amigos Invisibles', :title => 'La vecina', :year => '2000'})
DisplayInfo.create({:track_id => 9052, :icecast_title => 'Tito Puente - Ode To Cachao', 
    :artist => 'Tito Puente', :title => 'Ode to Cachao', :year => '1990'})
DisplayInfo.create({:track_id => 9063, :icecast_title => 'Isaac Hayes - Never gonna give you up', 
    :artist => 'Isaac Hayes', :title => 'Never gonna give you up', :year => '1971'})
DisplayInfo.create({:track_id => 9068, :icecast_title => 'Cantoma - Cosmopole', 
    :artist => 'Cantoma', :title => 'Cosmopole', :year => '2005'})
DisplayInfo.create({:track_id => 9087, :icecast_title => 'Anthony Hamilton - The truth', 
    :artist => 'Anthony Hamilton', :title => 'The truth', :year => '2005'})
DisplayInfo.create({:track_id => 9088, :icecast_title => 'Massive Attack - Protection (with Tracey Thorn)', 
    :artist => 'Massive Attack with Tracey Thorn', :title => 'Protection', :year => '1994'})
DisplayInfo.create({:track_id => 9089, :icecast_title => 'Zero 7 - Futures (with José González)', 
    :artist => 'Zero 7 with José González', :title => 'Futures', :year => '2006'})
DisplayInfo.create({:track_id => 9879, :icecast_title => 'Minus 8 - White', 
    :artist => 'Minus 8', :title => 'White', :year => '2002'})
DisplayInfo.create({:track_id => 10364, :icecast_title => 'Karrin Allyson - Wild world', 
    :artist => 'Karrin Allyson', :title => 'Wild world', :year => '2004'})
DisplayInfo.create({:track_id => 10375, :icecast_title => 'Johnny Mathis - Wild is the wind', 
    :artist => 'Johnny Mathis', :title => 'Wild is the wind', :year => '1957'})
DisplayInfo.create({:track_id => 10377, :icecast_title => 'Thomas Dolby - The flat earth', 
    :artist => 'Thomas Dolby', :title => 'The flat earth', :year => '1984'})
DisplayInfo.create({:track_id => 10379, :icecast_title => 'Tim Hardin - Misty roses', 
    :artist => 'Tim Hardin', :title => 'Misty roses', :year => '1965'})
DisplayInfo.create({:track_id => 10380, :icecast_title => 'Cerrone - Music of life', 
    :artist => 'Cerrone', :title => 'Music of life', :year => '1978'})
DisplayInfo.create({:track_id => 11069, :icecast_title => 'Walter Wanderley - Deus Brasileiro', 
    :artist => 'Walter Wanderley', :title => 'Deus Brasileiro', :year => '1965'})
DisplayInfo.create({:track_id => 11346, :icecast_title => 'Goldfrapp - Cologne Cerrone Houdini', 
    :artist => 'Goldfrapp', :title => 'Cologne Cerrone Houdini', :year => '2008'})
DisplayInfo.create({:track_id => 11354, :icecast_title => 'Etienne Daho - La baie', 
    :artist => 'Etienne Daho', :title => 'La baie', :year => '2000'})

MixSong.create({:mix_id => 2, :track_id => 9048, :start => 0, :end => 262})
MixSong.create({:mix_id => 2, :track_id => 7111, :start => 263, :end => 504})
MixSong.create({:mix_id => 2, :track_id => 321, :start => 505, :end => 760})
MixSong.create({:mix_id => 2, :track_id => 9089, :start => 761, :end => 912})
MixSong.create({:mix_id => 2, :track_id => 9063, :start => 913, :end => 1243})
MixSong.create({:mix_id => 2, :track_id => 8341, :start => 1244, :end => 1606})
MixSong.create({:mix_id => 2, :track_id => 9088, :start => 1607, :end => 2067})
MixSong.create({:mix_id => 2, :track_id => 9087, :start => 2068, :end => 2331})
MixSong.create({:mix_id => 2, :track_id => 7124, :start => 2332, :end => 2613})
MixSong.create({:mix_id => 2, :track_id => 9068, :start => 2614, :end => 3008})
MixSong.create({:mix_id => 2, :track_id => 8328, :start => 3009, :end => 3180})
MixSong.create({:mix_id => 2, :track_id => 7950, :start => 3181, :end => 3406})
MixSong.create({:mix_id => 2, :track_id => 4108, :start => 3407, :end => 3839})
MixSong.create({:mix_id => 2, :track_id => 9052, :start => 3840, :end => 4232})
MixSong.create({:mix_id => 2, :track_id => 370, :start => 4233, :end => 4561})
MixSong.create({:mix_id => 1, :track_id => 10377, :start => 0, :end => 379})
MixSong.create({:mix_id => 1, :track_id => 7171, :start => 380, :end => 574})
MixSong.create({:mix_id => 1, :track_id => 11069, :start => 575, :end => 740})
MixSong.create({:mix_id => 1, :track_id => 10364, :start => 741, :end => 1033})
MixSong.create({:mix_id => 1, :track_id => 8744, :start => 1034, :end => 1285})
MixSong.create({:mix_id => 1, :track_id => 1409, :start => 1286, :end => 1576})
MixSong.create({:mix_id => 1, :track_id => 7101, :start => 1577, :end => 1792})
MixSong.create({:mix_id => 1, :track_id => 9879, :start => 1793, :end => 2094})
MixSong.create({:mix_id => 1, :track_id => 10379, :start => 2095, :end => 2204})
MixSong.create({:mix_id => 1, :track_id => 5761, :start => 2205, :end => 2427})
MixSong.create({:mix_id => 1, :track_id => 7218, :start => 2428, :end => 2761})
MixSong.create({:mix_id => 1, :track_id => 10375, :start => 2762, :end => 2902})
MixSong.create({:mix_id => 1, :track_id => 11354, :start => 2903, :end => 3218})
MixSong.create({:mix_id => 1, :track_id => 11353, :start => 3219, :end => 3555})
MixSong.create({:mix_id => 1, :track_id => 6327, :start => 3556, :end => 3814})
MixSong.create({:mix_id => 1, :track_id => 11346, :start => 3815, :end => 4058})
MixSong.create({:mix_id => 1, :track_id => 10380, :start => 4059, :end => 4434})
