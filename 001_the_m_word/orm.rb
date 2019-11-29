class Entity
  attr_reader :table, :ident
  def initialize(table,ident)
    @table=table
    @ident=ident
    Database.sql "INSERT INTO #{@table} (id) VALUES (#{ident})"
  end

  def set(col, val)
    Database.sql "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{@ident}"
  end

  def get(col)
    Database.sql ("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
  end
end

class Movie < Entity
  def initialize(ident)
    super "movies", ident
  end

  def title
    get "title"
  end

  def title=(value)
    set "title", value
  end

  def director
    get "director"
  end

  def director=(value)
    set "director", value
  end
end

p movie=Movie.new(1)
p movie.title = "Doctor Stangelove"
p movie.director = "Stanley Kubrick"

================================ insted of
require 'sqlite3'
require 'active_record'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'

# Connect to an in-memory sqlite3 database
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

# Define a minimal database schema
ActiveRecord::Schema.define do
  create_table :shows, force: true do |t|
    t.string :name
  end

  create_table :episodes, force: true do |t|
    t.string :name
    t.belongs_to :show, index: true
  end
end

class Movie < ActiveRecord::Base
end

movie = Movie.create
movie.title = "Doctor Strangelove"
movie.title # => "Doctor Strangelove"