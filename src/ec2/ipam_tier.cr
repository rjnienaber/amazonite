private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IpamTier
    Free
    Advanced

    def self.to_json(e : IpamTier, json : JSON::Builder) : Nil
      value = case e
              when AEC::IpamTier::Free     then "free"
              when AEC::IpamTier::Advanced then "advanced"
              else
                raise Exception.new("unknown enum value for 'IpamTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IpamTier
      value = pull.read_string
      case value
      when "free"     then AEC::IpamTier::Free
      when "advanced" then AEC::IpamTier::Advanced
      else
        raise Exception.new("unknown enum value for 'IpamTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IpamTier::Free     then "free"
      when AEC::IpamTier::Advanced then "advanced"
      else
        raise Exception.new("unknown enum value for 'IpamTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IpamTier?
      case key
      when "free"     then AEC::IpamTier::Free
      when "advanced" then AEC::IpamTier::Advanced
      else
        nil
      end
    end
  end
end
