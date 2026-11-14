private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # A cost dimension used for allocation. Valid values are `data-transfer` and `data-processing`.
  # `data-processing` is valid only in a `NatFcaPolicyDocument`.
  enum FlexCostAllocationCostDimension
    DataTransfer
    DataProcessing

    def self.to_json(e : FlexCostAllocationCostDimension, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexCostAllocationCostDimension::DataTransfer   then "data-transfer"
              when AEC::FlexCostAllocationCostDimension::DataProcessing then "data-processing"
              else
                raise Exception.new("unknown enum value for 'FlexCostAllocationCostDimension' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexCostAllocationCostDimension
      value = pull.read_string
      case value
      when "data-transfer"   then AEC::FlexCostAllocationCostDimension::DataTransfer
      when "data-processing" then AEC::FlexCostAllocationCostDimension::DataProcessing
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationCostDimension' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexCostAllocationCostDimension::DataTransfer   then "data-transfer"
      when AEC::FlexCostAllocationCostDimension::DataProcessing then "data-processing"
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationCostDimension' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexCostAllocationCostDimension?
      case key
      when "data-transfer"   then AEC::FlexCostAllocationCostDimension::DataTransfer
      when "data-processing" then AEC::FlexCostAllocationCostDimension::DataProcessing
      else
        nil
      end
    end
  end
end
