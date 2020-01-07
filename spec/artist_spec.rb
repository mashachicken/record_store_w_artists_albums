require 'rspec'
require 'artist'
require 'song'
require 'pry'
require 'spec_helper'
require 'artist'

describe '#Artist' do

  before(:each) do
    Album.clear
    Song.clear
    Artist.clear
  end

  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Prince", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Prince", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:name => "Prince", :id => nil})
      artist2 = Artist.new({:name => "Prince", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Prince", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist.update("BB King")
      expect(artist.name).to(eq("BB King"))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Prince", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  # describe('#songs') do
  #   it("returns an artist's songs") do
  #     artist = Artist.new({:name => "John Coltrane", :id => nil})
  #     artist.save()
  #     song = Song.new({:name => "Naima", :album_id => artist.id, :id => nil})
  #     song.save()
  #     song2 = Song.new({:name => "Cousin Mary", :album_id => artist.id, :id => nil})
  #     song2.save()
  #     expect(artist.songs).to(eq([song, song2]))
  #   end
  # end

  describe('.search') do
    it("searches for an artist by name") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Prince", :id => nil})
      artist2.save()
      artist3 = Artist.new({:name => "John Legend", :id => nil})
      artist3.save()
      expect(Artist.search("john")).to(eq([artist, artist3]))
    end
  end

  describe('.sort') do
    it("sorts artists by name") do
      artist = Artist.new({:name => "Prince", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "John Coltrane", :id => nil})
      artist2.save()
      artist3 = Artist.new({:name => "Rush", :id => nil})
      artist3.save()
      expect(Artist.sort()).to(eq([artist2, artist, artist3]))
    end
  end

end
