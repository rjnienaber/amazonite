private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcTenancy
    Default

    def self.to_json(e : VpcTenancy, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcTenancy::Default then "default"
              else
                raise Exception.new("unknown enum value for 'VpcTenancy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcTenancy
      value = pull.read_string
      case value
      when "default" then AEC::VpcTenancy::Default
      else
        raise Exception.new("unknown enum value for 'VpcTenancy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcTenancy::Default then "default"
      else
        raise Exception.new("unknown enum value for 'VpcTenancy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcTenancy?
      case key
      when "default" then AEC::VpcTenancy::Default
      else
        nil
      end
    end
  end
end
