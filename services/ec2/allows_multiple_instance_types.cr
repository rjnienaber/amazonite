private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AllowsMultipleInstanceTypes
    On
    Off

    def self.to_json(e : AllowsMultipleInstanceTypes, json : JSON::Builder) : Nil
      value = case e
              when AEC::AllowsMultipleInstanceTypes::On  then "on"
              when AEC::AllowsMultipleInstanceTypes::Off then "off"
              else
                raise Exception.new("unknown enum value for 'AllowsMultipleInstanceTypes' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AllowsMultipleInstanceTypes
      value = pull.read_string
      case value
      when "on"  then AEC::AllowsMultipleInstanceTypes::On
      when "off" then AEC::AllowsMultipleInstanceTypes::Off
      else
        raise Exception.new("unknown enum value for 'AllowsMultipleInstanceTypes' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AllowsMultipleInstanceTypes::On  then "on"
      when AEC::AllowsMultipleInstanceTypes::Off then "off"
      else
        raise Exception.new("unknown enum value for 'AllowsMultipleInstanceTypes' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AllowsMultipleInstanceTypes?
      case key
      when "on"  then AEC::AllowsMultipleInstanceTypes::On
      when "off" then AEC::AllowsMultipleInstanceTypes::Off
      else
        nil
      end
    end
  end
end
