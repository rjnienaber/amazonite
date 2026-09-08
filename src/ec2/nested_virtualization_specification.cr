private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum NestedVirtualizationSpecification
    Enabled
    Disabled

    def self.to_json(e : NestedVirtualizationSpecification, json : JSON::Builder) : Nil
      value = case e
              when AEC::NestedVirtualizationSpecification::Enabled  then "enabled"
              when AEC::NestedVirtualizationSpecification::Disabled then "disabled"
              else
                raise Exception.new("unknown enum value for 'NestedVirtualizationSpecification' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::NestedVirtualizationSpecification
      value = pull.read_string
      case value
      when "enabled"  then AEC::NestedVirtualizationSpecification::Enabled
      when "disabled" then AEC::NestedVirtualizationSpecification::Disabled
      else
        raise Exception.new("unknown enum value for 'NestedVirtualizationSpecification' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::NestedVirtualizationSpecification::Enabled  then "enabled"
      when AEC::NestedVirtualizationSpecification::Disabled then "disabled"
      else
        raise Exception.new("unknown enum value for 'NestedVirtualizationSpecification' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::NestedVirtualizationSpecification?
      case key
      when "enabled"  then AEC::NestedVirtualizationSpecification::Enabled
      when "disabled" then AEC::NestedVirtualizationSpecification::Disabled
      else
        nil
      end
    end
  end
end
