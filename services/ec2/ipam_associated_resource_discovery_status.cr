private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamAssociatedResourceDiscoveryStatus
    Active
    NotFound

    def self.to_json(e : IpamAssociatedResourceDiscoveryStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamAssociatedResourceDiscoveryStatus::Active   then "active"
              when AEC::IpamAssociatedResourceDiscoveryStatus::NotFound then "not-found"
              else
                raise Exception.new("unknown enum value for 'IpamAssociatedResourceDiscoveryStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamAssociatedResourceDiscoveryStatus
      value = pull.read_string
      case value
      when "active"    then AEC::IpamAssociatedResourceDiscoveryStatus::Active
      when "not-found" then AEC::IpamAssociatedResourceDiscoveryStatus::NotFound
      else
        raise Exception.new("unknown enum value for 'IpamAssociatedResourceDiscoveryStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamAssociatedResourceDiscoveryStatus::Active   then "active"
      when AEC::IpamAssociatedResourceDiscoveryStatus::NotFound then "not-found"
      else
        raise Exception.new("unknown enum value for 'IpamAssociatedResourceDiscoveryStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamAssociatedResourceDiscoveryStatus?
      case key
      when "active"    then AEC::IpamAssociatedResourceDiscoveryStatus::Active
      when "not-found" then AEC::IpamAssociatedResourceDiscoveryStatus::NotFound
      else
        nil
      end
    end
  end
end
