private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficType
    Accept
    Reject
    All

    def self.to_json(e : TrafficType, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficType::Accept then "ACCEPT"
              when AEC::TrafficType::Reject then "REJECT"
              when AEC::TrafficType::All    then "ALL"
              else
                raise Exception.new("unknown enum value for 'TrafficType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficType
      value = pull.read_string
      case value
      when "ACCEPT" then AEC::TrafficType::Accept
      when "REJECT" then AEC::TrafficType::Reject
      when "ALL"    then AEC::TrafficType::All
      else
        raise Exception.new("unknown enum value for 'TrafficType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficType::Accept then "ACCEPT"
      when AEC::TrafficType::Reject then "REJECT"
      when AEC::TrafficType::All    then "ALL"
      else
        raise Exception.new("unknown enum value for 'TrafficType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficType?
      case key
      when "ACCEPT" then AEC::TrafficType::Accept
      when "REJECT" then AEC::TrafficType::Reject
      when "ALL"    then AEC::TrafficType::All
      else
        nil
      end
    end
  end
end
