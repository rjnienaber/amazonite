private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum S3SseAlgorithm
    Aes256
    Kms

    def self.to_json(e : S3SseAlgorithm, json : JSON::Builder) : Nil
      value = case e
              when ADDB::S3SseAlgorithm::Aes256 then "AES256"
              when ADDB::S3SseAlgorithm::Kms    then "KMS"
              else
                raise Exception.new("unknown enum value for 'S3SseAlgorithm' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::S3SseAlgorithm
      value = pull.read_string
      case value
      when "AES256" then ADDB::S3SseAlgorithm::Aes256
      when "KMS"    then ADDB::S3SseAlgorithm::Kms
      else
        raise Exception.new("unknown enum value for 'S3SseAlgorithm' when deserializing from json: '#{value}'")
      end
    end
  end
end
