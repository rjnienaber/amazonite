private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeAttributeName
    AutoEnableIo
    ProductCodes

    def self.to_json(e : VolumeAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeAttributeName::AutoEnableIo then "autoEnableIO"
              when AEC::VolumeAttributeName::ProductCodes then "productCodes"
              else
                raise Exception.new("unknown enum value for 'VolumeAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeAttributeName
      value = pull.read_string
      case value
      when "autoEnableIO" then AEC::VolumeAttributeName::AutoEnableIo
      when "productCodes" then AEC::VolumeAttributeName::ProductCodes
      else
        raise Exception.new("unknown enum value for 'VolumeAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeAttributeName::AutoEnableIo then "autoEnableIO"
      when AEC::VolumeAttributeName::ProductCodes then "productCodes"
      else
        raise Exception.new("unknown enum value for 'VolumeAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeAttributeName?
      case key
      when "autoEnableIO" then AEC::VolumeAttributeName::AutoEnableIo
      when "productCodes" then AEC::VolumeAttributeName::ProductCodes
      else
        nil
      end
    end
  end
end
