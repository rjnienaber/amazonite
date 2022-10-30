private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ContributorInsightsAction
    Enable
    Disable

    def self.to_json(e : ContributorInsightsAction, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ContributorInsightsAction::Enable  then "ENABLE"
              when ADDB::ContributorInsightsAction::Disable then "DISABLE"
              else
                raise Exception.new("unknown enum value for 'ContributorInsightsAction' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ContributorInsightsAction
      value = pull.read_string
      case value
      when "ENABLE"  then ADDB::ContributorInsightsAction::Enable
      when "DISABLE" then ADDB::ContributorInsightsAction::Disable
      else
        raise Exception.new("unknown enum value for 'ContributorInsightsAction' when deserializing from json: '#{value}'")
      end
    end
  end
end
