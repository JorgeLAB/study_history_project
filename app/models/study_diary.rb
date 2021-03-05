require_relative 'study_item'
require 'sqlite3'

def search_items
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = StudyItem.all.filter do |item|
    item.include?(term,"title")
  end
end
