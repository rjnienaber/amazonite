private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum MembershipType
    Static
    Igmp

    def self.to_json(e : MembershipType, json : JSON::Builder) : Nil
      value = case e
              when AEC::MembershipType::Static then "static"
              when AEC::MembershipType::Igmp   then "igmp"
              else
                raise Exception.new("unknown enum value for 'MembershipType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::MembershipType
      value = pull.read_string
      case value
      when "static" then AEC::MembershipType::Static
      when "igmp"   then AEC::MembershipType::Igmp
      else
        raise Exception.new("unknown enum value for 'MembershipType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::MembershipType::Static then "static"
      when AEC::MembershipType::Igmp   then "igmp"
      else
        raise Exception.new("unknown enum value for 'MembershipType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::MembershipType?
      case key
      when "static" then AEC::MembershipType::Static
      when "igmp"   then AEC::MembershipType::Igmp
      else
        nil
      end
    end
  end
end
