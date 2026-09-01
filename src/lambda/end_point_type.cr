private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum EndPointType
    KafkaBootstrapServers

    def self.to_json(e : EndPointType, json : JSON::Builder) : Nil
      value = case e
              when AL::EndPointType::KafkaBootstrapServers then "KAFKA_BOOTSTRAP_SERVERS"
              else
                raise Exception.new("unknown enum value for 'EndPointType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::EndPointType
      value = pull.read_string
      case value
      when "KAFKA_BOOTSTRAP_SERVERS" then AL::EndPointType::KafkaBootstrapServers
      else
        raise Exception.new("unknown enum value for 'EndPointType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::EndPointType::KafkaBootstrapServers then "KAFKA_BOOTSTRAP_SERVERS"
      else
        raise Exception.new("unknown enum value for 'EndPointType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::EndPointType?
      case key
      when "KAFKA_BOOTSTRAP_SERVERS" then AL::EndPointType::KafkaBootstrapServers
      else
        nil
      end
    end
  end
end
