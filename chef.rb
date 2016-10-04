require 'sqlite3'


class Chef

  def initialize(irst_name,last_name,birthday,email,phone)
    @first_name = irst_name 
    @last_name = last_name
    @birthday = birthday
    @email = email
    @phone= phone
  end

  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
          ('Fer', 'Ad', '1995-03-09', 'fer.ad@gmail.com', '54789654821', DATETIME('now'), DATETIME('now')),
          ('Yo', 'Mi apellido', '1999-01-01', 'yo.miapellido@correo.com', '123456789', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def self.all
    Chef.db.execute(
      <<-SQL
        SELECT * FROM chefs;
      SQL
    )
  end

  def self.where(arg,value)
        Chef.db.execute(
        <<-SQL
        SELECT * FROM chefs WHERE  #{arg} = '#{value}'; OR 
        SELECT * FROM chefs WHERE first_name = ?, '#{value}';
        SQL
        )
  end

  def save
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
          ('#{@first_name}', '#{@last_name}', '#{@birthday}', '#{@email}','#{@phone}', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end

  def self.delete(id)
    Chef.db.execute(
      <<-SQL
        DELETE FROM chefs WHERE id = '#{id}'
      SQL
    )

  end

  private

  def self.db

    @@db ||= SQLite3::Database.new("chefs.db")
  end

end
