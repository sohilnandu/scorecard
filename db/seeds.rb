# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Scorecard.delete_all
open('db/seed_data.txt') do |scorecards|
  scorecards.read.each_line do |scorecard|
    site_id, org_name, vertical, total_records, wrong_address_count, invalid_address_count, deceased_count,
        do_not_mail_count, missing_birthday_count, missing_email_count, missing_phone_number_count,
        missing_gender_count  = scorecard.chomp.split('|')

    Scorecard.create!(
        :site_id => site_id,
        :org_name => org_name,
        :vertical => vertical,
        :total_records => total_records,
        :wrong_address_count => wrong_address_count,
        :invalid_address_count => invalid_address_count,
        :deceased_count => deceased_count,
        :do_not_mail_count => do_not_mail_count,
        :missing_birthday_count => missing_birthday_count,
        :missing_email_count => missing_email_count,
        :missing_phone_number_count => missing_phone_number_count,
        :missing_gender_count => missing_gender_count
    )
  end
end