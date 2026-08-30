private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  enum IntegrationType
    Opensearch

    def self.to_json(e : IntegrationType, json : JSON::Builder) : Nil
      value = case e
              when ACWL::IntegrationType::Opensearch then "OPENSEARCH"
              else
                raise Exception.new("unknown enum value for 'IntegrationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::IntegrationType
      value = pull.read_string
      case value
      when "OPENSEARCH" then ACWL::IntegrationType::Opensearch
      else
        raise Exception.new("unknown enum value for 'IntegrationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::IntegrationType::Opensearch then "OPENSEARCH"
      else
        raise Exception.new("unknown enum value for 'IntegrationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::IntegrationType?
      case key
      when "OPENSEARCH" then ACWL::IntegrationType::Opensearch
      else
        nil
      end
    end
  end
end
