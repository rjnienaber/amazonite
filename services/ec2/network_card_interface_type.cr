private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkCardInterfaceType
    Interface
    Efa
    EfaOnly
    Secondary

    def self.to_json(e : NetworkCardInterfaceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkCardInterfaceType::Interface then "interface"
              when AEC::NetworkCardInterfaceType::Efa       then "efa"
              when AEC::NetworkCardInterfaceType::EfaOnly   then "efa-only"
              when AEC::NetworkCardInterfaceType::Secondary then "secondary"
              else
                raise Exception.new("unknown enum value for 'NetworkCardInterfaceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkCardInterfaceType
      value = pull.read_string
      case value
      when "interface" then AEC::NetworkCardInterfaceType::Interface
      when "efa"       then AEC::NetworkCardInterfaceType::Efa
      when "efa-only"  then AEC::NetworkCardInterfaceType::EfaOnly
      when "secondary" then AEC::NetworkCardInterfaceType::Secondary
      else
        raise Exception.new("unknown enum value for 'NetworkCardInterfaceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkCardInterfaceType::Interface then "interface"
      when AEC::NetworkCardInterfaceType::Efa       then "efa"
      when AEC::NetworkCardInterfaceType::EfaOnly   then "efa-only"
      when AEC::NetworkCardInterfaceType::Secondary then "secondary"
      else
        raise Exception.new("unknown enum value for 'NetworkCardInterfaceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkCardInterfaceType?
      case key
      when "interface" then AEC::NetworkCardInterfaceType::Interface
      when "efa"       then AEC::NetworkCardInterfaceType::Efa
      when "efa-only"  then AEC::NetworkCardInterfaceType::EfaOnly
      when "secondary" then AEC::NetworkCardInterfaceType::Secondary
      else
        nil
      end
    end
  end
end
