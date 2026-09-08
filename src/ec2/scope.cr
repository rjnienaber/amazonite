private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Scope
    AvailabilityZone
    Region

    def self.to_json(e : Scope, json : JSON::Builder) : Nil
      value = case e
              when AEC::Scope::AvailabilityZone then "Availability Zone"
              when AEC::Scope::Region           then "Region"
              else
                raise Exception.new("unknown enum value for 'Scope' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Scope
      value = pull.read_string
      case value
      when "Availability Zone" then AEC::Scope::AvailabilityZone
      when "Region"            then AEC::Scope::Region
      else
        raise Exception.new("unknown enum value for 'Scope' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Scope::AvailabilityZone then "Availability Zone"
      when AEC::Scope::Region           then "Region"
      else
        raise Exception.new("unknown enum value for 'Scope' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Scope?
      case key
      when "Availability Zone" then AEC::Scope::AvailabilityZone
      when "Region"            then AEC::Scope::Region
      else
        nil
      end
    end
  end
end
