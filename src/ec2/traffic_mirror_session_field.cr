private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum TrafficMirrorSessionField
    PacketLength
    Description
    VirtualNetworkId

    def self.to_json(e : TrafficMirrorSessionField, json : JSON::Builder) : Nil
      value = case e
              when AEC::TrafficMirrorSessionField::PacketLength     then "packet-length"
              when AEC::TrafficMirrorSessionField::Description      then "description"
              when AEC::TrafficMirrorSessionField::VirtualNetworkId then "virtual-network-id"
              else
                raise Exception.new("unknown enum value for 'TrafficMirrorSessionField' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::TrafficMirrorSessionField
      value = pull.read_string
      case value
      when "packet-length"      then AEC::TrafficMirrorSessionField::PacketLength
      when "description"        then AEC::TrafficMirrorSessionField::Description
      when "virtual-network-id" then AEC::TrafficMirrorSessionField::VirtualNetworkId
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorSessionField' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::TrafficMirrorSessionField::PacketLength     then "packet-length"
      when AEC::TrafficMirrorSessionField::Description      then "description"
      when AEC::TrafficMirrorSessionField::VirtualNetworkId then "virtual-network-id"
      else
        raise Exception.new("unknown enum value for 'TrafficMirrorSessionField' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::TrafficMirrorSessionField?
      case key
      when "packet-length"      then AEC::TrafficMirrorSessionField::PacketLength
      when "description"        then AEC::TrafficMirrorSessionField::Description
      when "virtual-network-id" then AEC::TrafficMirrorSessionField::VirtualNetworkId
      else
        nil
      end
    end
  end
end
