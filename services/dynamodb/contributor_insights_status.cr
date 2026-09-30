private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum ContributorInsightsStatus
    Enabling
    Enabled
    Disabling
    Disabled
    Failed

    def self.to_json(e : ContributorInsightsStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ContributorInsightsStatus::Enabling  then "ENABLING"
              when ADDB::ContributorInsightsStatus::Enabled   then "ENABLED"
              when ADDB::ContributorInsightsStatus::Disabling then "DISABLING"
              when ADDB::ContributorInsightsStatus::Disabled  then "DISABLED"
              when ADDB::ContributorInsightsStatus::Failed    then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ContributorInsightsStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ContributorInsightsStatus
      value = pull.read_string
      case value
      when "ENABLING"  then ADDB::ContributorInsightsStatus::Enabling
      when "ENABLED"   then ADDB::ContributorInsightsStatus::Enabled
      when "DISABLING" then ADDB::ContributorInsightsStatus::Disabling
      when "DISABLED"  then ADDB::ContributorInsightsStatus::Disabled
      when "FAILED"    then ADDB::ContributorInsightsStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ContributorInsightsStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ContributorInsightsStatus::Enabling  then "ENABLING"
      when ADDB::ContributorInsightsStatus::Enabled   then "ENABLED"
      when ADDB::ContributorInsightsStatus::Disabling then "DISABLING"
      when ADDB::ContributorInsightsStatus::Disabled  then "DISABLED"
      when ADDB::ContributorInsightsStatus::Failed    then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ContributorInsightsStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ContributorInsightsStatus?
      case key
      when "ENABLING"  then ADDB::ContributorInsightsStatus::Enabling
      when "ENABLED"   then ADDB::ContributorInsightsStatus::Enabled
      when "DISABLING" then ADDB::ContributorInsightsStatus::Disabling
      when "DISABLED"  then ADDB::ContributorInsightsStatus::Disabled
      when "FAILED"    then ADDB::ContributorInsightsStatus::Failed
      else
        nil
      end
    end
  end
end
