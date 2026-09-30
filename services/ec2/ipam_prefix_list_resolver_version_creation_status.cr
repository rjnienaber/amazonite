private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPrefixListResolverVersionCreationStatus
    Pending
    Success
    Failure

    def self.to_json(e : IpamPrefixListResolverVersionCreationStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPrefixListResolverVersionCreationStatus::Pending then "pending"
              when AEC::IpamPrefixListResolverVersionCreationStatus::Success then "success"
              when AEC::IpamPrefixListResolverVersionCreationStatus::Failure then "failure"
              else
                raise Exception.new("unknown enum value for 'IpamPrefixListResolverVersionCreationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPrefixListResolverVersionCreationStatus
      value = pull.read_string
      case value
      when "pending" then AEC::IpamPrefixListResolverVersionCreationStatus::Pending
      when "success" then AEC::IpamPrefixListResolverVersionCreationStatus::Success
      when "failure" then AEC::IpamPrefixListResolverVersionCreationStatus::Failure
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverVersionCreationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPrefixListResolverVersionCreationStatus::Pending then "pending"
      when AEC::IpamPrefixListResolverVersionCreationStatus::Success then "success"
      when AEC::IpamPrefixListResolverVersionCreationStatus::Failure then "failure"
      else
        raise Exception.new("unknown enum value for 'IpamPrefixListResolverVersionCreationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPrefixListResolverVersionCreationStatus?
      case key
      when "pending" then AEC::IpamPrefixListResolverVersionCreationStatus::Pending
      when "success" then AEC::IpamPrefixListResolverVersionCreationStatus::Success
      when "failure" then AEC::IpamPrefixListResolverVersionCreationStatus::Failure
      else
        nil
      end
    end
  end
end
