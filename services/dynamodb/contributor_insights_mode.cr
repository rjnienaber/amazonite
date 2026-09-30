private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum ContributorInsightsMode
    AccessedAndThrottledKeys
    ThrottledKeys

    def self.to_json(e : ContributorInsightsMode, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ContributorInsightsMode::AccessedAndThrottledKeys then "ACCESSED_AND_THROTTLED_KEYS"
              when ADDB::ContributorInsightsMode::ThrottledKeys            then "THROTTLED_KEYS"
              else
                raise Exception.new("unknown enum value for 'ContributorInsightsMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ContributorInsightsMode
      value = pull.read_string
      case value
      when "ACCESSED_AND_THROTTLED_KEYS" then ADDB::ContributorInsightsMode::AccessedAndThrottledKeys
      when "THROTTLED_KEYS"              then ADDB::ContributorInsightsMode::ThrottledKeys
      else
        raise Exception.new("unknown enum value for 'ContributorInsightsMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ContributorInsightsMode::AccessedAndThrottledKeys then "ACCESSED_AND_THROTTLED_KEYS"
      when ADDB::ContributorInsightsMode::ThrottledKeys            then "THROTTLED_KEYS"
      else
        raise Exception.new("unknown enum value for 'ContributorInsightsMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ContributorInsightsMode?
      case key
      when "ACCESSED_AND_THROTTLED_KEYS" then ADDB::ContributorInsightsMode::AccessedAndThrottledKeys
      when "THROTTLED_KEYS"              then ADDB::ContributorInsightsMode::ThrottledKeys
      else
        nil
      end
    end
  end
end
