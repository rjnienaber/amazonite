private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum EventSourcePosition
    TrimHorizon
    Latest
    AtTimestamp

    def self.to_json(e : EventSourcePosition, json : JSON::Builder) : Nil
      value = case e
              when AL::EventSourcePosition::TrimHorizon then "TRIM_HORIZON"
              when AL::EventSourcePosition::Latest      then "LATEST"
              when AL::EventSourcePosition::AtTimestamp then "AT_TIMESTAMP"
              else
                raise Exception.new("unknown enum value for 'EventSourcePosition' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::EventSourcePosition
      value = pull.read_string
      case value
      when "TRIM_HORIZON" then AL::EventSourcePosition::TrimHorizon
      when "LATEST"       then AL::EventSourcePosition::Latest
      when "AT_TIMESTAMP" then AL::EventSourcePosition::AtTimestamp
      else
        raise Exception.new("unknown enum value for 'EventSourcePosition' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::EventSourcePosition::TrimHorizon then "TRIM_HORIZON"
      when AL::EventSourcePosition::Latest      then "LATEST"
      when AL::EventSourcePosition::AtTimestamp then "AT_TIMESTAMP"
      else
        raise Exception.new("unknown enum value for 'EventSourcePosition' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::EventSourcePosition?
      case key
      when "TRIM_HORIZON" then AL::EventSourcePosition::TrimHorizon
      when "LATEST"       then AL::EventSourcePosition::Latest
      when "AT_TIMESTAMP" then AL::EventSourcePosition::AtTimestamp
      else
        nil
      end
    end
  end
end
