require( 'pg' )

class Pet
  attr_accessor(:name, :type, :id, :pet_shop_id)


  def initialize ( options, runner )
    @id = options['id']
    @name = options['name']
    @type = options['type']
    @runner = runner
    @pet_shop_id = options['pet_shop_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets (name, type, pet_shop_id) VALUES ('#{@name}', '#{@type}', '#{@pet_shop_id}')
    RETURNING *"
    @runner.run(sql)
    # db = PG.connect ({dbname: 'music_library', host:'localhost' })
    # db.exec( sql )
    # db.close() 
  end

  def self.all(pet_name, runner)
      sql = "SELECT * FROM pets"
      pet_data = runner.run( sql )
      pets = pet_data.map { |pet_data| Pet.new(pet_data, runner )}
      for pet in pets
      # binding.pry
        if pet.name == pet_name
          puts "#{pet.name} the #{pet.type} is in Pet Shop #{pet.pet_shop_id}"
      nil
        end
      end
  end

  # def artist()
  #   sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
  #   artist_data = @runner.run(sql)
  #   artist = artist_data.map { |artist_data| Artist.new(artist_data, @runner) }
  #   result = artist.first
  #   binding.pry
  #   return result
  # end

  # def self.all(runner)
  #   sql = "SELECT * FROM albums"
  #   albums_data = runner.run( sql )
  #   albums = albums_data.map { |album_data| Album.new(album_data, runner )}
  #   return albums
  # end


end

