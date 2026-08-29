private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  enum PackageType
    Zip
    Image

    def self.to_json(e : PackageType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AL::PackageType
      value = pull.read_string
      case value
      when "Zip"   then AL::PackageType::Zip
      when "Image" then AL::PackageType::Image
      else
        raise Exception.new("unknown enum value for 'PackageType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AL::PackageType?
      case key
      when "Zip"   then AL::PackageType::Zip
      when "Image" then AL::PackageType::Image
      else
        nil
      end
    end
  end
end
