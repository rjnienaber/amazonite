private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamNetworkInterfaceAttachmentStatus
    Available
    InUse

    def self.to_json(e : IpamNetworkInterfaceAttachmentStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamNetworkInterfaceAttachmentStatus::Available then "available"
              when AEC::IpamNetworkInterfaceAttachmentStatus::InUse     then "in-use"
              else
                raise Exception.new("unknown enum value for 'IpamNetworkInterfaceAttachmentStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamNetworkInterfaceAttachmentStatus
      value = pull.read_string
      case value
      when "available" then AEC::IpamNetworkInterfaceAttachmentStatus::Available
      when "in-use"    then AEC::IpamNetworkInterfaceAttachmentStatus::InUse
      else
        raise Exception.new("unknown enum value for 'IpamNetworkInterfaceAttachmentStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamNetworkInterfaceAttachmentStatus::Available then "available"
      when AEC::IpamNetworkInterfaceAttachmentStatus::InUse     then "in-use"
      else
        raise Exception.new("unknown enum value for 'IpamNetworkInterfaceAttachmentStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamNetworkInterfaceAttachmentStatus?
      case key
      when "available" then AEC::IpamNetworkInterfaceAttachmentStatus::Available
      when "in-use"    then AEC::IpamNetworkInterfaceAttachmentStatus::InUse
      else
        nil
      end
    end
  end
end
