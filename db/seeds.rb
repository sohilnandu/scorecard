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
        missing_birthday_count, missing_email_count, missing_phone_number_count,
        missing_gender_count  = scorecard.chomp.split('|')

    total_records_float = total_records.to_f

    Scorecard.create!(
        :site_id => site_id,
        :org_name => org_name,
        :vertical => vertical,
        :total_records => total_records,
        :wrong_address_count => wrong_address_count,
        :wrong_address_percent => '%.2f' % (wrong_address_count.to_i / total_records_float),
        :invalid_address_count => invalid_address_count,
        :invalid_address_percent => '%.2f' % (invalid_address_count.to_i / total_records_float),
        :deceased_count => deceased_count,
        :deceased_percent => '%.2f' % (deceased_count.to_i / total_records_float),
        :missing_birthday_count => missing_birthday_count,
        :missing_birthday_percent => '%.2f' % (missing_birthday_count.to_i / total_records_float),
        :missing_email_count => missing_email_count,
        :missing_email_percent => '%.2f' % (missing_email_count.to_i / total_records_float),
        :missing_phone_number_count => missing_phone_number_count,
        :missing_phone_number_percent => '%.2f' % (missing_phone_number_count.to_i / total_records_float),
        :missing_gender_count => missing_gender_count,
        :missing_gender_percent => '%.2f' % (missing_gender_count.to_i / total_records_float)
    )
  end
end