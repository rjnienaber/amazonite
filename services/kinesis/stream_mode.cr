private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum StreamMode
    Provisioned
    OnDemand

    def self.to_json(e : StreamMode, json : JSON::Builder) : Nil
      value = case e
              when AK::StreamMode::Provisioned then "PROVISIONED"
              when AK::StreamMode::OnDemand    then "ON_DEMAND"
              else
                raise Exception.new("unknown enum value for 'StreamMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::StreamMode
      value = pull.read_string
      case value
      when "PROVISIONED" then AK::StreamMode::Provisioned
      when "ON_DEMAND"   then AK::StreamMode::OnDemand
      else
        raise Exception.new("unknown enum value for 'StreamMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::StreamMode::Provisioned then "PROVISIONED"
      when AK::StreamMode::OnDemand    then "ON_DEMAND"
      else
        raise Exception.new("unknown enum value for 'StreamMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::StreamMode?
      case key
      when "PROVISIONED" then AK::StreamMode::Provisioned
      when "ON_DEMAND"   then AK::StreamMode::OnDemand
      else
        nil
      end
    end
  end
end
