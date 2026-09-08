private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LocationType
    Region
    AvailabilityZone
    AvailabilityZoneId
    Outpost

    def self.to_json(e : LocationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::LocationType::Region             then "region"
              when AEC::LocationType::AvailabilityZone   then "availability-zone"
              when AEC::LocationType::AvailabilityZoneId then "availability-zone-id"
              when AEC::LocationType::Outpost            then "outpost"
              else
                raise Exception.new("unknown enum value for 'LocationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LocationType
      value = pull.read_string
      case value
      when "region"               then AEC::LocationType::Region
      when "availability-zone"    then AEC::LocationType::AvailabilityZone
      when "availability-zone-id" then AEC::LocationType::AvailabilityZoneId
      when "outpost"              then AEC::LocationType::Outpost
      else
        raise Exception.new("unknown enum value for 'LocationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LocationType::Region             then "region"
      when AEC::LocationType::AvailabilityZone   then "availability-zone"
      when AEC::LocationType::AvailabilityZoneId then "availability-zone-id"
      when AEC::LocationType::Outpost            then "outpost"
      else
        raise Exception.new("unknown enum value for 'LocationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LocationType?
      case key
      when "region"               then AEC::LocationType::Region
      when "availability-zone"    then AEC::LocationType::AvailabilityZone
      when "availability-zone-id" then AEC::LocationType::AvailabilityZoneId
      when "outpost"              then AEC::LocationType::Outpost
      else
        nil
      end
    end
  end
end
