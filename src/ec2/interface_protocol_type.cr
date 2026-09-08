private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InterfaceProtocolType
    Vlan
    Gre

    def self.to_json(e : InterfaceProtocolType, json : JSON::Builder) : Nil
      value = case e
              when AEC::InterfaceProtocolType::Vlan then "VLAN"
              when AEC::InterfaceProtocolType::Gre  then "GRE"
              else
                raise Exception.new("unknown enum value for 'InterfaceProtocolType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InterfaceProtocolType
      value = pull.read_string
      case value
      when "VLAN" then AEC::InterfaceProtocolType::Vlan
      when "GRE"  then AEC::InterfaceProtocolType::Gre
      else
        raise Exception.new("unknown enum value for 'InterfaceProtocolType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InterfaceProtocolType::Vlan then "VLAN"
      when AEC::InterfaceProtocolType::Gre  then "GRE"
      else
        raise Exception.new("unknown enum value for 'InterfaceProtocolType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InterfaceProtocolType?
      case key
      when "VLAN" then AEC::InterfaceProtocolType::Vlan
      when "GRE"  then AEC::InterfaceProtocolType::Gre
      else
        nil
      end
    end
  end
end
