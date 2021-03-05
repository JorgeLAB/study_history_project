require_relative '../models/study_item'
require_relative '../models/study_diary'

REGISTER = 1
VIEW     = 2
SEARCH   = 3
DELETE   = 4
EXIT     = 5

def welcome
  "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!\n\n"
end

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar.'
  gets
end

def clear_and_wait_keypress
  wait_keypress
  clear
end

def menu
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{DELETE}] Deletar um item das notas"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

puts welcome
option = menu

loop do
  clear
  case option
  when REGISTER
    StudyItem.register
  when VIEW
    puts StudyItem.all
    puts 'Nenhum item encontrado' if StudyItem.all.empty?
  when SEARCH
    puts search_items
  when DELETE
    clear
    puts StudyItem.destroy
  when EXIT
    clear
    puts 'Obrigado por usar o Diário de Estudos'
    break
  else
    puts "Opção inválida"
  end
  clear_and_wait_keypress
  option = menu
end
