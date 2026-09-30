private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AcceleratorType
    Gpu
    Fpga
    Inference
    Media

    def self.to_json(e : AcceleratorType, json : JSON::Builder) : Nil
      value = case e
              when AEC::AcceleratorType::Gpu       then "gpu"
              when AEC::AcceleratorType::Fpga      then "fpga"
              when AEC::AcceleratorType::Inference then "inference"
              when AEC::AcceleratorType::Media     then "media"
              else
                raise Exception.new("unknown enum value for 'AcceleratorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AcceleratorType
      value = pull.read_string
      case value
      when "gpu"       then AEC::AcceleratorType::Gpu
      when "fpga"      then AEC::AcceleratorType::Fpga
      when "inference" then AEC::AcceleratorType::Inference
      when "media"     then AEC::AcceleratorType::Media
      else
        raise Exception.new("unknown enum value for 'AcceleratorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AcceleratorType::Gpu       then "gpu"
      when AEC::AcceleratorType::Fpga      then "fpga"
      when AEC::AcceleratorType::Inference then "inference"
      when AEC::AcceleratorType::Media     then "media"
      else
        raise Exception.new("unknown enum value for 'AcceleratorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AcceleratorType?
      case key
      when "gpu"       then AEC::AcceleratorType::Gpu
      when "fpga"      then AEC::AcceleratorType::Fpga
      when "inference" then AEC::AcceleratorType::Inference
      when "media"     then AEC::AcceleratorType::Media
      else
        nil
      end
    end
  end
end
