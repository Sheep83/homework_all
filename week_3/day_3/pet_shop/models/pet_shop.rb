require('pry-byebug')
require( 'pg' )

class PetShop
  attr_accessor(:name, :stock_type, :id, :address)
  
  def initialize ( options, runner ) #hash
    @name = options['name']
    @id = options['id'].to_i
    @stock_type = options['stock_type']
    @address = options['address']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO pet_shops (name, stock_type, address) VALUES ('#{@name}', '#{@stock_type}', '#{@address}') RETURNING *"
    # db = PG.connect ({dbname: 'music_library', host:'localhost' })
    # artist_data = db.exec( sql )
    # binding.pry
    pet_shop_data = @runner.run(sql)
    @id = pet_shop_data.first['id'].to_i #PG gem always returns an array of hashes, hence .first is necessary
    # db.close()
  end

  def all_pets
    sql = "SELECT * FROM pets WHERE pet_shop_id = #{@id}"
    all_pets = @runner.run(sql)
    pets = all_pets.map { |pets| Pet.new(pets, @runner)}
  end

  def self.all(shop_id, runner)
      sql = "SELECT * FROM pet_shops"
      shop_data = runner.run( sql )
      shops = shop_data.map { |shop_data| Pet.new(shop_data, runner )}
      for shop in shops
      # binding.pry
        if shop.id == shop_id
          puts "Pet shop id number #{shop.id} is #{shop.name}"
      nil
        end
      end
  end

  def update(options)
      db = PG.connect( {dbname: 'another_pet_shop', host: 'localhost' } )
      if options['name']
        @name = options['name']
      end
        if options['stock_type']
          @stock_type = options['stock_type']
        end
        if options['address']
          @address = options['address']
        end

      sql = "UPDATE pet_shops SET 
      name = '#{@name}', 
      stock_type = '#{@stock_type}', 
      address = '#{@address}' 
      WHERE id = #{@id}"
      db.exec(sql)
      db.close
  end

  def delete(id, runner)
      sql = "DELETE FROM pet_shops WHERE id = #{@id}"
      runner.run( sql )
  end

end


