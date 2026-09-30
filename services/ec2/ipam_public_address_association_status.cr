private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamPublicAddressAssociationStatus
    Associated
    Disassociated

    def self.to_json(e : IpamPublicAddressAssociationStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamPublicAddressAssociationStatus::Associated    then "associated"
              when AEC::IpamPublicAddressAssociationStatus::Disassociated then "disassociated"
              else
                raise Exception.new("unknown enum value for 'IpamPublicAddressAssociationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamPublicAddressAssociationStatus
      value = pull.read_string
      case value
      when "associated"    then AEC::IpamPublicAddressAssociationStatus::Associated
      when "disassociated" then AEC::IpamPublicAddressAssociationStatus::Disassociated
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressAssociationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamPublicAddressAssociationStatus::Associated    then "associated"
      when AEC::IpamPublicAddressAssociationStatus::Disassociated then "disassociated"
      else
        raise Exception.new("unknown enum value for 'IpamPublicAddressAssociationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamPublicAddressAssociationStatus?
      case key
      when "associated"    then AEC::IpamPublicAddressAssociationStatus::Associated
      when "disassociated" then AEC::IpamPublicAddressAssociationStatus::Disassociated
      else
        nil
      end
    end
  end
end
