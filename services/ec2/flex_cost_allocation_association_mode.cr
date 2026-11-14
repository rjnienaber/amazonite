private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # The mode of a policy association. Valid values:
  #
  # - `direct` - The policy is associated with specific resources by resource ID.
  #
  # - `scope` - The policy is associated with a scope of resources.
  enum FlexCostAllocationAssociationMode
    Direct
    Scope

    def self.to_json(e : FlexCostAllocationAssociationMode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FlexCostAllocationAssociationMode::Direct then "direct"
              when AEC::FlexCostAllocationAssociationMode::Scope  then "scope"
              else
                raise Exception.new("unknown enum value for 'FlexCostAllocationAssociationMode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FlexCostAllocationAssociationMode
      value = pull.read_string
      case value
      when "direct" then AEC::FlexCostAllocationAssociationMode::Direct
      when "scope"  then AEC::FlexCostAllocationAssociationMode::Scope
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationAssociationMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FlexCostAllocationAssociationMode::Direct then "direct"
      when AEC::FlexCostAllocationAssociationMode::Scope  then "scope"
      else
        raise Exception.new("unknown enum value for 'FlexCostAllocationAssociationMode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FlexCostAllocationAssociationMode?
      case key
      when "direct" then AEC::FlexCostAllocationAssociationMode::Direct
      when "scope"  then AEC::FlexCostAllocationAssociationMode::Scope
      else
        nil
      end
    end
  end
end
