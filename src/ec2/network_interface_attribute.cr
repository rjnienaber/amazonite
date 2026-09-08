private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkInterfaceAttribute
    Description
    GroupSet
    SourceDestCheck
    Attachment
    AssociatePublicIpAddress

    def self.to_json(e : NetworkInterfaceAttribute, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkInterfaceAttribute::Description              then "description"
              when AEC::NetworkInterfaceAttribute::GroupSet                 then "groupSet"
              when AEC::NetworkInterfaceAttribute::SourceDestCheck          then "sourceDestCheck"
              when AEC::NetworkInterfaceAttribute::Attachment               then "attachment"
              when AEC::NetworkInterfaceAttribute::AssociatePublicIpAddress then "associatePublicIpAddress"
              else
                raise Exception.new("unknown enum value for 'NetworkInterfaceAttribute' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkInterfaceAttribute
      value = pull.read_string
      case value
      when "description"              then AEC::NetworkInterfaceAttribute::Description
      when "groupSet"                 then AEC::NetworkInterfaceAttribute::GroupSet
      when "sourceDestCheck"          then AEC::NetworkInterfaceAttribute::SourceDestCheck
      when "attachment"               then AEC::NetworkInterfaceAttribute::Attachment
      when "associatePublicIpAddress" then AEC::NetworkInterfaceAttribute::AssociatePublicIpAddress
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceAttribute' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkInterfaceAttribute::Description              then "description"
      when AEC::NetworkInterfaceAttribute::GroupSet                 then "groupSet"
      when AEC::NetworkInterfaceAttribute::SourceDestCheck          then "sourceDestCheck"
      when AEC::NetworkInterfaceAttribute::Attachment               then "attachment"
      when AEC::NetworkInterfaceAttribute::AssociatePublicIpAddress then "associatePublicIpAddress"
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceAttribute' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkInterfaceAttribute?
      case key
      when "description"              then AEC::NetworkInterfaceAttribute::Description
      when "groupSet"                 then AEC::NetworkInterfaceAttribute::GroupSet
      when "sourceDestCheck"          then AEC::NetworkInterfaceAttribute::SourceDestCheck
      when "attachment"               then AEC::NetworkInterfaceAttribute::Attachment
      when "associatePublicIpAddress" then AEC::NetworkInterfaceAttribute::AssociatePublicIpAddress
      else
        nil
      end
    end
  end
end
