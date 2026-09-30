private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BlockPublicAccessMode
    Off
    BlockBidirectional
    BlockIngress

    def self.to_json(e : BlockPublicAccessMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::BlockPublicAccessMode::Off                then "off"
              when AEC::BlockPublicAccessMode::BlockBidirectional then "block-bidirectional"
              when AEC::BlockPublicAccessMode::BlockIngress       then "block-ingress"
              else
                raise Exception.new("unknown enum value for 'BlockPublicAccessMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BlockPublicAccessMode
      value = pull.read_string
      case value
      when "off"                 then AEC::BlockPublicAccessMode::Off
      when "block-bidirectional" then AEC::BlockPublicAccessMode::BlockBidirectional
      when "block-ingress"       then AEC::BlockPublicAccessMode::BlockIngress
      else
        raise Exception.new("unknown enum value for 'BlockPublicAccessMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BlockPublicAccessMode::Off                then "off"
      when AEC::BlockPublicAccessMode::BlockBidirectional then "block-bidirectional"
      when AEC::BlockPublicAccessMode::BlockIngress       then "block-ingress"
      else
        raise Exception.new("unknown enum value for 'BlockPublicAccessMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BlockPublicAccessMode?
      case key
      when "off"                 then AEC::BlockPublicAccessMode::Off
      when "block-bidirectional" then AEC::BlockPublicAccessMode::BlockBidirectional
      when "block-ingress"       then AEC::BlockPublicAccessMode::BlockIngress
      else
        nil
      end
    end
  end
end
