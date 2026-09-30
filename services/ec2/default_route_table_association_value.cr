private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DefaultRouteTableAssociationValue
    Enable
    Disable

    def self.to_json(e : DefaultRouteTableAssociationValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::DefaultRouteTableAssociationValue::Enable  then "enable"
              when AEC::DefaultRouteTableAssociationValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'DefaultRouteTableAssociationValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DefaultRouteTableAssociationValue
      value = pull.read_string
      case value
      when "enable"  then AEC::DefaultRouteTableAssociationValue::Enable
      when "disable" then AEC::DefaultRouteTableAssociationValue::Disable
      else
        raise Exception.new("unknown enum value for 'DefaultRouteTableAssociationValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DefaultRouteTableAssociationValue::Enable  then "enable"
      when AEC::DefaultRouteTableAssociationValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'DefaultRouteTableAssociationValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DefaultRouteTableAssociationValue?
      case key
      when "enable"  then AEC::DefaultRouteTableAssociationValue::Enable
      when "disable" then AEC::DefaultRouteTableAssociationValue::Disable
      else
        nil
      end
    end
  end
end
