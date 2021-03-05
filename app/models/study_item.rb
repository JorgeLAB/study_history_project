require 'pry'
require 'sqlite3'

class StudyItem
	attr_accessor :title, :category

	def initialize(title:, category:)
		@title = title
		@category = category
	end

	def include?(query,attribute)
		send(attribute).include?(query)
	end

	def to_s
		"##{title} - #{category}"
	end

	def self.register
		print "Digite o titulo do seu item de estudo: "
		title = gets.chomp
		print "Digite a categoria do seu item de estudo: "
		category = gets.chomp

		puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"

    self.new(title: title, category: category)

    begin

      db = SQLite3::Database.open "../../db/study_history.db"
      db.execute("INSERT INTO StudyItems(Title, Category) VALUES (?, ?)", [@title, @category])

    rescue SQLite3::Exception => e

      puts "Exception occurred"
      puts e

    ensure
      db.close if db
    end
	end

	def self.all
    begin
      db = SQLite3::Database.open "../../db/study_history.db"
      study_items = db.prepare "SELECT * FROM StudyItems"

      study_items.each do |row|
        p row
      end

    rescue SQLite3::Exception => e

      puts "Exception occurred"
      puts e

    ensure
      study_items.close if study_items
      db.close if db
    end
	end

	def self.search(term)
  end

	def self.destroy
  	puts '==== List de items ===='

    self.all
  	puts 'Qual o id do Item de estudo você quer apagar?'
  	id = gets.to_i

    begin

      db = SQLite3::Database.open "../../db/study_history.db"
      study_item = db.execute("DELETE FROM StudyItems WHERE ID=?", [id])

    rescue SQLite3::Exception => e
      puts "Exception occurred"
      puts e
    ensure
      db.close if db
    end
  end
end
