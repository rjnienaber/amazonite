private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum StatusName
    Reachability

    def self.to_json(e : StatusName, json : JSON::Builder) : Nil
      value = case e
              when AEC::StatusName::Reachability then "reachability"
              else
                raise Exception.new("unknown enum value for 'StatusName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::StatusName
      value = pull.read_string
      case value
      when "reachability" then AEC::StatusName::Reachability
      else
        raise Exception.new("unknown enum value for 'StatusName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::StatusName::Reachability then "reachability"
      else
        raise Exception.new("unknown enum value for 'StatusName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::StatusName?
      case key
      when "reachability" then AEC::StatusName::Reachability
      else
        nil
      end
    end
  end
end
