private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SecondaryInterfaceType
    Secondary

    def self.to_json(e : SecondaryInterfaceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SecondaryInterfaceType::Secondary then "secondary"
              else
                raise Exception.new("unknown enum value for 'SecondaryInterfaceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SecondaryInterfaceType
      value = pull.read_string
      case value
      when "secondary" then AEC::SecondaryInterfaceType::Secondary
      else
        raise Exception.new("unknown enum value for 'SecondaryInterfaceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SecondaryInterfaceType::Secondary then "secondary"
      else
        raise Exception.new("unknown enum value for 'SecondaryInterfaceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SecondaryInterfaceType?
      case key
      when "secondary" then AEC::SecondaryInterfaceType::Secondary
      else
        nil
      end
    end
  end
end
