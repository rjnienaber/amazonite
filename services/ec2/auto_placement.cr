private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AutoPlacement
    On
    Off

    def self.to_json(e : AutoPlacement, json : JSON::Builder) : Nil
      value = case e
              when AEC::AutoPlacement::On  then "on"
              when AEC::AutoPlacement::Off then "off"
              else
                raise Exception.new("unknown enum value for 'AutoPlacement' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AutoPlacement
      value = pull.read_string
      case value
      when "on"  then AEC::AutoPlacement::On
      when "off" then AEC::AutoPlacement::Off
      else
        raise Exception.new("unknown enum value for 'AutoPlacement' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AutoPlacement::On  then "on"
      when AEC::AutoPlacement::Off then "off"
      else
        raise Exception.new("unknown enum value for 'AutoPlacement' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AutoPlacement?
      case key
      when "on"  then AEC::AutoPlacement::On
      when "off" then AEC::AutoPlacement::Off
      else
        nil
      end
    end
  end
end
