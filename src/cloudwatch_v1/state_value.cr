private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum StateValue
    Ok
    Alarm
    InsufficientData

    def self.to_json(e : StateValue, json : JSON::Builder) : Nil
      value = case e
              when ACW::StateValue::Ok               then "OK"
              when ACW::StateValue::Alarm            then "ALARM"
              when ACW::StateValue::InsufficientData then "INSUFFICIENT_DATA"
              else
                raise Exception.new("unknown enum value for 'StateValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::StateValue
      value = pull.read_string
      case value
      when "OK"                then ACW::StateValue::Ok
      when "ALARM"             then ACW::StateValue::Alarm
      when "INSUFFICIENT_DATA" then ACW::StateValue::InsufficientData
      else
        raise Exception.new("unknown enum value for 'StateValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::StateValue::Ok               then "OK"
      when ACW::StateValue::Alarm            then "ALARM"
      when ACW::StateValue::InsufficientData then "INSUFFICIENT_DATA"
      else
        raise Exception.new("unknown enum value for 'StateValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::StateValue?
      case key
      when "OK"                then ACW::StateValue::Ok
      when "ALARM"             then ACW::StateValue::Alarm
      when "INSUFFICIENT_DATA" then ACW::StateValue::InsufficientData
      else
        nil
      end
    end
  end
end
