private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EndDateType
    Unlimited
    Limited

    def self.to_json(e : EndDateType, json : JSON::Builder) : Nil
      value = case e
              when AEC::EndDateType::Unlimited then "unlimited"
              when AEC::EndDateType::Limited   then "limited"
              else
                raise Exception.new("unknown enum value for 'EndDateType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EndDateType
      value = pull.read_string
      case value
      when "unlimited" then AEC::EndDateType::Unlimited
      when "limited"   then AEC::EndDateType::Limited
      else
        raise Exception.new("unknown enum value for 'EndDateType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EndDateType::Unlimited then "unlimited"
      when AEC::EndDateType::Limited   then "limited"
      else
        raise Exception.new("unknown enum value for 'EndDateType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EndDateType?
      case key
      when "unlimited" then AEC::EndDateType::Unlimited
      when "limited"   then AEC::EndDateType::Limited
      else
        nil
      end
    end
  end
end
