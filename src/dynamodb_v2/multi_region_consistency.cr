private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum MultiRegionConsistency
    Eventual
    Strong

    def self.to_json(e : MultiRegionConsistency, json : JSON::Builder) : Nil
      value = case e
              when ADDB::MultiRegionConsistency::Eventual then "EVENTUAL"
              when ADDB::MultiRegionConsistency::Strong   then "STRONG"
              else
                raise Exception.new("unknown enum value for 'MultiRegionConsistency' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::MultiRegionConsistency
      value = pull.read_string
      case value
      when "EVENTUAL" then ADDB::MultiRegionConsistency::Eventual
      when "STRONG"   then ADDB::MultiRegionConsistency::Strong
      else
        raise Exception.new("unknown enum value for 'MultiRegionConsistency' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::MultiRegionConsistency::Eventual then "EVENTUAL"
      when ADDB::MultiRegionConsistency::Strong   then "STRONG"
      else
        raise Exception.new("unknown enum value for 'MultiRegionConsistency' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::MultiRegionConsistency?
      case key
      when "EVENTUAL" then ADDB::MultiRegionConsistency::Eventual
      when "STRONG"   then ADDB::MultiRegionConsistency::Strong
      else
        nil
      end
    end
  end
end
