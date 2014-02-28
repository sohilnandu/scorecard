class Scorecard < ActiveRecord::Base
  include JSON
  extend FriendlyId
  friendly_id :site_id

  validates_uniqueness_of :site_id

  attr_accessor(
      :total_records,
      :vertical,
      :wrong_address_count,
      :invalid_address_count,
      :deceased_count,
      :do_not_mail_count,
      :missing_birthday_count,
      :missing_email_count,
      :missing_phone_number_count,
      :missing_gender_count,
      :financial_impact_total
  )

  def init_data
    json_data = JSON.parse(data)
    @total_records = json_data['totalRecords']
    @vertical = json_data['vertical']
    @wrong_address_count = json_data['wrongAddressCount']
    @invalid_address_count = json_data['invalidAddressCount']
    @deceased_count = json_data['deceasedCount']
    @do_not_mail_count = json_data['doNotMailCount']
    @missing_birthday_count = json_data['missingBirthdayCount']
    @missing_email_count = json_data['missingEmailCount']
    @missing_phone_number_count = json_data['missingPhoneNumberCount']
    @missing_gender_count = json_data['missingGenderCount']

    if not @invalid_address_count.nil? and not @wrong_address_count.nil? and not @deceased_count.nil?
      @financial_impact_total = @invalid_address_count + @wrong_address_count + @deceased_count
    else
      @financial_impact_total = nil
    end
  end
end
