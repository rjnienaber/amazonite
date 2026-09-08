private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ZeroSizePreference
    Retain
    Default

    def self.to_json(e : ZeroSizePreference, json : JSON::Builder) : Nil
      value = case e
              when AEC::ZeroSizePreference::Retain  then "retain"
              when AEC::ZeroSizePreference::Default then "default"
              else
                raise Exception.new("unknown enum value for 'ZeroSizePreference' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ZeroSizePreference
      value = pull.read_string
      case value
      when "retain"  then AEC::ZeroSizePreference::Retain
      when "default" then AEC::ZeroSizePreference::Default
      else
        raise Exception.new("unknown enum value for 'ZeroSizePreference' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ZeroSizePreference::Retain  then "retain"
      when AEC::ZeroSizePreference::Default then "default"
      else
        raise Exception.new("unknown enum value for 'ZeroSizePreference' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ZeroSizePreference?
      case key
      when "retain"  then AEC::ZeroSizePreference::Retain
      when "default" then AEC::ZeroSizePreference::Default
      else
        nil
      end
    end
  end
end
