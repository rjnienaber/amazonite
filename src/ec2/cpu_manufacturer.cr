private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum CpuManufacturer
    Intel
    Amd
    AmazonWebServices
    Apple

    def self.to_json(e : CpuManufacturer, json : JSON::Builder) : Nil
      value = case e
              when AEC::CpuManufacturer::Intel             then "intel"
              when AEC::CpuManufacturer::Amd               then "amd"
              when AEC::CpuManufacturer::AmazonWebServices then "amazon-web-services"
              when AEC::CpuManufacturer::Apple             then "apple"
              else
                raise Exception.new("unknown enum value for 'CpuManufacturer' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::CpuManufacturer
      value = pull.read_string
      case value
      when "intel"               then AEC::CpuManufacturer::Intel
      when "amd"                 then AEC::CpuManufacturer::Amd
      when "amazon-web-services" then AEC::CpuManufacturer::AmazonWebServices
      when "apple"               then AEC::CpuManufacturer::Apple
      else
        raise Exception.new("unknown enum value for 'CpuManufacturer' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::CpuManufacturer::Intel             then "intel"
      when AEC::CpuManufacturer::Amd               then "amd"
      when AEC::CpuManufacturer::AmazonWebServices then "amazon-web-services"
      when AEC::CpuManufacturer::Apple             then "apple"
      else
        raise Exception.new("unknown enum value for 'CpuManufacturer' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::CpuManufacturer?
      case key
      when "intel"               then AEC::CpuManufacturer::Intel
      when "amd"                 then AEC::CpuManufacturer::Amd
      when "amazon-web-services" then AEC::CpuManufacturer::AmazonWebServices
      when "apple"               then AEC::CpuManufacturer::Apple
      else
        nil
      end
    end
  end
end
