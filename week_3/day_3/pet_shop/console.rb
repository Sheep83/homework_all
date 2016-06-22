require('pry-byebug')
require_relative('./models/pet')
require_relative('./models/pet_shop')
require_relative('./db/sql_runner')

runner = SqlRunner.new( {dbname:'another_pet_shop', host:'localhost'} )

pet_shop_1 = PetShop.new( { 'name' => 'Cat Emporium', 'stock_type' => 'Cats', 'address' => 'Aberdeen',  }, runner )
pet_shop_1.save()
pet1 = Pet.new( {'name' => 'Theo', 'type' => 'Cat', 'pet_shop_id' => pet_shop_1.id}, runner )
pet2 = Pet.new( {'name' => 'Tabby', 'type' => 'Cat', 'pet_shop_id' => pet_shop_1.id}, runner )
pet1.save()
pet2.save()

pet_shop_2 = PetShop.new( { 'name' => 'Dogging Spot', 'stock_type' => 'Dogs', 'address' => 'Edinburgh', }, runner )
pet_shop_2.save()
pet3 = Pet.new( {'name' => 'Fido', 'type' => 'Dog', 'pet_shop_id' => pet_shop_2.id}, runner )
pet4 = Pet.new( {'name' => 'Spot', 'type' => 'Dog', 'pet_shop_id' => pet_shop_2.id}, runner )
pet3.save()
pet4.save()

pet_shop_1.all_pets()     # returns all pets in pet_shop 1 ***working***

Pet.all('Theo', runner) #returns pet shop id for a given pet name ***working***

PetShop.all('1', runner)  #returns pet shop name for a given id ***working***

pet_shop_1.update( {'name' => 'New Improved Cat Emporium'} ) #updates pet shop details from given values #***messy but working***

pet_shop_1.delete('1', runner)  #***not working - foreighn key constraint, delete paets from stock first?

pet1.delete('2', runner) #***also not working, not sure why :-(***
