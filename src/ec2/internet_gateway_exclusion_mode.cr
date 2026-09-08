private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InternetGatewayExclusionMode
    AllowBidirectional
    AllowEgress

    def self.to_json(e : InternetGatewayExclusionMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::InternetGatewayExclusionMode::AllowBidirectional then "allow-bidirectional"
              when AEC::InternetGatewayExclusionMode::AllowEgress        then "allow-egress"
              else
                raise Exception.new("unknown enum value for 'InternetGatewayExclusionMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InternetGatewayExclusionMode
      value = pull.read_string
      case value
      when "allow-bidirectional" then AEC::InternetGatewayExclusionMode::AllowBidirectional
      when "allow-egress"        then AEC::InternetGatewayExclusionMode::AllowEgress
      else
        raise Exception.new("unknown enum value for 'InternetGatewayExclusionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InternetGatewayExclusionMode::AllowBidirectional then "allow-bidirectional"
      when AEC::InternetGatewayExclusionMode::AllowEgress        then "allow-egress"
      else
        raise Exception.new("unknown enum value for 'InternetGatewayExclusionMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InternetGatewayExclusionMode?
      case key
      when "allow-bidirectional" then AEC::InternetGatewayExclusionMode::AllowBidirectional
      when "allow-egress"        then AEC::InternetGatewayExclusionMode::AllowEgress
      else
        nil
      end
    end
  end
end
