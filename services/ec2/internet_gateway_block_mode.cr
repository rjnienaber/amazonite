private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InternetGatewayBlockMode
    Off
    BlockBidirectional
    BlockIngress

    def self.to_json(e : InternetGatewayBlockMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::InternetGatewayBlockMode::Off                then "off"
              when AEC::InternetGatewayBlockMode::BlockBidirectional then "block-bidirectional"
              when AEC::InternetGatewayBlockMode::BlockIngress       then "block-ingress"
              else
                raise Exception.new("unknown enum value for 'InternetGatewayBlockMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InternetGatewayBlockMode
      value = pull.read_string
      case value
      when "off"                 then AEC::InternetGatewayBlockMode::Off
      when "block-bidirectional" then AEC::InternetGatewayBlockMode::BlockBidirectional
      when "block-ingress"       then AEC::InternetGatewayBlockMode::BlockIngress
      else
        raise Exception.new("unknown enum value for 'InternetGatewayBlockMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InternetGatewayBlockMode::Off                then "off"
      when AEC::InternetGatewayBlockMode::BlockBidirectional then "block-bidirectional"
      when AEC::InternetGatewayBlockMode::BlockIngress       then "block-ingress"
      else
        raise Exception.new("unknown enum value for 'InternetGatewayBlockMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InternetGatewayBlockMode?
      case key
      when "off"                 then AEC::InternetGatewayBlockMode::Off
      when "block-bidirectional" then AEC::InternetGatewayBlockMode::BlockBidirectional
      when "block-ingress"       then AEC::InternetGatewayBlockMode::BlockIngress
      else
        nil
      end
    end
  end
end
