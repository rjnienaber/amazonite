private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ModifyAvailabilityZoneOptInStatus
    OptedIn
    NotOptedIn

    def self.to_json(e : ModifyAvailabilityZoneOptInStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::ModifyAvailabilityZoneOptInStatus::OptedIn    then "opted-in"
              when AEC::ModifyAvailabilityZoneOptInStatus::NotOptedIn then "not-opted-in"
              else
                raise Exception.new("unknown enum value for 'ModifyAvailabilityZoneOptInStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ModifyAvailabilityZoneOptInStatus
      value = pull.read_string
      case value
      when "opted-in"     then AEC::ModifyAvailabilityZoneOptInStatus::OptedIn
      when "not-opted-in" then AEC::ModifyAvailabilityZoneOptInStatus::NotOptedIn
      else
        raise Exception.new("unknown enum value for 'ModifyAvailabilityZoneOptInStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ModifyAvailabilityZoneOptInStatus::OptedIn    then "opted-in"
      when AEC::ModifyAvailabilityZoneOptInStatus::NotOptedIn then "not-opted-in"
      else
        raise Exception.new("unknown enum value for 'ModifyAvailabilityZoneOptInStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ModifyAvailabilityZoneOptInStatus?
      case key
      when "opted-in"     then AEC::ModifyAvailabilityZoneOptInStatus::OptedIn
      when "not-opted-in" then AEC::ModifyAvailabilityZoneOptInStatus::NotOptedIn
      else
        nil
      end
    end
  end
end
