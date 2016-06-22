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



  # def albums()
  #   #query the database for artist's albums
  #   #make album objects
  #   sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
  #   albums_data = @runner.run(sql)

  #   albums = albums_data.map { |album_data| Album.new(album_data, @runner) }
  #   return albums 
  #   binding.pry
  #   nil

  # end

end


