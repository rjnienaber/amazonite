private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum RegionConcurrencyType
    Sequential
    Parallel

    def self.to_json(e : RegionConcurrencyType, json : JSON::Builder) : Nil
      value = case e
              when ACF::RegionConcurrencyType::Sequential then "SEQUENTIAL"
              when ACF::RegionConcurrencyType::Parallel   then "PARALLEL"
              else
                raise Exception.new("unknown enum value for 'RegionConcurrencyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::RegionConcurrencyType
      value = pull.read_string
      case value
      when "SEQUENTIAL" then ACF::RegionConcurrencyType::Sequential
      when "PARALLEL"   then ACF::RegionConcurrencyType::Parallel
      else
        raise Exception.new("unknown enum value for 'RegionConcurrencyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::RegionConcurrencyType::Sequential then "SEQUENTIAL"
      when ACF::RegionConcurrencyType::Parallel   then "PARALLEL"
      else
        raise Exception.new("unknown enum value for 'RegionConcurrencyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::RegionConcurrencyType?
      case key
      when "SEQUENTIAL" then ACF::RegionConcurrencyType::Sequential
      when "PARALLEL"   then ACF::RegionConcurrencyType::Parallel
      else
        nil
      end
    end
  end
end
