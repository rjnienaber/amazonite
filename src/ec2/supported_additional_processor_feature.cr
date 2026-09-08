private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SupportedAdditionalProcessorFeature
    AmdSevSnp
    NestedVirtualization

    def self.to_json(e : SupportedAdditionalProcessorFeature, json : JSON::Builder) : Nil
      value = case e
              when AEC::SupportedAdditionalProcessorFeature::AmdSevSnp            then "amd-sev-snp"
              when AEC::SupportedAdditionalProcessorFeature::NestedVirtualization then "nested-virtualization"
              else
                raise Exception.new("unknown enum value for 'SupportedAdditionalProcessorFeature' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SupportedAdditionalProcessorFeature
      value = pull.read_string
      case value
      when "amd-sev-snp"           then AEC::SupportedAdditionalProcessorFeature::AmdSevSnp
      when "nested-virtualization" then AEC::SupportedAdditionalProcessorFeature::NestedVirtualization
      else
        raise Exception.new("unknown enum value for 'SupportedAdditionalProcessorFeature' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SupportedAdditionalProcessorFeature::AmdSevSnp            then "amd-sev-snp"
      when AEC::SupportedAdditionalProcessorFeature::NestedVirtualization then "nested-virtualization"
      else
        raise Exception.new("unknown enum value for 'SupportedAdditionalProcessorFeature' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SupportedAdditionalProcessorFeature?
      case key
      when "amd-sev-snp"           then AEC::SupportedAdditionalProcessorFeature::AmdSevSnp
      when "nested-virtualization" then AEC::SupportedAdditionalProcessorFeature::NestedVirtualization
      else
        nil
      end
    end
  end
end
