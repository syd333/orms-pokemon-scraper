class Pokemon
attr_accessor :id, :name, :type, :db

def initialize(keywords)
    # @id = id
    # @name = name
    # @type = type
    # @db = db
end

def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
        # DB[:conn].execute(sql, self.name, self.type)
        # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        #unintialized constant Pokemon::DB
end

# def self.find(row)
#     # sql= <<-SQL
#     # SELECT * FROM pokemon WHERE id = ? LIMIT 1
#     # SQL
#     # DB[:conn].execute(sql)
#     # id = row[0]
#     # name = row[1]
#     # type = row[2]
#     # self.new(id, name, type)
# end

def self.find(num,db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    return new_pokemon
  end

end
