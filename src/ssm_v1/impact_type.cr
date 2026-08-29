private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ImpactType
    Mutating
    NonMutating
    Undetermined

    def self.to_json(e : ImpactType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ImpactType
      value = pull.read_string
      case value
      when "Mutating"     then AS::ImpactType::Mutating
      when "NonMutating"  then AS::ImpactType::NonMutating
      when "Undetermined" then AS::ImpactType::Undetermined
      else
        raise Exception.new("unknown enum value for 'ImpactType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ImpactType?
      case key
      when "Mutating"     then AS::ImpactType::Mutating
      when "NonMutating"  then AS::ImpactType::NonMutating
      when "Undetermined" then AS::ImpactType::Undetermined
      else
        nil
      end
    end
  end
end
