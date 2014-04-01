# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'GLOBAL SETTINGS RECORD'
global_settings = GlobalSettings.find_or_create_by_id({:id => 1}, :without_protection => true)

puts 'DEFAULT EMAIL TYPES'
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Registration Welcome', :email_type=>'confirmation'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Upload New Job', :email_type=>'confirmation'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Upload New Job', :email_type=>'notification'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Upload New File', :email_type=>'confirmation'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Upload New File', :email_type=>'notification'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Proof Approved', :email_type=>'confirmation'
puts 'Email: ' << email_text.name
email_text = EmailText.find_or_create_by_name_and_email_type :name=>'Proof Approved', :email_type=>'notification'
puts 'Email: ' << email_text.name
