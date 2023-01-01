private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum ParameterTier
    Standard
    Advanced
    IntelligentTiering

    def self.to_json(e : ParameterTier, json : JSON::Builder) : Nil
      value = case e
              when AS::ParameterTier::Standard           then "Standard"
              when AS::ParameterTier::Advanced           then "Advanced"
              when AS::ParameterTier::IntelligentTiering then "Intelligent-Tiering"
              else
                raise Exception.new("unknown enum value for 'ParameterTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ParameterTier
      value = pull.read_string
      case value
      when "Standard"            then AS::ParameterTier::Standard
      when "Advanced"            then AS::ParameterTier::Advanced
      when "Intelligent-Tiering" then AS::ParameterTier::IntelligentTiering
      else
        raise Exception.new("unknown enum value for 'ParameterTier' when deserializing from json: '#{value}'")
      end
    end
  end
end
