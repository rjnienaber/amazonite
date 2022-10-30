private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ReturnValue
    None
    AllOld
    UpdatedOld
    AllNew
    UpdatedNew

    def self.to_json(e : ReturnValue, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReturnValue::None       then "NONE"
              when ADDB::ReturnValue::AllOld     then "ALL_OLD"
              when ADDB::ReturnValue::UpdatedOld then "UPDATED_OLD"
              when ADDB::ReturnValue::AllNew     then "ALL_NEW"
              when ADDB::ReturnValue::UpdatedNew then "UPDATED_NEW"
              else
                raise Exception.new("unknown enum value for 'ReturnValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ReturnValue
      value = pull.read_string
      case value
      when "NONE"        then ADDB::ReturnValue::None
      when "ALL_OLD"     then ADDB::ReturnValue::AllOld
      when "UPDATED_OLD" then ADDB::ReturnValue::UpdatedOld
      when "ALL_NEW"     then ADDB::ReturnValue::AllNew
      when "UPDATED_NEW" then ADDB::ReturnValue::UpdatedNew
      else
        raise Exception.new("unknown enum value for 'ReturnValue' when deserializing from json: '#{value}'")
      end
    end
  end
end
