private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FindingsFound
    True
    False
    Unknown

    def self.to_json(e : FindingsFound, json : JSON::Builder) : Nil
      value = case e
              when AEC::FindingsFound::True    then "true"
              when AEC::FindingsFound::False   then "false"
              when AEC::FindingsFound::Unknown then "unknown"
              else
                raise Exception.new("unknown enum value for 'FindingsFound' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FindingsFound
      value = pull.read_string
      case value
      when "true"    then AEC::FindingsFound::True
      when "false"   then AEC::FindingsFound::False
      when "unknown" then AEC::FindingsFound::Unknown
      else
        raise Exception.new("unknown enum value for 'FindingsFound' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FindingsFound::True    then "true"
      when AEC::FindingsFound::False   then "false"
      when AEC::FindingsFound::Unknown then "unknown"
      else
        raise Exception.new("unknown enum value for 'FindingsFound' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FindingsFound?
      case key
      when "true"    then AEC::FindingsFound::True
      when "false"   then AEC::FindingsFound::False
      when "unknown" then AEC::FindingsFound::Unknown
      else
        nil
      end
    end
  end
end
