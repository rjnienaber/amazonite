private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AvailabilityZoneOptInStatus
    OptInNotRequired
    OptedIn
    NotOptedIn

    def self.to_json(e : AvailabilityZoneOptInStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::AvailabilityZoneOptInStatus::OptInNotRequired then "opt-in-not-required"
              when AEC::AvailabilityZoneOptInStatus::OptedIn          then "opted-in"
              when AEC::AvailabilityZoneOptInStatus::NotOptedIn       then "not-opted-in"
              else
                raise Exception.new("unknown enum value for 'AvailabilityZoneOptInStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AvailabilityZoneOptInStatus
      value = pull.read_string
      case value
      when "opt-in-not-required" then AEC::AvailabilityZoneOptInStatus::OptInNotRequired
      when "opted-in"            then AEC::AvailabilityZoneOptInStatus::OptedIn
      when "not-opted-in"        then AEC::AvailabilityZoneOptInStatus::NotOptedIn
      else
        raise Exception.new("unknown enum value for 'AvailabilityZoneOptInStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AvailabilityZoneOptInStatus::OptInNotRequired then "opt-in-not-required"
      when AEC::AvailabilityZoneOptInStatus::OptedIn          then "opted-in"
      when AEC::AvailabilityZoneOptInStatus::NotOptedIn       then "not-opted-in"
      else
        raise Exception.new("unknown enum value for 'AvailabilityZoneOptInStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AvailabilityZoneOptInStatus?
      case key
      when "opt-in-not-required" then AEC::AvailabilityZoneOptInStatus::OptInNotRequired
      when "opted-in"            then AEC::AvailabilityZoneOptInStatus::OptedIn
      when "not-opted-in"        then AEC::AvailabilityZoneOptInStatus::NotOptedIn
      else
        nil
      end
    end
  end
end
