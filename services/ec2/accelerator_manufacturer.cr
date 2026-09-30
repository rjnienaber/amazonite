private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AcceleratorManufacturer
    AmazonWebServices
    Amd
    Nvidia
    Xilinx
    Habana

    def self.to_json(e : AcceleratorManufacturer, json : JSON::Builder) : Nil
      value = case e
              when AEC::AcceleratorManufacturer::AmazonWebServices then "amazon-web-services"
              when AEC::AcceleratorManufacturer::Amd               then "amd"
              when AEC::AcceleratorManufacturer::Nvidia            then "nvidia"
              when AEC::AcceleratorManufacturer::Xilinx            then "xilinx"
              when AEC::AcceleratorManufacturer::Habana            then "habana"
              else
                raise Exception.new("unknown enum value for 'AcceleratorManufacturer' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AcceleratorManufacturer
      value = pull.read_string
      case value
      when "amazon-web-services" then AEC::AcceleratorManufacturer::AmazonWebServices
      when "amd"                 then AEC::AcceleratorManufacturer::Amd
      when "nvidia"              then AEC::AcceleratorManufacturer::Nvidia
      when "xilinx"              then AEC::AcceleratorManufacturer::Xilinx
      when "habana"              then AEC::AcceleratorManufacturer::Habana
      else
        raise Exception.new("unknown enum value for 'AcceleratorManufacturer' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AcceleratorManufacturer::AmazonWebServices then "amazon-web-services"
      when AEC::AcceleratorManufacturer::Amd               then "amd"
      when AEC::AcceleratorManufacturer::Nvidia            then "nvidia"
      when AEC::AcceleratorManufacturer::Xilinx            then "xilinx"
      when AEC::AcceleratorManufacturer::Habana            then "habana"
      else
        raise Exception.new("unknown enum value for 'AcceleratorManufacturer' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AcceleratorManufacturer?
      case key
      when "amazon-web-services" then AEC::AcceleratorManufacturer::AmazonWebServices
      when "amd"                 then AEC::AcceleratorManufacturer::Amd
      when "nvidia"              then AEC::AcceleratorManufacturer::Nvidia
      when "xilinx"              then AEC::AcceleratorManufacturer::Xilinx
      when "habana"              then AEC::AcceleratorManufacturer::Habana
      else
        nil
      end
    end
  end
end
