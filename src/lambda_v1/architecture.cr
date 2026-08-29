private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum Architecture
    X8664
    Arm64

    def self.to_json(e : Architecture, json : JSON::Builder) : Nil
      value = case e
              when AL::Architecture::X8664 then "x86_64"
              when AL::Architecture::Arm64 then "arm64"
              else
                raise Exception.new("unknown enum value for 'Architecture' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::Architecture
      value = pull.read_string
      case value
      when "x86_64" then AL::Architecture::X8664
      when "arm64"  then AL::Architecture::Arm64
      else
        raise Exception.new("unknown enum value for 'Architecture' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::Architecture::X8664 then "x86_64"
      when AL::Architecture::Arm64 then "arm64"
      else
        raise Exception.new("unknown enum value for 'Architecture' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::Architecture?
      case key
      when "x86_64" then AL::Architecture::X8664
      when "arm64"  then AL::Architecture::Arm64
      else
        nil
      end
    end
  end
end
