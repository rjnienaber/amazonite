private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NetworkInterfaceCreationType
    Efa
    EfaOnly
    Branch
    Trunk

    def self.to_json(e : NetworkInterfaceCreationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::NetworkInterfaceCreationType::Efa     then "efa"
              when AEC::NetworkInterfaceCreationType::EfaOnly then "efa-only"
              when AEC::NetworkInterfaceCreationType::Branch  then "branch"
              when AEC::NetworkInterfaceCreationType::Trunk   then "trunk"
              else
                raise Exception.new("unknown enum value for 'NetworkInterfaceCreationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NetworkInterfaceCreationType
      value = pull.read_string
      case value
      when "efa"      then AEC::NetworkInterfaceCreationType::Efa
      when "efa-only" then AEC::NetworkInterfaceCreationType::EfaOnly
      when "branch"   then AEC::NetworkInterfaceCreationType::Branch
      when "trunk"    then AEC::NetworkInterfaceCreationType::Trunk
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceCreationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NetworkInterfaceCreationType::Efa     then "efa"
      when AEC::NetworkInterfaceCreationType::EfaOnly then "efa-only"
      when AEC::NetworkInterfaceCreationType::Branch  then "branch"
      when AEC::NetworkInterfaceCreationType::Trunk   then "trunk"
      else
        raise Exception.new("unknown enum value for 'NetworkInterfaceCreationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NetworkInterfaceCreationType?
      case key
      when "efa"      then AEC::NetworkInterfaceCreationType::Efa
      when "efa-only" then AEC::NetworkInterfaceCreationType::EfaOnly
      when "branch"   then AEC::NetworkInterfaceCreationType::Branch
      when "trunk"    then AEC::NetworkInterfaceCreationType::Trunk
      else
        nil
      end
    end
  end
end
