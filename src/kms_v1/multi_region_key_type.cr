private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum MultiRegionKeyType
    Primary
    Replica

    def self.to_json(e : MultiRegionKeyType, json : JSON::Builder) : Nil
      value = case e
              when AK::MultiRegionKeyType::Primary then "PRIMARY"
              when AK::MultiRegionKeyType::Replica then "REPLICA"
              else
                raise Exception.new("unknown enum value for 'MultiRegionKeyType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::MultiRegionKeyType
      value = pull.read_string
      case value
      when "PRIMARY" then AK::MultiRegionKeyType::Primary
      when "REPLICA" then AK::MultiRegionKeyType::Replica
      else
        raise Exception.new("unknown enum value for 'MultiRegionKeyType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::MultiRegionKeyType::Primary then "PRIMARY"
      when AK::MultiRegionKeyType::Replica then "REPLICA"
      else
        raise Exception.new("unknown enum value for 'MultiRegionKeyType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::MultiRegionKeyType?
      case key
      when "PRIMARY" then AK::MultiRegionKeyType::Primary
      when "REPLICA" then AK::MultiRegionKeyType::Replica
      else
        nil
      end
    end
  end
end
