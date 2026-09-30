private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum RouteServerRouteInstallationStatus
    Installed
    Rejected

    def self.to_json(e : RouteServerRouteInstallationStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::RouteServerRouteInstallationStatus::Installed then "installed"
              when AEC::RouteServerRouteInstallationStatus::Rejected  then "rejected"
              else
                raise Exception.new("unknown enum value for 'RouteServerRouteInstallationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::RouteServerRouteInstallationStatus
      value = pull.read_string
      case value
      when "installed" then AEC::RouteServerRouteInstallationStatus::Installed
      when "rejected"  then AEC::RouteServerRouteInstallationStatus::Rejected
      else
        raise Exception.new("unknown enum value for 'RouteServerRouteInstallationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::RouteServerRouteInstallationStatus::Installed then "installed"
      when AEC::RouteServerRouteInstallationStatus::Rejected  then "rejected"
      else
        raise Exception.new("unknown enum value for 'RouteServerRouteInstallationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::RouteServerRouteInstallationStatus?
      case key
      when "installed" then AEC::RouteServerRouteInstallationStatus::Installed
      when "rejected"  then AEC::RouteServerRouteInstallationStatus::Rejected
      else
        nil
      end
    end
  end
end
