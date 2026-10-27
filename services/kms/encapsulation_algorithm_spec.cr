private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum EncapsulationAlgorithmSpec
    MlKem

    def self.to_json(e : EncapsulationAlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::EncapsulationAlgorithmSpec::MlKem then "ML_KEM"
              else
                raise Exception.new("unknown enum value for 'EncapsulationAlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::EncapsulationAlgorithmSpec
      value = pull.read_string
      case value
      when "ML_KEM" then AK::EncapsulationAlgorithmSpec::MlKem
      else
        raise Exception.new("unknown enum value for 'EncapsulationAlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::EncapsulationAlgorithmSpec::MlKem then "ML_KEM"
      else
        raise Exception.new("unknown enum value for 'EncapsulationAlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::EncapsulationAlgorithmSpec?
      case key
      when "ML_KEM" then AK::EncapsulationAlgorithmSpec::MlKem
      else
        nil
      end
    end
  end
end
