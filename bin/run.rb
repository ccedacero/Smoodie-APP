require_relative "../config/environment"
interface = Interface.new()
interface.welcome

user_instance = interface.chooose_login_or_register

interface.user = user_instance
# binding.pry

# interface.main_menu
# interface.display

puts "hello world"
