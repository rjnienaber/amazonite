private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AvailabilityMode
    Zonal
    Regional

    def self.to_json(e : AvailabilityMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::AvailabilityMode::Zonal    then "zonal"
              when AEC::AvailabilityMode::Regional then "regional"
              else
                raise Exception.new("unknown enum value for 'AvailabilityMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AvailabilityMode
      value = pull.read_string
      case value
      when "zonal"    then AEC::AvailabilityMode::Zonal
      when "regional" then AEC::AvailabilityMode::Regional
      else
        raise Exception.new("unknown enum value for 'AvailabilityMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AvailabilityMode::Zonal    then "zonal"
      when AEC::AvailabilityMode::Regional then "regional"
      else
        raise Exception.new("unknown enum value for 'AvailabilityMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AvailabilityMode?
      case key
      when "zonal"    then AEC::AvailabilityMode::Zonal
      when "regional" then AEC::AvailabilityMode::Regional
      else
        nil
      end
    end
  end
end
