class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.get_artists(db_query)
    returned_artists = DB.exec(db_query)
    artists = []
    returned_artists.each() do |artist|
      name = artist.fetch('name')
      id = artist.fetch('id').to_i
      artists.push(Artist.new({:name => name, :id => id}))
    end
    artists
  end

  def self.all
    self.get_artists('SELECT * FROM artists;')
  end

  def save
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  def ==(artist_to_compare)
    self.name() == artist_to_compare.name()
  end

  def self.clear
    DB.exec("DELETE FROM artists *;")
  end

  def self.find(id)
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    name = artist.fetch('name')
    id = artist.fetch('id').to_i
    Artist.new({:name => name, :id => id})
  end

  def self.search(search)
    self.get_artists("SELECT * FROM artists WHERE lower(name) LIKE '%#{search}%';")
  end

  def update(name)
    @name = name
    DB.exec("UPDATE artists SET name = '#{@name}' WHERE id = #{@id};")
  end

  def self.sort()
    self.get_artists('SELECT * FROM artists ORDER BY name;')
  end

  def delete
    DB.exec("DELETE FROM artists WHERE id = #{@id};")
  end
end
